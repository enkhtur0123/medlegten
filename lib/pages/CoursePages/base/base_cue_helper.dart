import 'package:flutter/material.dart';
import 'package:medlegten/pages/CoursePages/base/cue_wrapper.dart';
import 'package:medlegten/utils/global.dart';

class BaseCueHelper {
  double getMaxHeight(
      List<CParagraph> paragraphs, bool isEng, TextStyle style, double width) {
    double maxHeight = 0;
    for (var paragraph in paragraphs) {
      var size = textHeight(
          isEng ? paragraph.engText : paragraph.monText, style, width);
      if (size > maxHeight) {
        maxHeight = size;
      }
    }

    maxHeight = (maxHeight / (style.fontSize ?? 18)).round() * 21;
    if (maxHeight < 50) {
      maxHeight = 50;
    }
    return maxHeight;
  }

  double textHeight(String text, TextStyle style, double textWidth) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      textDirection: TextDirection.ltr,
      textScaleFactor: GlobalValues.screenScaleFactor,
      maxLines: 1,
    )..layout(minWidth: 0, maxWidth: double.infinity);

    final countLines = (textPainter.size.width / textWidth).ceil();
    final height = countLines * textPainter.size.height;
    return height;
  }
}
