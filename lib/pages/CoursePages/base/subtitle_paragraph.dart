import 'package:flutter/material.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/pages/CoursePages/base/cue_wrapper.dart';
import 'package:tuple/tuple.dart';

// ignore: must_be_immutable
class SubtitleParagraph extends StatefulWidget {
  final CParagraph paragraph;
  final int currentIndex;
  final String? currentWord;
  final Alignment? alignment;
  Map<CWord, Tuple2<GlobalKey, Widget>> wordWidgets = {};

  SubtitleParagraph(this.paragraph, this.currentIndex,
      {Key? key, this.currentWord, this.alignment})
      : super(key: key);

  @override
  _CueTexteState createState() => _CueTexteState();
}

class _CueTexteState extends State<SubtitleParagraph> {
  @override
  Widget build(BuildContext context) {
    bool beforeSpace = false;
    return Align(
      alignment: widget.alignment ?? Alignment.center,
      child: Wrap(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: widget.paragraph.words.map(
          (w) {
            Widget widgetRet;
            if (widget.currentWord! == w.word) {
              widgetRet = buildTextElevated(w);
              beforeSpace = true;
            } else {
              widgetRet = buildText(w, beforeSpace);
              beforeSpace = false;
            }
            return widgetRet;
          },
        ).toList(),
      ),
    );
  }

  Widget buildTextElevated(CWord word) {
    final globalKey = GlobalKey();
    var childWidget = Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black26, // red as border color
        ),
        borderRadius: BorderRadius.circular(10),
        // boxShadow: [
        //   const BoxShadow(color: Colors.green, spreadRadius: 3),
        // ],
      ),
      child: Text(
        word.word,
        key: globalKey,
        style: const TextStyle(
            color: colorSecondary, fontSize: 24, fontWeight: FontWeight.w400),
      ),
    );
    widget.wordWidgets[word] =
        Tuple2<GlobalKey, Widget>(globalKey, childWidget);
    return childWidget;
  }

  Widget buildText(CWord w, bool beforeSpace) {
    final globalKey = GlobalKey();
    var childWidget = Text(
      '${beforeSpace ? ' ' : ''}${w.word}${w.spaceNext == true ? ' ' : ''}',
      key: globalKey,
      style: TextStyle(
          color: widget.currentIndex == widget.paragraph.ordering - 1
              ? colorBlack
              : Colors.black54,
          fontSize: 18,
          fontWeight: FontWeight.w400),
    );

    widget.wordWidgets[w] = Tuple2<GlobalKey, Widget>(globalKey, childWidget);
    return childWidget;
  }
}