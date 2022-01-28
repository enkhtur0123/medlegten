import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/common/widget_functions.dart';
import 'package:medlegten/models/Landing/quiz_answer.dart';
import 'package:medlegten/pages/CoursePages/course_self_test/course_self_test.dart';


import 'course_self_test_answer_item.dart';

class CourseSelfTestQuestion extends HookWidget {
  final QuizQuestionEx quizQuestionEx;
  final int mode;
  final ValueNotifier<bool>? check;
  ValueNotifier<int> correctCnt;
  int selfTestCnt;  
  CourseSelfTestQuestion(this.quizQuestionEx, {Key? key, this.mode = 0, this.check, required this.correctCnt,required this.selfTestCnt})
      : super(key: key);

  final style = const TextStyle(
      color: Color.fromRGBO(51, 51, 51, 1), fontFamily: 'Roboto', fontSize: 15, fontWeight: FontWeight.w400);

  @override
  Widget build(BuildContext context) {
    var sortedAnswers = quizQuestionEx.quizQuestion.answers
      ..sort((a, b) => int.parse(a.ordering).compareTo(int.parse(b.ordering)));
    var state = useState(-1);
    var isSelected = useState(false);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Асуулт ' + quizQuestionEx.quizQuestion.ordering + ':',
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
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Align(
              alignment: Alignment.center,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: sortedAnswers
                      .map((answer) => CourseSelfAnswerItem(
                          answer: answer,
                          quizQuestionEx: quizQuestionEx,
                          mode: mode,
                          correctCnt: correctCnt,
                        ),
                      ).toList()
                  // children: sortedAnswers
                  //     .map(
                  //       (answer) => ChoiceChip(
                  //           backgroundColor: ColorTable.color255_255_255,
                  //           elevation: 5.0,
                  //           shape: RoundedRectangleBorder(
                  //               side: getBorderSide(answer), borderRadius: const BorderRadius.all(Radius.circular(20.0))),
                  //           label: IntrinsicWidth(
                  //             stepWidth: 50,
                  //             child: Center(
                  //               child: Text(answer.answer, style: style),
                  //             ),
                  //           ),
                  //           selected: int.parse(answer.ordering) == state.value,
                  //           selectedColor: mode == 0 ? Colors.greenAccent : Colors.white,
                  //           onSelected: (bool selected) {
                  //             if (mode == 0) {
                  //               state.value = selected ? int.parse(answer.ordering) : 0;
                  //               quizQuestionEx.selectedAnswerId = answer.answerId;
                  //             }
                  //             setCnt(answer: answer);
                  //           }),
                  //     )
                  //     .toList(),

                  ),
            ),
          )
        ],
      ),
    );
  }

  ///

}
