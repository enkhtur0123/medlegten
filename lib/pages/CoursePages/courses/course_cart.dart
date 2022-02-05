import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/common/widget_functions.dart';
import 'package:medlegten/components/icon_text.dart';
import 'package:medlegten/models/Landing/course_info.dart';
import 'package:medlegten/utils/app_router.dart';
import 'package:medlegten/widgets/amount_widget.dart';
import 'package:medlegten/widgets/buttons/custom_outlined_button.dart';

////Cart байгаа хэсэгт заавал Flexible ашигла
class CourseCart extends StatelessWidget {
  CourseCart(this.courseInfo, {Key? key, this.onTap}) : super(key: key);

  final CourseInfo courseInfo;
  Function(String id)? onTap;

  final TextStyle textStyle = const TextStyle(color: Colors.black);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap!(courseInfo.courseId);
      },
      child: Container(
        margin: const EdgeInsets.only(left: 10, right: 10),
        padding: const EdgeInsets.symmetric(vertical: 5),
        width: double.infinity,
        child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
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
                  flex: 8,
                  child: Container(
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
                                fontSize: 10,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        addVerticalSpace(5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Flexible(
                                flex: 2,
                                child: IconText(Icons.person_outline_outlined,
                                    courseInfo.levelName)),
                            Flexible(
                                flex: 3,
                                child: IconText(
                                    Icons.timer, courseInfo.hours + ' цаг')),
                            Flexible(
                                flex: 4,
                                child: IconText(Icons.feed_outlined,
                                    courseInfo.units + ' хичээл')),
                          ],
                        ),
                        addVerticalSpace(5),
                        AmountWidget(
                          amount: double.parse(
                              courseInfo.price.toString().replaceAll(",", "")),
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(flex: 4, child: courseBgImg(context, courseInfo)),
              ],
            )),
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
        borderRadius: BorderRadius.only(
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
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Text(
                courseInfo.levelName + ' level'.toUpperCase(),
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
                  onTap: () {
                    if (!courseInfo.isPurchased) {
                      AutoRouter.of(context)
                          .push(CourseDetailRoute(courseInfo: courseInfo));
                    } else {
                      AutoRouter.of(context)
                          .push(CoursePaymentRoute(courseInfo: courseInfo));
                    }
                  },
                  text: courseInfo.isPurchased ? "See units" : "Buy Now"),
            ),
          ],
        ),
      ))
    ],
  );
}
