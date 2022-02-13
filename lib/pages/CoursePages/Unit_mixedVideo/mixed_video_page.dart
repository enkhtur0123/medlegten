import 'package:flutter/material.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/models/Unit/unit_mixed_video.dart';
import 'package:medlegten/pages/CoursePages/Unit_mixedVideo/mixed_video_helper.dart';
import 'package:medlegten/pages/CoursePages/Unit_mixedVideo/mixed_video_subtitle.dart';
import 'package:medlegten/pages/CoursePages/base/base_video_page.dart';
import 'package:medlegten/pages/CoursePages/base/cue_word_widget.dart';
import 'package:medlegten/pages/CoursePages/base/cue_wrapper.dart';
import 'package:medlegten/utils/global.dart';

class MixedVideoPage extends BaseVideoPage {
  const MixedVideoPage(this.unitTitle, this.unitMixedVideo, this.url,
      {Key? key})
      : super(url, title: unitTitle, key: key);

  final UnitMixedVideo unitMixedVideo;
  final String url;
  final String unitTitle;
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
      word = null;
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
          return word != null
              ? _showBottomSheetWord(context, word, position)
              : _showBottomSheetParagraph(context, paragraph);
        },
        valueListenable: refreshNotifier);
  }

  Widget _showBottomSheetWord(context, CWord? word, Rect position) {
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

  Widget _showBottomSheetParagraph(
      BuildContext context, CParagraph? paragraph) {
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
