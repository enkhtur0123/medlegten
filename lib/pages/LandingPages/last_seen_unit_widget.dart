import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/models/Unit/last_seen_unit.dart';
import 'package:medlegten/pages/CoursePages/course_unit_module_list/unit_module_header.dart';
import 'package:medlegten/utils/to_percent.dart';
import 'package:medlegten/widgets/percent_indicator.dart';

import 'last_seen_widget.dart';

// ignore: must_be_immutable
class LastSeenUnitWidget extends HookWidget {
  const LastSeenUnitWidget({Key? key, this.lastSeenUnit}) : super(key: key);
  
  final LastSeenUnit? lastSeenUnit;

  @override
  Widget build(BuildContext context) {
    TextStyle percentStyle = const TextStyle(
        color: colorPrimary,
        fontSize: 13,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.normal);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Үзэж буй Курс",
          style: TextStyle(
              fontSize: 10,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.normal),
        ),
        const SizedBox(
          height: 5,
        ),
        Divider(
          color: const Color(0xffC7C9D9).withOpacity(0.2),
          thickness: 1,
          height: 1,
        ),
        const SizedBox(
          height: 5,
        ),
        lastSeenUnit != null
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CustomCircularPercentIndicator(
                          radius: 40.0,
                          lineWidth: 3.0,
                          percent: calculatePercent(
                                  totalCount: (lastSeenUnit!.completedCount +
                                      lastSeenUnit!.unCompletedCount),
                                  completedCount: lastSeenUnit!.completedCount,
                                  unCompletedCount:
                                      lastSeenUnit!.unCompletedCount,
                                  fixed: 3)
                              .toDouble(),
                          progressColor: colorPrimary),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                       "Unit "+lastSeenUnit!.unitNumber+"-" +lastSeenUnit!.unitName,
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                            color: Color(0xff333333),
                            fontSize: 14,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.normal),
                      )
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 16),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: Percent.toPercent(
                              percent: calculatePercent(
                                  totalCount: (lastSeenUnit!.completedCount +
                                      lastSeenUnit!.unCompletedCount),
                                  completedCount: lastSeenUnit!.completedCount,
                                  unCompletedCount:
                                      lastSeenUnit!.unCompletedCount,
                                  fixed: 3),
                            ) +
                            "\n",
                        style: percentStyle,
                        children:  <TextSpan>[
                          TextSpan(
                            text: lastSeenUnit!.moduleTypeName,
                            style: percentStyle,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              )
            : emptyContainer(),
      ],
    );
  }
}
