import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/common/widget_functions.dart';

class CourseDetailUnit extends HookWidget {
  const CourseDetailUnit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        color: ColorTable.color255_255_255,
        shadowColor: Colors.grey.withOpacity(0.5),
        elevation: 10.0,
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
                  const Text(
                    'Unit 1: Pronoun, to be',
                    style: TextStyle(
                        color: colorPrimary,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700,
                        fontSize: 20),
                  ),
                  addVerticalSpace(5),
                  Row(
                    children: [
                      const SizedBox(
                          child: Icon(
                        Icons.person_outline_outlined,
                        color: Color.fromRGBO(130, 130, 130, 1),
                        size: 16.0,
                      )),
                      addHorizontalSpace(3),
                      const Text('Beginner',
                          style: TextStyle(
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
                      const Text('30 minutes',
                          style: TextStyle(
                              color: Color.fromRGBO(130, 130, 130, 1),
                              fontWeight: FontWeight.w400,
                              fontSize: 12)),
                    ],
                  )
                ],
              ),
              Container(
                child: iconLocked(),
              ),
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
