import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:medlegten/models/Landing/quiz_answer.dart';
import 'package:medlegten/pages/CoursePages/Unit_test/unit_test_helper.dart';

class UnitTestAnswerItem extends HookWidget {
  UnitTestAnswerItem(this.callBack,
      {Key? key, this.answer, this.quizQuestionEx, this.duussan})
      : super(key: key);
  QuizAnswer? answer;
  ExamQuestionEx? quizQuestionEx;
  int? duussan;
  Function() callBack;

  final style = const TextStyle(
      color: Color.fromRGBO(51, 51, 51, 1),
      fontFamily: 'Roboto',
      fontSize: 15,
      fontWeight: FontWeight.w400);
  @override
  Widget build(BuildContext context) {
    var state = useState(-1);
    var isSelected = useState(false);
    // print(quizQuestionEx!.selectedAnswerId);
    useEffect(() {
      isSelected.value = int.parse(answer!.ordering) == state.value ||
          quizQuestionEx!.selectedAnswerId == answer!.answerId;
      return null;
    }, const []);

    return Flexible(
      flex: 3,
      child: GestureDetector(
        onTap: () {
          if (duussan == 0) {
            if (state.value == -1) {
              state.value = int.parse(answer!.ordering) != state.value
                  ? int.parse(answer!.ordering)
                  : -1;
              quizQuestionEx!.selectedAnswerId = answer!.answerId;
            } else {
              state.value = -1;
              quizQuestionEx!.selectedAnswerId = null;
            }
            callBack();
          }
          isSelected.value = int.parse(answer!.ordering) == state.value ||
              quizQuestionEx!.selectedAnswerId == answer!.answerId;
        },
        child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(5),
          width: double.infinity,
          height: 30,
          decoration: BoxDecoration(
            color: isSelected.value && duussan == 0
                ? Colors.greenAccent
                : Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            boxShadow: [
              const BoxShadow(
                color: Color.fromRGBO(13, 24, 249, 0.15),
                spreadRadius: 1,
                blurRadius: 2,
                offset: Offset(0, 2), // changes position of shadow
              ),
            ],
            border: Border.all(
                color: getBorderSide(answer!), width: duussan == 1 ? 1 : 0.5),
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

  Color getBorderSide(QuizAnswer answer) {
    Color color = Colors.transparent;
    if (duussan == 1) {
      if (answer.isTrue == '1') {
        color = Colors.green;
      }

      if (quizQuestionEx!.selectedAnswerId == answer.answerId &&
          answer.isTrue == '0') {
        color = Colors.red;
      }
    }
    return color;
  }
}
