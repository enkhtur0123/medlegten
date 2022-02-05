import 'package:flutter/material.dart';
import 'package:medlegten/pages/CoursePages/base/subtitle_paragraph.dart';
import 'package:medlegten/pages/CoursePages/base/cue_wrapper.dart';
import 'package:medlegten/utils/global.dart';
import 'package:tuple/tuple.dart';

typedef SubtitleWordCallback = void Function(CWord? word, Rect position);
typedef SubtitleParagraphCallback = void Function(CParagraph? paragraph);

abstract class BaseSubtitlePage extends StatefulWidget {
  const BaseSubtitlePage(this.paragraph,
      {Key? key,
      SubtitleWordCallback? pwordCallback,
      SubtitleParagraphCallback? pparagraphCallback})
      : wordCallback = pwordCallback,
        paragraphCallback = pparagraphCallback,
        super(key: key);

  final CParagraph paragraph;
  final SubtitleWordCallback? wordCallback;
  final SubtitleParagraphCallback? paragraphCallback;
}

abstract class BaseSubtitleState<Page extends BaseSubtitlePage>
    extends State<Page> {
  int currentIndex = -1;
  int isUser = -1;

  Map<CParagraph, Map<CWord, Tuple2<GlobalKey, Widget>>> cueWidgets = {};
  String selectedWord = '';
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
              selectedWord = key.word;
              widget.wordCallback!(key, rect);
              refreshCue.value = !refreshCue.value;
            } else {
              widget.wordCallback!(null, Rect.zero);
            }
          });
        } else {
          widget.wordCallback!(null, Rect.zero);
        }
      },
      child: buildParagraph(context, widget.paragraph, selectedWord),
    );
  }

  Widget buildParagraph(context, CParagraph paragraph, String selectedWord) {
    var widget = SubtitleParagraph(
      paragraph,
      currentIndex,
      currentWord: selectedWord,
      alignment: Alignment.centerLeft,
    );

    cueWidgets[paragraph] = widget.wordWidgets;
    return widget;
  }
}
