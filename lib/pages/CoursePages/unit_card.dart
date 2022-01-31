import 'dart:math';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/common/widget_functions.dart';
import 'package:medlegten/components/icon_text.dart';
import 'package:medlegten/models/Landing/course_info.dart';
import 'package:medlegten/models/Landing/course_unit.dart';
import 'package:medlegten/themes/style.dart';
import 'package:medlegten/utils/app_router.dart';
import 'package:medlegten/widgets/amount_widget.dart';
import 'package:medlegten/widgets/buttons/custom_outlined_button.dart';

class UnitCart extends HookWidget {
  UnitCart({Key? key, this.courseInfo, this.unitInfo}) : super(key: key);
  final CourseUnit? unitInfo;
  final CourseInfo? courseInfo;

  List<Color> colors = [];

  @override
  Widget build(BuildContext context) {
    final rnd = Random();
    var iconWidgets = {
      0: iconLocked(),
      1: iconFree(),
      2: iconCompleted(),
    };
    return InkWell(
      onTap: () => {
        showModalBottomSheet(
            context: context,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(26), topRight: Radius.circular(26)),
            ),
            backgroundColor: Colors.white.withOpacity(0.69),
            builder: (context) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(26),
                      topRight: Radius.circular(26)),
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
                   const SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: [
                        Text(
                          courseInfo!.courseName.toUpperCase(),
                          style: const TextStyle(
                              fontSize: 20,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.normal),
                        ),
                        AmountWidget(
                          amount: double.parse(
                            courseInfo!.price.replaceAll(",", ""),
                          ),
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.normal,
                          fontSize: 50,
                        ),
                        Container(
                          height: 40,
                          padding: const EdgeInsets.only(
                              top: 10, bottom: 10, left: 60, right: 60),
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(4)),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              transform: const GradientRotation(0.7853982),
                              colors: getCourSeColor(),
                            ),
                          ),
                          child: Text(
                            courseInfo!.levelName.toUpperCase(),
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            label(text: "• 500 new words"),
                            label(text: "• Grammar Explanation"),
                            label(text: "• Writing features")
                          ],
                        )
                      ],
                    ),
                    Container(
                        margin: const EdgeInsets.all(15),
                        child: CustomOutlinedButton(
                          color: secondaryColor,
                          text: "Buy Now",
                          height: 50,
                          onTap: () {
                            AutoRouter.of(context).push(
                                CoursePaymentRoute(courseInfo: courseInfo));
                          },
                        ))
                  ],
                ),
              );
            })
      },
      // AutoRouter.of(context)
      //     .push(CourseUnitModuleListRoute(unitInfo: unitInfo!))

      child: Card(
        color: ColorTable.color255_255_255,
        borderOnForeground: true,
        shadowColor: Colors.grey,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Unit ' + unitInfo!.unitNumber + ': ' + unitInfo!.unitName,
                    style: const TextStyle(
                        color: colorPrimary,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700,
                        fontSize: 20),
                  ),
                  addVerticalSpace(5),
                  Row(
                    children: [
                      const IconText(Icons.person_outline_outlined, 'Beginner'),
                      addHorizontalSpace(20),
                      IconText(Icons.timer, unitInfo!.minToWatch + ' minutes'),
                    ],
                  )
                ],
              ),
              Container(child: iconWidgets[rnd.nextInt(100) % 3]),
            ],
          ),
        ),
      ),
    );
  }

  Widget label({String? text}) {
    return Container(
      // alignment: Alignment.c,
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

Widget iconCompleted() => Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: const Color.fromRGBO(122, 194, 23, .2),
      ),
      height: 25,
      width: 25,
      child: const Icon(
        Icons.check,
        color: Color.fromRGBO(122, 194, 23, 1),
        size: 14,
      ),
    );

Widget iconFree() => Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: const Color.fromRGBO(120, 100, 254, .2),
      ),
      height: 25,
      width: 25,
      child: const Icon(
        CupertinoIcons.lock_open_fill,
        color: Color.fromRGBO(120, 100, 254, 1),
        size: 14,
      ),
    );

Widget iconLocked() => Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: const Color.fromRGBO(120, 100, 254, .2),
      ),
      height: 25,
      width: 25,
      child: const Icon(
        CupertinoIcons.lock_fill,
        color: Color.fromRGBO(120, 100, 254, 1),
        size: 14,
      ),
    );
