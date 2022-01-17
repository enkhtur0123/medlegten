import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/common/widget_functions.dart';
import 'package:medlegten/components/icon_text.dart';
import 'package:medlegten/models/Landing/course_unit.dart';
import 'package:medlegten/utils/app_router.dart';

class UnitCart extends HookWidget {
  const UnitCart(this.unitInfo, {Key? key}) : super(key: key);
  final CourseUnit unitInfo;

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
        AutoRouter.of(context)
            .push(CourseUnitModuleListRoute(unitInfo: unitInfo))
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
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Unit ' + unitInfo.unitNumber + ': ' + unitInfo.unitName,
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
                      IconText(Icons.timer, unitInfo.minToWatch + ' minutes'),
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
