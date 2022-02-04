import 'package:flutter/material.dart';

class ReportItem {
  IconData? iconData;
  String? title;
  String? body;
  List<Color>? colors;
  Color? iconColor;
  Color? titleColor;
  Color? bodyColor;
  double? bodyFontSize;
  FontWeight? bodyFontWeight;
  String? imgUrl;
  ReportItem(
      {this.iconData,
      this.title,
      this.body,
      this.colors,
      this.iconColor,
      this.bodyColor,
      this.bodyFontSize,
      this.bodyFontWeight,
      this.imgUrl,
      this.titleColor});
}
