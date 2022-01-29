import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Helper {
  BuildContext context;
  late DateTime currentBackPressTime;

  Helper(this.context);

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (now.difference(currentBackPressTime) > const Duration(seconds: 2)) {
      currentBackPressTime = now;

      Fluttertoast.showToast(
          msg: 'Tap again to leave', gravity: ToastGravity.SNACKBAR);
      return Future.value(false);
    }
    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    return Future.value(true);
  }

  Future<bool> backPage() {
    DateTime now = DateTime.now();
    if (now.difference(currentBackPressTime) > const Duration(seconds: 4)) {
      currentBackPressTime = now;

      Fluttertoast.showToast(
          msg: 'Tap again to leave', gravity: ToastGravity.SNACKBAR);
      return Future.value(false);
    }
    return Future.value(true);
  }
}
