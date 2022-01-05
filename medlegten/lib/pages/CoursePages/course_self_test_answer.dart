import 'package:flutter/material.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/common/widget_functions.dart';
import 'package:medlegten/pages/CoursePages/course_self_test_question.dart';

class CourseSelfTestAnswer extends StatelessWidget {
  final String answer;
  const CourseSelfTestAnswer({Key? key, required this.answer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorTable.color255_255_255,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: colorPrimary.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 8, left: 20, right: 20),
        child: Text(answer, style: TextStyle(color: Color.fromRGBO(51, 51, 51, 1), fontFamily: 'Roboto', fontSize: 15, fontWeight: FontWeight.w400),),
      ),
    );
  }
}