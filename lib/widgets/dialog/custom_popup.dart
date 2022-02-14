import 'dart:ui';
import 'package:flutter/material.dart';

class CustomPopUpDialog extends StatelessWidget {
  const CustomPopUpDialog(
      {Key? key,
      this.title,
      this.body,
      this.isBlur = true,
      this.isAlert = false,
      this.isSuccess = false,
      this.isError = false,
      this.isBtn=false})
      : super(key: key);

  final String? title;
  final String? body;
  final bool? isBlur;
  final bool? isAlert;
  final bool? isSuccess;
  final bool? isError;
  final bool isBtn;

  @override
  Widget build(BuildContext context) {
    Icon? icon;
    Color? color;
    String? title;
    if (isSuccess!) {
      icon = const Icon(
        Icons.check,
        size: 30,
        color: Colors.white,
      );
      title = "Амжилттай";
      color = const Color(0xff70C217);
    } else if (isAlert!) {
      icon = const Icon(
        Icons.priority_high,
        size: 30,
        color: Colors.white,
      );
      title = "Анхааруулга";
      color = Colors.yellow;
    } else {
      icon = const Icon(
        Icons.close,
        size: 30,
        color: Colors.white,
      );
      title = "Амжилтгүй";
      color = Colors.red;
    }
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
      blendMode: BlendMode.lighten,
      child: AlertDialog(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: color, borderRadius: BorderRadius.circular(15)),
                child: icon),
          ],
        ),
        elevation: 5,
        titlePadding: const EdgeInsets.all(40),
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(26))),
        titleTextStyle: const TextStyle(
            fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),
        content: Container(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  title.toUpperCase(),
                  style: const TextStyle(
                      color: Color(0xff30359F),
                      fontStyle: FontStyle.normal,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                Text(
                  body!.toUpperCase(),
                  style: TextStyle(
                      color: const Color(0xff30359F).withOpacity(0.7),
                      fontStyle: FontStyle.normal,
                      fontSize: 15,
                      fontWeight: FontWeight.normal),
                  textAlign: TextAlign.center,
                )
              ],
            )),
      ),
    );
  }
}
