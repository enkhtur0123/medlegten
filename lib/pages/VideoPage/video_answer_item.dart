import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:medlegten/models/Landing/quiz_answer.dart';
import 'package:medlegten/themes/style.dart';

// ignore: must_be_immutable
class AnsWerItem extends HookWidget {
  AnsWerItem(
      {Key? key,
      this.quizAnswer,
      this.mode,
      this.correctAnswerds,
      this.clickCnts})
      : super(key: key);

  List<QuizAnswer>? quizAnswer;

  ValueNotifier<int>? mode;

  /// Зөв үгийг тоолох

  ValueNotifier<Set<String>>? correctAnswerds;
  ValueNotifier<int>? clickCnts;

  @override
  Widget build(BuildContext context) {
    var selectedAnswerId = useState("");
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: quizAnswer!.map((e) {
        return Flexible(
          fit: FlexFit.tight,
          flex: 3,
          child: GestureDetector(
            onTap: () {
              selectedAnswerId.value = e.answerId!;
              setCnt(answer: e, selectedAnswerId: selectedAnswerId.value);
            },
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(left: 10),
              height: 52,
              padding:
                  const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
              decoration: BoxDecoration(
                border: Border.all(
                    color: getBorderColor(
                        quizAnswer: e,
                        selectedAnswerId: selectedAnswerId.value)!),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
                color: mode!.value == 1
                    ? Colors.white
                    : getBackgroundColor(
                        quizAnswer: e,
                        selectedAnswerId: selectedAnswerId.value,
                      ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: AutoSizeText(
                e.answer!,
                textAlign: TextAlign.center,
                softWrap: true,
                maxFontSize: 15,
                style: const TextStyle(
                  color: Color(0xff333333),
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.normal,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Color getBackgroundColor({QuizAnswer? quizAnswer, String? selectedAnswerId}) {
    if (quizAnswer!.answerId == selectedAnswerId) {
      return secondaryColor.withOpacity(0.5);
    } else {
      return Colors.white;
    }
  }

  setCnt({QuizAnswer? answer, String? selectedAnswerId}) {
    clickCnts!.value++;
    if (answer!.isTrue == '1' && answer.answerId == selectedAnswerId) {
      correctAnswerds!.value.add(answer.answerId!);
    } else if (answer.answerId == selectedAnswerId && answer.isTrue == '0') {
      for (var val in quizAnswer!) {
        correctAnswerds!.value
            .removeWhere((element) => element == val.answerId);
      }
      correctAnswerds!.value.forEach((element) {
        print(element.toUpperCase());
      });
    }
  }

  ///border Color
  Color? getBorderColor({QuizAnswer? quizAnswer, String? selectedAnswerId}) {
    Color color = Colors.white;
    if (mode!.value == 1) {
      if (quizAnswer!.isTrue == "1") {
        color = Colors.greenAccent;
      } else if (selectedAnswerId != null &&
          quizAnswer.answerId == selectedAnswerId &&
          quizAnswer.isTrue == "0") {
        color = Colors.redAccent;
      }
    } else {
      color = Colors.white;
    }
    return color;
  }
}
