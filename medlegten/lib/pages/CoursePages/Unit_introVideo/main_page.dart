import 'package:flutter/material.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/common/widget_functions.dart';
import 'package:medlegten/components/video_items.dart';
import 'package:medlegten/components/video_player_widget.dart';
import 'package:medlegten/models/Unit/unit_introduction_video.dart';
import 'package:medlegten/pages/CoursePages/Unit_introVideo/subtitle.dart';
import 'package:video_player/video_player.dart';

class CourseUnitIntroVideoPage extends StatefulWidget {
  const CourseUnitIntroVideoPage(this.unitIntroVideo, {Key? key})
      : super(key: key);

  final UnitIntroVideo unitIntroVideo;

  @override
  _CourseUnitIntroVideoPageState createState() =>
      _CourseUnitIntroVideoPageState();
}

class _CourseUnitIntroVideoPageState extends State<CourseUnitIntroVideoPage> {
  late VideoPlayerController _videoPlayerController;
  String prevCueId = '-1';

  // void _scrollListener() {
  //   // if (_controller.offset >= _controller.position.maxScrollExtent &&
  //   //     !_controller.position.outOfRange) {
  //   //   setState(() {
  //   //     message = "reach the bottom";
  //   //   });
  //   // }
  //   // if (_controller.offset <= _controller.position.minScrollExtent &&
  //   //     !_controller.position.outOfRange) {
  //   //   setState(() {
  //   //     message = "reach the top";
  //   //   });
  //   // }
  //   _controller!.seekTo(getDuration(
  //       widget.unitIntroVideo.cues[_controller1!.selectedItem].startTime));
  // }

  @override
  void initState() {
    super.initState();

    //_fixedExtentScrollController = FixedExtentScrollController();

    _videoPlayerController =
        VideoPlayerController.network(widget.unitIntroVideo.url)
          //..addListener(() => {})
          ..setLooping(false)
          ..initialize().then((_) {
            // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
            setState(() {});
          });

    //setState(() {
    //       _duration = _videoPlayerController.value.position;
    //       var idx = widget.unitIntroVideo.cues.firstWhereOrNull(
    //           (element) =>
    //               getDuration(element.startTime) <= _duration &&
    //               getDuration(element.endTime) > _duration);
    //       if (idx != null && prevCueId != idx.cueId) {
    //         _fixedExtentScrollController!.animateToItem(
    //             int.parse(idx.cueId),
    //             duration: const Duration(milliseconds: 1000),
    //             curve: Curves.linear);
    //         prevCueId = idx.cueId;
    //       }
    //     }))
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
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
          VideoPlayerWidget(controller: _videoPlayerController),
          //VideoItems(_videoPlayerController, false, true),
          addVerticalSpace(20),
          _videoPlayerController.value.isInitialized
              ? VCaption(_videoPlayerController, widget.unitIntroVideo)
              : Container(
                  child: Text('not initialized',
                      style: TextStyle(color: Colors.black))),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: SizedBox(
          //     height: 180,
          //     child: ListWheelScrollView(
          //       physics:
          //           const FixedExtentScrollPhysics(), // auto байрлалаа олоод зогсоно
          //       itemExtent: 60,
          //       // squeeze: 0.7,
          //       useMagnifier: true,
          //       magnification: 1.0, // голын item нь илүү том харагдах
          //       diameterRatio: 5, // item-ийг налалттай биш өнцгөөр харуулна
          //       perspective: 0.001,
          //       controller: _fixedExtentScrollController,
          //       onSelectedItemChanged: (index) {
          //         //currentIndex = index;
          //         //_controller!.seekTo(
          //         //    getDuration(widget.unitIntroVideo.cues[index].startTime));
          //       },
          //       children: <Widget>[
          //         ...widget.unitIntroVideo.cues.map((cue) {
          //           return Text(
          //             isMon ? cue.fromText : cue.toText,
          //             style: TextStyle(
          //                 color: currentIndex == int.parse(cue.cueId)
          //                     ? colorBlack
          //                     : Colors.black54,
          //                 fontSize: 18,
          //                 fontWeight: FontWeight.w400),
          //             textAlign: TextAlign.center,
          //           );
          //         })
          //       ],
          //     ),
          //   ),
          // )
        ],
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
