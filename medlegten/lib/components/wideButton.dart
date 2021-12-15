import 'package:flutter/material.dart';

class WideButton extends StatelessWidget {
  final String text;
  final Color backroundColor;
  final Color foregroundColor;
  final Function onPressed;
  final String? imgPath;
  const WideButton(
      this.text, this.backroundColor, this.foregroundColor, this.onPressed,
      {Key? key, this.imgPath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      width: double.infinity, // <-- match_parent
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: ElevatedButton(
            style: TextButton.styleFrom(
              backgroundColor: backroundColor,
              primary: Colors.black87,
              splashFactory: InkRipple.splashFactory,
              elevation: 5,
              minimumSize: const Size(88, 36),
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
              ),
            ),
            onPressed: () => onPressed.call(),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                imgPath != null
                    ? Image.asset(
                        imgPath!,
                        height: 20,
                        width: 20,
                      )
                    : Container(),
                SizedBox(width: imgPath != null ? 20 : 1),
                Text(
                  text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: foregroundColor,
                      fontFamily: 'Roboto-Regular',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      height: 1),
                ),
              ],
            )),
      ),
    );
  }
}
