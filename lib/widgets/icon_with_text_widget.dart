import 'package:flutter/material.dart';

// ignore: must_be_immutable
class IconWithTextWidget extends StatelessWidget {
  IconWithTextWidget({Key? key, this.iconData, this.text, this.iconSize = 15})
      : super(key: key);
  IconData? iconData;
  String? text;
  double? iconSize;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = const TextStyle(
        color: Color(0xff828282),
        fontSize: 10,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.normal);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          iconData,
          size: iconSize,
          color: const Color(0xff828282),
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          text!,
          style: textStyle,
        )
      ],
    );
  }
}
