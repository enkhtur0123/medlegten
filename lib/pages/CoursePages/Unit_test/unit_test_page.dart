import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/common/widget_functions.dart';
import 'package:medlegten/components/loading.dart';
import 'package:medlegten/components/wide_button.dart';
import 'package:medlegten/models/Unit/unit_test_model.dart';
import 'package:medlegten/pages/CoursePages/Unit_test/unit_test_helper.dart';
import 'package:medlegten/pages/CoursePages/Unit_test/unit_test_question.dart';
import 'package:medlegten/repositories/unit_repository.dart';
import 'package:medlegten/widgets/dialog/confirm_dialog.dart';

// ignore: must_be_immutable
class UnitTestPage extends HookWidget {
  final String moduleTypeId;
  final String moduleId;
  final String unitTitle;
  final bool isOnlyShowResult;
  UnitTestPage(
      this.moduleTypeId, this.moduleId, this.unitTitle, this.isOnlyShowResult,
      {Key? key})
      : super(key: key);

  late UnitTestModel unitTestModel;
  late String examName;
  Future<List<ExamQuestionEx>> fetchData() async {
    List<ExamQuestionEx> sortedList = [];
    if (!isOnlyShowResult) {
      var result = moduleTypeId == '8'
          ? await UnitRepository().getProgressExam(moduleId)
          : await UnitRepository().getFinalExam(moduleId);
      var _sortedList = result!.questions
        ..sort(
            (a, b) => int.parse(a.ordering).compareTo(int.parse(b.ordering)));
      for (var e in _sortedList) {
        sortedList.add(ExamQuestionEx.fromExam(e));
      }
      unitTestModel = result;
      examName = result.examName;
    } else {
      var result = await UnitRepository().getExamResult(moduleId);
      for (var res in result!.examResult) {
        var ordering = 1;
        for (var e in res.questions) {
          sortedList.add(ExamQuestionEx.fromResult(
              e, res.segmentName, res.totalPercent, ordering.toString()));
          ordering++;
        }
      }
      examName = result.examName;
    }
    return sortedList;
  }

  @override
  Widget build(BuildContext context) {
    var duussan = useState(isOnlyShowResult ? 1 : 0);
    ValueNotifier<bool> check = ValueNotifier<bool>(false);
    final future = useMemoized(fetchData);
    final snapshot = useFuture(future);

    List<Widget> list = [];

    if (!isOnlyShowResult) {
      list.add(addVerticalSpace(20));
      list.add(snapshot.hasData
          ? Text(
              examName,
              style: const TextStyle(
                  color: colorPrimary,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w700,
                  fontSize: 16),
            )
          : const Center(child: CircularProgressIndicator()));
      list.add(addVerticalSpace(10));
      list.add(const Divider(
        color: Color.fromRGBO(199, 201, 217, .3),
        thickness: 1,
      ));
    }
    list.add(addVerticalSpace(20));
    list.add(Expanded(
      child: SingleChildScrollView(
          child: snapshot.hasData
              ? ValueListenableBuilder<bool>(
                  builder: (BuildContext context, bool value, Widget? child) {
                    return child!;
                  },
                  valueListenable: check,
                  child: Column(
                    children: snapshot.data!
                        .map((question) =>
                            UnitTestQuestion(question, duussan: duussan.value))
                        .toList(),
                  ),
                )
              : const Loading()),
    ));
    list.add(AbsorbPointer(
        absorbing: !snapshot.hasData,
        child: WideButton(duussan.value == 0 ? 'Дуусгах' : 'Буцах',
            colorSecondary, colorWhite, () async {
          if (duussan.value == 0) {
            await showDialog<bool>(
                context: context,
                builder: (context) {
                  return ConfirmDialog(
                    text: "Энэ шалгалтийг дуусгахдаа итгэлтэй байна уу?",
                    isAlert: true,
                  );
                }).then((value) async {
              if (value != null && value) {
                duussan.value = 1;
                saveExamValue(snapshot.data!);
              }
            });
          } else {
            AutoRouter.of(context).pop();
          }
        })));
    list.add(addVerticalSpace(20));
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(unitTitle),
      ),
      body: Column(
        children: list,
      ),
    );
  }

  void saveExamValue(List<ExamQuestionEx> list) {
    ExamJson jsonClass = ExamJson();
    jsonClass.examId = unitTestModel.examId;
    for (var item in list.where((element) =>
        element.quizQuestion.type == '0' && element.selectedAnswerId != null)) {
      jsonClass.results.add(QuestionJson(item.quizQuestion.segmentId,
          item.quizQuestion.questionId, item.selectedAnswerId!));
    }

    UnitRepository().setExam(jsonClass.toJson());
  }
}