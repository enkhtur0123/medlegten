import 'dart:async';

import 'package:flutter/material.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/models/video/quiz.dart';
import 'package:medlegten/pages/CoursePages/Unit_listening/answer_item.dart';
import 'package:medlegten/themes/style.dart';
import 'package:medlegten/widgets/buttons/custom_outlined_button.dart';

// ignore: must_be_immutable
class VideoQuizPage extends StatefulWidget {
  VideoQuizPage({Key? key, this.videoQuiz, this.title}) : super(key: key);

  VideoQuiz? videoQuiz;
  String? title;

  @override
  State<StatefulWidget> createState() {
    return VideoQuizPageState();
  }
}

class VideoQuizPageState extends State<VideoQuizPage> {
  ValueNotifier<int> mode = ValueNotifier(0);
  Timer? _timer;
  int _start = 60;
  @override
  void initState() {
    super.initState();
    startTimer();
    widget.videoQuiz!.contextQuiz!.addAll(widget.videoQuiz!.vocQuiz!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: false,
      appBar: AppBar(
        title: Text(widget.title!),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 30, top: 10),
            child: Text(
              formatHHMMSS(_start),
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  color: Colors.white,
                  fontSize: 21,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              height: 1,
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.white)),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: widget.videoQuiz!.contextQuiz!.map((e) {
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
                                "Асуулт ${widget.videoQuiz!.contextQuiz!.indexOf(e) + 1}:",
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
                }).toList(),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        margin: const EdgeInsets.all(20),
        child: CustomOutlinedButton(
          text: mode.value == 0 ? "Шалгах" : "Дуусгах",
          color: secondaryColor,
          fontSize: 16,
          height: 50,
          onTap: () {
            if (mode.value == 0) {
              mode.value = 1;
            } else {
              Navigator.pop(context, true);
            }
            setState(() {});
          },
        ),
      ),
    );
  }

  String formatHHMMSS(int seconds) {
    int hours = (seconds / 3600).truncate();
    seconds = (seconds % 3600).truncate();
    int minutes = (seconds / 60).truncate();

    String hoursStr = (hours).toString().padLeft(2, '0');
    String minutesStr = (minutes).toString().padLeft(2, '0');
    String secondsStr = (seconds % 60).toString().padLeft(2, '0');

    if (hours == 0) {
      return "$minutesStr:$secondsStr";
    }

    return "$hoursStr:$minutesStr:$secondsStr";
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }
}
