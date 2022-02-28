import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/common/widget_functions.dart';
import 'package:medlegten/components/loading.dart';
import 'package:medlegten/models/Landing/course_info.dart';
import 'package:medlegten/pages/CoursePages/courses/course_cart.dart';
import 'package:medlegten/repositories/course_repository.dart';
import 'package:medlegten/repositories/landing_repository.dart';
import 'package:medlegten/utils/app_router.dart';
import 'package:medlegten/widgets/TextButton.dart';
import 'package:medlegten/widgets/loader.dart';

class CourseList extends HookWidget {
  CourseList({Key? key}) : super(key: key);

  final TextStyle textStyle = TextStyle(color: ColorTable.color48_53_159);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        addVerticalSpace(10),
        Align(
            alignment: Alignment.topLeft,
            child: TextButtonWidget(text: 'Courses', onTap: () {})),
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
                    .map((courseInfo) => CourseCart(
                          courseInfo,
                          onTap: (String id) async {
                            if (!courseInfo.isCreatedPlan) {
                              LoadingIndicator(context: context)
                                  .showLoadingIndicator();
                              await CourseRepository()
                                  .setCoursePlan(id: courseInfo.courseId)
                                  .then((value) {
                                LoadingIndicator(context: context)
                                    .hideLoadingIndicator();
                                if (value != null) {
                                  AutoRouter.of(context).push(CourseDetailRoute(
                                      courseInfo: courseInfo));
                                }
                              }).catchError((onError) {
                                LoadingIndicator(context: context)
                                    .hideLoadingIndicator();
                              });
                            } else {
                              AutoRouter.of(context).push(
                                  CourseDetailRoute(courseInfo: courseInfo));
                            }
                          },
                        ))
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
