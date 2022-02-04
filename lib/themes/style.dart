import 'package:flutter/material.dart';

const secondaryColor = Color(0xff7864FE);
final appTheme = ThemeData(
  tabBarTheme: const TabBarTheme(),
  bottomAppBarColor: Colors.white,
  bottomAppBarTheme: const BottomAppBarTheme(color: Colors.white),
  bottomNavigationBarTheme:
      const BottomNavigationBarThemeData(backgroundColor: Colors.white),
  primaryColor:const Color(0xff30359F),
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xff7864FE),
    foregroundColor: Colors.white,
    titleTextStyle: TextStyle(
        fontStyle: FontStyle.normal,
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: Colors.white),
    titleSpacing: 0,
    centerTitle: false,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(8),
      ),
    ),
  ),
  colorScheme: const ColorScheme.dark(
    secondary: Color(0xFF9054E7),
    secondaryVariant: Color(0xFFF88E77),
  ),
  textTheme: const TextTheme(
    headline1: TextStyle(fontFamily: "Roboto", color: Color(0xff30359F)),
    headline2: TextStyle(fontFamily: "Roboto", color: Color(0xff30359F)),
    headline3: TextStyle(fontFamily: "Roboto", color: Color(0xff30359F)),
    headline4: TextStyle(fontFamily: "Roboto", color: Color(0xff30359F)),
    headline5: TextStyle(fontFamily: "Roboto", color: Color(0xff30359F)),
    headline6: TextStyle(fontFamily: "Roboto", color: Color(0xff30359F)),
    bodyText1: TextStyle(fontFamily: "Roboto", color: Color(0xff30359F)),
    bodyText2: TextStyle(fontFamily: "Roboto", color: Color(0xff30359F)),
  ),
  hintColor: Colors.white,
  dividerColor: Colors.white54,
  fontFamily: 'Roboto',
  backgroundColor: Colors.white,
);
