import 'package:flutter/material.dart';
import 'package:medlegten/pages/CoursePages/base/cue_word_widget.dart';
import 'package:medlegten/pages/CoursePages/base/cue_wrapper.dart';

class ReadingPopUpDialog extends StatelessWidget {
  const ReadingPopUpDialog(this.word, this.position, {Key? key})
      : super(key: key);

  final CWord word;
  final Rect position;

  @override
  Widget build(BuildContext context) {
    var _mediaQueryData = MediaQuery.of(context);
    var mediaHeight = _mediaQueryData.size.height -
        (_mediaQueryData.padding.top + _mediaQueryData.padding.bottom);
    var isTop = mediaHeight - position.top > 220;
    //var actualTop = (_mediaQueryData.size.height - cueWidgetHeight) / 2;
    //var edgeInsetTop = (actualTop - ((mediaHeight - position.top) / 2)) / 2;
    return //Dialog(
        //contentPadding: EdgeInsets.zero,

        // insetPadding: EdgeInsets.only(
        //     top: edgeInsetTop > 0 ? edgeInsetTop : 0,
        //     left: 0,
        //     bottom: 0, //edgeInsetTop < 0 ? edgeInsetTop * -1 : 0,
        //     right: 0),
        // elevation: 0,
        // backgroundColor: Colors.transparent,
        //shape: const RoundedRectangleBorder(
        //    borderRadius: BorderRadius.all(Radius.circular(18))),
        // child:
        CueWordWidget(
      word,
      ppointerPosition: position,
      isshadow: true,
      istop: isTop,
      //),
    );
  }
}
