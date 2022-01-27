import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/common/widget_functions.dart';
import 'package:medlegten/components/icon_text.dart';
import 'package:medlegten/components/landing_header.dart';
import 'package:medlegten/components/loading.dart';
import 'package:medlegten/components/video_player_widget.dart';
import 'package:medlegten/models/Landing/course_info.dart';
import 'package:medlegten/models/Landing/course_unit.dart';
import 'package:expandable/expandable.dart';
import 'package:medlegten/repositories/landing_repository.dart';
import 'package:video_player/video_player.dart';

import 'unit_card.dart';

class CourseDetailPage extends StatefulWidget {
  const CourseDetailPage(this.courseInfo, {Key? key}) : super(key: key);
  final CourseInfo courseInfo;

  @override
  _CourseDetailState createState() => _CourseDetailState();
}

class _CourseDetailState extends State<CourseDetailPage> {
  late VideoPlayerController _controller;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(
        'assets/A1-U1-INTRO-V1.mp4') //VideoPlayerController.network(videoUrl)
      ..addListener(() => setState(() {}))
      ..setLooping(false)
      ..initialize();
    // ..initialize().then((_) => _controller.play());
  }

  @override
  void dispose() {
    //_controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTable.color255_255_255,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LandingHeader(100),
          VideoPlayerWidget(controller: _controller),
          addVerticalSpace(20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: ExpandablePanel(
              header: const Text(
                'A1 Course - Анхан шатны хичээлийн агуулга',
                style: TextStyle(
                    color: colorPrimary,
                    fontFamily: 'Roboto',
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              collapsed: Column(
                children: [
                  Row(
                    children: [
                      const IconText(
                          Icons.remove_red_eye_outlined, '1233 views'),
                      addHorizontalSpace(20),
                      const IconText(CupertinoIcons.heart, '456 Likes'),
                      addHorizontalSpace(20),
                      const IconText(Icons.timer, '2 minutes'),
                    ],
                  )
                ],
              ),
              expanded: Column(
                children: [
                  Row(
                    children: [
                      const IconText(
                          Icons.remove_red_eye_outlined, '1233 views'),
                      addHorizontalSpace(20),
                      const IconText(CupertinoIcons.heart, '456 Likes'),
                      addHorizontalSpace(20),
                      const IconText(Icons.timer, '2 minutes'),
                    ],
                  ),
                  addVerticalSpace(20),
                  const Text(
                    'Та энэхүү курс хичээлийг бүрэн үзсэнээр Англи хэлний 26 цаг болон яриа, сонсгол гэх мэт олон ур чадваруудыг суралцана.',
                    style: TextStyle(color: colorBlack, height: 1.5),
                    softWrap: true,
                  )
                ],
              ),
            ),
          ),
          const Divider(
            height: 40,
            thickness: 1,
            endIndent: 0,
            color: Color.fromRGBO(199, 201, 217, .5),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        ' Units',
                        style: TextStyle(
                            color: colorPrimary,
                            fontFamily: 'Roboto',
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    FutureBuilder<List<CourseUnit>?>(
                      future: LandingRepository()
                          .getCourseUnitList(widget.courseInfo.courseId),
                      builder: (BuildContext context,
                          AsyncSnapshot<List<CourseUnit>?> snapshot) {
                        if (snapshot.hasData) {
                          return Column(
                            children: snapshot.data!
                                .map((unitInfo) => UnitCart(unitInfo))
                                .toList(),
                          );
                        } else if (snapshot.hasError) {
                          return const Loading();
                        } else {
                          return const Loading();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
