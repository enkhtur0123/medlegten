import 'package:flutter/material.dart';
import 'package:medlegten/models/Unit/reading.dart';
import 'package:medlegten/models/Unit/unit_introduction_cue_word.dart';
import 'package:medlegten/pages/CoursePages/base/cue_wrapper.dart';
import 'package:medlegten/utils/global.dart';
import 'package:flutter/rendering.dart';

class ReadingHelper {
  List<CParagraph> paragraphs = [];
  Map<CParagraph, int> valueKeys = <CParagraph, int>{};
  int lastIndex = -1;

  double width = GlobalValues.screenWidth - 80;

  static List<CParagraph> convert(Reading reading) {
    List<CParagraph> retList = [];

    for (var cue in reading.cue) {
      if (cue.words.isNotEmpty) {
        retList.add(CParagraph(cue.cueId, int.parse(cue.ordering),
            cue.toLangTranslation, cue.fromLangTranslation,
            grammarDescription: cue.grammarDescription,
            grammarIsHighLighted: cue.grammarIsHighLighted,
            words: convertWords(cue.words)));
      }
    }

    return retList;
  }

  static List<CWord> convertWords(List<UnitIntroCueWord> list) {
    List<CWord> retList = [];
    for (var word in list) {
      retList.add(CWord(
          word.wordId, word.mainText, word.wordValue, word.spaceNext == '0'));
    }
    return retList;
  }
}

typedef OnWidgetSizeChange = void Function(Size size);

class MeasureSizeRenderObject extends RenderProxyBox {
  Size? oldSize;
  final OnWidgetSizeChange onChange;

  MeasureSizeRenderObject(this.onChange);

  @override
  void performLayout() {
    super.performLayout();

    Size newSize = child!.size;
    if (oldSize == newSize) return;

    oldSize = newSize;
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      onChange(newSize);
    });
  }
}

class MeasureSize extends SingleChildRenderObjectWidget {
  final OnWidgetSizeChange onChange;

  const MeasureSize({
    Key? key,
    required this.onChange,
    required Widget child,
  }) : super(key: key, child: child);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return MeasureSizeRenderObject(onChange);
  }
}
