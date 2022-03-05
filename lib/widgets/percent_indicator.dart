import 'package:flutter/material.dart';
import 'package:medlegten/common/colors.dart';
import 'package:percent_indicator/percent_indicator.dart';

// ignore: must_be_immutable
class CustomCircularPercentIndicator extends StatelessWidget {
  double? radius;
  double? lineWidth;
  double? percent;
  Color? progressColor;
  bool? isCenter;
  String? text;

  CustomCircularPercentIndicator(
      {Key? key,
      this.radius,
      this.lineWidth,
      this.percent = 0,
      this.progressColor,
      this.isCenter = false,this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: radius!,
      lineWidth: lineWidth!,
      percent: percent!,
      progressColor: progressColor ?? colorPrimary,
      center: isCenter!
          ? Text(
              text!,
              style: const TextStyle(color: colorPrimary),
              textAlign: TextAlign.center,
            )
          : Container(),
    );
  }
}
