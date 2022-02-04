import 'package:flutter/material.dart';

class ClipShadowPainter extends CustomPainter {
  final CustomClipper<Path> clipper;
  final List<ClipShadow> clipShadows;
  final bool isShadow;
  ClipShadowPainter(this.clipper, this.clipShadows, this.isShadow);

  @override
  void paint(Canvas canvas, Size size) {
    if (!isShadow) {
      Paint paint = Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.0
        ..color = const Color.fromRGBO(174, 177, 239, .8);

      canvas.drawPath(clipper.getClip(size), paint);
    } else {
      for (var shadow in clipShadows) {
        canvas.drawShadow(
            clipper.getClip(size), shadow.color, shadow.elevation, true);
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class ClipShadow {
  final Color color;
  final double elevation;

  ClipShadow({required this.color, this.elevation = 5});
}
