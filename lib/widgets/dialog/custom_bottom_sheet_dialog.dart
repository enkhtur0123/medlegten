import 'package:flutter/material.dart';
import 'package:medlegten/widgets/buttons/custom_outlined_button.dart';

// ignore: must_be_immutable
class CustomBottomSheetDialog extends StatelessWidget {
  CustomBottomSheetDialog(
      {Key? key, this.isError = false, this.isSuccess = false,this.body=""})
      : super(key: key);
  String text = "";
  bool? isError;
  bool? isSuccess;
  String? body;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.45,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: const Color(0xffF4F5F3),
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Image.asset(
                "assets/img/like.png",
                width: 35,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  isSuccess!
                      ? "амжилттай".toUpperCase()
                      : "амжилтгүй".toUpperCase(),
                  style: const TextStyle(
                      color: Color(0xff70C217),
                      fontSize: 30,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  margin: const EdgeInsets.all(20),
                  child: Text(
                    body??"",
                    style: const TextStyle(
                        fontSize: 14,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.normal),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
            Container(
                margin: const EdgeInsets.all(20),
                child: CustomOutlinedButton(
                  height: 50,
                  onTap: () {
                    Navigator.pop(context);
                  },
                  text: "Let’s Do this",
                  color: const Color(0xff7864FE),
                )),
          ],
        ));
  }
}
