import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/components/wide_button.dart';
import 'package:medlegten/utils/app_router.dart';

class PreliminaryTest extends StatelessWidget {
  PreliminaryTest({Key? key}) : super(key: key);

  final TextStyle textStyle = TextStyle(
      color: ColorTable.color120_100_254,
      fontWeight: FontWeight.w700,
      fontSize: 18,
      fontFamily: 'Roboto',
      height: 1.2);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Do you want to',
                      style: textStyle,
                    ),
                    Text(
                      'take preliminary test ?',
                      style: textStyle,
                    ),
                  ],
                ),
              ),
            ],
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
  