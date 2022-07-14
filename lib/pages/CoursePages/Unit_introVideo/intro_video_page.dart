import 'package:flutter/material.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/models/Unit/unit_introduction_video.dart';
import 'package:medlegten/pages/CoursePages/Unit_introVideo/intro_video_helper.dart';
import 'package:medlegten/pages/CoursePages/Unit_introVideo/intro_video_subtitle.dart';
import 'package:medlegten/pages/CoursePages/base/base_video_page.dart';
import 'package:medlegten/pages/CoursePages/base/cue_word_widget.dart';
import 'package:medlegten/pages/CoursePages/base/cue_wrapper.dart';
import 'package:medlegten/widgets/dialog/custom_popup.dart';

class CourseUnitIntroVideoPage extends BaseVideoPage {
  const CourseUnitIntroVideoPage(this.unitIntroVideo, this.url,
      {Key? key, this.moduleId, this.unitTitle, this.isCompleted})
      : super(url, key: key, title: unitTitle, isCompleted: isCompleted);

  final String? unitTitle;
  final UnitIntroVideo unitIntroVideo;
  final String url;
  final String? moduleId;
  final bool? isCompleted;

  @override
  _CourseUnitIntroVideoPageState createState() =>
      _CourseUnitIntroVideoPageState();
}

class _CourseUnitIntroVideoPageState
    extends BaseVideoPageState<CourseUnitIntroVideoPage> with BaseVideoMixin {
  CWord? word;
  Rect position = Rect.zero;
  bool bottomIsVisible = false;
  bool dialogIsShown = false;
  late final ValueNotifier<bool> refreshNotifier = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    videoPlayerController!.addListener(() {
      if (videoPlayerController!.value.isPlaying) {
        if (bottomIsVisible) {
          bottomIsVisible = false;
          word = null;
        }

        if (widget.unitIntroVideo.needGuide == '1') {
          if (videoPlayerController!.value.position.inSeconds + 1 >=
              videoPlayerController!.value.duration.inSeconds) {
            if (!dialogIsShown) {
              dialogIsShown = true;
              showGuide(context);
            }
          }
        }
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
        videoPlayerController!, IntroVideohelper.convert(widget.unitIntroVideo),
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

  void showGuide(BuildContext context) async {
    await showDialog(
        barrierDismissible: true,
        barrierColor: Colors.transparent,
        context: context,
        builder: (context) {
          return const CustomPopUpDialog(
            isInfo: true,
            body:
                'Та хичээл бүрийг бүрэн үзэж дууссаны дараа баруун дээр байрлах дуусгах товчлуур дээр дарж дараагийн хичээлийг үзэх боломжтой',
          );
        });
  }
}
