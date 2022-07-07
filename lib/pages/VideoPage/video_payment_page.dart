import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/models/video/payment_info.dart';
import 'package:medlegten/themes/style.dart';
import 'package:medlegten/widgets/amount_widget.dart';
import 'package:medlegten/widgets/buttons/custom_outlined_button.dart';

import '../../models/video/price.dart';
import '../../utils/app_router.dart';

class VideoPaymentPage extends HookConsumerWidget {
  VideoPaymentPage({Key? key, this.paymentInfo}) : super(key: key);

  PaymentInfo? paymentInfo;
  double currentPrice = 0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: const Color(0xffFCFCFE),
      appBar: AppBar(
        title: const Text("Төлбөр"),
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: paymentInfo!.prices.map((e) {
            return itemWidget(price: e, context: context);
          }).toList(),
        ),
      ),
    );
  }

  Widget itemWidget({Price? price, BuildContext? context}) {
    double monthPrice = (int.parse(price!.price) / int.parse(price.month));
    return Container(
      padding: const EdgeInsets.only(top: 15, bottom: 15, left: 20, right: 20),
      margin: const EdgeInsets.only(top: 20),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 7,
            offset: const Offset(2.0, 2.0),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            fit: FlexFit.loose,
            flex: 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "1 сарын эрх",
                  style: TextStyle(
                      color: const Color(0xff5E5E61).withOpacity(0.8),
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    AmountWidget(
                      amount: monthPrice,
                    ),
                    const Text(
                      "/сар",
                      style: TextStyle(color: colorPrimary, fontSize: 17),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      "Нийт төлбөр",
                      style: TextStyle(
                          color: const Color(0xff5E5E61).withOpacity(0.8),
                          fontSize: 14),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    AmountWidget(
                      amount: double.parse(price.price),
                      fontSize: 14,
                      color: const Color(0xff5E5E61).withOpacity(0.8),
                    )
                  ],
                ),
              ],
            ),
          ),
          Flexible(
            fit: FlexFit.loose,
            flex: 3,
            child: CustomOutlinedButton(
              height: 50,
              color: secondaryColor,
              text: "Төлбөр төлөх",
              onTap: () {
                AutoRouter.of(context!).push(
                  PaymentRoute(
                    courseInfo: null,
                    paymentType: "1002",
                    videoPrice: double.parse(price.price),
                    subscribtionCnt: int.parse(price.month),
                    isCourse: false,
                    paymentInfo: paymentInfo,
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
