import 'package:flutter/material.dart';
import 'package:medlegten/common/widget_functions.dart';

class IconText extends StatelessWidget {
  final String text;
  final IconData iconData;
  const IconText(this.iconData, this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          child: Icon(
            iconData,
            color: const Color.fromRGBO(130, 130, 130, 1),
            size: 22.0,
          ),
        ),
        addHorizontalSpace(3),
        Text(
          text,
          style: const TextStyle(
              color: Color.fromRGBO(130, 130, 130, 1),
              fontWeight: FontWeight.w400,
              fontSize: 12),
        )
      ],
    );
  }
}
