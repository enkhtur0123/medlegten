import 'package:flutter/material.dart';
import 'package:medlegten/common/colors.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text(
          'Welcome to landing page',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: ColorTable.color48_53_159,
              fontFamily: 'Roboto-Bold',
              fontSize: 16,
              fontWeight: FontWeight.w700,
              height: 1),
        ),
      ),
    );
  }
}
