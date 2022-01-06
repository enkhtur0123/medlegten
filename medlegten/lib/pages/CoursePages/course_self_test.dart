import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/common/widget_functions.dart';
import 'package:medlegten/components/landing_header.dart';
import 'package:medlegten/components/loading.dart';
import 'package:medlegten/components/wide_button.dart';
import 'package:medlegten/models/Landing/quiz_question.dart';
import 'package:medlegten/models/Landing/self_quiz.dart';
import 'package:medlegten/pages/CoursePages/course_self_test_question.dart';
import 'package:medlegten/repositories/landing_repository.dart';

class CourseSelfTestPage extends HookWidget {
  const CourseSelfTestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          LandingHeader(100),
          addVerticalSpace(20),
          Text(
            'Өөрийгөө үнэлэх тест'.toUpperCase(),
            style: const TextStyle(
                color: colorPrimary,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w700,
                fontSize: 16),
          ),
          addVerticalSpace(6),
          const Text(
            'Явцын шалгалт 2',
            style: TextStyle(
                color: colorPrimary,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w700,
                fontSize: 12),
          ),
          addVerticalSpace(10),
          const Divider(
            color: Color.fromRGBO(199, 201, 217, .3),
            thickness: 1,
          ),
          addVerticalSpace(20),
          Expanded(
            child: SingleChildScrollView(
              child: FutureBuilder<SelfQuiz?>(
                future: LandingRepository().getSelfQuiz(),
                builder:
                    (BuildContext context, AsyncSnapshot<SelfQuiz?> snapshot) {
                  if (snapshot.hasData) {
                    var list = snapshot.data!.questions
                      ..sort((a, b) => int.parse(b.ordering)
                          .compareTo(int.parse(a.ordering)));
                    return Column(
                      children:
                          list.map((s) => CourseSelfTestQuestion(s)).toList(),
                    );
                  } else if (snapshot.hasError) {
                    return const Loading();
                  } else {
                    return const Loading();
                  }
                },
              ),
            ),
          ),
          WideButton('Дуусгах', colorSecondary, colorWhite, () {}),
        ],
      ),
    );
  }
}
