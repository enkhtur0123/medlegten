import 'package:flutter/material.dart';

final appProvider = AppProvider();

class AppProvider extends ChangeNotifier {
  final GlobalKey<NavigatorState> key;

  AppProvider()
      : key = GlobalKey<NavigatorState>(),
        super();

  NavigatorState? get navi => key.currentState;
}
