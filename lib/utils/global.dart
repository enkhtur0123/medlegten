import 'package:flutter/material.dart';

class Utils {
  Color hexToColor(String code) {
    return Color(
        int.parse(code.trim().substring(0, 6), radix: 16) + 0xFF000000);
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
