import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:medlegten/common/colors.dart';
class LoadingIndicator {
  LoadingIndicator({this.context});
  BuildContext? context;

  showLoadingIndicator() async {
    await showDialog(
      useSafeArea: true,
      barrierDismissible: true,
      context: context!,
      builder: (context) {
        return Dialog(
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            alignment: Alignment.center,
            child: const SpinKitCircle(
              color: colorPrimary,
              size: 50.0,
            ),
          ),
        );
      },
    );
  }

  hideLoadingIndicator() {
    Navigator.pop(context!);
  }
}
