import 'package:flutter/material.dart';
import 'package:medlegten/common/colors.dart';

// ignore: must_be_immutable
class CustomOutlinedButton extends StatelessWidget {
  CustomOutlinedButton(
      {Key? key,
      this.text,
      this.color,
      this.onTap,
      this.height,
      this.textAlign})
      : super(key: key);
  String? text;
  Function? onTap;
  Color? color;
  double? height;
  TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: TextButton(
        onPressed: () {
          onTap!();
        },
        child: Text(
          text ?? "",
          style: const TextStyle(
              color: colorWhite,
              fontWeight: FontWeight.w500,
              fontSize: 14,
              fontFamily: 'Roboto'),
          textAlign: textAlign ?? TextAlign.start,
        ),
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(color ?? Colors.transparent),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              side: BorderSide(color: color ?? Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
