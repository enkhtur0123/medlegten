import 'package:flutter/material.dart';
import 'package:medlegten/pages/LandingPages/promotion_list.dart';

class LandingHome extends StatelessWidget {
  const LandingHome({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(children: [PromotionList()]);
  }
}
