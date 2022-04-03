import 'package:flutter/material.dart';

class Utils {
  Color hexToColor(String code) {
    return Color(
        int.parse(code.trim().substring(0, 6), radix: 16) + 0xFF000000);
  }
}

class AppProperties {
  static String version = "1.1.3";
}

class GlobalValues {
  static double screenHeight = 1;
  static double screenWidth = 1;
  static double screenScaleFactor = 1;

  static double getWidthRelativeToScreen(double percent) {
    return screenWidth * percent / 100;
  }

  static double getHeightRelativeToScreen(double percent) {
    return screenHeight * percent / 100;
  }
}

extension GlobalKeyExtension on GlobalKey {
  Rect? get globalPaintBounds {
    final renderObject = currentContext?.findRenderObject();
    final translation = renderObject?.getTransformTo(null).getTranslation();
    if (translation != null && renderObject?.paintBounds != null) {
      final offset = Offset(translation.x, translation.y);
      Rect rect = renderObject!.paintBounds.shift(offset);
      return rect;
    } else {
      return null;
    }
  }
}
