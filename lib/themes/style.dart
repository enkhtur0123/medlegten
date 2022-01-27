import 'package:flutter/material.dart';

final appTheme = ThemeData(
  appBarTheme: AppBarTheme( 
      backgroundColor: ThemeData.dark().scaffoldBackgroundColor,
      foregroundColor: Colors.white),
  colorScheme: const ColorScheme.dark(
    secondary: Color(0xFF9054E7),
    secondaryVariant: Color(0xFFF88E77),
  ),
  textTheme: TextTheme(),
  hintColor: Colors.white,
  dividerColor: Colors.white54,
  fontFamily: 'Roboto',
  backgroundColor: Colors.white
);
