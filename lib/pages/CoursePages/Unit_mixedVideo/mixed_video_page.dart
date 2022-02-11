import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/models/Unit/unit_mixed_video.dart';
import 'package:medlegten/pages/CoursePages/Unit_mixedVideo/mixed_video_helper.dart';
import 'package:medlegten/pages/CoursePages/Unit_mixedVideo/mixed_video_subtitle.dart';
import 'package:medlegten/pages/CoursePages/base/base_video_page.dart';
import 'package:medlegten/pages/CoursePages/base/cue_word_widget.dart';
import 'package:medlegten/pages/CoursePages/base/cue_wrapper.dart';
import 'package:medlegten/utils/global.dart';

class MixedVideoPage extends BaseVideoPage {
  const MixedVideoPage(this.unitMixedVideo, this.url, {Key? key})
      : super(url, key: key);

  final UnitMixedVideo unitMixedVideo;
  final String url;

  @override
  _MixedVideoPageState createState() => _MixedVideoPageState();
}

class _MixedVideoPageState extends BaseVideoPageState<MixedVideoPage>
    with BaseVideoMixin {
  CParagraph? paragraph;
  CWord? word;
  Rect position = Rect.zero;
  bool bottomIsVisible = false;

  late final ValueNotifier<bool> refreshNotifier = ValueNotifier(false)
    ..addListener(_listener);

  void _listener() {
    setState(() {});
  }

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
    return MixedVideoSubtitle(
        videoPlayerController, MixedVideohelper.convert(widget.unitMixedVideo),
        (val) {
      paragraph = val;
      refreshNotifier.value = !refreshNotifier.value;
    }, (cword, pposition) {
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
          return child!;
        },
        valueListenable: refreshNotifier,
        child: _showBottomSheet(context, paragraph));
  }

  Widget _showBottomSheet(BuildContext context, CParagraph? paragraph) {
    if (paragraph == null) return const SizedBox(height: 1);

    return BottomSheet(
      backgroundColor: colorWhite,
      enableDrag: false,
      builder: (BuildContext context) {
        return SizedBox(
          height: GlobalValues.getHeightRelativeToScreen(25),
          width: double.infinity,
          child: innerBottonSheetWidget(paragraph),
        );
      },
      onClosing: () {},
    );
  }

  void wordCallBack(word, position) {
    if (word != null) {
      var isTop = GlobalValues.screenHeight - position.top > 220;
      SmartDialog.showAttach(
        isLoadingTemp: false,
        targetContext: null,
        target: Offset(
            10, isTop == false ? position.top - 220 - 30 : position.top + 30),
        //isPenetrateTemp: true,
        //alignmentTemp: Alignment.bottomCenter,
        useSystem: false,
        isUseAnimationTemp: false,
        maskColorTemp: Colors.transparent,
        widget: SizedBox(
          height: 220 + 20,
          width: GlobalValues.getWidthRelativeToScreen(51),
          //color: Colors.white60,
          child: CueWordWidget(word,
              ppointerPosition: position, isshadow: true, istop: isTop),
        ),
      );
      // showDialog(
      //     context: context,
      //     barrierColor: Colors.transparent,
      //     barrierDismissible: true,
      //     builder: (BuildContext context) {
      //       return ReadingPopUpDialog(word, position);
      //     });
    }
  }

  Widget innerBottonSheetWidget(CParagraph paragraph) {
    List<Widget> list = [];

    list.add(const Text(
      'Grammar',
      style: TextStyle(
          fontFamily: 'Roboto',
          color: Color.fromRGBO(48, 53, 159, 1),
          fontSize: 14,
          fontWeight: FontWeight.w500),
    ));

    list.add(
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          paragraph.grammarDescription ?? 'NO DATA',
          style: const TextStyle(
              fontFamily: 'Roboto',
              color: Color.fromRGBO(120, 100, 254, 1),
              fontSize: 14,
              fontWeight: FontWeight.w500),
        ),
      ),
    );

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) => list[index],
      ),
    );
  }
}
