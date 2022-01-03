import 'package:flutter/material.dart';
import 'package:medlegten/pages/CoursePages/course_list.dart';
import 'package:medlegten/pages/CoursePages/preliminary_test.dart';

class LandingCourse extends StatelessWidget {
  const LandingCourse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const PreliminaryTest(),
        CourseList(),
      ],
    );
  }
}
