import 'package:flutter/material.dart';

class CustomPopUpDialog extends StatelessWidget {
  const CustomPopUpDialog(
      {Key? key,
      this.title = "",
      this.body,
      this.isBlur = true,
      this.isAlert = false,
      this.isSuccess = false,
      this.isError = false,
      this.isInfo = false,
      this.isNotification = false,
      this.isBtn = false})
      : super(key: key);

  final String? title;
  final String? body;
  final bool? isBlur;
  final bool? isAlert;
  final bool? isSuccess;
  final bool? isError;
  final bool? isInfo;
  final bool? isNotification;
  final bool isBtn;

  @override
  Widget build(BuildContext context) {
    Icon? icon;
    Color? color;
    String? titleInner;
    if (isSuccess!) {
      icon = const Icon(
        Icons.check,
        size: 30,
        color: Colors.white,
      );

      titleInner = "Амжилттай";
      color = const Color(0xff70C217);
    } else if (isAlert!) {
      icon = const Icon(
        Icons.priority_high,
        size: 30,
        color: Colors.white,
      );
      titleInner = "Анхааруулга";
      color = Colors.yellow;
    } else if (isInfo!) {
      icon = const Icon(
        Icons.swipe,
        size: 30,
        color: Colors.white,
      );
      titleInner = "ЗААВАР";
      color = Colors.green;
    } else if (isNotification!) {
      icon = const Icon(
        Icons.notifications,
        size: 30,
        color: Colors.white,
      );
      titleInner = "Мэдэгдэл";
      color = Colors.green;
    } else {
      icon = const Icon(
        Icons.close,
        size: 30,
        color: Colors.white,
      );
      titleInner = "Амжилтгүй";
      color = Colors.red;
    }
    if (title != null) {
      titleInner = title;
    }
    return
        // BackdropFilter(
        //   filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        // blendMode: BlendMode.lighten,
        AlertDialog(
      title: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(15),
              ),
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
              titleInner!.toUpperCase(),
              maxLines: 1,
              style: const TextStyle(
                  color: Color(0xff30359F),
                  fontStyle: FontStyle.normal,
                  fontSize: 26,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
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
        ),
      ),
    );
    // );
  }
}
