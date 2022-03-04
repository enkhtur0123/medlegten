import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/models/Landing/course_info.dart';
import 'package:medlegten/models/Landing/course_unit.dart';
import 'package:medlegten/pages/CoursePages/payment/buy_course_intro_bsheet.dart';
import 'package:medlegten/utils/app_router.dart';
import 'package:medlegten/widgets/snackbar/custom_snackbar.dart';
import 'unit_progress_status.dart';

class UnitCart extends HookWidget {
  const UnitCart({Key? key, this.courseInfo, this.unitInfo}) : super(key: key);
  final CourseUnit? unitInfo;
  final CourseInfo? courseInfo;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        if (unitInfo!.openUnit) {
          if (unitInfo!.hasTrial == "1" || courseInfo!.isPurchased) {
            AutoRouter.of(context)
                .push(CourseUnitModuleListRoute(unitInfo: unitInfo!));
          } else {
            await showModalBottomSheet(
                context: context,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(26),
                      topRight: Radius.circular(26)),
                ),
                elevation: 10,
                isDismissible: true,
                backgroundColor: Colors.white.withOpacity(0.69),
                enableDrag: true,
                builder: (context) {
                  return BuyCourseIntroWidget(
                    courseInfo: courseInfo,
                  );
                }).then((value) {
              Navigator.pop(context);
            });
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(MySnackBar(
            text: "Таны Өнөөдрийн эрх дууссан байна",
          ));
        }
      },
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
            mainAxisSize: MainAxisSize.max,
            children: [
              Flexible(
                fit: FlexFit.loose,
                flex: 6,
                //child: Column(
                //  mainAxisAlignment: MainAxisAlignment.start,
                //  crossAxisAlignment: CrossAxisAlignment.start,
                //  children: [
                child: SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Unit ' +
                          unitInfo!.unitNumber +
                          ': ' +
                          unitInfo!.unitName,
                      style: const TextStyle(
                          color: colorPrimary,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w700,
                          fontSize: 20),
                    ),
                  ),
                ),
                // addVerticalSpace(5),
                // Row(
                //   children: [
                //     const IconText(
                //         Icons.person_outline_outlined, 'Beginner'),
                //     addHorizontalSpace(20),
                //     IconText(
                //         Icons.timer, unitInfo!.minToWatch + ' minutes'),
                //   ],
                // )
                //],
                //),
              ),
              Flexible(
                  fit: FlexFit.loose,
                  flex: 2,
                  child: Container(child: getUnitStatusWidget())),
            ],
          ),
        ),
      ),
    );
  }

  ///Unit Status
  getUnitStatusWidget() {
    if (courseInfo!.isPurchased) {
      if (unitInfo!.isCompleted) {
        return iconCompleted();
      } else {
        return iconLocked();
      }
    } else {
      if (unitInfo!.hasTrial == '1') {
        return iconCompleted();
      } else {
        return iconLocked();
      }
    }
  }
}
