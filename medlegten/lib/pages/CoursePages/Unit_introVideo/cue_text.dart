import 'package:flutter/material.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/models/Unit/unit_introduction_cue.dart';
import 'package:medlegten/repositories/repository.dart';

// ignore: must_be_immutable
class CueText extends StatefulWidget {
  final UnitIntroCueParagraph paragraph;
  Map<String, GlobalKey> wordWidgets = {};

  CueText(this.paragraph, {Key? key}) : super(key: key);

  @override
  _CueTexteState createState() => _CueTexteState();
}

class _CueTexteState extends State<CueText> {
  final globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var _widget = Center(
      key: globalKey,
      child: Wrap(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: widget.paragraph.words.map(
          (w) {
            widget.wordWidgets[w.mainText] = globalKey;
            return Text(
              '${w.mainText}${w.spaceNext == '0' ? ' ' : ''}',
              style: const TextStyle(
                  color: colorPrimary,
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
