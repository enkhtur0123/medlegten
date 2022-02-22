import 'package:flutter/material.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/common/widget_functions.dart';
import 'package:medlegten/components/loading.dart';
import 'package:medlegten/components/video_player_chewie.dart';
import 'package:medlegten/components/wide_button.dart';
import 'package:medlegten/models/Unit/unit_writing_cueword.dart';
import 'package:medlegten/models/Unit/unit_writing_video.dart';
import 'package:medlegten/pages/CoursePages/Unit_writing/writing_sentence.dart';
import 'package:medlegten/pages/CoursePages/Unit_writing/writing_video_page.dart';
import 'package:medlegten/utils/global.dart';
import 'package:video_player/video_player.dart';

class WritingVideoSubPage extends StatefulWidget {
  const WritingVideoSubPage(this.unitWritingVideo, this.index, this.callBack,
      {Key? key})
      : super(key: key);

  final UnitWritingVideo unitWritingVideo;
  final SubVideoCallback callBack;
  final List<int> index;
  @override
  WritingVideoSubPageState createState() => WritingVideoSubPageState();
}

class WritingVideoSubPageState extends State<WritingVideoSubPage> {
  late VideoPlayerController videoPlayerController;
  Map<UnitWritingCueWord, bool?> answers = {};
  int counter = 3;
  @override
  void initState() {
    super.initState();
    videoPlayerController =
        VideoPlayerController.network(widget.unitWritingVideo.hostUrl)
          ..setLooping(false)
          ..initialize().then((value) => setState(() {}));
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    super.dispose();
  }

  void playVideo() {
    if (videoPlayerController.value.isInitialized) {
      videoPlayerController.play();
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> list = [];
    if (videoPlayerController.value.isInitialized) {
      list.add(VideoPlayerChewie(videoPlayerController));
    } else {
      list.add(const AspectRatio(
          aspectRatio: 16 / 9,
          child: SizedBox(width: double.infinity, child: Loading())));
    }
    list.add(indicator(widget.index[3], widget.index[1]));
    list.add(addVerticalSpace(20));
    list.add(
      Container(
        height: GlobalValues.screenHeight / 2 -
            40, // - 100 - GlobalValues.screenWidth * 9 / 16,
        padding: const EdgeInsets.all(20),
        child: Align(
          alignment: Alignment.topCenter,
          child: WritingSentencePage(
              widget.unitWritingVideo, videoPlayerController, answers),
        ),
      ),
    );
    list.add(buttons(widget.index[0], widget.index[2]));

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: list,
      ),
    );
  }

  Widget buttons(int prev, int next) {
    List<Widget> listWidget = [];
    if (prev != -1) {
      listWidget.add(Flexible(
          flex: 1,
          child: WideButton(
            '< Өмнөх',
            colorSecondary,
            colorWhite,
            () {
              widget.callBack.call(widget.index[1], false);
            },
            horizontalEdge: 6,
          )));
    }
    if (next != 0) {
      listWidget.add(Flexible(
          flex: 1,
          child: WideButton(
            'Дараах ${counter < 3 ? '($counter)' : ''}>',
            colorSecondary,
            colorWhite,
            () {
              if (!checkWrongAnswerExists()) {
                widget.callBack.call(widget.index[1], true);
              } else {
                counter--;
                setState(() {});
              }
            },
            horizontalEdge: 6,
          )));
    }
    return Container(
        width: double.infinity,
        height: 100,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: listWidget));
  }

  bool checkWrongAnswerExists() {
    if (counter == 1) return false;
    if (answers.isEmpty) {
      return true;
    }
    return answers.values.any((element) => element == null || element == false);
  }

  Widget indicator(int length, int current) {
    List<Widget> listWidget = [];
    for (int i = 0; i < length; i++) {
      listWidget.add(Flexible(
          child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 0.5),
              height: 10,
              width: GlobalValues.screenWidth / length - 30,
              color: current == i
                  ? const Color.fromRGBO(120, 100, 254, 1)
                  : const Color.fromRGBO(210, 203, 255, 1))));
    }
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: listWidget);
  }
}
