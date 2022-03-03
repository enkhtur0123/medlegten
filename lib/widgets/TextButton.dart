import 'package:flutter/material.dart';
import 'package:medlegten/common/colors.dart';

// ignore: must_be_immutable
class TextButtonWidget extends StatelessWidget {
  const TextButtonWidget(
      {Key? key,
      this.text,
      required this.onTap,
      this.fontWeight,
      this.fontStyle,this.color})
      : super(key: key);
  final String? text;
  final Function onTap;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(
        color: colorPrimary,
        fontWeight: fontWeight ?? FontWeight.w500,
        fontStyle: fontStyle ?? FontStyle.normal,
        fontSize: 14,
        fontFamily: 'Roboto');
    return TextButton(
      style: TextButton.styleFrom(
        primary: color??colorPrimary,
      ),
      onPressed: () {
        onTap();
      },
      child: Text(
        text!,
        style: textStyle,
      ),
    );
  }
}
