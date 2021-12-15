import 'package:flutter/material.dart';

class MedlegtenLogoVertical extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  final double width;
  const MedlegtenLogoVertical(this.textStyle,
      {Key? key, this.text = 'MEDLEGTEN APP', this.width = 100})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/img/Logo.png',
              width: width, height: width / 1.3, fit: BoxFit.fitWidth),
          Text(
            text,
            textAlign: TextAlign.center,
            style: textStyle,
          ),
        ],
      ),
    );
  }
}
