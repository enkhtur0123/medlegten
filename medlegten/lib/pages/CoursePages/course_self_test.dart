import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/common/widget_functions.dart';
import 'package:medlegten/components/landing_header.dart';
import 'package:medlegten/components/loading.dart';
import 'package:medlegten/components/wide_button.dart';
import 'package:medlegten/models/Landing/quiz_question.dart';
import 'package:medlegten/pages/CoursePages/course_self_test_question.dart';
import 'package:medlegten/repositories/landing_repository.dart';

class CourseSelfTestPage extends HookWidget {
  const CourseSelfTestPage({Key? key}) : super(key: key);

  Future<List<QuizQuestionEx>> fetchData() async {
    List<QuizQuestionEx> sortedList = [];
    var result = await LandingRepository().getSelfQuiz();

    var _sortedList = result!.questions
      ..sort((a, b) => int.parse(b.ordering).compareTo(int.parse(a.ordering)));

    for (var e in _sortedList) {
      sortedList.add(QuizQuestionEx(e));
    }
    return sortedList;
  }

  @override
  Widget build(BuildContext context) {
    var mode = useState(0);

    final future = useMemoized(fetchData);
    final snapshot = useFuture(future);

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
                child: snapshot.hasData
                    ? Column(
                        children: snapshot.data!
                            .map((question) => CourseSelfTestQuestion(
                                  question,
                                  mode: mode.value,
                                ))
                            .toList(),
                      )
                    : const Loading()),
          ),
          WideButton(
              mode.value == 0 ? 'Дуусгах' : 'Буцах', colorSecondary, colorWhite,
              () {
            if (mode.value == 0) {
              mode.value = 1;
            } else {
              AutoRouter.of(context).pop();
            }
          }),
          addVerticalSpace(20)
        ],
      ),
    );
  }
}

class QuizQuestionEx {
  QuizQuestionEx(this.quizQuestion);

  QuizQuestion quizQuestion;
  String? selectedAnswerId;
}
