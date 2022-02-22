import 'package:flutter/material.dart';
import 'package:medlegten/pages/CoursePages/base/subtitle_paragraph.dart';
import 'package:medlegten/pages/CoursePages/base/cue_wrapper.dart';
import 'package:medlegten/utils/global.dart';
import 'package:tuple/tuple.dart';

typedef SubtitleWordCallback = void Function(CWord? word, Rect position);
typedef SubtitleParagraphCallback = void Function(CParagraph? paragraph);

abstract class BaseSubtitlePage extends StatefulWidget {
  const BaseSubtitlePage(
    this.paragraph, {
    Key? key,
    SubtitleWordCallback? pwordCallback,
    SubtitleParagraphCallback? pparagraphCallback,
    Widget? ptailWidget,
    SubtitleParagraphCallback? ptailCallback,
    bool? pselectedParagraph,
    Color? pdefaultColor,
  })  : wordCallback = pwordCallback,
        paragraphCallback = pparagraphCallback,
        tailWidget = ptailWidget,
        tailCallback = ptailCallback,
        selectedParagraph = pselectedParagraph,
        defaultColor = pdefaultColor ?? Colors.grey,
        super(key: key);

  final CParagraph paragraph;
  final SubtitleWordCallback? wordCallback;
  final SubtitleParagraphCallback? paragraphCallback;
  final Widget? tailWidget;
  final SubtitleParagraphCallback? tailCallback;
  final bool? selectedParagraph;
  final Color defaultColor;
}

abstract class BaseSubtitleState<Page extends BaseSubtitlePage>
    extends State<Page> {
  int currentIndex = -1;
  int isUser = -1;

  Map<CParagraph, Map<CWord, Tuple2<GlobalKey, Widget>>> cueWidgets = {};
  CWord? selectedWord;
  late final refreshCue = ValueNotifier<bool>(false)..addListener(_listener);

  void _listener() {
    setState(() {});
  }
}

mixin BaseSubtitleMixin<Page extends BaseSubtitlePage>
    on BaseSubtitleState<Page> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (TapDownDetails details) {
        if (widget.wordCallback != null) {
          var position = details.globalPosition;
          var paragraph = widget.paragraph;
          cueWidgets[paragraph]!.forEach((key, value) {
            var rect = value.item1.globalPaintBounds!;
            if (rect.contains(position)) {
              if (key.id == '-1') {
                widget.tailCallback!(paragraph);
              } else {
                selectedWord = key;
                widget.wordCallback!(key, rect);
              }
              refreshCue.value = !refreshCue.value;
            } else {
              widget.wordCallback!(null, Rect.zero);
            }
          });
        } else {
          widget.wordCallback!(null, Rect.zero);
        }
      },
      child: buildParagraph(context, widget.paragraph, selectedWord,
          widget.tailWidget, widget.selectedParagraph),
    );
  }

  Widget buildParagraph(context, CParagraph paragraph, CWord? selectedWord,
      Widget? tailWidget, bool? selectParagraph) {
    var widget = SubtitleParagraph(paragraph, currentIndex,
        defaultColor: this.widget.defaultColor,
        currentWord: selectedWord,
        alignment: Alignment.centerLeft,
        tailWidget: tailWidget,
        selectParagraph: selectParagraph);

    cueWidgets[paragraph] = widget.wordWidgets;
    return widget;
  }
}
