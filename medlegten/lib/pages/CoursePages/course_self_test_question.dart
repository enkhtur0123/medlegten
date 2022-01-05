import 'package:flutter/material.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/common/widget_functions.dart';
import 'package:medlegten/pages/CoursePages/course_self_test_answer.dart';


class CourseSelfTestQuestion extends StatelessWidget {

  final int questionNumber;
  final String question;
  final List<String> answers;

  const CourseSelfTestQuestion({Key? key, required this.question, required this.questionNumber, required this.answers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text('Асуулт '+questionNumber.toString()+':', style: TextStyle(color: Color.fromRGBO(48, 53, 159, 1), fontWeight: FontWeight.w600, fontSize: 14, fontFamily: 'Roboto'),),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Align(
              child: Text(question,
                style: TextStyle(color: Color.fromRGBO(51, 51, 51, 1), fontWeight: FontWeight.w600, fontSize: 14, fontFamily: 'Roboto', height: 1.5),),
            ),
          ),
          addVerticalSpace(5),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Wrap(
                runSpacing: 10,
                spacing: 25,
                children: [
                  CourseSelfTestAnswer(answer: 'Don no have to'),
                  CourseSelfTestAnswer(answer: 'Don no need to'),
                  CourseSelfTestAnswer(answer: 'Must not'),
                  CourseSelfTestAnswer(answer: 'I did not need to hurry'),
                  // ListView.builder(
                  //     itemCount: answers.length,
                  //     itemBuilder: (context, index) {
                  //       return Text('aa');
                  //     }
                  // )
                ],
              ),
            ),
          )
        ],
      );
    }
  }