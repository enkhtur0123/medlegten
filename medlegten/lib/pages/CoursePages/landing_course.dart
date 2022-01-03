import 'package:flutter/material.dart';
import 'package:medlegten/pages/LandingPages/promotion_list.dart';

class LandingCourse extends StatelessWidget {
  const LandingCourse({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(children: [PromotionList()]);
  }
}
