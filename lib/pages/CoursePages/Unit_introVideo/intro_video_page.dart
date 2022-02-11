import 'package:flutter/material.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/models/Unit/unit_introduction_video.dart';
import 'package:medlegten/pages/CoursePages/Unit_introVideo/intro_video_helper.dart';
import 'package:medlegten/pages/CoursePages/Unit_introVideo/intro_video_subtitle.dart';
import 'package:medlegten/pages/CoursePages/base/base_video_page.dart';
import 'package:medlegten/pages/CoursePages/base/cue_word_widget.dart';
import 'package:medlegten/pages/CoursePages/base/cue_wrapper.dart';

class CourseUnitIntroVideoPage extends BaseVideoPage {
  const CourseUnitIntroVideoPage(this.unitIntroVideo, this.url, {Key? key})
      : super(url, key: key);

  final UnitIntroVideo unitIntroVideo;
  final String url;

  @override
  _CourseUnitIntroVideoPageState createState() =>
      _CourseUnitIntroVideoPageState();
}

class _CourseUnitIntroVideoPageState
    extends BaseVideoPageState<CourseUnitIntroVideoPage> with BaseVideoMixin {
  CWord? word;
  Rect position = Rect.zero;
  bool bottomIsVisible = false;
  late final ValueNotifier<bool> refreshNotifier = ValueNotifier(false);
  //..addListener(_listener);

  // void _listener() {
  //   setState(() {});
  // }

  @override
  void initState() {
    super.initState();
    videoPlayerController.addListener(() {
      if (videoPlayerController.value.isPlaying && bottomIsVisible) {
        bottomIsVisible = false;
        word = null;
        refreshNotifier.value = !refreshNotifier.value;
      }
    });
  }

  @override
  void dispose() {
    refreshNotifier.dispose();
    super.dispose();
  }

  @override
  Widget subtitleWidget() {
    return IntroVideoSubtitle(
        videoPlayerController, IntroVideohelper.convert(widget.unitIntroVideo),
        (cword, pposition) {
      if (cword != null) {
        word = cword;
        position = pposition;
        refreshNotifier.value = !refreshNotifier.value;
      }
    });
  }

  @override
  Widget bottomSheetWidget() {
    return ValueListenableBuilder<bool>(
        builder: (BuildContext context, bool value, Widget? child) {
          return _showBottomSheet(context, word, position);
        },
        valueListenable: refreshNotifier);
  }

  Widget _showBottomSheet(context, CWord? word, Rect position) {
    if (word == null) return const SizedBox(height: 1);
    bottomIsVisible = true;
    return BottomSheet(
      backgroundColor: colorWhite,
      enableDrag: false,
      builder: (BuildContext context) {
        return CueWordWidget(
          word,
          ppointerPosition: position,
          isshadow: false,
        );
      },
      onClosing: () {},
    );
  }
}
