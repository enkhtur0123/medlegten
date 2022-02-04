import 'package:flutter/material.dart';
import 'package:medlegten/pages/CoursePages/courses/course_list.dart';
import 'package:medlegten/pages/CoursePages/customer_review/customer_review_list.dart';
import 'package:medlegten/pages/CoursePages/courses/level_info.dart';
import 'package:medlegten/pages/CoursePages/courses/preliminary_test.dart';
import 'package:medlegten/services/http_helper.dart';
import 'package:medlegten/utils/date_time_formatter.dart';

class LandingCourse extends StatefulWidget {
  const LandingCourse({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return LandingCourseState();
  }
}

class LandingCourseState extends State<LandingCourse> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          FutureBuilder(
              future: HttpHelper().getUrl(url: "Course/SelfQuiz/History"),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  bool isExam = checkExam(data: snapshot.data);
                  return isExam ? PreliminaryTest() : const LevelInfoWidget();
                } else if (snapshot.hasError)
                  return Container();
                else
                  return Container();
              }),
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

  bool checkExam({Object? data}) {
    DateTime currentDateTime =
        MyDateTimeFormatter(nowDateTime: true).toDateTime();
    DateTime examDateTime =
        MyDateTimeFormatter(date: (data as Map)["quizDetial"]["createdAt"])
            .toDateTime()
            .add(const Duration(days: 3));
    if (examDateTime.isAfter(currentDateTime)) {
      return false;
    } else {
      return true;
    }
  }
}