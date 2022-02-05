import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/components/wide_button.dart';
import 'package:medlegten/themes/style.dart';
import 'package:medlegten/utils/app_router.dart';

class PreliminaryTest extends StatelessWidget {
  const PreliminaryTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 15),
            padding:const  EdgeInsets.all(10),
            child: const Text(
              'Та өөрийн англи хэлний\nтүвшинг шалгана уу?',
              style: TextStyle(
                color: secondaryColor,
                fontWeight: FontWeight.w900,
                fontSize: 18,
                fontStyle: FontStyle.normal,
              ),
            ),
          ),
          WideButton('Start Quiz', ColorTable.color120_100_254,
              ColorTable.color255_255_255, () {
            AutoRouter.of(context).push(CourseSelfTestRoute());
          }, horizontalEdge: 0),
        ],
      ),
    );
  }
}
