import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:medlegten/components/loading.dart';
import 'package:medlegten/models/Landing/course_info.dart';
import 'package:medlegten/repositories/repository.dart';
import 'package:medlegten/widgets/dialog/custom_bottom_sheet_dialog.dart';
import 'package:medlegten/widgets/snackbar/custom_snackbar.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class QpayPage extends HookWidget {
  QpayPage({Key? key, this.courseInfo,this.couponCode,this.price}) : super(key: key);

  CourseInfo? courseInfo;
  bool _showBottomSheet = false;
  String? couponCode;
  String? price;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Qpay Payment"),
        centerTitle: false,
      ),
      body: FutureBuilder(
        future:getQpayBanK(),
        builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.hasData) {
            return Container(
                color: Colors.white,
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(10),
                child: GridView.count(
                  crossAxisSpacing: 30,
                  mainAxisSpacing: 10,
                  crossAxisCount: 3,
                  shrinkWrap: true,
                  children: snapshot.data!
                      .map((e) => GestureDetector(
                            onTap: () async {
                              await launchApp(context: context,link: e["link"]);
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
                                    offset:const Offset(0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  ClipRRect(
                                      borderRadius: BorderRadius.all(Radius.circular(15)),
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
                ));
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
  launchApp({BuildContext? context,String? link}) async { 
    if (await canLaunch(link!)) {
      await launch(link);
    } else {
      ScaffoldMessenger.of(context!).showSnackBar(MySnackBar(text: "Апп суулгана уу",));
    }
  }
   /// Нэхэмжлэл үүсгэх Банкнуудын жагсаалт авах 
  Future<List<dynamic>> getQpayBanK() async {
    Map body = {
      "paymentType": "1001",
      "productId": courseInfo!.courseId,
      "price": price,
      "couponCode": couponCode,
      "promoId": ""
    };
    var data = await dioRepository.instance.post('Payments', data: body);
    return data.data["qpay"]["urls"];
  }
  
  _modalBottomSheetMenu({BuildContext? context}) {
    showModalBottomSheet(
        context: context!,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(26), topRight: Radius.circular(26)),
        ),
        backgroundColor: Colors.white,
        builder: (context) {
          return CustomBottomSheetDialog();
        });
      }
  }
