import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medlegten/models/Landing/course_info.dart';
import 'package:medlegten/models/video/payment_info.dart';
import 'package:medlegten/repositories/payment_repository.dart';
import 'package:medlegten/utils/app_router.dart';
import 'package:medlegten/widgets/buttons/custom_outlined_button.dart';
import 'package:medlegten/widgets/loader.dart';
import 'package:medlegten/widgets/my_textfield.dart';
import 'package:medlegten/widgets/snackbar/custom_snackbar.dart';

class PaymentPage extends StatefulWidget {
  final CourseInfo? courseInfo;
  final String? paymentType;
  final String? contendId;
  final PaymentInfo? paymentInfo;
  final bool? isCourse;

  // ignore: prefer_const_constructors_in_immutables
  PaymentPage(
      {Key? key,
      this.courseInfo,
      this.paymentType,
      this.contendId,
      this.paymentInfo,
      required this.isCourse})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return PaymentState();
  }
}

class PaymentState extends State<PaymentPage> {
  TextEditingController controller =
      TextEditingController(text: "924161ED12DA");
  FocusNode couponNode = FocusNode();
  String infoText = "Компанийн нэр: Стардаст вишн Партнерс ХХК";
  String? couponCode;
  String? price;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Төлбөр",
          textAlign: TextAlign.start,
        ),
        centerTitle: false,
      ),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                alignment: Alignment.topCenter,
                margin: const EdgeInsets.all(30),
                child: const Text("Төлбөрийн төрлөө сонгоно уу!",
                    style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                    textAlign: TextAlign.center),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    flex: 5,
                    child: Container(
                        margin: const EdgeInsets.all(20),
                        child: MyTextField(
                          controller: controller,
                          isBordered: true,
                          labelText: "Coupon code",
                          focusNode: couponNode,
                          keyboardType: TextInputType.text,
                          enabled: false,
                          onChanged: (value) {},
                        )),
                  ),
                  Flexible(
                    flex: 2,
                    child: Container(
                      margin: const EdgeInsets.only(right: 20),
                      child: CustomOutlinedButton(
                        color: const Color(0xff7864FE),
                        height: 50,
                        text: "шалгах",
                        onTap: () async {
                          checkCouponCode();
                        },
                      ),
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  AutoRouter.of(context).push(
                    QpayRoute(
                        isCourse: widget.isCourse,
                        courseInfo: widget.courseInfo,
                        couponCode: couponCode,
                        price: price ??
                            (widget.isCourse!
                                ? widget.courseInfo!.price
                                : widget.paymentInfo!.price),
                        paymentType: widget.paymentType,
                        paymentInfo: widget.paymentInfo),
                  );
                },
                child: getPaymentFunction(
                  title: "Qpay",
                  body: "QPay-р төлбөр төлөх",
                  icon: "assets/img/payment/qpay.svg",
                ),
              ),
              // GestureDetector(
              //   onTap: () {},
              //   child: getPaymentFunction(
              //     title: "Social pay",
              //     body: "Social pay-р төлбөр төлөх",
              //     icon: "assets/img/payment/socialpay.svg",
              //   ),
              // )
            ],
          ),
        ],
      ),
      bottomSheet: BottomSheet(
        enableDrag: true,
        backgroundColor: Colors.white,
        onClosing: () {},
        builder: (context) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:[
          Container(
            padding: const EdgeInsets.only(bottom: 100),
            child: Text(
              infoText,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 14,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.normal),
            ),
          )]);
        },
      ),
    );
  }

  void checkCouponCode() {
    LoadingIndicator(context: context).showLoadingIndicator();
    CoursePaymentRepository()
        .checkCouponCode(
            courseInfo: widget.courseInfo,
            couponCode: controller.text.toString(),
            paymentInfo: widget.paymentInfo,
            isCourse: widget.isCourse)
        .then((value) {
      LoadingIndicator(context: context).hideLoadingIndicator();
      if (value != null) {
        couponCode = value["coupon"]["couponCode"];
        price = value["coupon"]["price"];
        ScaffoldMessenger.of(context).showSnackBar(MySnackBar(
          text: "Амжилттай",
        ));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          MySnackBar(
            text: "Купон кодоо шалгана уу",
          ),
        );
      }
    }).catchError((onError) {
      LoadingIndicator(context: context).hideLoadingIndicator();
      ScaffoldMessenger.of(context).showSnackBar(
        MySnackBar(
          text: "Купон кодоо шалгана уу",
        ),
      );
    });
  }

  Widget getPaymentFunction({String? icon, String? title, String? body}) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0.5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SvgPicture.asset(icon!, width: 50),
          const SizedBox(
            width: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title!.toUpperCase(),
                  style: const TextStyle(
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  )),
              const SizedBox(
                height: 10,
              ),
              Text(
                body!,
                style: const TextStyle(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w500,
                    fontSize: 11),
              )
            ],
          ),
        ],
      ),
    );
  }
}
