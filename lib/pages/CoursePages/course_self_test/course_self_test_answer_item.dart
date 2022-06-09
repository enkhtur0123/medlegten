import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:medlegten/models/Landing/quiz_answer.dart';

// ignore: must_be_immutable
class CourseSelfAnswerItem extends HookWidget {
  CourseSelfAnswerItem(
      {Key? key,
      this.answers,
      this.mode,
      this.correctCnt,
      this.correctAnswerds,
      this.clickCnts})
      : super(key: key);
  List<QuizAnswer>? answers;
  int? mode;
  ValueNotifier<int>? correctCnt;
  ValueNotifier<Set<String>>? correctAnswerds;
  ValueNotifier<int>? clickCnts;

  final style = const TextStyle(
      color: Color.fromRGBO(51, 51, 51, 1),
      fontFamily: 'Roboto',
      fontSize: 15,
      fontWeight: FontWeight.w400);
  @override
  Widget build(BuildContext context) {
    var state = useState(-1);
    var selectedAnswerId = useState("");
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: answers!.map((e) {
          return Flexible(
            flex: 3,
            child: GestureDetector(
              onTap: () {
                selectedAnswerId.value = e.answerId!;
                setCnt(answer: e, selectedAnswerId: selectedAnswerId.value);
              },
              child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(5),
                width: double.infinity,
                height: 65,
                decoration: BoxDecoration(
                    color: mode == 1
                        ? Colors.white
                        : getBackgroundColor(
                            quizAnswer: e,
                            selectedAnswerId: selectedAnswerId.value),
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    border: Border.all(
                        color: getBorderColor(
                            answer: e,
                            selectedAnswerId: selectedAnswerId.value))),
                child: Text(
                  e.answer!,
                  style: style,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          );
        }).toList());
  }

  setCnt({QuizAnswer? answer, String? selectedAnswerId}) {
    clickCnts!.value++;
    if (answer!.isTrue == '1' && answer.answerId == selectedAnswerId) {
      correctAnswerds!.value.add(answer.answerId!);
    } else if (answer.answerId == selectedAnswerId && answer.isTrue == '0') {
      if (correctAnswerds!.value.contains(answer.answerId)) {
        correctAnswerds!.value.remove(answer.answerId);
      }
    }
  }

  Color getBackgroundColor({String? selectedAnswerId, QuizAnswer? quizAnswer}) {
    if (selectedAnswerId == quizAnswer!.answerId) {
      return Colors.greenAccent;
    } else {
      return Colors.white;
    }
  }

  Color getBorderColor({String? selectedAnswerId, QuizAnswer? answer}) {
    Color color = Colors.white;
    if (mode == 1) {
      if (answer!.isTrue == '1') {
        color = Colors.greenAccent;
      }
      // if (answer.isTrue == '1' && selectedAnswerId == answer.answerId) {
      //   correctCnt!.value++;
      //   print(correctCnt!.value);
      // }
      if (selectedAnswerId == answer.answerId && answer.isTrue == '0') {
        color = Colors.redAccent;
      }
    }
    return color;
  }
}
