import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/common/widget_functions.dart';
import 'package:medlegten/models/Unit/unit_writing_cueword.dart';
import 'package:medlegten/models/Unit/unit_writing_video.dart';
import 'package:medlegten/pages/CoursePages/Unit_writing/writing_paragraph.dart';
import 'package:video_player/video_player.dart';

class WritingSentencePage extends StatefulWidget {
  const WritingSentencePage(this.unitWritingVideo, this.videoPlayerController,
      this.answers, this.showCorrectAnswer,
      {Key? key})
      : super(key: key);

  final UnitWritingVideo unitWritingVideo;
  final VideoPlayerController videoPlayerController;
  final Map<UnitWritingCueWord, bool?> answers;
  final bool showCorrectAnswer;
  @override
  _WritingSentencePageState createState() => _WritingSentencePageState();
}

class _WritingSentencePageState extends State<WritingSentencePage> {
  int currentIndex = -1;
  int prevCueId = -1;
  int isUser = -1;
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    widget.videoPlayerController.addListener(videoPlayerListener);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  videoPlayerListener() {
    if (widget.videoPlayerController.value.isPlaying) {
      if (isUser == -1) {
        var _duration = widget.videoPlayerController.value.position;
        var idx = widget.unitWritingVideo.cue.firstWhereOrNull((element) =>
            getDuration(element.startTime) <= _duration &&
            getDuration(element.endTime) > _duration);

        if (idx != null && prevCueId != int.parse(idx.ordering) - 1) {
          currentIndex = int.parse(idx.ordering) - 1;
          // _scrollController.animateTo(int.parse(idx.ordering) * 100,
          //     duration: const Duration(milliseconds: 300),
          //     curve: Curves.linear);
          setState(
            () {},
          );

          prevCueId = int.parse(idx.ordering) - 1;
        }
      }
    }
  }

  Duration getDuration(String time) {
    var splitted = time.split(':');
    return Duration(
      hours: int.parse(splitted[0]),
      minutes: int.parse(splitted[1]),
      seconds: int.parse(splitted[2].split('.')[0]),
      milliseconds: int.parse(splitted[2].split('.')[1]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      shrinkWrap: true,
      //physics: const NeverScrollableScrollPhysics(),
      itemCount: widget.unitWritingVideo.cue.length,
      itemBuilder: (context, index) {
        var currentCue = widget.unitWritingVideo.cue[index];
        if (currentCue.missWordRequired == "0" ||
            currentCue.missWords.isEmpty) {
          return sentence(
              index,
              widget.unitWritingVideo.cue.length,
              index == currentIndex,
              buildText(currentCue.toLangTranslation, index == currentIndex));
        } else {
          for (var e in currentCue.missWords
              .where((element) => element.isVisible == '1')) {
            if (!widget.answers.containsKey(e)) {
              widget.answers[e] = null;
            }
          }
          Widget? child2;
          if (widget.showCorrectAnswer) {
            child2 =
                buildText(currentCue.toLangTranslation, index == currentIndex);
          }
          return sentence(
              index,
              widget.unitWritingVideo.cue.length,
              index == currentIndex,
              WritingParagraph(
                  currentCue, index == currentIndex, widget.answers, () {
                if (currentIndex != index) {
                  currentIndex = index;
                  setState(() {});
                }
              }, widget.showCorrectAnswer),
              child2: child2);
        }
      },
    );
  }

  Widget sentence(int index, int length, bool isSelected, Widget child,
      {Widget? child2}) {
    List<Widget> list = [];
    list.add(Align(
      alignment: Alignment.topLeft,
      child: Text(
        'Sentence ${index + 1}:',
        style: TextStyle(
            color: Color.fromRGBO(48, 53, 159, isSelected ? 1 : 0.5),
            fontWeight: FontWeight.w500,
            fontFamily: 'Roboto',
            fontSize: 15),
      ),
    ));
    list.add(addVerticalSpace(20));
    list.add(Align(alignment: Alignment.topCenter, child: child));
    if (child2 != null) {
      list.add(addVerticalSpace(20));
      list.add(Align(alignment: Alignment.topCenter, child: child2));
    }
    if (index + 1 != length) {
      list.add(addVerticalSpace(20));
      list.add(const Divider(color: Color.fromRGBO(199, 201, 217, 0.2)));
    }
    return Column(children: list);
  }

  Widget buildText(String text, bool isSelected) {
    //, bool beforeSpace
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
          color: isSelected ? colorBlack : Colors.black45,
          fontSize: 14,
          fontWeight: FontWeight.w400),
    );
  }
}
