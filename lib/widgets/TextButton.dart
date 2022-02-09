import 'package:flutter/material.dart';
import 'package:medlegten/common/colors.dart';

// ignore: must_be_immutable
class TextButtonWidget extends StatelessWidget {
  TextButtonWidget({Key? key, this.text, required this.onTap}) : super(key: key);
  final String? text;
  final Function onTap;
  TextStyle textStyle = const TextStyle(color: colorPrimary, fontWeight: FontWeight.w500, fontSize: 14, fontFamily: 'Roboto');
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        primary: colorPrimary,
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
