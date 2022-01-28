import 'dart:ui';
import 'package:flutter/material.dart';

class CustomPopUpDialog extends StatelessWidget {
  CustomPopUpDialog({Key? key, this.title, this.titleIcon, this.body,this.isBlur=true}) : super(key: key);

  final String? title;
  final String? body;
  final Icon? titleIcon;
  final bool? isBlur;

  @override
  Widget build(BuildContext context) {
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
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(color: Color(0xff70C217), borderRadius: BorderRadius.circular(15)),
                child: Icon(
                  Icons.check,
                  size: 30,
                )),
          ],
        ),
        elevation: 5,
        titlePadding: EdgeInsets.all(40),
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(26))),
        titleTextStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),
        content: Container(
            padding: EdgeInsets.all(30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "${title!.toUpperCase()}",
                  style: TextStyle(
                      color: Color(0xff30359F), fontStyle: FontStyle.normal, fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Text(
                  "${body!.toUpperCase()}",
                  style: TextStyle(
                      color: Color(0xff30359F).withOpacity(0.7),
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
