import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/common/widget_functions.dart';
import 'package:medlegten/pages/CoursePages/Unit_test/unit_test_answer.dart';
import 'package:medlegten/pages/CoursePages/Unit_test/unit_test_helper.dart';

class UnitTestQuestion extends HookWidget {
  final ExamQuestionEx quizQuestionEx;
  final int duussan;

  const UnitTestQuestion(
    this.quizQuestionEx, {
    Key? key,
    this.duussan = 0,
  }) : super(key: key);

  final style = const TextStyle(
      color: Color.fromRGBO(51, 51, 51, 1),
      fontFamily: 'Roboto',
      fontSize: 15,
      fontWeight: FontWeight.w400);

  @override
  Widget build(BuildContext context) {
    var state = useState(false);
    var sortedAnswers = quizQuestionEx.quizQuestion.answers
      ..sort((a, b) => int.parse(a.ordering).compareTo(int.parse(b.ordering)));
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        children: [
          quizQuestionEx.quizQuestion.segmentId == '' &&
                  quizQuestionEx.quizQuestion.ordering == '1'
              ? Center(
                  child: Text(
                    '${quizQuestionEx.quizQuestion.segmentName}  -  ${quizQuestionEx.quizQuestion.questionId}',
                    style: const TextStyle(
                        color: colorPrimary,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700,
                        fontSize: 16),
                  ),
                )
              : Container(),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              quizQuestionEx.quizQuestion.type == '0'
                  ? 'Асуулт ${quizQuestionEx.quizQuestion.ordering}:'
                  : '${quizQuestionEx.quizQuestion.typeText}:',
              style: const TextStyle(
                  color: Color.fromRGBO(48, 53, 159, 1),
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  fontFamily: 'Roboto'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 10, 5, 5),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                quizQuestionEx.quizQuestion.question,
                style: const TextStyle(
                    color: Color.fromRGBO(51, 51, 51, 1),
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    fontFamily: 'Roboto',
                    height: 1.5),
              ),
            ),
          ),
          quizQuestionEx.quizQuestion.type == '0'
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: sortedAnswers
                      .map(
                        (answer) => UnitTestAnswerItem(() {
                          state.value = !state.value;
                        },
                            answer: answer,
                            quizQuestionEx: quizQuestionEx,
                            duussan: duussan,
                            key: UniqueKey()),
                      )
                      .toList())
              : Divider(
                  color: Colors.grey.withOpacity(0.5),
                  thickness: 1,
                ),
          quizQuestionEx.quizQuestion.type == '0'
              ? addVerticalSpace(40)
              : addVerticalSpace(20)
        ],
      ),
    );
  }

  ///

}
