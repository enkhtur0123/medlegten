import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:medlegten/models/Landing/quiz_answer.dart';
import 'package:medlegten/pages/CoursePages/course_self_test/course_self_test.dart';

// ignore: must_be_immutable
class CourseSelfAnswerItem extends HookWidget {
  CourseSelfAnswerItem(
      {Key? key, this.answer, this.quizQuestionEx, this.mode, this.correctCnt})
      : super(key: key);
  QuizAnswer? answer;
  QuizQuestionEx? quizQuestionEx;
  int? mode;
  ValueNotifier<int>? correctCnt;

  final style = const TextStyle(
      color: Color.fromRGBO(51, 51, 51, 1),
      fontFamily: 'Roboto',
      fontSize: 15,
      fontWeight: FontWeight.w400);
  @override
  Widget build(BuildContext context) {
    var state = useState(-1);
    var isSelected = useState(false);
    return Flexible(
      flex: 3,
      child: GestureDetector(
        onTap: () {
          if (mode == 0) {
            state.value = int.parse(answer!.ordering) == state.value
                ? int.parse(answer!.ordering)
                : 0;
            quizQuestionEx!.selectedAnswerId = answer!.answerId;
          }
          isSelected.value = int.parse(answer!.ordering) == state.value ||
              quizQuestionEx!.selectedAnswerId == answer!.answerId;
          setCnt(answer: answer);
        },
        child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(5),
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            color: isSelected.value && mode == 0
                ? Colors.greenAccent
                : Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
            border: Border(
              bottom: getBorderSide(answer!),
              left: getBorderSide(answer!),
              right: getBorderSide(answer!),
              top: getBorderSide(answer!),
            ),
          ),
          child: Text(
            answer!.answer,
            style: style,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  setCnt({QuizAnswer? answer}) {
    if (answer!.isTrue == '1') {
      correctCnt!.value++;
    } else if (correctCnt!.value > 0) {
      correctCnt!.value--;
    }
  }

  BorderSide getBorderSide(QuizAnswer answer) {
    Color color = Colors.transparent;
    if (mode == 1) {
      if (answer.isTrue == '1') {
        color = Colors.greenAccent;
      }
     
      if (quizQuestionEx!.selectedAnswerId == answer.answerId &&
          answer.isTrue == '0') {
        color = Colors.redAccent;
      }
    }
    return BorderSide(color: color, width: 0.5);
  }
}
