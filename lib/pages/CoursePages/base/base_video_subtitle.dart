// ignore_for_file: implementation_imports
import 'package:clickable_list_wheel_view/clickable_list_wheel_widget.dart';
import 'package:collection/src/iterable_extensions.dart';
import 'package:flutter/material.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/common/widget_functions.dart';
import 'package:medlegten/pages/CoursePages/base/base_cue_helper.dart';
import 'package:medlegten/pages/CoursePages/base/base_paragraph.dart';
import 'package:medlegten/pages/CoursePages/base/subtitle_paragraph.dart';
import 'package:medlegten/pages/CoursePages/base/cue_wrapper.dart';
import 'package:medlegten/utils/global.dart';
import 'package:tuple/tuple.dart';
import 'package:video_player/video_player.dart';

abstract class BaseVideoSubtitlePage extends StatefulWidget {
  const BaseVideoSubtitlePage(this.videoPlayerController, this.paragraphs,
      {Key? key,
      SubtitleWordCallback? pwordCallback,
      SubtitleParagraphCallback? pparagraphCallback})
      : wordCallback = pwordCallback,
        paragraphCallback = pparagraphCallback,
        super(key: key);

  final List<CParagraph> paragraphs;
  final VideoPlayerController videoPlayerController;
  final SubtitleWordCallback? wordCallback;
  final SubtitleParagraphCallback? paragraphCallback;
}

TextStyle subtitleTextStyle = const TextStyle(
    color: colorBlack, fontSize: 18, fontWeight: FontWeight.w400);

abstract class BaseVideoSubtitleState<Page extends BaseVideoSubtitlePage>
    extends State<Page> {
  int currentIndex = -1;
  int isUser = -1;

  Map<CParagraph, Map<CWord, Tuple2<GlobalKey, Widget>>> cueWidgets = {};

  late FixedExtentScrollController _fixedExtentScrollController;
  var valueKeyList = <CParagraph, int>{};
  String selectedWord = '';
  late final isMon = ValueNotifier<bool>(true)..addListener(_listener);
  int prevCueId = -1;
  late final refreshCue = ValueNotifier<bool>(false)..addListener(_listener2);
  double maxExtent = 60;

  void _listener() {
    setMaxExtent();
    setState(() {});
  }

  void _listener2() {
    setState(() {});
  }

  void setMaxExtent() {
    maxExtent = BaseCueHelper().getMaxHeight(widget.paragraphs, !isMon.value,
        subtitleTextStyle, GlobalValues.screenWidth - 50);
  }

  @override
  void initState() {
    _fixedExtentScrollController = FixedExtentScrollController();

    widget.videoPlayerController.addListener(() {
      if (widget.videoPlayerController.value.isPlaying) {
        if (isUser == -1) {
          var _duration = widget.videoPlayerController.value.position;
          var idx = widget.paragraphs.firstWhereOrNull((element) =>
              getDuration(element.startTime!) <= _duration &&
              getDuration(element.endTime!) > _duration);
          if (idx != null && prevCueId != idx.ordering) {
            _fixedExtentScrollController.animateToItem(idx.ordering + 1,
                duration: const Duration(milliseconds: 500),
                curve: Curves.linear);
            prevCueId = idx.ordering;
          }
        }
      }
    });
    setMaxExtent();
    super.initState();
  }

  @override
  void dispose() {
    isMon.dispose();
    _fixedExtentScrollController.dispose();
    super.dispose();
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

mixin BaseVideoSubtitleMixin<Page extends BaseVideoSubtitlePage>
    on BaseVideoSubtitleState<Page> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              OutlinedButton(
                onPressed: () {
                  isMon.value = false;
                },
                style: OutlinedButton.styleFrom(
                  backgroundColor: isMon.value
                      ? ColorTable.color48_53_159.withOpacity(.5)
                      : ColorTable.color48_53_159,
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
                    backgroundColor: isMon.value
                        ? ColorTable.color48_53_159
                        : ColorTable.color48_53_159.withOpacity(.5)),
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
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: GestureDetector(
              // onLongPress: () {
              //   if (widget.videoPlayerController.value.isPlaying) {
              //     widget.videoPlayerController.pause();
              //   }
              // },
              onTapDown: (TapDownDetails details) {
                if (widget.wordCallback != null && isMon.value == false) {
                  var position = details.globalPosition;
                  if (currentIndex > -1 &&
                      currentIndex < widget.paragraphs.length) {
                    var cue = widget.paragraphs[currentIndex];
                    for (var entry in cueWidgets[cue]!.entries) {
                      var rect = entry.value.item1.globalPaintBounds!;
                      if (rect.contains(position)) {
                        if (widget.videoPlayerController.value.isPlaying) {
                          widget.videoPlayerController.pause();
                        }
                        selectedWord = entry.key.word;
                        valueKeyList[cue] = valueKeyList[cue]! + 1;
                        widget.wordCallback!(entry.key, rect);
                        refreshCue.value = !refreshCue.value;
                        break;
                      } else {
                        widget.wordCallback!(null, Rect.zero);
                      }
                    }
                  } else {
                    widget.wordCallback!(null, Rect.zero);
                  }
                }
              },
              child: SizedBox(
                height: maxExtent * 3 + 20,
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
                          widget.paragraphs[currentIndex].startTime!));
                      //if (widget.videoPlayerController.value.isPlaying == false) {
                      //  widget.videoPlayerController.play();
                      //}
                    }
                    return false;
                  },
                  child: ClickableListWheelScrollView(
                    scrollController: _fixedExtentScrollController,
                    itemHeight: maxExtent,
                    itemCount: widget.paragraphs.length,
                    onItemTapCallback: (index) {
                      currentIndex = index;
                    },
                    child: ListWheelScrollView.useDelegate(
                      physics:
                          const FixedExtentScrollPhysics(), // auto байрлалаа олоод зогсоно
                      itemExtent: maxExtent,
                      useMagnifier: false,
                      overAndUnderCenterOpacity: 0.4,
                      magnification: 1, // голын item нь илүү том харагдах
                      //perspective: 0.001,
                      controller: _fixedExtentScrollController,
                      onSelectedItemChanged: (index) {
                        currentIndex = index;
                        if (!widget.videoPlayerController.value.isPlaying &&
                            widget.paragraphCallback != null) {
                          widget.paragraphCallback!(widget.paragraphs[index]);
                        }

                        if (widget.paragraphs[index].grammarIsHighLighted !=
                                null &&
                            widget.paragraphCallback != null) {
                          widget.paragraphCallback!(
                              widget.paragraphs[index].grammarIsHighLighted ==
                                      "1"
                                  ? widget.paragraphs[index]
                                  : null);
                        }
                      },
                      childDelegate: ListWheelChildBuilderDelegate(
                        builder: (context, index) => buildParagraph(
                            isMon.value,
                            widget.paragraphs[index],
                            valueKeyList,
                            selectedWord,
                            index == currentIndex), //selectedIndex == index
                        childCount: widget.paragraphs.length,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildParagraph(
      bool isMon,
      CParagraph paragraph,
      Map<CParagraph, int> valueKeyList,
      String selectedWord,
      bool isSelectedIndex) {
    if (!valueKeyList.containsKey(paragraph)) {
      valueKeyList[paragraph] = 0;
    }
    var widget = isMon
        ? getTextWidget(paragraph.monText, paragraph)
        : paragraph.words != null
            ? SubtitleParagraph(
                paragraph,
                currentIndex,
                key: ValueKey<int>(valueKeyList[paragraph]!),
                currentWord: isSelectedIndex ? selectedWord : null,
              )
            : getTextWidget(paragraph.engText, paragraph);

    if (widget is SubtitleParagraph) {
      cueWidgets[paragraph] = widget.wordWidgets;
    }
    return widget;
  }

  Widget getTextWidget(String caption, CParagraph paragraph) {
    return Center(
      child: Text(
        caption,
        style: subtitleTextStyle,
        textAlign: TextAlign.center,
      ),
    );
  }
}
