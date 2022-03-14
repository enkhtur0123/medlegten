// ignore_for_file: implementation_imports
import 'dart:io';

import 'package:clickable_list_wheel_view/clickable_list_wheel_widget.dart';
import 'package:collection/src/iterable_extensions.dart';
import 'package:flutter/cupertino.dart';
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
      SubtitleParagraphCallback? pparagraphCallback,
      Function? bookMark,
      this.defaultColor,
      this.isBookMark = false})
      : wordCallback = pwordCallback,
        paragraphCallback = pparagraphCallback,
        bookMark = bookMark,
        super(key: key);

  final List<CParagraph> paragraphs;
  final VideoPlayerController videoPlayerController;
  final SubtitleWordCallback? wordCallback;
  final SubtitleParagraphCallback? paragraphCallback;
  final bool isBookMark;
  final Function? bookMark;
  final Color? defaultColor;
}

TextStyle subtitleTextStyle = const TextStyle(
    color: colorBlack, fontSize: 18, fontWeight: FontWeight.w400);

abstract class BaseVideoSubtitleState<Page extends BaseVideoSubtitlePage>
    extends State<Page> {
  int currentIndex = -1;
  int isUser = -1;
  late Color defaultColor;
  Map<CParagraph, Map<CWord, Tuple2<GlobalKey, Widget>>> cueWidgets = {};

  late FixedExtentScrollController _fixedExtentScrollController;
  var valueKeyList = <CParagraph, int>{};
  late final isMon = ValueNotifier<bool>(true)..addListener(_listener);
  int prevCueId = -2;
  late final refreshCue = ValueNotifier<bool>(false)..addListener(_listener2);
  double maxExtent = 60;
  List<CParagraph> paragraphs = [];
  Rect? selectedRect;
  CWord? selectedWord;
  int selectedWordParagraphIndex = -1;

  void _listener() {
    //setMaxExtent();
    setState(() {});
  }

  void _listener2() {
    setState(() {});
  }

  void setMaxExtent() {
    maxExtent = BaseCueHelper().getMaxHeight(
        paragraphs,
        !isMon.value,
        subtitleTextStyle,
        GlobalValues.screenWidth - 80 - (Platform.isIOS ? 50 : 0));
  }

  @override
  void initState() {
    paragraphs.add(CParagraph("-1", -1, "", "",
        startTime: "0:0:0.0",
        endTime: widget.paragraphs.first.startTime,
        words: [CWord('-1', '', '', false)]));

    paragraphs.addAll(widget.paragraphs);
    for (var element in paragraphs) {
      element.ordering = element.ordering + 1;
    }

    defaultColor = widget.defaultColor ?? Colors.grey.shade400;
    _fixedExtentScrollController = FixedExtentScrollController();

    widget.videoPlayerController.addListener(videoPlayerListener);
    //_fixedExtentScrollController.addListener(scrollerListener);
    setMaxExtent();
    super.initState();
  }

  scrollerListener() {
    if (selectedWordParagraphIndex != -1) {
      _fixedExtentScrollController.animateToItem(selectedWordParagraphIndex,
          duration: const Duration(milliseconds: 100), curve: Curves.linear);
      selectedWord = null;
      selectedWordParagraphIndex = -1;
    }
  }

  videoPlayerListener() {
    if (widget.videoPlayerController.value.isPlaying) {
      if (isUser == -1) {
        var _duration = widget.videoPlayerController.value.position;
        var idx = paragraphs.firstWhereOrNull((element) =>
            getDuration(element.startTime!) <= _duration &&
            getDuration(element.endTime!) > _duration);
        if (idx != null && prevCueId != idx.ordering) {
          _fixedExtentScrollController.animateToItem(idx.ordering,
              duration: const Duration(milliseconds: 300),
              curve: Curves.linear);
          prevCueId = idx.ordering;
        }
      }
    }
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
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
              widget.isBookMark
                  ? GestureDetector(
                      onTap: () {
                        widget.bookMark!();
                      },
                      child: const Icon(CupertinoIcons.bookmark,
                          color: Color(0xffC7C9D9), size: 30))
                  : Container()
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: GestureDetector(
              onLongPress: () {
                if (widget.videoPlayerController.value.isPlaying) {
                  widget.videoPlayerController.pause();
                }
                // if (selectedCWord != null && selectedRect != null) {
                //   widget.wordCallback!(selectedCWord!, selectedRect!);
                //   refreshCue.value = !refreshCue.value;

                //   selectedCWord = null;
                //   selectedRect = null;
                // }
              },
              onTapDown: (TapDownDetails details) {
                selectedWordParagraphIndex = -1;
                if (widget.wordCallback != null && isMon.value == false) {
                  var position = details.globalPosition;
                  if (currentIndex > -1 && currentIndex < paragraphs.length) {
                    var cue = paragraphs[currentIndex];
                    for (var entry in cueWidgets[cue]!.entries) {
                      var rect = entry.value.item1.globalPaintBounds!;
                      if (rect.contains(position) &&
                          (entry.key.wordValue != '')) {
                        selectedWord = entry.key;
                        selectedWordParagraphIndex = currentIndex;
                        //print('Here onTapDown $selectedWordParagraphIndex');
                        selectedRect = rect;
                        valueKeyList[cue] = valueKeyList[cue]! + 1;

                        widget.wordCallback!(selectedWord!, selectedRect!);
                        if (widget.videoPlayerController.value.isPlaying) {
                          widget.videoPlayerController.pause();
                        }
                        refreshCue.value = !refreshCue.value;
                        break;
                      }
                      // else {
                      //   widget.wordCallback!(null, Rect.zero);
                      // }
                    }
                  }
                  // else {
                  //   widget.wordCallback!(null, Rect.zero);
                  // }
                }
              },
              child: SizedBox(
                height: maxExtent * 3 + 15,
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
                      //print('Here ScrollEndNotification $currentIndex');
                      isUser = 0;
                      //widget.videoPlayerController.removeListener(listener);
                      widget.videoPlayerController.seekTo(
                          getDuration(paragraphs[currentIndex].startTime!));
                      //widget.videoPlayerController.addListener(listener);
                      if (!widget.videoPlayerController.value.isPlaying) {
                        widget.videoPlayerController.play();
                      }
                    }
                    return false;
                  },
                  child: ClickableListWheelScrollView(
                    scrollController: _fixedExtentScrollController,
                    itemHeight: maxExtent,
                    itemCount: paragraphs.length,
                    onItemTapCallback: (index) {
                      currentIndex = index;
                    },
                    child: ListWheelScrollView.useDelegate(
                      physics:
                          const FixedExtentScrollPhysics(), // auto байрлалаа олоод зогсоно
                      itemExtent: maxExtent,
                      useMagnifier: false,
                      //overAndUnderCenterOpacity: 0.5,
                      diameterRatio: 50,
                      magnification: 1.01, // голын item нь илүү том харагдах
                      perspective: 0.001,
                      controller: _fixedExtentScrollController,
                      onSelectedItemChanged: (index) {
                        currentIndex = index;
                        //print('Here onSelectedItemChanged $currentIndex');
                        selectedWord = null;
                        //print(
                        //    'currentIndex: ${widget.paragraphs[index].engText}');
                        if (!widget.videoPlayerController.value.isPlaying &&
                            widget.paragraphCallback != null) {
                          widget.paragraphCallback!(paragraphs[index]);
                        }

                        if (paragraphs[index].grammarIsHighLighted != null &&
                            widget.paragraphCallback != null) {
                          widget.paragraphCallback!(
                              paragraphs[index].grammarIsHighLighted == "1"
                                  ? paragraphs[index]
                                  : null);
                        }

                        refreshCue.value = !refreshCue.value;
                      },
                      childDelegate: ListWheelChildBuilderDelegate(
                        builder: (context, index) => buildParagraph(
                            isMon.value,
                            paragraphs[index],
                            valueKeyList,
                            selectedWord,
                            index == currentIndex), //selectedIndex == index
                        childCount: paragraphs.length,
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
      CWord? selectedWord,
      bool isSelectedIndex) {
    if (!valueKeyList.containsKey(paragraph)) {
      valueKeyList[paragraph] = 0;
    }
    var widget = isMon
        ? getTextWidget(paragraph.monText, isSelectedIndex)
        : paragraph.words != null
            ? SubtitleParagraph(
                paragraph,
                currentIndex,
                defaultColor: defaultColor,
                key: ValueKey<int>(valueKeyList[paragraph]!),
                currentWord: isSelectedIndex ? selectedWord : null,
                alignment: Alignment.center,
              )
            : getTextWidget(paragraph.engText, true);

    if (widget is SubtitleParagraph) {
      cueWidgets[paragraph] = widget.wordWidgets;
    }
    return widget;
  }

  Widget getTextWidget(String caption, bool isSelected) {
    return Center(
      child: Text(
        caption,
        style: isSelected
            ? subtitleTextStyle
            : TextStyle(
                color: defaultColor, fontSize: 18, fontWeight: FontWeight.w400),
        textAlign: TextAlign.center,
      ),
    );
  }
}
