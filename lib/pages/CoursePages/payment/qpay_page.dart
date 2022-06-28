import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:medlegten/components/loading.dart';
import 'package:medlegten/models/Landing/course_info.dart';
import 'package:medlegten/models/video/payment_info.dart';
import 'package:medlegten/repositories/payment_repository.dart';
import 'package:medlegten/widgets/amount_widget.dart';
import 'package:medlegten/widgets/dialog/custom_bottom_sheet_dialog.dart';
import 'package:medlegten/widgets/snackbar/custom_snackbar.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class QpayPage extends HookWidget {
  QpayPage(
      {Key? key,
      this.courseInfo,
      this.couponCode,
      this.price,
      this.paymentType = "",
      this.paymentInfo,
      required this.isCourse})
      : super(key: key);

  CourseInfo? courseInfo;
  String? couponCode;
  String? price;
  String? invoice_id;
  String? paymentType;
  PaymentInfo? paymentInfo;
  bool? isCourse;
  ValueNotifier isCall = ValueNotifier(false);

  Future<List<dynamic>> createInvoice() async {
    Map<String, dynamic> body = {
      "paymentType": paymentType,
      "productId": isCourse! ? courseInfo!.courseId : paymentInfo!.productId,
      "price": price,
      "couponCode": couponCode,
      "promoId": ""
    };
    List<dynamic> list =
        await CoursePaymentRepository().createInvoice(body: body);
    invoice_id = list[1];
    return list;
  }

  @override
  Widget build(BuildContext context) {
    final future = useMemoized(createInvoice);
    final snapshot = useFuture(future);
    AppLifecycleState? appLifecycleState = useAppLifecycleState();
    checkPaymentStatus(appLifecycleState: appLifecycleState, context: context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Төлбөр"),
        centerTitle: false,
      ),
      body: snapshot.hasData && snapshot.data!.isNotEmpty
          ? Container(
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
                        amount: double.parse(
                          price!.replaceAll(",", ""),
                        ),
                      )
                    ],
                  ),
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
                    children: (snapshot.data![0] as List)
                        .map(
                          (e) => GestureDetector(
                            onTap: () async {
                              await launchApp(
                                  context: context, link: e["link"]);
                            },
                            child: Container(
                              padding: const EdgeInsets.all(10),
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
                              child: SizedBox(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      fit: FlexFit.tight,
                                      flex: 5,
                                      child: ClipRRect(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(8)),
                                        child: Image.network(
                                          e["logo"],
                                          height: 45,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Expanded(
                                      flex: 4,
                                      child: AutoSizeText(
                                        e["name"],
                                        maxLines: 3,
                                        textAlign: TextAlign.center,
                                        // style: const TextStyle(fontSize: 6),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
            )
          : const Loading(),
    );
  }

  checkPaymentStatus(
      {AppLifecycleState? appLifecycleState, BuildContext? context}) {
    if (appLifecycleState == AppLifecycleState.resumed && isCall.value) {
      CoursePaymentRepository()
          .checkPaymentStatus(invoice_id: invoice_id)
          .then((value) async {
        if (value != null) {
          await modalBottomSheetMenu(
              context: context,
              isSuccess: true,
              body:
                  "Төлбөр амжилттай төлөгдлөө. Танд сурлагын өндөр амжилт хүсье!");
        } else {
          await modalBottomSheetMenu(
              context: context,
              isError: true,
              body: "Төлбөр төлөлт амжилтгүй боллоо");
        }
      });
    }
  }

  /// Банкны аппаа дуудах
  Future launchApp({BuildContext? context, String? link}) async {
    if (await canLaunch(link!)) {
      isCall.value = true;
      await launch(link);
    } else {
      ScaffoldMessenger.of(context!).showSnackBar(
        MySnackBar(
          text: "Апп суулгана уу",
        ),
      );
    }
  }

  modalBottomSheetMenu(
      {BuildContext? context,
      bool? isSuccess = false,
      bool? isError = false,
      String? body}) {
    showModalBottomSheet<bool>(
        enableDrag: false,
        isScrollControlled: true,
        context: context!,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(26), topRight: Radius.circular(26)),
        ),
        backgroundColor: Colors.white,
        builder: (context) {
          return CustomBottomSheetDialog(
            isError: isError,
            isSuccess: isSuccess,
            body: body,
          );
        }).then((value) {
      if (value!) {
        AutoRouter.of(context).navigateNamed("/");
      }
    });
  }
}
