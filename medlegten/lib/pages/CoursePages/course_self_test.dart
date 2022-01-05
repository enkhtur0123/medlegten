import 'package:flutter/material.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/common/widget_functions.dart';
import 'package:medlegten/components/wide_button.dart';
import 'package:medlegten/pages/CoursePages/course_self_test_question.dart';

class CourseSelfTest extends StatelessWidget {
  const CourseSelfTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          children: [
            addVerticalSpace(20),
            Text('Өөрийгөө үнэлэх тест'.toUpperCase(), style: TextStyle(color: colorPrimary, fontFamily: 'Roboto', fontWeight: FontWeight.w700, fontSize: 16),),
            addVerticalSpace(6   ),
            Text('Явцын шалгалт 2', style: TextStyle(color: colorPrimary, fontFamily: 'Roboto', fontWeight: FontWeight.w700, fontSize: 10),),
            Container(
              width: double.infinity,
              height: 25,
              decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 1.0, color: Color.fromRGBO(199, 201, 217, .3)),
                  )
              ),
            ),
            addVerticalSpace(10),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: CourseSelfTestQuestion(
                    questionNumber: 1,
                    question: 'My manager says we ________ take more than ten minutes for our break and, if we do, he will make us work extra hours.',
                    answers: ['Do not have to','Must not','I did not need to hurry','You would do better'],
                )
            ),
            addVerticalSpace(10),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: CourseSelfTestQuestion(
                  questionNumber: 2,
                  question: 'I ran all the way to station but when I got there I realised that ________ because trains were delayed.',
                  answers: ['I didn not need to hurry','I need not have hurried','I didn not have to hurry'],
                )
            ),
            addVerticalSpace(40),
            WideButton('Дуусгах', colorSecondary, colorWhite, () {}),
          ],
        )
    );
  }
}