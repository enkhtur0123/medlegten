import 'package:collection/src/iterable_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/common/widget_functions.dart';
import 'package:medlegten/models/Unit/unit_introduction_video.dart';
import 'package:video_player/video_player.dart';

class VCaption extends StatefulWidget {
  const VCaption(this.videoPlayerController, this.unitIntroVideo, {Key? key})
      : super(key: key);
  final UnitIntroVideo unitIntroVideo;

  final VideoPlayerController videoPlayerController;
  @override
  _VCaptionState createState() => _VCaptionState();
}

class _VCaptionState extends State<VCaption> {
  late FixedExtentScrollController _fixedExtentScrollController;
  bool isMon = true;
  String prevCueId = '-1';
  String? selectedCaption = "";
  Map<int, String> captions = {5: "First subtitle", 20: "Second subtitle"};
  int currentIndex = -1;
  int isUser = -1;
  @override
  void dispose() {
    _fixedExtentScrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _fixedExtentScrollController = FixedExtentScrollController();

    widget.videoPlayerController.addListener(() {
      if (widget.videoPlayerController.value.isPlaying) {
        if (isUser == -1) {
          setState(() {
            var _duration = widget.videoPlayerController.value.position;
            var idx = widget.unitIntroVideo.cue.firstWhereOrNull((element) =>
                getDuration(element.startTime) <= _duration &&
                getDuration(element.endTime) > _duration);
            if (idx != null && prevCueId != idx.ordering) {
              _fixedExtentScrollController.animateToItem(
                  int.parse(idx.ordering) - 1,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.linear);
              prevCueId = idx.ordering;
            }
          });
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            addHorizontalSpace(10),
            OutlinedButton(
              onPressed: () {
                isMon = false;
              },
              style: OutlinedButton.styleFrom(
                backgroundColor:
                    isMon ? Colors.grey[400] : ColorTable.color48_53_159,
              ),
              child: const Text(
                'Eng',
                style: TextStyle(
                    color: colorWhite,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    fontFamily: 'Roboto'),
              ),
            ),
            addHorizontalSpace(10),
            OutlinedButton(
              onPressed: () {
                isMon = true;
              },
              style: OutlinedButton.styleFrom(
                backgroundColor:
                    isMon ? ColorTable.color48_53_159 : Colors.grey[400],
              ),
              child: const Text(
                'Mon',
                style: TextStyle(
                    color: colorWhite,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    fontFamily: 'Roboto'),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 180,
            child: NotificationListener<ScrollNotification>(
              onNotification: (scrollNotification) {
                if (scrollNotification is UserScrollNotification) {
                  if (isUser == -1) {
                    isUser = 1;
                  } else if (isUser == 0) {
                    isUser = -1;
                  }
                } else if (scrollNotification is ScrollEndNotification &&
                    isUser == 1) {
                  isUser = 0;
                  widget.videoPlayerController.seekTo(getDuration(
                      widget.unitIntroVideo.cue[currentIndex].startTime));
                  if (widget.videoPlayerController.value.isPlaying == false) {
                    widget.videoPlayerController.play();
                  }
                }
                return false;
              },
              child: ListWheelScrollView(
                physics:
                    const FixedExtentScrollPhysics(), // auto байрлалаа олоод зогсоно
                itemExtent: 60,
                // squeeze: 0.7,
                useMagnifier: true,
                magnification: 1.0, // голын item нь илүү том харагдах
                diameterRatio: 5, // item-ийг налалттай биш өнцгөөр харуулна
                perspective: 0.001,
                controller: _fixedExtentScrollController,
                onSelectedItemChanged: (index) {
                  currentIndex = index;
                },
                children: <Widget>[
                  ...widget.unitIntroVideo.cue.map((cue) {
                    return GestureDetector(
                      onTap: () {
                        const AlertDialog(
                          content: Text(
                            'Test',
                            style: TextStyle(color: Colors.teal),
                          ),
                        );
                      },
                      child: Center(
                        child: Text(
                          isMon
                              ? cue.toLangTranslation
                              : cue.fromLangTranslation,
                          style: TextStyle(
                              color: currentIndex == int.parse(cue.ordering) - 1
                                  ? colorBlack
                                  : Colors.black54,
                              fontSize: 18,
                              fontWeight: FontWeight.w400),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  })
                ],
              ),
            ),
          ),
        )
      ],
    );
    //return ClosedCaption(
    //  text: selectedCaption,
    //  textStyle: const TextStyle(fontSize: 15, color: Colors.black),
    //);
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
