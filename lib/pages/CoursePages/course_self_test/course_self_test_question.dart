import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:medlegten/common/widget_functions.dart';
import 'package:medlegten/pages/CoursePages/course_self_test/course_self_test.dart';

import 'course_self_test_answer_item.dart';

// ignore: must_be_immutable
class CourseSelfTestQuestion extends HookWidget {
  final QuizQuestionEx quizQuestionEx;
  final int mode;
  final ValueNotifier<bool>? check;
  ValueNotifier<int> correctCnt;
  ValueNotifier? selectedAnswerId = ValueNotifier("");
  int selfTestCnt;
  ValueNotifier<Set<String>>? correctAnswerds;
  CourseSelfTestQuestion(this.quizQuestionEx,
      {Key? key,
      this.mode = 0,
      this.check,
      required this.correctCnt,
      required this.selfTestCnt,
      this.correctAnswerds})
      : super(key: key);

  final style = const TextStyle(
      color: Color.fromRGBO(51, 51, 51, 1),
      fontFamily: 'Roboto',
      fontSize: 15,
      fontWeight: FontWeight.w400);

  @override
  Widget build(BuildContext context) {
    var sortedAnswers = quizQuestionEx.quizQuestion.answers
      ..sort((a, b) => int.parse(a.ordering).compareTo(int.parse(b.ordering)));
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              quizQuestionEx.quizQuestion.type == '0'
                  ? 'Асуулт ${quizQuestionEx.quizQuestion.ordering}:'
                  : '${quizQuestionEx.quizQuestion.typeText}:',
              //'Асуулт ' + quizQuestionEx.quizQuestion.ordering + ':',
              style: const TextStyle(
                  color: Color.fromRGBO(48, 53, 159, 1),
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  fontFamily: 'Roboto'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                quizQuestionEx.quizQuestion.question,
                style: const TextStyle(
                    color: Color.fromRGBO(51, 51, 51, 1),
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    fontFamily: 'Roboto',
                    height: 1.5),
              ),
            ),
          ),
          addVerticalSpace(5),
          CourseSelfAnswerItem(
              answers: sortedAnswers,
              mode: mode,
              correctCnt: correctCnt,
              correctAnswerds: correctAnswerds)
        ],
      ),
    );
  }

  ///

}
