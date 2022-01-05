import 'package:flutter/material.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/models/Landing/course_info.dart';

class CourseCart extends StatelessWidget {
  const CourseCart(this.courseInfo, {Key? key}) : super(key: key);

  final CourseInfo courseInfo;

  final TextStyle textStyle = const TextStyle(color: Colors.black);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorTable.color255_255_255,
      shadowColor: Colors.grey.withOpacity(0.5),
      elevation: 10.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Column(
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
              Container(
                width: 100,
                color: ColorTable.color120_100_254,
                child: Column(
                  children: [Text('250000', style: textStyle)],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
