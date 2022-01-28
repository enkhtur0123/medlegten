import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:medlegten/models/Landing/course_info.dart';
import 'package:medlegten/utils/app_router.dart';
import 'package:medlegten/widgets/footer/footer_view.dart';
import 'package:medlegten/widgets/footer/footer_widget.dart';

class CoursePaymentPage extends StatefulWidget {
  final CourseInfo? courseInfo;

  CoursePaymentPage({Key? key, this.courseInfo}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return CoursePaymentState();
  }
}

class CoursePaymentState extends State<CoursePaymentPage> {
  String infoText =
      "Гүйлгээний мэдээллийг нэг бүрчлэн оруулах шаардлагагүйгээр дээрх банкны апп-р төлбөр төлөх боломжтой.";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Payment",
            textAlign: TextAlign.start,
          ),
          centerTitle: false,
        ),
        backgroundColor: Colors.white,
        body: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                alignment: Alignment.topCenter,
                margin: EdgeInsets.all(30),
                child: Text("Төлбөрийн төрлөө сонгоно уу!",
                    style: TextStyle(fontStyle: FontStyle.normal, fontWeight: FontWeight.bold, fontSize: 16),
                    textAlign: TextAlign.center),
              ),
              GestureDetector(
                onTap: () {
                  AutoRouter.of(context).push(QpayRoute(courseInfo:widget.courseInfo));
                },
                child:
                    getPaymentFunction(title: "Qpay", body: "QPay-р төлбөр төлөх", icon: "assets/img/payment/qpay.png"),
              ),
              GestureDetector(
                onTap: () {
                  // print("Social pay");
                },
                child: getPaymentFunction(
                  title: "Social pay",
                  body: "Social pay-р төлбөр төлөх",
                  icon: "assets/img/payment/socialpay.png",
                ),
              )
            ],
          ),
          Container(
              padding: EdgeInsets.only(bottom: 100),
              child: Text(infoText,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, fontStyle: FontStyle.normal, fontWeight: FontWeight.normal))),
        ]));
  }

  Widget getPaymentFunction({String? icon, String? title, String? body}) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(left: 20, right: 20, top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0.5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(icon!, width: 50),
          SizedBox(
            width: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title!.toUpperCase(),
                  style: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  )),
              SizedBox(
                height: 10,
              ),
              Text(
                body!,
                style: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.w500, fontSize: 11),
              )
            ],
          ),
        ],
      ),
    );
  }
}
