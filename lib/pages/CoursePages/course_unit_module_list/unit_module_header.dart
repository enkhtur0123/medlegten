import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/common/widget_functions.dart';
import 'package:medlegten/components/icon_text.dart';
import 'package:medlegten/models/Landing/course_unit.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class UnitModuleHeader extends HookWidget {
  const UnitModuleHeader({Key? key,this.unitInfo}) : super(key: key);

  final CourseUnit? unitInfo;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
      addVerticalSpace(20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'UNIT ${unitInfo!.unitNumber}: ${unitInfo!.unitName.toUpperCase()}',
                  style: const TextStyle(
                      color: colorPrimary,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w700,
                      fontSize: 16),
                ),
                addVerticalSpace(8),
                Row(
                  children: [
                    const IconText(Icons.person_outline_outlined, 'Beginner'),
                    addHorizontalSpace(20),
                    const IconText(Icons.timer, '16 min'),
                  ],
                )
              ],
            ),
            addHorizontalSpace(20),
            CircularPercentIndicator(
                radius: 40.0,
                lineWidth: 3.0,
                percent: 0.6,
                center: const Text(
                  "60%",
                  style: TextStyle(color: colorPrimary),
                ),
                progressColor: colorPrimary)
          ],
        ),
        addVerticalSpace(10),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Divider(
            color: Color.fromRGBO(199, 201, 217, .2),
            thickness: 1,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
    ],);
  }
}
