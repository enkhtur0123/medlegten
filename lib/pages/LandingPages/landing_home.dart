import 'package:flutter/material.dart';

class LandingHome extends StatelessWidget {
  const LandingHome({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        // CourseDetail(),
        // CourseSelfTest(),
        const Text("Home pages", style: TextStyle(color: Colors.black))
      ],
    );
  }
}
