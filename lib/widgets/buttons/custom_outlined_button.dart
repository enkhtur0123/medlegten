import 'package:flutter/material.dart';
import 'package:medlegten/common/colors.dart';

class CustomOutlinedButton extends StatelessWidget {
  CustomOutlinedButton({Key? key, this.text, this.onTap}) : super(key: key);
  String? text;
  Function? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child:TextButton(
      onPressed: () {
        onTap!();
      },
      child: Text(
        text ?? "",
        style: TextStyle(color: colorWhite, fontWeight: FontWeight.w500, fontSize: 14, fontFamily: 'Roboto'),
      ),
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: BorderSide(color: Colors.white),
          ),
        ),
      ),
    )
  );
}
}
