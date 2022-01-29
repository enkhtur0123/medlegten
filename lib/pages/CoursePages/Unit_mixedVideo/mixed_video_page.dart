import 'package:flutter/material.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/components/loading.dart';
import 'package:medlegten/models/Unit/cue_word.dart';
import 'package:medlegten/models/Unit/unit_introduction_video.dart';
import 'package:medlegten/pages/CoursePages/Unit_introVideo/intro_video_helper.dart';
import 'package:medlegten/pages/CoursePages/Unit_mixedVideo/mixed_video_subtitle.dart';
import 'package:medlegten/pages/CoursePages/base/base_video_page.dart';
import 'package:medlegten/pages/CoursePages/base/cue_wrapper.dart';
import 'package:medlegten/repositories/unit_repository.dart';

class MixedVideoPage extends BaseVideoPage {
  const MixedVideoPage(this.unitIntroVideo, this.url, {Key? key})
      : super(url, key: key);

  final UnitIntroVideo unitIntroVideo;
  final String url;

  @override
  _MixedVideoPageState createState() => _MixedVideoPageState();
}

class _MixedVideoPageState extends BaseVideoPageState<MixedVideoPage>
    with BaseVideoMixin {
  CParagraph? paragraph;

  late final ValueNotifier<bool> refreshNotifier = ValueNotifier(false)
    ..addListener(_listener);

  void _listener() {
    setState(() {});
  }

  @override
  Widget subtitleWidget() {
    return MixedVideoSubtitle(
        videoPlayerController, IntroVideohelper.convert(widget.unitIntroVideo),
        (val) {
      paragraph = val;
      refreshNotifier.value = !refreshNotifier.value;
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
          height: 250,
          width: double.infinity,
          child: Container(
            height: 220,
            width: MediaQuery.of(context).size.width * 0.88,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                  color: const Color.fromRGBO(174, 177, 239, .3), width: 1),
            ),
            child: FutureBuilder<CueWord?>(
              future: UnitRepository().getCueWord('Noun'), // async work
              builder:
                  (BuildContext context, AsyncSnapshot<CueWord?> snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return const Loading();
                  default:
                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      return innerBottonSheetWidget(paragraph);
                    }
                }
              },
            ),
          ),
        );
      },
      onClosing: () {},
    );
  }

  Widget innerBottonSheetWidget(CParagraph? paragraph) {
    if (paragraph == null) {
      return Text('NULL', style: TextStyle(color: ColorTable.color48_53_159));
    }

    List<Widget> list = [];

    //for (var translation in cueWord.translation) {
    //  {
    list.add(
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              paragraph.monText,
              style: const TextStyle(
                  color: Color.fromRGBO(48, 53, 159, 1),
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
            Text(
              paragraph.engText,
              style: const TextStyle(
                  color: Color.fromRGBO(48, 53, 159, .3),
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
    //}
    //}

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.unmodifiable(() sync* {
            yield* list;
          }()),
        ),
      ),
    );
  }
}
