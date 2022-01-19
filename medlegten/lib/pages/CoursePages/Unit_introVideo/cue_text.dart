import 'package:flutter/material.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/models/Unit/unit_introduction_cue.dart';
import 'package:medlegten/models/Unit/unit_introduction_cue_word.dart';

// ignore: must_be_immutable
class CueText extends StatefulWidget {
  final UnitIntroCueParagraph paragraph;
  final int currentIndex;
  Map<UnitIntroCueWord, GlobalKey> wordWidgets = {};

  CueText(this.paragraph, this.currentIndex, {Key? key}) : super(key: key);

  @override
  _CueTexteState createState() => _CueTexteState();
}

class _CueTexteState extends State<CueText> {
  @override
  Widget build(BuildContext context) {
    var _widget = Center(
      child: Wrap(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: widget.paragraph.words.map(
          (w) {
            final globalKey = GlobalKey();
            widget.wordWidgets[w] = globalKey;
            return Text(
              '${w.mainText}${w.spaceNext == '0' ? ' ' : ''}',
              key: globalKey,
              style: TextStyle(
                  color: widget.currentIndex ==
                          int.parse(widget.paragraph.ordering) - 1
                      ? colorBlack
                      : Colors.black54,
                  fontSize: 18,
                  fontWeight: FontWeight.w400),
            );
          },
        ).toList(),
      ),
    );
    return _widget;
  }
}
