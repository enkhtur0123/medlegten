import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/models/Unit/last_seen_unit.dart';
import 'package:medlegten/pages/CoursePages/course_unit_module_list/course_unit_module_helper.dart';
import 'package:medlegten/pages/CoursePages/course_unit_module_list/unit_module_header.dart';
import 'package:medlegten/repositories/landing_repository.dart';
import 'package:medlegten/utils/app_router.dart';
import 'package:medlegten/utils/to_percent.dart';
import 'package:medlegten/widgets/loader.dart';
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
            ? GestureDetector(
                onTap: () {
                  LoadingIndicator(context: context).showLoadingIndicator();
                  LandingRepository()
                      .getLastSeenUnitInfo(
                          unitId: lastSeenUnit!.unitId,
                          moduleId: lastSeenUnit!.moduleId,
                          moduleTypeId: lastSeenUnit!.moduleTypeId)
                      .then((value) {
                    LoadingIndicator(context: context).hideLoadingIndicator();
                    switch (value.moduleInfo!.moduleTypeId) {
                      case "8":
                      case "9":
                        {
                          if (value.moduleInfo!.isUpcoming &&
                              value.moduleInfo!.isCompleted) {
                            AutoRouter.of(context).push(
                              UnitTestRoute(
                                  isOnlyShowResult: false,
                                  unitTitle: value.moduleInfo!.moduleTypeName,
                                  moduleTypeId: value.moduleInfo!.moduleTypeId,
                                  moduleId: value.moduleInfo!.moduleId),
                            );
                          } else if (value.moduleInfo!.isUpcoming &&
                              value.moduleInfo!.isCompleted) {
                            AutoRouter.of(context).push(
                              UnitTestRoute(
                                  isOnlyShowResult: true,
                                  unitTitle: value.moduleInfo!.moduleTypeName,
                                  moduleTypeId: value.moduleInfo!.moduleTypeId,
                                  moduleId: value.moduleInfo!.moduleId),
                            );
                          }
                          break;
                        }
                      default:
                        if (value.moduleInfo!.isUpcoming ||
                            value.moduleInfo!.isCompleted) {
                          UnitModuleHelper().showUnitPages(
                              context, value.moduleInfo!, value.unitInfo);
                        }
                    }
                  }).catchError((onError) {
                    LoadingIndicator(context: context).hideLoadingIndicator();
                  });
                },
                child: Row(
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
                                    completedCount:
                                        lastSeenUnit!.completedCount,
                                    unCompletedCount:
                                        lastSeenUnit!.unCompletedCount,
                                    fixed: 3)
                                .toDouble(),
                            isCenter: true,
                            text: Percent.toPercent(
                              percent: calculatePercent(
                                  totalCount: (lastSeenUnit!.completedCount +
                                      lastSeenUnit!.unCompletedCount),
                                  completedCount: lastSeenUnit!.completedCount,
                                  unCompletedCount:
                                      lastSeenUnit!.unCompletedCount,
                                  fixed: 3),
                            ),
                            progressColor: colorPrimary),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Unit " +
                                  lastSeenUnit!.unitNumber +
                                  "-" +
                                  lastSeenUnit!.unitName,
                              textAlign: TextAlign.justify,
                              style: const TextStyle(
                                  color: Color(0xff333333),
                                  fontSize: 14,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.normal),
                            ),
                            const SizedBox(height: 5,),
                            Text(lastSeenUnit!.moduleTypeName,style: percentStyle,)
                          ],
                        ),
                      ],
                    ),
                   
                  ],
                ),
              )
            : emptyContainer(),
      ],
    );
  }
}
