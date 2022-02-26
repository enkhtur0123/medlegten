import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/common/widget_functions.dart';
import 'package:medlegten/components/icon_text.dart';
import 'package:medlegten/models/Landing/course_info.dart';

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
          style: const TextStyle(color: colorPrimary, fontFamily: 'Roboto', fontSize: 16, fontWeight: FontWeight.w500),
        ),
        collapsed: Column(
          children: [
            getIntroWidget()
          ],
        ),
        expanded: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            getIntroWidget(),
            addVerticalSpace(20),
            Text(
              courseInfo!.shortDesc,
              style: TextStyle(color: colorBlack, height: 1.5),
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
        const IconText(Icons.remove_red_eye_outlined, '1233 views'),
        addHorizontalSpace(20),
        IconText(Icons.timer, courseInfo!.hours + " цаг"),
      ],
    );
  }
}
