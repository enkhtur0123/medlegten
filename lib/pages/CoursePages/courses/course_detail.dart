import 'package:flutter/material.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/common/widget_functions.dart';
import 'package:medlegten/components/loading.dart';
import 'package:medlegten/components/video_player_chewie.dart';
import 'package:medlegten/models/Landing/course_info.dart';
import 'package:medlegten/models/Landing/course_unit.dart';
import 'package:medlegten/pages/CoursePages/unit/unit_card.dart';
import 'package:medlegten/repositories/landing_repository.dart';
import 'package:video_player/video_player.dart';
import 'course_introduction_widget.dart';

class CourseDetailPage extends StatefulWidget {
  const CourseDetailPage(this.courseInfo, {Key? key}) : super(key: key);

  final CourseInfo courseInfo;

  @override
  _CourseDetailState createState() => _CourseDetailState();
}

class _CourseDetailState extends State<CourseDetailPage> {
  late VideoPlayerController _controller;

  @override
  void dispose() {
    //_controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.courseInfo.introVideoUrl)
      ..addListener(() => setState(() {}))
      ..setLooping(false)
      ..initialize();
    // ..initialize().then((_) => _controller.play());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: ColorTable.color255_255_255,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //VideoPlayerChewie(_controller),
          addVerticalSpace(20),
          CourseIntroWidget(courseInfo: widget.courseInfo),
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
                                .map((unitInfo) => UnitCart(
                                      unitInfo: unitInfo,
                                      courseInfo: widget.courseInfo,
                                    ))
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
