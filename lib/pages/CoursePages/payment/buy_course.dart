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
  final double? videoPrice;
  final int? subscribtionCnt;

  // ignore: prefer_const_constructors_in_immutables
  PaymentPage(
      {Key? key,
      this.courseInfo,
      this.paymentType,
      this.contendId,
      this.paymentInfo,
      required this.isCourse,
      this.videoPrice,
      this.subscribtionCnt})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return PaymentState();
  }
}

class PaymentState extends State<PaymentPage> {
  TextEditingController controller = TextEditingController();
  FocusNode couponNode = FocusNode();
  String infoText = "Стардаст вишн Партнерс ХХК";
  String? couponCode;
  String? price;
  bool isSuccess = false;
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
      // backgroundColor: Colors.red,
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
                child: const Text(
                  "Төлбөрийн төрлөө сонгоно уу!",
                  style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 5,
                    child: Container(
                      width: double.infinity,
                      margin: const EdgeInsets.all(20),
                      child: MyTextField(
                        borderColor: isSuccess ? Colors.green : Colors.red,
                        labelColor: Colors.black,
                        key: GlobalKey<FormFieldState>(),
                        suffix: Container(
                          width: 0,
                          height: 0,
                        ),
                        controller: controller,
                        isBordered: true,
                        labelText: "Купон код",
                        focusNode: couponNode,
                        keyboardType: TextInputType.text,
                        enabled: true,
                        onChanged: (value) {},
                        onSubmitted: (value) {},
                      ),
                    ),
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
                          if (widget.isCourse!) {
                            checkCouponCode();
                          } else {
                            checkContentCouponCode();
                          }
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
                                : widget.paymentInfo!.prices
                                    .singleWhere((element) =>
                                        int.parse(element.month) ==
                                        widget.subscribtionCnt)
                                    .price),
                        paymentType: widget.paymentType,
                        paymentInfo: widget.paymentInfo,
                        month: !widget.isCourse!
                            ? widget.subscribtionCnt.toString()
                            : ""),
                  );
                },
                child: getPaymentFunction(
                  title: "Qpay",
                  body: "QPay-р төлбөр төлөх",
                  icon: "assets/img/payment/qpay.svg",
                ),
              ),
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
            children: [
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
              )
            ],
          );
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
      isCourse: widget.isCourse,
    )
        .then((value) {
      LoadingIndicator(context: context).hideLoadingIndicator();
      if (value != null) {
        couponCode = value["coupon"]["couponCode"];
        price = value["coupon"]["price"];
        isSuccess = true;
        keyboardHide();
        couponNode.unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
        ScaffoldMessenger.of(context).showSnackBar(
          MySnackBar(
            text: "Уг купон кодыг ашиглах боломжтой байна.",
          ),
        );
        setState(() {});
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          MySnackBar(
            text: "Купон кодоо шалгана уу",
          ),
        );
        isSuccess = false;
        keyboardHide();
        setState(() {});
      }
    }).catchError((onError) {
      LoadingIndicator(context: context).hideLoadingIndicator();
      ScaffoldMessenger.of(context).showSnackBar(
        MySnackBar(
          text: "Купон кодоо шалгана уу",
        ),
      );
      keyboardHide();
      isSuccess = false;
      setState(() {});
    });
  }

  void keyboardHide() {
    FocusManager.instance.primaryFocus?.unfocus();
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

  void checkContentCouponCode() {
    LoadingIndicator(context: context).showLoadingIndicator();
    CoursePaymentRepository()
        .checkContentCouponCode(
      couponCode: controller.text.toString(),
      paymentInfo: widget.paymentInfo,
      isCourse: widget.isCourse,
    )
        .then((value) {
      LoadingIndicator(context: context).hideLoadingIndicator();
      if (value != null) {
        couponCode = value.couponCode;
        price = value.price;
        isSuccess = true;
        keyboardHide();
        couponNode.unfocus();
        FocusManager.instance.primaryFocus?.unfocus();

        if (widget.subscribtionCnt == int.parse(value.month)) {
          ScaffoldMessenger.of(context).showSnackBar(
            MySnackBar(
              text: "Уг купон кодыг ашиглах боломжтой байна.",
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            MySnackBar(
              text: "Купон код буруу байна",
            ),
          );
        }

        setState(() {});
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          MySnackBar(
            text: "Купон кодоо шалгана уу",
          ),
        );
        isSuccess = false;
        keyboardHide();
        setState(() {});
      }
    }).catchError((onError) {
      LoadingIndicator(context: context).hideLoadingIndicator();
      ScaffoldMessenger.of(context).showSnackBar(
        MySnackBar(
          text: "Купон кодоо шалгана уу",
        ),
      );
      keyboardHide();
      isSuccess = false;
      setState(() {});
    });
  }
}
