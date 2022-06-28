import 'package:flutter/material.dart';
import 'package:medlegten/common/colors.dart';

// ignore: must_be_immutable
class CustomInkWellButton extends StatelessWidget {
  CustomInkWellButton(
      {Key? key,
      this.text,
      this.color,
      this.onTap,
      this.height,
      this.textAlign,
      this.fontSize,this.fontWeight,this.fontStyle})
      : super(key: key);
  String? text;
  Function? onTap;
  Color? color;
  double? height;
  TextAlign? textAlign;
  double? fontSize;
  FontWeight? fontWeight;
  FontStyle? fontStyle;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(
        color: color??colorPrimary,
        fontWeight: fontWeight ?? FontWeight.w500,
        fontStyle: fontStyle ?? FontStyle.normal,
        fontSize: 14,
        fontFamily: 'Roboto');
    return InkWell(
      onTap: () {
        onTap!();
      },
      child: Text(
        text ?? "",
        style: textStyle,
        textAlign: textAlign ?? TextAlign.start,
      ),
    );
  }
}
