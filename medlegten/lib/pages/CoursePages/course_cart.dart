import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/common/widget_functions.dart';
import 'package:medlegten/models/Landing/course_info.dart';
import "package:intl/intl.dart";
import 'package:medlegten/utils/app_router.dart';

class CourseCart extends StatelessWidget {
  const CourseCart(this.courseInfo, {Key? key}) : super(key: key);

  final CourseInfo courseInfo;

  final TextStyle textStyle = const TextStyle(color: Colors.black);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: SizedBox(
        width: double.infinity,
        child: Card(
          color: ColorTable.color255_255_255,
          shadowColor: Colors.grey.withOpacity(0.5),
          elevation: 10.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            courseInfo.courseName,
                            style: const TextStyle(
                                color: colorPrimary,
                                fontFamily: 'Roboto',
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        addVerticalSpace(5),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            courseInfo.shortDesc,
                            style: const TextStyle(
                                color: Color.fromRGBO(189, 189, 189, 1),
                                fontFamily: 'Roboto',
                                fontSize: 10,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        addVerticalSpace(5),
                        Row(
                          children: [
                            const SizedBox(
                                child: Icon(
                              Icons.person_outline_outlined,
                              color: Color.fromRGBO(130, 130, 130, 1),
                              size: 12.0,
                            )),
                            addHorizontalSpace(3),
                            Text(courseInfo.levelName,
                                style: const TextStyle(
                                    color: Color.fromRGBO(130, 130, 130, 1),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12)),
                            addHorizontalSpace(20),
                            const SizedBox(
                                child: Icon(
                              Icons.timer,
                              color: Color.fromRGBO(130, 130, 130, 1),
                              size: 12.0,
                            )),
                            addHorizontalSpace(3),
                            Text(courseInfo.hours + ' цаг',
                                style: const TextStyle(
                                    color: Color.fromRGBO(130, 130, 130, 1),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12)),
                            addHorizontalSpace(20),
                            const SizedBox(
                                child: Icon(
                              Icons.feed_outlined,
                              color: Color.fromRGBO(130, 130, 130, 1),
                              size: 12.0,
                            )),
                            addHorizontalSpace(3),
                            Text(courseInfo.units + ' хичээл',
                                style: const TextStyle(
                                    color: Color.fromRGBO(130, 130, 130, 1),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12)),
                          ],
                        ),
                        addVerticalSpace(5),
                        Text(toMoney(courseInfo.price),
                            style: const TextStyle(
                                color: colorPrimary,
                                fontWeight: FontWeight.w700,
                                fontSize: 23,
                                fontFamily: 'Arial')),
                      ],
                    ),
                  ),
                  courseBgImg(context, courseInfo),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

toMoney(stringMoney) {
  double d = double.parse(stringMoney);
  final currencyFormatter = NumberFormat('#,##0', 'MNG');
  return currencyFormatter.format(d) + '\u20AE';
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

  return Container(
    height: 120,
    width: 112,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage(imgUrl),
        fit: BoxFit.cover,
      ),
    ),
    child: Column(
      children: [
        addVerticalSpace(30),
        Text(
          courseInfo.levelName + ' level'.toUpperCase(),
          style: const TextStyle(
              color: colorWhite,
              fontWeight: FontWeight.w700,
              fontFamily: 'Roboto',
              fontSize: 16),
        ),
        addVerticalSpace(10),
        OutlinedButton(
          onPressed: () async {
            AutoRouter.of(context)
                .push(CourseDetailRoute(courseInfo: courseInfo));
          },
          style: OutlinedButton.styleFrom(
            side: const BorderSide(width: 1.0, color: colorWhite),
          ),
          child: const Text(
            'See units',
            style: TextStyle(
                color: colorWhite,
                fontWeight: FontWeight.w500,
                fontSize: 14,
                fontFamily: 'Roboto'),
          ),
        ),
      ],
    ),
  );
}
