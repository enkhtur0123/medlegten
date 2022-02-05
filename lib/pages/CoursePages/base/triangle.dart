import 'package:flutter/material.dart';

class ShapesPainter extends CustomPainter {
  final bool isShadowed;
  final bool isTop;
  final bool isSecound;
  ShapesPainter(this.isShadowed, this.isTop, this.isSecound);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = 1
      ..color =
          isShadowed ? Colors.white : const Color.fromRGBO(174, 177, 239, .3)
      ..style = isShadowed ? PaintingStyle.fill : PaintingStyle.stroke;

    var path = Path();
    if (isTop) {
      path.moveTo(0, 0);
      path.relativeLineTo(11, 11);
      path.relativeLineTo(-22, 0);
    } else {
      path.moveTo(-11, 0);
      path.relativeLineTo(22, 0);
      path.relativeLineTo(-11, 11);
    }
    path.close();
    canvas.drawPath(path, paint);
    if (isShadowed && isSecound == false) {
      canvas.drawShadow(path, Colors.grey.withOpacity(0.4), 4.0, false);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
