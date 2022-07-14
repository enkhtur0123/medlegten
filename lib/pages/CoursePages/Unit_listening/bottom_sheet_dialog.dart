import 'package:flutter/material.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/models/Unit/unit_listening_quiz_question.dart';
import 'package:medlegten/pages/CoursePages/Unit_listening/answer_item.dart';
import 'package:medlegten/themes/style.dart';
import 'package:medlegten/widgets/buttons/custom_outlined_button.dart';

// ignore: must_be_immutable
class ListenQuizWidget extends StatefulWidget {
  ListenQuizWidget(
      {Key? key,
      this.listeningQuiz,
      this.randomColors,
      this.currentIndex,
      this.heardIndex})
      : super(key: key);

  ListeningQuiz? listeningQuiz;
  List<Color>? randomColors;
  int? currentIndex;
  Function(int index)? heardIndex;

  @override
  State<StatefulWidget> createState() {
    return ListenQuizWidgetState();
  }
}

class ListenQuizWidgetState extends State<ListenQuizWidget> {
  ValueNotifier<int> mode = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Row(
          children: [
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(left: 20),
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(colors: widget.randomColors!)),
            ),
            Container(
              margin: const EdgeInsets.only(left: 10, bottom: 20, top: 20),
              child: Text(
                "Сонсгол ${widget.currentIndex! + 1}:\n${widget.listeningQuiz!.listening.cue[widget.currentIndex!].title}",
                style: const TextStyle(
                    fontSize: 15,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        Container(
          height: 1,
          decoration:
              BoxDecoration(border: Border.all(width: 1, color: Colors.white)),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
                children: widget.listeningQuiz!.listening
                    .cue[widget.currentIndex!].questions
                    .map((e) {
              return Container(
                  margin: const EdgeInsets.only(top: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Асуулт ${e.ordering}:",
                            style: const TextStyle(
                                color: colorPrimary,
                                fontSize: 17,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.start,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            e.question!,
                            style: const TextStyle(
                              color: Color(0xff000000),
                              fontSize: 15,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      AnsWerItem(quizAnswer: e.answers, mode: mode)
                    ],
                  ));
            }).toList())),
        Container(
            margin: const EdgeInsets.all(20),
            child: CustomOutlinedButton(
              text: mode.value == 0 ? "Шалгах" : "Дуусгах",
              color: secondaryColor,
              fontSize: 16,
              height: 50,
              onTap: () {
                if (mode.value == 0) {
                  mode.value = 1;
                  widget.heardIndex!(int.parse(widget.listeningQuiz!.listening
                      .cue[widget.currentIndex!].cueId));
                } else {
                  Navigator.pop(context, true);
                }
                setState(() {});
              },
            ))
      ],
    );
  }
}
