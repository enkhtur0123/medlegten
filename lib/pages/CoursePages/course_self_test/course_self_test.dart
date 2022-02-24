import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/common/widget_functions.dart';
import 'package:medlegten/components/loading.dart';
import 'package:medlegten/components/wide_button.dart';
import 'package:medlegten/models/Landing/quiz_question.dart';
import 'package:medlegten/pages/CoursePages/course_self_test/course_self_test_question.dart';
import 'package:medlegten/repositories/landing_repository.dart';
import 'package:medlegten/widgets/dialog/custom_popup.dart';
import 'package:medlegten/widgets/loader.dart';

// ignore: must_be_immutable
class CourseSelfTestPage extends HookWidget {
  CourseSelfTestPage({Key? key}) : super(key: key);

  ValueNotifier<String>? quizId = ValueNotifier("");

  Future<List<QuizQuestionEx>> fetchData() async {
    List<QuizQuestionEx> sortedList = [];
    var result = await LandingRepository().getSelfQuiz();
    quizId?.value = result!.quizId;
    var _sortedList = result!.questions
      ..sort((a, b) => int.parse(a.ordering).compareTo(int.parse(b.ordering)));
    for (var e in _sortedList) {
      sortedList.add(QuizQuestionEx(e));
    }
    return sortedList;
  }

  @override
  Widget build(BuildContext context) {
    var mode = useState(0);
    ValueNotifier<bool> check = ValueNotifier<bool>(false);
    ValueNotifier<int> correctCnt = ValueNotifier<int>(0);
    int wrongCnt = 0;
    final future = useMemoized(fetchData);
    final snapshot = useFuture(future);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: Column(
        children: [
          addVerticalSpace(20),
          Text(
            'Өөрийгөө үнэлэх тест'.toUpperCase(),
            style: const TextStyle(
                color: colorPrimary,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w700,
                fontSize: 16),
          ),
          addVerticalSpace(6),
          const Text(
            'Явцын шалгалт 2',
            style: TextStyle(
                color: colorPrimary,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w700,
                fontSize: 12),
          ),
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
                              .map((question) => CourseSelfTestQuestion(
                                    question,
                                    mode: mode.value,
                                    check: check,
                                    correctCnt: correctCnt,
                                    selfTestCnt: snapshot.data!.length,
                                  ))
                              .toList(),
                        ),
                      )
                    : const Loading()),
          ),
          WideButton(
              mode.value == 0 ? 'Дуусгах' : 'Буцах', colorSecondary, colorWhite,
              () {
            if (mode.value == 0) {
              check.value = true;
              mode.value = 1;
              setSelfTestResult(
                  correctCnt: correctCnt.value,
                  snapshot: snapshot,
                  context: context);
            } else {
              AutoRouter.of(context).pop();
            }
          }),
          addVerticalSpace(20)
        ],
      ),
    );
  }

  setSelfTestResult(
      {int? correctCnt,
      AsyncSnapshot<List<QuizQuestionEx>>? snapshot,
      BuildContext? context}) async {
    Map<String, dynamic> data = {
      "quizId": quizId?.value.toString(),
      "correctCount": correctCnt.toString(),
      "incorrectCount": (snapshot!.data!.length - correctCnt!).toString()
    };
    var result;
    try {
      LoadingIndicator(context: context).showLoadingIndicator();
       result = await LandingRepository().setCourseSelfTestHistory(body: data);
       LoadingIndicator(context: context).hideLoadingIndicator();
    } catch (ex) {
      LoadingIndicator(context: context).hideLoadingIndicator();
    }

    if (result != null) {
      showDialog(
          context: context!,
          builder: (BuildContext context) {
            return const CustomPopUpDialog(
                title: "Амжилттай",
                body: "Хүсэлт амжилттай илгээгдлээ",
                isSuccess: true);
          });
    } else {
      showDialog(
          context: context!,
          builder: (context) {
            return const CustomPopUpDialog(
                title: "Амжилтгүй", body: "", isError: true);
          });
    }
  }
}

class QuizQuestionEx {
  QuizQuestionEx(this.quizQuestion);

  QuizQuestion quizQuestion;
  String? selectedAnswerId;
}
