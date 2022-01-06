import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/common/widget_functions.dart';
import 'package:medlegten/components/loading.dart';
import 'package:medlegten/models/Landing/course_info.dart';
import 'package:medlegten/pages/CoursePages/course_cart.dart';
import 'package:medlegten/repositories/landing_repository.dart';

class CourseList extends HookWidget {
  CourseList({Key? key}) : super(key: key);

  final TextStyle textStyle = TextStyle(color: ColorTable.color48_53_159);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        addVerticalSpace(20),
        Align(
          alignment: Alignment.topLeft,
          child: Text('Courses', style: textStyle),
        ),
        addVerticalSpace(5),
        FutureBuilder<List<CourseInfo>?>(
          future: LandingRepository().getCourseList(),
          builder: (BuildContext context,
              AsyncSnapshot<List<CourseInfo>?> snapshot) {
            if (snapshot.hasData) {
              var orderedCourses = snapshot.data!
                ..sort((a, b) =>
                    int.parse(a.ordering).compareTo(int.parse(b.ordering)));
              return Column(
                children: orderedCourses
                    .map((courseInfo) => CourseCart(courseInfo))
                    .toList(),
              );
              //return Listlist;
            } else if (snapshot.hasError) {
              return const Loading();
            } else {
              return const Loading();
            }
          },
        ),
      ],
    );
  }
}
