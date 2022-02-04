import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
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
          child: Text("Index 2", style: TextStyle(color: Colors.black)),
        ),
        const Center(
          child: Text("Index 3", style: TextStyle(color: Colors.black)),
        ),
        LandingProfile(),
      ];

  @override
  Widget build(BuildContext context) {
    final _controller =
        useTabController(initialLength: tabs.length, initialIndex: 0);
    final _index = useState(0);
    final _key = GlobalKey();

    return Scaffold(
      appBar: AppBar(
        primary: true,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(Icons.search),
                const SizedBox(
                  width: 15,
                ),
                const Icon(Icons.notifications_active)
              ],
            ),
          )
        ],
        title: Container(
          margin: const EdgeInsets.only(left: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  SvgPicture.asset("assets/svg/logo.svg"),
                  const SizedBox(
                    width: 8,
                  ),
                  const Text(
                    "МЭДЛЭГТЭН",
                    style: TextStyle(
                        color: Colors.white,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const Text(
                    "Сайн уу,BatToday’s Goal:",
                    style: TextStyle(
                        color: Color(0xffC7C9D9),
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.normal),
                  )
                ],
              ),
            ],
          ),
        ),
        centerTitle: false,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(8),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
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
