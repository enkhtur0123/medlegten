import 'dart:core';

import 'package:flutter/material.dart';

/// [MessageClipper], can be used with [ClipPath] widget, and clips the widget in dialog box shape
class MessageClipper extends CustomClipper<Path> {
  MessageClipper(this.triangleX1, this.triangleX2, this.triangleX3,
      this.triangleY1, this.isTop,
      {this.borderRadius = 10});
  final double borderRadius;
  final double triangleX1;
  final double triangleX2;
  final double triangleX3;
  final double triangleY1;
  final bool isTop;
  @override
  Path getClip(Size size) {
    double width = size.width;
    double height = size.height;
    double rheight = height - triangleY1;

    final pathTop = Path()
      ..moveTo(0, triangleY1 + borderRadius)
      ..lineTo(0, rheight - borderRadius)
      ..cubicTo(0, rheight - borderRadius, 0, rheight, borderRadius, rheight)
      ..lineTo(width - borderRadius, rheight)
      ..cubicTo(width - borderRadius, rheight, width, rheight, width,
          rheight - borderRadius)
      ..lineTo(width, borderRadius + triangleY1)
      ..cubicTo(width, borderRadius + triangleY1, width, triangleY1,
          width - borderRadius, triangleY1)
      ..lineTo(triangleX1, triangleY1)
      ..lineTo(triangleX3, 0)
      ..lineTo(triangleX2, triangleY1)
      ..lineTo(borderRadius, triangleY1)
      ..cubicTo(borderRadius, triangleY1, 0, triangleY1, 0,
          borderRadius + triangleY1);

    final pathBottom = Path()
      ..lineTo(0, rheight - borderRadius)
      ..cubicTo(0, rheight - borderRadius, 0, rheight, borderRadius, rheight)
      ..lineTo(triangleX1, size.height - triangleY1)
      ..lineTo(triangleX3, size.height)
      ..lineTo(triangleX2, size.height - triangleY1)
      //..lineTo(oneThird, rheight)
      //..lineTo(width / 2 - borderRadius, height - borderRadius)
      //..cubicTo(width / 2 - borderRadius, height - borderRadius, width / 2,
      //    height, width / 2 + borderRadius, height - borderRadius)
      //..lineTo(2 * oneThird, rheight)
      ..lineTo(width - borderRadius, rheight)
      ..cubicTo(width - borderRadius, rheight, width, rheight, width,
          rheight - borderRadius)
      ..lineTo(width, borderRadius)
      ..cubicTo(width, borderRadius, width, 0, width - borderRadius, 0)
      ..lineTo(borderRadius, 0)
      ..cubicTo(borderRadius, 0, 0, 0, 0, borderRadius);

    return isTop ? pathTop : pathBottom;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
