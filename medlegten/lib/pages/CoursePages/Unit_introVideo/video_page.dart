import 'package:flutter/material.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/common/widget_functions.dart';
import 'package:medlegten/components/loading.dart';
import 'package:medlegten/components/video_player_chewie.dart';
import 'package:medlegten/models/Unit/unit_introduction_video.dart';
import 'package:medlegten/pages/CoursePages/Unit_introVideo/video_subtitle.dart';
import 'package:video_player/video_player.dart';

// ignore: must_be_immutable
class CourseUnitIntroVideoPage extends StatefulWidget {
  const CourseUnitIntroVideoPage(this.unitIntroVideo, {Key? key})
      : super(key: key);

  final UnitIntroVideo unitIntroVideo;
  @override
  _CourseUnitIntroVideoState createState() => _CourseUnitIntroVideoState();
}

class _CourseUnitIntroVideoState extends State<CourseUnitIntroVideoPage> {
  late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController =
        VideoPlayerController.network(widget.unitIntroVideo.url)
          ..initialize().then((_) {
            setState(() {});
          });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> list = [];
    if (_videoPlayerController.value.isInitialized) {
      list.add(VideoPlayerChewie(_videoPlayerController));
      list.add(addVerticalSpace(20));
      list.add(VideoSubtitle(_videoPlayerController, widget.unitIntroVideo));
    } else {
      list.add(const Loading());
    }
    return Scaffold(
      backgroundColor: ColorTable.color255_255_255,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: list,
      ),
    );
  }

  Duration getDuration(String time) {
    var splitted = time.split(':');
    return Duration(
      hours: int.parse(splitted[0]),
      minutes: int.parse(splitted[1]),
      seconds: int.parse(splitted[2].split('.')[0]),
      milliseconds: int.parse(splitted[2].split('.')[1]),
    );
  }
}
