import 'package:flutter/material.dart';
import 'package:medlegten/models/Unit/grammar.dart';
import 'package:medlegten/pages/CoursePages/Unit_grammarTable/grammar_helper.dart';
import 'package:medlegten/utils/global.dart';
import 'package:tuple/tuple.dart';

class DrawVerticalLinePainter extends CustomPainter {
  const DrawVerticalLinePainter(this.helper, this.grammar);
  final Grammarhelper helper;
  final Grammar grammar;
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = const Color.fromRGBO(199, 201, 217, .5);
    paint.strokeWidth = 3;
    for (int i = 1; i < helper.labelWidgets.length; i++) {
      var rect1 = helper
          .labelWidgets[Tuple2<Grammar, int>(grammar, i)]!.globalPaintBounds;
      var rect2 = helper.labelWidgets[Tuple2<Grammar, int>(grammar, i + 1)]!
          .globalPaintBounds;

      canvas.drawLine(
        Offset(20, rect1!.bottom),
        Offset(20, rect2!.top),
        paint,
      );
    }

    // canvas.drawLine(
    //   Offset(20, 20),
    //   Offset(20, 100),
    //   paint,
    // );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
