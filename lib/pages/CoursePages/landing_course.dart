import 'package:flutter/material.dart';
import 'package:medlegten/pages/CoursePages/courses/course_list.dart';

import 'package:medlegten/pages/CoursePages/preliminary_test.dart';
import 'package:medlegten/pages/CoursePages/customer_review_list.dart';

class LandingCourse extends StatelessWidget {
  const LandingCourse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          PreliminaryTest(),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CourseList(),
                  CustomerReviewList(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
