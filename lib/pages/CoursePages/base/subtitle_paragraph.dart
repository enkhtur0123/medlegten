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
    //bool beforeSpace = false;
    return Align(
      alignment: widget.alignment ?? Alignment.center,
      child: Wrap(
        alignment: widget.alignment == Alignment.center
            ? WrapAlignment.center
            : WrapAlignment.start,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: widget.paragraph.words!.map(
          (w) {
            Widget widgetRet;
            if (widget.currentWord != null && widget.currentWord! == w.word) {
              widgetRet = buildTextElevated(w);
              //beforeSpace = true;
            } else {
              widgetRet = buildText(w); //, beforeSpace);
              //beforeSpace = false;
            }
            return widgetRet;
          },
        ).toList(),
      ),
    );
  }

  Widget buildTextElevated(CWord word) {
    final globalKey = GlobalKey();
    var childWidget = PhysicalModel(
      elevation: 6.0,
      shape: BoxShape.rectangle,
      shadowColor: Colors.black45,
      color: Colors.white,
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
        child: Text(
          word.word,
          key: globalKey,
          style: const TextStyle(
              fontFamily: 'Roboto',
              color: colorPrimary,
              fontSize: 18,
              fontWeight: FontWeight.w800),
        ),
      ),
    );
    widget.wordWidgets[word] =
        Tuple2<GlobalKey, Widget>(globalKey, childWidget);
    return childWidget;
  }

  Widget buildText(CWord w) {
    //, bool beforeSpace
    final globalKey = GlobalKey();
    var childWidget = Text(
      '${w.word}${w.spaceNext == true ? ' ' : ''}', // //'${beforeSpace ? ' ' : ''}$
      key: globalKey,
      style: TextStyle(
          color: widget.currentIndex == widget.paragraph.ordering
              ? colorBlack
              : Colors.black54,
          fontSize: 18,
          fontWeight: FontWeight.w400),
    );

    widget.wordWidgets[w] = Tuple2<GlobalKey, Widget>(globalKey, childWidget);
    return childWidget;
  }
}
