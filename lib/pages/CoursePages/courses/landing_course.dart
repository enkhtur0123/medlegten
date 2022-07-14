import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:medlegten/components/loading.dart';
import 'package:medlegten/pages/CoursePages/courses/course_list.dart';
import 'package:medlegten/pages/CoursePages/customer_review/customer_review_list.dart';
import 'package:medlegten/pages/CoursePages/courses/level_info.dart';
import 'package:medlegten/pages/CoursePages/courses/preliminary_test.dart';
import 'package:medlegten/providers/auth_provider.dart';
import 'package:medlegten/repositories/landing_repository.dart';
import 'package:medlegten/utils/date_time_formatter.dart';
import 'package:medlegten/widgets/dialog/custom_popup.dart';

class LandingCourse extends ConsumerStatefulWidget {
  const LandingCourse({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return LandingCourseState();
  }

  // @override
  // State<StatefulWidget> createState() {
  //   return LandingCourseState();
  // }
}

class LandingCourseState extends ConsumerState<LandingCourse> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (GetStorage().hasData("isGuest")) {
        await showDialog(
            barrierDismissible: true,
            context: context,
            builder: (context) {
              return const CustomPopUpDialog(
                isAlert: true,
                iconData: Icons.account_circle_rounded,
                title: "Анхааруулга",
                body:
                    "Та уг үйлдлийг хийхийн тулд зочин эрхийг өөрийн сошиал эрхээр солино уу.",
              );
            });
      }
    });
   
  }

  @override
  Widget build(BuildContext context) {
    return !GetStorage().hasData("isGuest")
        ? Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          FutureBuilder(
              future: LandingRepository().getSelfTestDetail(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  bool isExam = checkExam(data: snapshot.data);
                        return isExam
                      ? const PreliminaryTest()
                      : LevelInfoWidget(
                          level: (snapshot.data as Map)["quizDetial"]
                              ["quizResult"]);
                } else if (snapshot.hasError) {
                  return Container();
                } else {
                  return const SizedBox(height: 100, child: Loading());
                }
              }),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                //mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CourseList(),
                  CustomerReviewList(),
                ],
              ),
            ),
          ),
        ],
            ),
          )
        : Container();
  }

  bool checkExam({Object? data}) {
    try {
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
    } catch (e) {
      return true;
    }
  }
}
