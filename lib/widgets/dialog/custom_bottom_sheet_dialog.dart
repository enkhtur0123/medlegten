import 'package:flutter/material.dart';
import 'package:medlegten/widgets/buttons/custom_outlined_button.dart';

class CustomBottomSheetDialog extends StatelessWidget {
  
  CustomBottomSheetDialog({Key? key,this.isError=false,this.isSuccess=true}) : super(key: key);
  String text = "";
  bool? isError;
  bool? isSuccess;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.45,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Color(0xffF4F5F3),
                borderRadius: BorderRadius.all(Radius.circular(15)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
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
                  "амжилттай".toUpperCase(),
                  style: TextStyle(
                      color: Color(0xff70C217),
                      fontSize: 30,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  margin: EdgeInsets.all(20),
                  child: Text(
                    "Төлбөр амжилттай төлөгдлөө. Танд сурлагын өндөр амжилт хүсье!",
                    style: TextStyle(
                        fontSize: 14,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.normal),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
            Container(
                margin: EdgeInsets.all(20),
                child: CustomOutlinedButton(
                  height: 50,
                  onTap: () {
                    Navigator.pop(context);
                  },
                  text: "Let’s Do this",
                  color: Color(0xff7864FE),
                )),
          ],
        ));
  }
}
