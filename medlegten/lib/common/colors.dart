import 'package:flutter/material.dart';

const colorPrimary = Color.fromRGBO(48, 53, 159, 1);
const colorSecondary = Color.fromRGBO(120, 100, 254, 1);
const colorBlack = Colors.black;
const colorWhite = Colors.white;

const TextTheme TEXT_THEME_DEFAULT = TextTheme(
    headline1: TextStyle(
        color: colorPrimary,
        fontWeight: FontWeight.w400,
        fontSize: 16,
        fontFamily: 'Roboto'),
    headline2: TextStyle(
        color: colorPrimary,
        fontWeight: FontWeight.w700,
        fontSize: 18,
        fontFamily: 'Roboto'),
    headline3: TextStyle(
      color: Colors.grey,
      fontWeight: FontWeight.w400,
      fontSize: 14,
      fontFamily: 'Roboto',
      textBaseline: TextBaseline.alphabetic,
    ));

class ColorTable {
  ColorTable._();

  static Color color120_100_254 = const Color.fromRGBO(120, 100, 254, 1);
  static Color color255_255_255 = const Color.fromRGBO(255, 255, 255, 1);
  static Color color48_53_159 = const Color.fromRGBO(48, 53, 159, 1);

  //static const IconData more = const IconData(0xe800, fontFamily: _kFontFam);
}
