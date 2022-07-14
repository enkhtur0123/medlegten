import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/models/Landing/quiz_question.dart';
import 'package:medlegten/models/video/quiz.dart';
import 'package:medlegten/pages/LandingPages/landing_page.dart';
import 'package:medlegten/pages/ProfilePages/landing_profile.dart';
import 'package:medlegten/pages/VideoPage/video_answer_item.dart';

import 'package:medlegten/repositories/video_repository.dart';
import 'package:medlegten/services/custom_exception.dart';
import 'package:medlegten/themes/style.dart';
import 'package:medlegten/widgets/buttons/custom_outlined_button.dart';
import 'package:medlegten/widgets/dialog/custom_popup.dart';
import 'package:medlegten/widgets/loader.dart';
import 'package:medlegten/widgets/snackbar/custom_snackbar.dart';

// ignore: must_be_immutable
class VideoQuizPage extends StatefulWidget {
  VideoQuizPage({Key? key, this.videoQuiz, this.title, this.contentId})
      : super(key: key);

  VideoQuiz? videoQuiz;
  String? title;
  String? contentId;

  @override
  State<StatefulWidget> createState() {
    return VideoQuizPageState();
  }
}

class VideoQuizPageState extends State<VideoQuizPage> {
  ValueNotifier<int> mode = ValueNotifier(0);
  Timer? _timer;
  int _start = 0;
  List<QuizQuestion> totalQuestion = [];
  ValueNotifier<int> wrongCnt = ValueNotifier(0);

  ///Зөв хариултыг тоолох
  ValueNotifier<Set<String>> contextCorrectAnswerIds = ValueNotifier(Set());
  ValueNotifier<Set<String>> vocCorrectAnswerIds = ValueNotifier(Set());
  ValueNotifier<int> clickCnts = ValueNotifier(0);
  int totalQuestionCnt = 0;
  bool isPass = false;

  @override
  void initState() {
    super.initState();
    _start = widget.videoQuiz!.quizDuration!;
    totalQuestionCnt = widget.videoQuiz!.contextQuiz!.length +
        widget.videoQuiz!.vocQuiz!.length;
    if (_start != 0) {
      startTimer();
    }
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
                    fontWeight: FontWeight.bold,
                  ),
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
              child: getQuizWidget(
                questions: widget.videoQuiz!.contextQuiz,
                isContextQuiz: true,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: getQuizWidget(
                questions: widget.videoQuiz!.vocQuiz,
                isContextQuiz: false,
              ),
            ),
            const SizedBox(
              height: 30,
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
              if (clickCnts.value != 0) {
                isPass = ((contextCorrectAnswerIds.value.length +
                            vocCorrectAnswerIds.value.length) ==
                        totalQuestionCnt ||
                    (contextCorrectAnswerIds.value.length +
                            vocCorrectAnswerIds.value.length) ==
                        totalQuestionCnt - 1);
                mode.value = 1;
                // print(contextCorrectAnswerIds.value.length + vocCorrectAnswerIds.value.length);
                sentResult(result: isPass ? "1" : "0");
              } else {
                ScaffoldMessenger.of(context).showSnackBar(MySnackBar(
                  text: "Хариултаа сонгоно уу",
                ));
              }
            } else {
              Navigator.pop(context, true);
            }
            setState(() {});
          },
        ),
      ),
    );
  }

  getQuizWidget({bool? isContextQuiz = true, List<QuizQuestion>? questions}) {
    return Column(
      children: [
        Container(
          margin: isContextQuiz!
              ? const EdgeInsets.all(0)
              : const EdgeInsets.only(top: 25),
          child: Text(
            isContextQuiz
                ? "Агуулгын асуулт".toUpperCase()
                : "Үгсийн сангийн асуулт".toUpperCase(),
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: Colors.black),
          ),
        ),
        Column(
          children: questions!.map((e) {
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
                        "Асуулт ${questions.indexOf(e) + 1}:",
                        style: const TextStyle(
                          color: colorPrimary,
                          fontSize: 17,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                        ),
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
                  AnsWerItem(
                    quizAnswer: e.answers,
                    mode: mode,
                    clickCnts: clickCnts,
                    correctAnswerds: isContextQuiz
                        ? contextCorrectAnswerIds
                        : vocCorrectAnswerIds,
                  )
                ],
              ),
            );
          }).toList(),
        ),
      ],
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

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  Future sentResult({String? result}) async {
    LoadingIndicator(context: context).showLoadingIndicator();
    try {
      await VideoRepository()
          .sentQuizResult(quizResult: result, contentId: widget.contentId)
          .then(
        (value) async {
          _timer!.cancel();
          await showDialog(
              context: context,
              builder: (context) {
                return CustomPopUpDialog(
                  isAlert: !isPass,
                  isSuccess: isPass,
                  title: isPass ? "Амжилттай" : "Амжилтгүй",
                  body: isPass ? "Та тэнцлээ" : "Та тэнцсэнгүй",
                );
              });
        },
      );
      LoadingIndicator(context: context).hideLoadingIndicator();
    } on CustomException catch (ex) {
      LoadingIndicator(context: context).hideLoadingIndicator();
    } catch (ex) {
      LoadingIndicator(context: context).hideLoadingIndicator();
    }
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0 && widget.videoQuiz!.quizDuration != 0) {
          timer.cancel();
          isPass = ((contextCorrectAnswerIds.value.length +
                      vocCorrectAnswerIds.value.length) ==
                  totalQuestionCnt ||
              (contextCorrectAnswerIds.value.length +
                      vocCorrectAnswerIds.value.length) ==
                  totalQuestionCnt - 1);
          // print(contextCorrectAnswerIds.value.length + vocCorrectAnswerIds.value.length);
          mode.value = 1;
          sentResult(result: isPass ? "1" : "0");
          setState(() {});
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }
}
