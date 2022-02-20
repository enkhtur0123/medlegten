import 'dart:convert';

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

// ignore: must_be_immutable
class UnitTestPage extends HookWidget {
  final String moduleTypeId;
  final String moduleId;
  UnitTestPage(this.moduleTypeId, this.moduleId, {Key? key}) : super(key: key);

  late UnitTestModel unitTestModel;

  Future<List<ExamQuestionEx>> fetchData() async {
    List<ExamQuestionEx> sortedList = [];
    var result = moduleTypeId == '8'
        ? await UnitRepository().getProgressExam(moduleId)
        : await UnitRepository().getFinalExam(moduleId);
    var _sortedList = result!.questions
      ..sort((a, b) => int.parse(a.ordering).compareTo(int.parse(b.ordering)));
    for (var e in _sortedList) {
      sortedList.add(ExamQuestionEx(e));
    }
    unitTestModel = result;
    return sortedList;
  }

  @override
  Widget build(BuildContext context) {
    var duussan = useState(0);
    ValueNotifier<bool> check = ValueNotifier<bool>(false);
    final future = useMemoized(fetchData);
    final snapshot = useFuture(future);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: Column(
        children: [
          addVerticalSpace(20),
          snapshot.hasData
              ? Text(
                  unitTestModel.examName,
                  style: const TextStyle(
                      color: colorPrimary,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w700,
                      fontSize: 16),
                )
              : const Center(child: CircularProgressIndicator()),
          addVerticalSpace(10),
          const Divider(
            color: Color.fromRGBO(199, 201, 217, .3),
            thickness: 1,
          ),
          addVerticalSpace(20),
          Expanded(
            child: SingleChildScrollView(
                child: snapshot.hasData
                    ? ValueListenableBuilder<bool>(
                        builder:
                            (BuildContext context, bool value, Widget? child) {
                          return child!;
                        },
                        valueListenable: check,
                        child: Column(
                          children: snapshot.data!
                              .map((question) => UnitTestQuestion(question,
                                  duussan: duussan.value))
                              .toList(),
                        ),
                      )
                    : const Loading()),
          ),
          AbsorbPointer(
              absorbing: !snapshot.hasData,
              child: WideButton(duussan.value == 0 ? 'Дуусгах' : 'Буцах',
                  colorSecondary, colorWhite, () {
                if (duussan.value == 0) {
                  duussan.value = 1;
                  saveExamValue(snapshot.data!);
                } else {
                  AutoRouter.of(context).pop();
                }
              })),
          addVerticalSpace(20)
        ],
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
