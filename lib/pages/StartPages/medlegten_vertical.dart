import 'package:flutter/material.dart';

class MedlegtenLogoVertical extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  final double width;
  const MedlegtenLogoVertical(this.textStyle,
      {Key? key, this.text = 'LINGOS APP', this.width = 100})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/logo/start_logo.png',
              width: width, height: width / 1.3, fit: BoxFit.contain),
          const SizedBox(height: 30,),
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
