import 'package:flutter/material.dart';

class CoursePayment extends StatefulWidget {
  static var name;

  @override
  State<StatefulWidget> createState() {
    return CoursePaymentState();
  }
}

class CoursePaymentState extends State<CoursePayment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.topCenter,
              margin: EdgeInsets.all(30),
              child: Text("Төлбөрийн төрлөө сонгоно уу!",
                  style: TextStyle(fontStyle: FontStyle.normal, fontWeight: FontWeight.bold, fontSize: 16),
                  textAlign: TextAlign.center),
            ),
            getPaymentFunction(),
          ],
        ));
  }

  Widget getPaymentFunction({String? title}) {
    return Container(
      margin: EdgeInsets.all(20), 
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
         ],
      ),
      child: Row(
        children: [
          Image.asset("assets/img/payment/qpay.png"),
          Text("Qpay"),

        ],
      ),
    );
  }
}
