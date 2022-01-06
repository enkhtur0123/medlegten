import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/common/widget_functions.dart';
import 'package:medlegten/models/Landing/quiz_question.dart';

class CourseSelfTestQuestion extends HookWidget {
  final QuizQuestion quizQuestion;

  const CourseSelfTestQuestion(this.quizQuestion, {Key? key}) : super(key: key);

  final style = const TextStyle(
      color: Color.fromRGBO(51, 51, 51, 1),
      fontFamily: 'Roboto',
      fontSize: 15,
      fontWeight: FontWeight.w400);

  @override
  Widget build(BuildContext context) {
    var sortedAnswers = quizQuestion.answers
      ..sort((a, b) => int.parse(a.ordering).compareTo(int.parse(b.ordering)));
    var state = useState(-1);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Асуулт ' + quizQuestion.ordering + ':',
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
                quizQuestion.question,
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
              child: Wrap(
                runSpacing: 10,
                spacing: 25,
                children: sortedAnswers
                    .map(
                      (answer) => ChoiceChip(
                        backgroundColor: ColorTable.color255_255_255,
                        elevation: 5.0,
                        label: IntrinsicWidth(
                          stepWidth: 50,
                          //constraints: const BoxConstraints(
                          //    minWidth: 50.0, maxWidth: double.infinity),
                          child: Center(
                            child: Text(answer.answer, style: style),
                          ),
                        ),
                        selected: int.parse(answer.ordering) == state.value,
                        selectedColor: Colors.greenAccent,
                        onSelected: (bool selected) {
                          state.value =
                              selected ? int.parse(answer.ordering) : 0;
                        },
                      ),
                    )
                    .toList(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
