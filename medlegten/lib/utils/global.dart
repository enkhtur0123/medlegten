import 'dart:ui';

class Utils {
  Color hexToColor(String code) {
    return Color(
        int.parse(code.trim().substring(0, 6), radix: 16) + 0xFF000000);
  }
}
