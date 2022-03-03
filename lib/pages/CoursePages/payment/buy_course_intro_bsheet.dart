import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:medlegten/models/Landing/course_info.dart';
import 'package:medlegten/themes/style.dart';
import 'package:medlegten/utils/app_router.dart';
import 'package:medlegten/widgets/amount_widget.dart';
import 'package:medlegten/widgets/buttons/custom_outlined_button.dart';

// ignore: must_be_immutable
class BuyCourseIntroWidget extends StatelessWidget {
  BuyCourseIntroWidget({Key? key, this.courseInfo}) : super(key: key);
  CourseInfo? courseInfo;
  List<Color> colors = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(26), topRight: Radius.circular(26)),
        gradient: LinearGradient(
          colors: [
            const Color(0xffFFFFFF).withOpacity(0.5),
            const Color(0xffFFFFFF).withOpacity(0.6539),
            const Color(0xffFFFFFF).withOpacity(0.3639),
            const Color(0xffFFFFFF).withOpacity(0.5),
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                courseInfo!.courseName.toUpperCase(),
                style: const TextStyle(
                    fontSize: 20,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.normal),
              ),
              const SizedBox(
                height: 20,
              ),
              AmountWidget(
                amount: double.parse(
                  courseInfo!.price.replaceAll(",", ""),
                ),
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.normal,
                fontSize: 50,
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 40,
                padding: const EdgeInsets.only(
                    top: 10, bottom: 10, left: 60, right: 60),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(4)),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    transform: const GradientRotation(0.7853982),
                    colors: getCourSeColor(),
                  ),
                ),
                child: Text(
                  courseInfo!.levelName.toUpperCase(),
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 30, right: 60),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: courseInfo!.purchaseDesc.map((e) {
                      return label(text: "• ${e.toString()}");
                    }).toList()),
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.all(25),
            child: CustomOutlinedButton(
              color: secondaryColor,
              text: "Худалдаж авах",
              height: 50,
              onTap: () {
                AutoRouter.of(context).push(
                  PaymentRoute(
                      courseInfo: courseInfo,
                      paymentType: "1001",
                      isCourse: true),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Widget label({String? text}) {
    return SizedBox(
      child: Text(
        text!,
        style: const TextStyle(
            color: Color(0xff6573DB),
            fontSize: 17,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.normal),
        textAlign: TextAlign.start,
      ),
    );
  }

  getCourSeColor() {
    switch (courseInfo!.courseId) {
      case "1":
        {
          colors = [
            const Color(0xffFF3868).withOpacity(0.57),
            const Color(0xffFEB59F).withOpacity(1)
          ];
        }
        break;
      case "2":
        {
          colors = [
            const Color(0xff4481EB).withOpacity(1),
            const Color(0xff4481EB).withOpacity(0.56),
            const Color(0xff1AE5EF).withOpacity(1),
          ];
        }
        break;
      case "3":
        {
          colors = [
            const Color(0xff1BD370).withOpacity(1),
            const Color(0xff27AE60).withOpacity(0.35),
            const Color(0xff1BD370).withOpacity(0.4),
            const Color(0xff3DC24B).withOpacity(0.28),
          ];
        }
        break;
    }
    return colors;
  }
}
