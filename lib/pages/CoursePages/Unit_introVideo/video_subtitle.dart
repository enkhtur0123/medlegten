import 'package:clickable_list_wheel_view/clickable_list_wheel_widget.dart';
import 'package:collection/src/iterable_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/common/widget_functions.dart';
import 'package:medlegten/models/Unit/unit_introduction_cue.dart';
import 'package:medlegten/models/Unit/unit_introduction_cue_word.dart';
import 'package:medlegten/models/Unit/unit_introduction_video.dart';
import 'package:medlegten/pages/CoursePages/Unit_introVideo/cue_text.dart';
import 'package:medlegten/utils/global.dart';
import 'package:tuple/tuple.dart';
import 'package:video_player/video_player.dart';

// ignore: must_be_immutable
class VideoSubtitle extends HookWidget {
  VideoSubtitle(this.videoPlayerController, this.unitIntroVideo, this.callback,
      {Key? key})
      : super(key: key);

  final UnitIntroVideo unitIntroVideo;
  final VideoPlayerController videoPlayerController;
  final UnitIntroCueWordCallback callback;

  int currentIndex = -1;
  int isUser = -1;

  Map<UnitIntroCueParagraph, Map<UnitIntroCueWord, Tuple2<GlobalKey, Widget>>>
      cueWidgets = {};

  @override
  Widget build(BuildContext context) {
    final _fixedExtentScrollController =
        useMemoized(() => FixedExtentScrollController());
    final valueKeyList = useMemoized(() => <UnitIntroCueParagraph, int>{});
    final selectedWord = useMemoized(() => ['']);
    final isMon = useState(true);
    final prevCueId = useState('-1');
    final refreshCue = useState(false);

    useEffect(() {
      videoPlayerController.addListener(() {
        if (videoPlayerController.value.isPlaying) {
          if (isUser == -1) {
            var _duration = videoPlayerController.value.position;
            var idx = unitIntroVideo.cue.firstWhereOrNull((element) =>
                getDuration(element.startTime) <= _duration &&
                getDuration(element.endTime) > _duration);
            if (idx != null && prevCueId.value != idx.ordering) {
              _fixedExtentScrollController.animateToItem(
                  int.parse(idx.ordering) - 1,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.linear);
              prevCueId.value = idx.ordering;
            }
          }
        }
      });
    }, const []);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            addHorizontalSpace(10),
            OutlinedButton(
              onPressed: () {
                isMon.value = false;
              },
              style: OutlinedButton.styleFrom(
                backgroundColor:
                    isMon.value ? Colors.grey[400] : ColorTable.color48_53_159,
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
                isMon.value = true;
              },
              style: OutlinedButton.styleFrom(
                backgroundColor:
                    isMon.value ? ColorTable.color48_53_159 : Colors.grey[400],
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
          child: GestureDetector(
            // onLongPress: () {
            //   if (videoPlayerController.value.isPlaying) {
            //     videoPlayerController.pause();
            //   } else {
            //     videoPlayerController.play();
            //   }
            // },
            onTapDown: (TapDownDetails details) {
              var position = details.globalPosition;
              if (currentIndex > -1 &&
                  currentIndex < unitIntroVideo.cue.length) {
                var cue = unitIntroVideo.cue[currentIndex];
                cueWidgets[cue]!.forEach((key, value) {
                  var rect = value.item1.globalPaintBounds!;
                  if (rect.contains(position)) {
                    selectedWord[0] = key.mainText;
                    valueKeyList[cue] = valueKeyList[cue]! + 1;
                    callback(key);
                    refreshCue.value = !refreshCue.value;
                  }
                });
              }
            },
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
                    videoPlayerController.seekTo(getDuration(
                        unitIntroVideo.cue[currentIndex].startTime));
                    if (videoPlayerController.value.isPlaying == false) {
                      videoPlayerController.play();
                    }
                  }
                  return false;
                },
                child: ClickableListWheelScrollView(
                  scrollController: _fixedExtentScrollController,
                  itemHeight: 60,
                  itemCount: unitIntroVideo.cue.length,
                  onItemTapCallback: (index) {
                    currentIndex = index;
                  },
                  child: ListWheelScrollView.useDelegate(
                    physics:
                        const FixedExtentScrollPhysics(), // auto байрлалаа олоод зогсоно
                    itemExtent: 60,
                    // squeeze: 0.7,
                    useMagnifier: true,
                    magnification: 1.2, // голын item нь илүү том харагдах
                    diameterRatio: 5, // item-ийг налалттай биш өнцгөөр харуулна
                    perspective: 0.001,
                    controller: _fixedExtentScrollController,
                    onSelectedItemChanged: (index) {
                      currentIndex = index;
                    },
                    childDelegate: ListWheelChildBuilderDelegate(
                      builder: (context, index) => buildParagraph(
                          isMon.value,
                          unitIntroVideo.cue[index],
                          valueKeyList,
                          selectedWord[0]), //selectedIndex == index
                      childCount: unitIntroVideo.cue.length,
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget buildParagraph(bool isMon, UnitIntroCueParagraph cue,
      Map<UnitIntroCueParagraph, int> valueKeyList, String selectedWord) {
    if (!valueKeyList.containsKey(cue)) {
      valueKeyList[cue] = 0;
    }
    var widget = isMon
        ? Center(
            child: Text(
              cue.toLangTranslation,
              style: TextStyle(
                  color: currentIndex == int.parse(cue.ordering) - 1
                      ? colorBlack
                      : Colors.black54,
                  fontSize: 18,
                  fontWeight: FontWeight.w400),
              textAlign: TextAlign.center,
            ),
          )
        : CueText(
            cue,
            currentIndex,
            key: ValueKey<int>(valueKeyList[cue]!),
            currentWord: selectedWord,
          );

    if (widget is CueText) {
      cueWidgets[cue] = widget.wordWidgets;
    }
    return widget;
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
