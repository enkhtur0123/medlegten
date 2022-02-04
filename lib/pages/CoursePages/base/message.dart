import 'package:flutter/widgets.dart';
import 'package:medlegten/pages/CoursePages/base/clip_shadow.dart'
    show ClipShadow, ClipShadowPainter;
import 'package:medlegten/pages/CoursePages/base/message_clipper.dart';

class Message extends StatelessWidget {
  const Message(
      {Key? key,
      required this.triangleX1,
      required this.triangleX2,
      required this.triangleX3,
      required this.triangleY1,
      required this.child,
      this.clipShadows = const [],
      this.isTop = true,
      this.isShadow = false})
      : super(key: key);

  ///The left corner distance of triangle to widget's left edge
  final double triangleX1;

  ///The right corner distance of triangle to widget's left edge
  final double triangleX2;

  ///The point corner distance of triangle to widget's left edge
  final double triangleX3;

  ///The message box height
  final double triangleY1;

  final bool isTop;
  final bool isShadow;

  final Widget child;

  ///List of shadows to be cast on the border
  final List<ClipShadow> clipShadows;

  @override
  Widget build(BuildContext context) {
    var clipper = MessageClipper(
        triangleX1, triangleX2, triangleX3, triangleY1, isTop); //
    return CustomPaint(
      painter: ClipShadowPainter(clipper, clipShadows, isShadow),
      child: ClipPath(
        clipper: clipper,
        child: child,
      ),
    );
  }
}
