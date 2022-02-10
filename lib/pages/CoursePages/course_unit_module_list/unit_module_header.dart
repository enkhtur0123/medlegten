import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/common/widget_functions.dart';
import 'package:medlegten/models/Landing/course_unit.dart';
import 'package:medlegten/models/Landing/unit_complete_percent.dart';
import 'package:medlegten/repositories/unit_repository.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class UnitModuleHeader extends HookWidget {
  const UnitModuleHeader({Key? key, this.unitInfo}) : super(key: key);

  final CourseUnit? unitInfo;

  ///
  Future<UnitCompleteInfo> fetchUnitCompletePercent() async {
    var result = await UnitRepository()
        .getUnitCompletePercent(id: unitInfo!.unitId, mode: "1");
    return result;
  }

  @override
  Widget build(BuildContext context) {
    final percentFuture = useMemoized(fetchUnitCompletePercent);
    final percentSnapshot = useFuture(percentFuture);
    return Column(
      children: [
        addVerticalSpace(20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'UNIT ${unitInfo!.unitNumber}: ${unitInfo!.unitName.toUpperCase()}',
              style: const TextStyle(
                  color: colorPrimary,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w700,
                  fontSize: 16),
            ),
            addHorizontalSpace(20),
            CircularPercentIndicator(
                radius: 40.0,
                lineWidth: 3.0,
                percent: percentSnapshot.hasData
                    ? calculatePercent(
                            totalCount: (percentSnapshot.data!.completedCount +
                                percentSnapshot.data!.unCompletedCount),
                            unCompletedCount:
                                percentSnapshot.data!.unCompletedCount,fixed: 3)
                        .toDouble()
                    : 0,
                center: percentSnapshot.hasData
                    ? Text(
                        (calculatePercent(
                                totalCount:
                                    (percentSnapshot.data!.completedCount +
                                        percentSnapshot.data!.unCompletedCount),
                                unCompletedCount:
                                    percentSnapshot.data!.unCompletedCount,fixed: 1)*100).toStringAsFixed(0)+"%",
                        style: const TextStyle(color: colorPrimary),
                        textAlign: TextAlign.center,
                      )
                    : const Text("0%"),
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
      ],
    );
  }
////Хувь тооцох
  double calculatePercent({int? totalCount, int? unCompletedCount,int? fixed=3}) {
    double percent = ((100 * unCompletedCount!) / totalCount!) / 100;
    return double.parse(percent.toStringAsFixed(fixed!));
 }
}
