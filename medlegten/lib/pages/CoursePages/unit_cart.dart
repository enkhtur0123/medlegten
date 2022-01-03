import 'package:flutter/material.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/models/Landing/course_unit.dart';

class UnitCart extends StatelessWidget {
  const UnitCart(this.courseInfo, {Key? key}) : super(key: key);

  final CourseUnit courseInfo;

  final TextStyle textStyle = const TextStyle(color: Colors.black);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorTable.color255_255_255,
        borderRadius: BorderRadius.circular(10),
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
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Flexible(
                flex: 2,
                child: Column(
                  children: [
                    Text('Анхан шат', style: textStyle),
                    Text('Тухайн хичээлийн товч тайлбар', style: textStyle),
                    Row(children: [
                      Text('Beginner', style: textStyle),
                      Text('42 hours', style: textStyle),
                      Text('31 lessons', style: textStyle),
                    ]),
                    Text('250000', style: textStyle),
                  ],
                ),
              ),
              Flexible(
                child: Column(
                  children: [],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
