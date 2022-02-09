import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LandingHome extends ConsumerStatefulWidget {
  const LandingHome({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return LandingHomeState();
  }
}

class LandingHomeState extends ConsumerState<LandingHome> {
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
