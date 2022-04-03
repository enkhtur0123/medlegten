import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:country_codes/country_codes.dart';
import 'package:flutter/material.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/common/widget_functions.dart';
import 'package:medlegten/models/Landing/course_info.dart';
import 'package:medlegten/repositories/course_repository.dart';
import 'package:medlegten/utils/app_router.dart';
import 'package:medlegten/utils/date_time_formatter.dart';
import 'package:medlegten/widgets/amount_widget.dart';
import 'package:medlegten/widgets/buttons/custom_outlined_button.dart';
import 'package:medlegten/widgets/icon_with_text_widget.dart';
import 'package:url_launcher/url_launcher.dart';

////Cart байгаа хэсэгт заавал Flexible ашигла
// ignore: must_be_immutable
class CourseCart extends StatelessWidget {
  CourseCart(this.courseInfo, {Key? key, this.onTap}) : super(key: key);

  final CourseInfo courseInfo;
  Function(String id)? onTap;

  final TextStyle textStyle = const TextStyle(color: Colors.black);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (courseInfo.isReady != "1") {
          onTap!(courseInfo.courseId);
        }
      },
      child: Container(
        margin: const EdgeInsets.only(left: 10, right: 10),
        padding: const EdgeInsets.symmetric(vertical: 5),
        width: double.infinity,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xff343C44).withOpacity(0.1),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                  BoxShadow(
                    color: const Color(0xff75838E).withOpacity(0.04),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 8,
                    child: Container(
                      padding: const EdgeInsets.only(left: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            courseInfo.courseName,
                            style: const TextStyle(
                                color: colorPrimary,
                                fontFamily: 'Roboto',
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
                          addVerticalSpace(15),
                          addVerticalSpace(5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Flexible(
                                  fit: FlexFit.loose,
                                  flex: 3,
                                  child: IconWithTextWidget(
                                      iconData: Icons.timer,
                                      text: courseInfo.hours + ' цаг')),
                              const SizedBox(
                                width: 10,
                              ),
                              Flexible(
                                  fit: FlexFit.loose,
                                  flex: 4,
                                  child: IconWithTextWidget(
                                      iconData: Icons.feed_outlined,
                                      text: courseInfo.units + ' хичээл')),
                            ],
                          ),
                          addVerticalSpace(5),
                          !courseInfo.isPurchased
                              ? AmountWidget(
                                  amount: double.parse(courseInfo.price
                                      .toString()
                                      .replaceAll(",", "")),
                                )
                              : Container(
                                  margin: const EdgeInsets.only(top: 10),
                                  child: Text(
                                    MyDateTimeFormatter(
                                            date: courseInfo.purchaseExpireDate,
                                            noTime: true)
                                        .toDateTime()
                                        .toString()
                                        .split(" ")[0]
                                        .replaceAll("-", "."),
                                    style: const TextStyle(fontSize: 15),
                                  ),
                                ),
                        ],
                      ),
                    ),
                  ),
                  Flexible(flex: 4, child: courseBgImg(context, courseInfo)),
                ],
              ),
            ),
            courseInfo.isReady == "1"
                ? Positioned.fill(
                    left: 0,
                    right: 0,
                    top: 0,
                    bottom: 0,
                    child: Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.8),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Text(
                        "Тун Удахгүй".toLowerCase(),
                        textAlign: TextAlign.center,
                        style:
                            const TextStyle(fontSize: 20, color: Colors.grey),
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}

courseBgImg(context, CourseInfo courseInfo) {
  String imgUrl = '';

  switch (courseInfo.courseId) {
    case "1":
      {
        imgUrl = 'assets/img/Course/course_cart_a1.png';
      }
      break;
    case "2":
      {
        imgUrl = 'assets/img/Course/course_cart_a2.png';
      }
      break;
    case "3":
      {
        imgUrl = 'assets/img/Course/course_cart_a3.png';
      }
      break;
  }
  return Stack(
    children: [
      ClipRRect(
        borderRadius: const BorderRadius.only(
            topRight: Radius.circular(8), bottomRight: Radius.circular(8)),
        child: Image.asset(
          imgUrl,
          fit: BoxFit.fitHeight,
          filterQuality: FilterQuality.high,
        ),
      ),
      Positioned.fill(
          child: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: AutoSizeText(
                courseInfo.levelName + ' Түвшин'.toUpperCase(),
                maxLines: 1,
                style: const TextStyle(
                    color: colorWhite,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Roboto',
                    fontSize: 16),
              ),
            ),
            addVerticalSpace(10),
            Container(
              margin: const EdgeInsets.only(left: 10, right: 10),
              child: CustomOutlinedButton(
                onTap: () async {
                  if (!courseInfo.isCreatedPlan) {
                    await CourseRepository()
                        .setCoursePlan(id: courseInfo.courseId)
                        .then((value) {
                      if (value != null) {
                        AutoRouter.of(context).push(PaymentRoute(
                            courseInfo: courseInfo,
                            paymentType: "1001",
                            isCourse: true));
                      }
                    }).catchError((onError) {
                      // print(onError);
                    });
                  } else if (courseInfo.isPurchased) {
                    AutoRouter.of(context)
                        .push(CourseDetailRoute(courseInfo: courseInfo));
                  } else {
                    if (Platform.isIOS) {
                      CountryCodes.init().then((value) {
                        final Locale? deviceLocale =
                            CountryCodes.getDeviceLocale();
                        if (deviceLocale!.countryCode == "MN") {
                          AutoRouter.of(context).push(PaymentRoute(
                              courseInfo: courseInfo,
                              paymentType: "1001",
                              isCourse: true));
                        } else {
                          launch("https://www.lingos.mn/payment");
                        }
                      });
                    } else {
                      AutoRouter.of(context).push(PaymentRoute(
                          courseInfo: courseInfo,
                          paymentType: "1001",
                          isCourse: true));
                    }
                  }
                },
                text: courseInfo.isPurchased ? "Эхлэх" : "Төлбөр төлөх",
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ))
    ],
  );
}
