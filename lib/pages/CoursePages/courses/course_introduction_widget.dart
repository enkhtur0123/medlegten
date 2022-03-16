import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/common/widget_functions.dart';
import 'package:medlegten/models/Landing/course_info.dart';
import 'package:medlegten/widgets/icon_with_text_widget.dart';

class CourseIntroWidget extends StatelessWidget {
  CourseIntroWidget({Key? key, this.courseInfo}) : super(key: key);
  CourseInfo? courseInfo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: ExpandablePanel(
        header: Text(
          courseInfo!.courseName,
          style: const TextStyle(
              color: colorPrimary,
              fontFamily: 'Roboto',
              fontSize: 16,
              fontWeight: FontWeight.w500),
        ),
        collapsed: Column(
          children: [getIntroWidget()],
        ),
        expanded: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            getIntroWidget(),
            addVerticalSpace(20),
            Text(
              courseInfo!.shortDesc,
              style: const TextStyle(color: colorBlack, height: 1.5),
              textAlign: TextAlign.start,
              softWrap: true,
            )
          ],
        ),
      ),
    );
  }

  Widget getIntroWidget() {
    return Row(
      children: [
        IconWithTextWidget(
            iconData: Icons.shopping_cart, text: courseInfo!.purchaseCount),
        addHorizontalSpace(20),
        IconWithTextWidget(
            iconData: Icons.timer, text: courseInfo!.hours + " цаг"),
      ],
    );
  }
}
