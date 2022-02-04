import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:medlegten/components/landing_header.dart';
import 'package:medlegten/pages/CoursePages/courses/landing_course.dart';
import 'package:medlegten/pages/ProfilePages/landing_profile.dart';

import 'landing_home.dart';

class LandingPage extends HookWidget {
  const LandingPage({Key? key}) : super(key: key);

  List<Widget> get tabs => [
        Tab(
          icon: Image.asset(
            'assets/img/Landing/Home.png',
            height: 20,
            width: 20,
          ),
          text: "Нүүр",
        ),
        Tab(
          icon: Image.asset(
            'assets/img/Landing/Course.png',
            height: 20,
            width: 20,
          ),
          text: "Курс",
        ),
        Tab(
          icon: Image.asset(
            'assets/img/Landing/Video.png',
            height: 20,
            width: 20,
          ),
          text: "Видео",
        ),
        Tab(
          icon: Image.asset(
            'assets/img/Landing/Blog.png',
            height: 20,
            width: 20,
          ),
          text: "Нийтлэл",
        ),
        // ignore: prefer_const_constructors
        Tab(
          icon: const Icon(
            Icons.account_circle,
            size: 20,
          ),
          text: "Миний",
        ),
      ];

  List<Widget> get pages => [
        const LandingHome(),
        const LandingCourse(),
        const Center(
          child: Text("Index 2", style: const TextStyle(color: Colors.black)),
        ),
        const Center(
          child: Text("Index 3", style: const TextStyle(color: Colors.black)),
        ),
        LandingProfile(),
      ];

  @override
  Widget build(BuildContext context) {
    final _controller =
        useTabController(initialLength: tabs.length, initialIndex: 0);
    final _index = useState(0);
    final _key = GlobalKey();

    _controller.addListener(() {});

    return Scaffold(
      // extendBodyBehindAppBar: true,
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   shadowColor: Colors.transparent,
      //   elevation: 0.0,
      //   bottomOpacity: 0.0,
      // ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          LandingHeader(100),
          Expanded(
            child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              key: _key,
              controller: _controller,
              children: pages.map((e) {
                return e;
              }).toList(),
            ),
          ),
        ],
      ),
      bottomNavigationBar: TabBar(
        indicatorColor: const Color(0xff30359F),
        unselectedLabelColor: const Color(0xff30359F).withOpacity(0.5),
        tabs: tabs,
        onTap: (index) {
          _index.value = index;
        },
        controller: _controller,
        labelColor: const Color(0xff30359F),
        labelStyle: const TextStyle(
          color: Color(0xff30359F),
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.normal,
        ),
        unselectedLabelStyle: TextStyle(
          color: const Color(0xff30359F).withOpacity(0.5),
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }
}
