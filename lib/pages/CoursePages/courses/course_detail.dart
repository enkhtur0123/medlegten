import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/common/widget_functions.dart';
import 'package:medlegten/components/loading.dart';
import 'package:medlegten/components/video_player_chewie.dart';
import 'package:medlegten/models/Landing/course_info.dart';
import 'package:medlegten/models/Landing/course_unit.dart';
import 'package:medlegten/pages/CoursePages/base/unit_appbar.dart';
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

class _CourseDetailState extends State<CourseDetailPage> with AutoRouteAware {
  late VideoPlayerController _controller;
  AutoRouteObserver? _observer;
  bool isPushNext = false;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // RouterScope exposes the list of provided observers
    // including inherited observers
    _observer =
        RouterScope.of(context).firstObserverOfType<AutoRouteObserver>();
    if (_observer != null) {
      // we subscribe to the observer by passing our
      // AutoRouteAware state and the scoped routeData
      _observer!.subscribe(this, context.routeData);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _observer!.unsubscribe(this);
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.courseInfo.introVideoUrl)
      //VideoPlayerController.asset('assets/A1-U1-INTRO.mp4')
      ..setLooping(false)
      ..initialize().then((value) {
        WidgetsBinding.instance?.addPostFrameCallback((_) {
          setState(() {
            if (!isPushNext) {
              _controller.play();
            }
          });
        });
      });
  }

  @override
  void didPopNext() {
    isPushNext = false;
    if (_controller.value.position != _controller.value.duration) {
      _controller.play();
    }
  }

  @override
  void didPushNext() {
    isPushNext = true;
    if (_controller.value.isPlaying) {
      _controller.pause();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTable.color255_255_255,
      body: Stack(children: [
        Positioned(
          top: unitHeaderHeight,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height - unitHeaderHeight,
          child: body(),
        ),
        Positioned(
          width: MediaQuery.of(context).size.width,
          height: unitHeaderHeight + 8,
          child: UnitAppBar(
            '${widget.courseInfo.courseName} - ${widget.courseInfo.levelName}',
            moduleId: null,
            isCompleted: null,
          ),
        ),
      ]),
    );
  }

  Widget body() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _controller.value.isInitialized
            ? VideoPlayerChewie(_controller)
            : const AspectRatio(
                aspectRatio: 16 / 9,
                child: SizedBox(width: double.infinity, child: Loading())),
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
                  // const Align(
                  //   alignment: Alignment.centerLeft,
                  //   child: Text(
                  //     ' Units',
                  //     style: TextStyle(
                  //         color: colorPrimary,
                  //         fontFamily: 'Roboto',
                  //         fontSize: 18,
                  //         fontWeight: FontWeight.w500),
                  //   ),
                  // ),
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
    );
  }
}
