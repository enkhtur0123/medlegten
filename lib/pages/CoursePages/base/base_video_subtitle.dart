// ignore_for_file: implementation_imports
import 'package:auto_route/auto_route.dart';
import 'package:clickable_list_wheel_view/clickable_list_wheel_widget.dart';
import 'package:collection/src/iterable_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_storage/get_storage.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/common/widget_functions.dart';
import 'package:medlegten/models/video/memorize_word.dart';
import 'package:medlegten/models/video/quiz.dart';
import 'package:medlegten/models/video/sonsgol.dart';
import 'package:medlegten/pages/CoursePages/base/base_cue_helper.dart';
import 'package:medlegten/pages/CoursePages/base/base_paragraph.dart';
import 'package:medlegten/pages/CoursePages/base/subtitle_paragraph.dart';
import 'package:medlegten/pages/CoursePages/base/cue_wrapper.dart';
import 'package:medlegten/pages/VideoPage/exercise_option_dialog.dart';
import 'package:medlegten/pages/VideoPage/options.dart';
import 'package:medlegten/services/custom_exception.dart';
import 'package:medlegten/utils/global.dart';
import 'package:medlegten/widgets/loader.dart';
import 'package:medlegten/widgets/snackbar/custom_snackbar.dart';
import 'package:tuple/tuple.dart';
import 'package:video_player/video_player.dart';

import '../../../models/video/movie.dart';
import '../../../repositories/video_repository.dart';
import '../../../utils/app_router.dart';

abstract class BaseVideoSubtitlePage extends StatefulWidget {
  const BaseVideoSubtitlePage(this.videoPlayerController, this.paragraphs,
      {Key? key,
      SubtitleWordCallback? pwordCallback,
      SubtitleParagraphCallback? pparagraphCallback,
      Function? quizBtn,
      this.defaultColor,
      this.isMemorize = false,
      this.isBookMark = false,
      this.videoMemorizeWord,
      this.contentId,
      this.videoUrl,
      this.movies,
      this.quiz,
      this.title,
      this.memorizeTypeBtn,
      this.sonsgol})
      : wordCallback = pwordCallback,
        paragraphCallback = pparagraphCallback,
        // ignore: prefer_initializing_formals
        quizBtn = quizBtn,
        super(key: key);

  final List<CParagraph> paragraphs;
  final VideoPlayerController videoPlayerController;
  final SubtitleWordCallback? wordCallback;
  final SubtitleParagraphCallback? paragraphCallback;
  final bool isBookMark;
  final Function? quizBtn;
  final Color? defaultColor;
  final bool? isMemorize;
  final VideoMemorizeWord? videoMemorizeWord;
  final String? contentId;
  final List<Movie>? movies;
  final String? videoUrl;
  final VideoQuiz? quiz;
  final String? title;
  final Function(String? type)? memorizeTypeBtn;
  final Function? sonsgol;
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
  bool? isMemorize;
  VideoMemorizeWord? videoMemorizeWord;
  CWord? memorizedWord;
  ValueNotifier<bool>? memorize = ValueNotifier(false);
  List<MemorizeOptions> memorizeOptions = [
    MemorizeOptions(type: "1", name: "Бүх үг"),
    MemorizeOptions(type: "0", name: "Хадгалсан үг"),
  ];

  bool isScroll = true;

  int? memorizedOptionsCurrentIndex = 0;
  String currentOption = "1";
  CParagraph? currentParagraph;
  String? lastWordId = "0";
  var idx;
  void _listener() {
    setState(() {});
  }

  void _listener2() {
    setState(() {});
  }

  void setMaxExtent() {
    maxExtent = BaseCueHelper().getMaxHeight(paragraphs, !isMon.value,
            subtitleTextStyle, GlobalValues.screenWidth - 80) +
        10;
  }

  @override
  void initState() {
    isScroll = widget.isMemorize != null && widget.isMemorize! ? false : true;
    isMemorize = widget.isMemorize ?? false;
    videoMemorizeWord = widget.videoMemorizeWord;
    paragraphs.add(
      CParagraph(
        "-1",
        -1,
        "",
        "",
        startTime: "0:0:0.0",
        endTime: widget.paragraphs.first.startTime,
        words: [
          CWord('-1', '', '', false),
        ],
      ),
    );
    paragraphs.addAll(widget.paragraphs);
    for (var element in paragraphs) {
      element.ordering = element.ordering + 1;
    }
    defaultColor = widget.defaultColor ?? Colors.grey.shade400;
    _fixedExtentScrollController = FixedExtentScrollController();
    widget.videoPlayerController.addListener(videoPlayerListener);
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

  videoPlayerListener() async {
    /// Үг цээжлэх үед зогсох хугацаа
    if ((isMemorize != null && isMemorize!) ||
        widget.videoMemorizeWord != null &&
            widget.videoPlayerController.value.isPlaying) {
      if (widget.videoPlayerController.value.position.inSeconds ==
          getDuration(videoMemorizeWord!.endTime!).inSeconds) {
        await widget.videoPlayerController.pause();
      }
    }
    if (widget.videoPlayerController.value.isPlaying) {
      if (isUser == -1) {
        var _duration = widget.videoPlayerController.value.position;
        idx = paragraphs.firstWhereOrNull((element) =>
            getDuration(element.startTime!) <= _duration &&
            getDuration(element.endTime!) > _duration);
        if (idx != null && prevCueId != idx.ordering) {
          if (isMemorize != null && isMemorize!) {
            memorizeHighlight();
          }
          _fixedExtentScrollController.animateToItem(
            idx.ordering,
            duration: const Duration(milliseconds: 300),
            curve: Curves.linear,
          );
          prevCueId = idx.ordering;
        }
      }
    }
  }

  memorizeHighlight() {
    paragraphs[paragraphs.indexOf(idx)].words!.forEach((element) async {
      if (videoMemorizeWord!.word!.toUpperCase() ==
          element.word.toUpperCase()) {
        memorizedWord = element;
        isMon.value = false;
        refreshCue.value = !refreshCue.value;
        currentIndex = paragraphs.indexOf(idx);
        await Future.delayed(const Duration(milliseconds: 300));
        wordDescriptionBottomSheet();
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    isMon.dispose();
    _fixedExtentScrollController.dispose();
    super.dispose();
  }

  void wordDescriptionBottomSheet({TapDownDetails? details}) {
    if (widget.wordCallback != null && isMon.value == false) {
      var position;
      if (details != null) {
        position = details.globalPosition;
      }
      if (currentIndex > -1 && currentIndex < paragraphs.length) {
        CParagraph cue = paragraphs[currentIndex];
        for (var entry in cueWidgets[cue]!.entries) {
          Rect rect = entry.value.item1.globalPaintBounds!;
          if ((position != null && rect.contains(position)) &&
              (entry.key.wordValue != '')) {
            currentSheetData(cue: cue, entry: entry, rect: rect);
            break;
          } else if (isMemorize!) {
            currentSheetData(cue: cue, entry: entry, rect: rect);
            break;
          }
        }
      }
    }
  }

  currentSheetData(
      {MapEntry<CWord, Tuple2<GlobalKey<State<StatefulWidget>>, Widget>>? entry,
      Rect? rect,
      CParagraph? cue}) {
    selectedWord = !isMemorize! ? entry!.key : memorizedWord;
    selectedWordParagraphIndex = currentIndex;
    selectedRect = rect;
    valueKeyList[cue!] = valueKeyList[cue]! + 1;
    widget.wordCallback!(selectedWord!, selectedRect!);
    if (widget.videoPlayerController.value.isPlaying && !isMemorize!) {
      widget.videoPlayerController.pause();
    }
    refreshCue.value = !refreshCue.value;
  }
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

mixin BaseVideoSubtitleMixin<Page extends BaseVideoSubtitlePage>
    on BaseVideoSubtitleState<Page> {
  @override
  void initState() {
    super.initState();
  }

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
              widget.isMemorize != null && widget.isMemorize!
                  ? Row(
                      mainAxisSize: MainAxisSize.min,
                      children: memorizeOptions.map((e) {
                        return Flexible(
                          flex: 1,
                          child: memorizeOptionWidget(
                            options: e,
                            index: memorizeOptions.indexOf(e),
                          ),
                        );
                      }).toList(),
                    )
                  : widget.isBookMark
                      ? Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            InkWell(
                              onTap: () async {
                                await widget.videoPlayerController.pause();
                                int index;
                                await showDialog(
                                  context: context,
                                  builder: (context) {
                                    return ExerciseOptionDialog();
                                  },
                                ).then((value) {
                                  if (value != null) {
                                    index = value;
                                    exerciseNavigate(index: index);
                                  }
                                });
                              },
                              child: const Icon(
                                Icons.expand_circle_down_outlined,
                                color: Color(0xffC7C9D9),
                                size: 27,
                              ), 
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              onTap: () {
                                widget.quizBtn!();
                              },
                              child: SvgPicture.asset(
                                "assets/img/video/quiz.svg",
                                width: 30,
                                height: 30,
                                color: const Color(0xffC7C9D9),
                              ),
                            )
                          ],
                        )
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
              },
              onTapDown: (TapDownDetails details) {
                isMemorize = false;
                selectedWordParagraphIndex = -1;
                wordDescriptionBottomSheet(details: details);
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
                      isUser = 0;
                      widget.videoPlayerController.seekTo(
                          getDuration(paragraphs[currentIndex].startTime!));
                      if (!widget.videoPlayerController.value.isPlaying) {
                        widget.videoPlayerController.play();
                      }
                    }
                    return false;
                  },
                  child: ClickableListWheelScrollView(
                    scrollController: _fixedExtentScrollController,
                    itemHeight: maxExtent,
                    scrollOnTap: isScroll,
                    itemCount: paragraphs.length,
                    onItemTapCallback: (index) {
                      if (widget.isMemorize == null) {
                        currentIndex = index;
                      }
                    },
                    child: ListWheelScrollView.useDelegate(
                      physics: !isScroll
                          ? const NeverScrollableScrollPhysics()
                          : const FixedExtentScrollPhysics(), // auto байрлалаа олоод зогсоно
                      itemExtent: maxExtent,
                      useMagnifier: false,
                      diameterRatio: 50,
                      magnification: 1.01, // голын item нь илүү том харагдах
                      perspective: 0.001,
                      controller: _fixedExtentScrollController,
                      onSelectedItemChanged: (index) {
                        currentIndex = index;
                        selectedWord = null;
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
                          index == currentIndex,
                        ), //selectedIndex == index
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

  ///Нэмэлт дасгалийн сонголтууд
  exerciseNavigate({int? index}) async {
    switch (index) {
      case 0:
        Sonsgol data;
        try {
          LoadingIndicator(context: context).showLoadingIndicator();
          data = await VideoRepository()
              .getSonsgol(movieId: widget.movies![0].contentId!);
          LoadingIndicator(context: context).hideLoadingIndicator();
          AutoRouter.of(context).push(
            SonsgolRoute(
              data: data,
              url: widget.videoUrl!,
              title: 'Сонсгол шалгах',
              contentId: widget.movies![0].contentId!,
              isListening: true,
            ),
          );
        } on CustomException catch (Ex) {
          LoadingIndicator(context: context).hideLoadingIndicator();
          ScaffoldMessenger.of(context).showSnackBar(
            MySnackBar(
              text: Ex.errorMsg.toString(),
            ),
          );
        } catch (ex) {
          LoadingIndicator(context: context).hideLoadingIndicator();
          ScaffoldMessenger.of(context).showSnackBar(
            MySnackBar(
              text: ex.toString(),
            ),
          );
        }

        break;
      case 1:
        VideoMemorizeWord? videoMemorizeWord;
        try {
          LoadingIndicator(context: context).showLoadingIndicator();
          videoMemorizeWord = await memorizeWords();
          LoadingIndicator(context: context).hideLoadingIndicator();
          AutoRouter.of(context).push(
            VideoMemorizeRoute(
              movies: widget.movies,
              url: widget.videoUrl!,
              title: "Үг цээжлэх",
              isSerial: false,
              quiz: null,
              isMemorize: true,
              contentId: widget.contentId,
              videoMemorizeWord: videoMemorizeWord,
            ),
          );
        } on CustomException catch (Ex) {
          LoadingIndicator(context: context).hideLoadingIndicator();
          ScaffoldMessenger.of(context).showSnackBar(
            MySnackBar(
              text: Ex.errorMsg.toString(),
            ),
          );
        } catch (ex) {
          LoadingIndicator(context: context).hideLoadingIndicator();
          ScaffoldMessenger.of(context).showSnackBar(
            MySnackBar(
              text: ex.toString(),
            ),
          );
        }
        break;
      case 2:
        AutoRouter.of(context).push(
          VideoVocabularyListRoute(movieId: widget.movies![0].movieId!),
        );
        break;
    }
  }

  Future<VideoMemorizeWord> memorizeWords() async {
    LoadingIndicator(context: context).showLoadingIndicator();
    try {
      VideoMemorizeWord videoMemorizeWord =
          await VideoRepository().getMemorizeWord(
        isAll: currentOption,
        contentId: widget.contentId,
        lastWordId: lastWordId,
      );
      await GetStorage().write("start_time", videoMemorizeWord.startTime);
      memorizeHighlight();
      isMemorize = true;
      lastWordId = videoMemorizeWord.wordId;
      LoadingIndicator(context: context).hideLoadingIndicator();
      return videoMemorizeWord;
    } on CustomException catch (ex) {
      LoadingIndicator(context: context).hideLoadingIndicator();
      throw CustomException(errorMsg: ex.errorMsg.toString());
    } catch (Ex) {
      LoadingIndicator(context: context).hideLoadingIndicator();
      throw CustomException(errorMsg: Ex.toString());
    }
  }

  Future getRandomCue({String? lastWordId}) async {
    videoMemorizeWord = await memorizeWords();
    await widget.videoPlayerController.pause();
    await widget.videoPlayerController
        .seekTo(getDuration(videoMemorizeWord!.startTime!));
    await widget.videoPlayerController.play();
    setState(() {});
  }

  /// Үг цээжлэх сонголт
  Widget memorizeOptionWidget({MemorizeOptions? options, int? index}) {
    return InkWell(
      onTap: () async {
        memorizedOptionsCurrentIndex = index;
        currentOption = memorizeOptions[memorizedOptionsCurrentIndex!].type!;
        widget.memorizeTypeBtn!(currentOption);
        isMon.value = false;
        setState(() {});
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            options!.name!,
            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  color: index == memorizedOptionsCurrentIndex
                      ? colorPrimary
                      : colorPrimary.withOpacity(0.3),
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            height: 2,
            width: 70,
            decoration: BoxDecoration(
              color: index == memorizedOptionsCurrentIndex
                  ? colorPrimary
                  : Colors.transparent,
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
        ? getTextWidget(paragraph.monText, isSelectedIndex, true)
        : paragraph.words != null
            ? SubtitleParagraph(
                paragraph,
                currentIndex,
                defaultColor: defaultColor,
                isMemorize: isMemorize,
                key: ValueKey<int>(valueKeyList[paragraph]!),
                currentWord: !isMemorize!
                    ? (isSelectedIndex ? selectedWord : null)
                    : memorizedWord,
                alignment: Alignment.center,
              )
            : getTextWidget(paragraph.engText, true, false);

    if (widget is SubtitleParagraph) {
      cueWidgets[paragraph] = widget.wordWidgets;
    }
    return widget;
  }

  Widget getTextWidget(String caption, bool isSelected, bool isMon) {
    return Center(
      child: Text(
        caption,
        style: isSelected
            ? TextStyle(
                color: colorBlack,
                fontSize: isMon ? 16 : 18,
                fontWeight: FontWeight.w400)
            : TextStyle(
                color: defaultColor,
                fontSize: isMon ? 16 : 18,
                fontWeight: FontWeight.w400),
        textAlign: TextAlign.center,
      ),
    );
  }
}
