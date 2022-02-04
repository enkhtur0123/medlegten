import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:medlegten/components/loading.dart';
import 'package:medlegten/models/Landing/course_info.dart';
import 'package:medlegten/repositories/payment_repository.dart';
import 'package:medlegten/repositories/repository.dart';
import 'package:medlegten/widgets/amount_widget.dart';
import 'package:medlegten/widgets/dialog/custom_bottom_sheet_dialog.dart';
import 'package:medlegten/widgets/snackbar/custom_snackbar.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class QpayPage extends HookWidget {
  QpayPage({Key? key, this.courseInfo, this.couponCode, this.price})
      : super(key: key);

  CourseInfo? courseInfo;
  String? couponCode;
  String? price;

  @override
  Widget build(BuildContext context) {
    Map<String,dynamic> body = {
      "paymentType": "1001",
      "productId": courseInfo!.courseId,
      "price": price,
      "couponCode": couponCode,
      "promoId": ""
    };
    return Scaffold(
      appBar: AppBar(
        title: const Text("Qpay Payment"),
        centerTitle: false,
      ),
      body: FutureBuilder(
        future: CoursePaymentRepository().createInvoice(body: body),
        builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.hasData) {
            return Container(
              color: Colors.white,
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Төлөх дүн:",
                        style: TextStyle(
                            fontSize: 20,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      AmountWidget(
                        amount: double.parse(price!.replaceAll(",", "")),
                      )
                    ],
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    "Банкны апп-аар",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontStyle: FontStyle.normal),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Divider(
                    thickness: 0.5,
                    height: 5,
                    color: Colors.grey.withOpacity(0.5),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GridView.count(
                    crossAxisSpacing: 30,
                    mainAxisSpacing: 10,
                    crossAxisCount: 3,
                    shrinkWrap: true,
                    children: snapshot.data!
                        .map((e) => GestureDetector(
                              onTap: () async {
                                await launchApp(
                                    context: context, link: e["link"]);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 1,
                                      blurRadius: 1,
                                      offset: const Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ClipRRect(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(15)),
                                        child: Image.network(
                                          e["logo"],
                                          width: 50,
                                        )),
                                    Text(e["name"], textAlign: TextAlign.center)
                                  ],
                                ),
                              ),
                            ))
                        .toList(),
                  ),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return const Loading();
          } else {
            return const Loading();
          }
        },
      ),
    );
  }

  /// Банкны аппаа дуудах
  launchApp({BuildContext? context, String? link}) async {
    if (await canLaunch(link!)) {
      await launch(link);
    } else {
      ScaffoldMessenger.of(context!).showSnackBar(MySnackBar(
        text: "Апп суулгана уу",
      ));
    }
  }
  modalBottomSheetMenu({BuildContext? context}) {
    showModalBottomSheet(
        context: context!,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(26), topRight: Radius.circular(26)),
        ),
        backgroundColor: Colors.white,
        builder: (context) {
          return CustomBottomSheetDialog();
        });
  }
}
