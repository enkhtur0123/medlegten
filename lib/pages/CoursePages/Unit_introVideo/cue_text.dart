import 'package:flutter/material.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/models/Unit/unit_introduction_cue.dart';
import 'package:medlegten/models/Unit/unit_introduction_cue_word.dart';
import 'package:tuple/tuple.dart';

// ignore: must_be_immutable
class CueText extends StatefulWidget {
  final UnitIntroCueParagraph paragraph;
  final int currentIndex;
  final String? currentWord;
  Map<UnitIntroCueWord, Tuple2<GlobalKey, Widget>> wordWidgets = {};

  CueText(this.paragraph, this.currentIndex, {Key? key, this.currentWord})
      : super(key: key);

  @override
  _CueTexteState createState() => _CueTexteState();
}

class _CueTexteState extends State<CueText> {
  @override
  Widget build(BuildContext context) {
    bool beforeSpace = false;
    return Center(
      child: Wrap(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: widget.paragraph.words.map(
          (w) {
            Widget widgetRet;
            if (widget.currentWord! == w.mainText) {
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

  Widget buildTextElevated(UnitIntroCueWord w) {
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
        w.mainText,
        key: globalKey,
        style: const TextStyle(
            color: colorSecondary, fontSize: 24, fontWeight: FontWeight.w400),
      ),
    );
    widget.wordWidgets[w] = Tuple2<GlobalKey, Widget>(globalKey, widget);
    return childWidget;
  }

  Widget buildText(UnitIntroCueWord w, bool beforeSpace) {
    final globalKey = GlobalKey();
    var childWidget = Text(
      '${beforeSpace ? ' ' : ''}${w.mainText}${w.spaceNext == '0' ? ' ' : ''}',
      key: globalKey,
      style: TextStyle(
          color: widget.currentIndex == int.parse(widget.paragraph.ordering) - 1
              ? colorBlack
              : Colors.black54,
          fontSize: 18,
          fontWeight: FontWeight.w400),
    );

    widget.wordWidgets[w] = Tuple2<GlobalKey, Widget>(globalKey, widget);
    return childWidget;
  }
}
