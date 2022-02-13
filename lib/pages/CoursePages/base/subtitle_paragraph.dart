import 'package:flutter/material.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/pages/CoursePages/base/cue_wrapper.dart';
import 'package:tuple/tuple.dart';

// ignore: must_be_immutable
class SubtitleParagraph extends StatefulWidget {
  final CParagraph paragraph;
  final int currentIndex;
  final CWord? currentWord;
  final Alignment? alignment;
  final Widget? tailWidget;
  final bool? selectParagraph;
  Map<CWord, Tuple2<GlobalKey, Widget>> wordWidgets = {};

  SubtitleParagraph(this.paragraph, this.currentIndex,
      {Key? key,
      this.currentWord,
      this.alignment,
      this.tailWidget,
      this.selectParagraph})
      : super(key: key);

  @override
  _CueTexteState createState() => _CueTexteState();
}

class _CueTexteState extends State<SubtitleParagraph> {
  @override
  Widget build(BuildContext context) {
    //bool beforeSpace = false;
    Map<CWord, Widget> widgetList = {};
    List<CWord> skip = [];
    for (int i1 = 0; i1 < widget.paragraph.words!.length; i1++) {
      CWord w = widget.paragraph.words![i1];

      if (widget.currentWord != null && //widget.currentWord!.word == w.word
          widget.currentWord!.id == w.id) {
        var splitted = widget.currentWord!.wordValue.split(' ');
        for (int i2 = 0; i2 < splitted.length; i2++) {
          if (splitted[i2] == widget.currentWord!.word) {
            widgetList[widget.currentWord!] =
                buildTextElevated(widget.currentWord!);
          } else {
            for (int i3 = i2; i3 < 10; i3++) {
              if (widget.paragraph.words!.length > i1 + i3) {
                var wordForward = widget.paragraph.words![i1 + i3];
                if (wordForward.word == splitted[i2]) {
                  widgetList[wordForward] = buildTextElevated(wordForward);
                  //skip.add(wordForward);
                  break;
                }
              }
              if (i1 - i3 > -1) {
                var wordBackward = widget.paragraph.words![i1 - i3];
                if (wordBackward.word == splitted[i2]) {
                  widgetList[wordBackward] = buildTextElevated(wordBackward);
                  //skip.add(wordBackward);
                  break;
                }
              }
            }
          }
        }
        //beforeSpace = true;
      } else {
        if (!widgetList.containsKey(w)) {
          widgetList[w] =
              buildText(w, widget.selectParagraph); //, beforeSpace);
          //beforeSpace = false;
        }
      }
    }

    // if (skip.isNotEmpty) {
    //   for (int i = 0; i < skip.length; i++) {
    //     if (widgetList.keys.contains(skip[i])) {
    //       widgetList.remove(skip[i]);
    //     }
    //   }
    // }

    if (widget.tailWidget != null) {
      final globalKey = GlobalKey();
      var childWidget = Container(key: globalKey, child: widget.tailWidget!);
      var cword = CWord('-1', '-1', '-1', false);
      widget.wordWidgets[cword] =
          Tuple2<GlobalKey, Widget>(globalKey, childWidget);
      widgetList[cword] = childWidget;
    }

    return Align(
      alignment: widget.alignment ?? Alignment.center,
      child: Wrap(
        alignment: widget.alignment == Alignment.center
            ? WrapAlignment.center
            : WrapAlignment.start,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: widgetList.entries.map((e) => e.value).toList(),
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

  Widget buildText(CWord w, bool? selectWord) {
    //, bool beforeSpace
    final globalKey = GlobalKey();
    var childWidget = Text(
      '${w.word}${w.spaceNext == true ? ' ' : ''}', // //'${beforeSpace ? ' ' : ''}$
      key: globalKey,
      style: TextStyle(
          color: widget.currentIndex == widget.paragraph.ordering
              ? colorBlack
              : (selectWord != null
                  ? (selectWord ? colorBlack : Colors.black54)
                  : Colors.black54),
          fontSize: 18,
          fontWeight: FontWeight.w400),
    );

    widget.wordWidgets[w] = Tuple2<GlobalKey, Widget>(globalKey, childWidget);
    return childWidget;
  }
}
