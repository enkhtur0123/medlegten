import 'package:clickable_list_wheel_view/clickable_list_wheel_widget.dart';
import 'package:flutter/material.dart';
import 'package:medlegten/pages/CoursePages/base/base_video_subtitle.dart';
import 'package:medlegten/pages/CoursePages/base/subtitle_paragraph.dart';
import 'package:medlegten/pages/CoursePages/base/cue_wrapper.dart';
import 'package:medlegten/utils/global.dart';
import 'package:tuple/tuple.dart';

// ignore: must_be_immutable

abstract class BaseSubtitlePage extends StatefulWidget {
  const BaseSubtitlePage(this.paragraphs,
      {Key? key,
      SubtitleWordCallback? pwordCallback,
      SubtitleParagraphCallback? pparagraphCallback})
      : wordCallback = pwordCallback,
        paragraphCallback = pparagraphCallback,
        super(key: key);

  final List<CParagraph> paragraphs;
  final SubtitleWordCallback? wordCallback;
  final SubtitleParagraphCallback? paragraphCallback;
}

abstract class BaseSubtitleState<Page extends BaseSubtitlePage>
    extends State<Page> {
  int currentIndex = -1;
  int isUser = -1;

  Map<CParagraph, Map<CWord, Tuple2<GlobalKey, Widget>>> cueWidgets = {};
  var valueKeyList = <CParagraph, GlobalKey>{};
  String selectedWord = '';
  late final refreshCue = ValueNotifier<bool>(false)..addListener(_listener);
  Map<CParagraph, Tuple2<ValueKey, Widget>> paragraphWidgets = {};
  late FixedExtentScrollController _fixedExtentScrollController;
  void _listener() {
    setState(() {});
  }

  @override
  void initState() {
    _fixedExtentScrollController = FixedExtentScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _fixedExtentScrollController.dispose();
    super.dispose();
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
          paragraphWidgets.forEach((key, value) {
            var rect1 = (value.item1.value as GlobalKey).globalPaintBounds!;
            if (rect1.contains(position)) {
              var paragraph = key;
              cueWidgets[paragraph]!.forEach((key, value) {
                var rect = value.item1.globalPaintBounds!;
                if (rect.contains(position)) {
                  selectedWord = key.word;
                  valueKeyList[paragraph] = GlobalKey();
                  widget.wordCallback!(key);
                  refreshCue.value = !refreshCue.value;
                } else {
                  widget.wordCallback!(null);
                }
              });
            }
          });
        } else {
          widget.wordCallback!(null);
        }
      },
      child: Scrollbar(
        thickness: 10,
        child: ListView.builder(
          itemCount: widget.paragraphs.length,
          itemBuilder: (context, index) => buildParagraph(
              context, widget.paragraphs[index], valueKeyList, selectedWord),
        ),
      ),
    );
  }

  Widget buildParagraph(context, CParagraph paragraph,
      Map<CParagraph, GlobalKey> valueKeyList, String selectedWord) {
    if (!valueKeyList.containsKey(paragraph)) {
      valueKeyList[paragraph] = GlobalKey();
    }
    var widget = SubtitleParagraph(
      paragraph,
      currentIndex,
      key: ValueKey<GlobalKey>(valueKeyList[paragraph]!),
      currentWord: selectedWord,
      alignment: Alignment.centerLeft,
    );

    cueWidgets[paragraph] = widget.wordWidgets;
    paragraphWidgets[paragraph] = Tuple2<ValueKey, Widget>(
        ValueKey<GlobalKey>(valueKeyList[paragraph]!), widget);
    return widget;
  }
}
