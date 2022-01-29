import 'package:flutter/material.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/common/widget_functions.dart';
import 'package:medlegten/components/loading.dart';
import 'package:medlegten/models/Unit/cue_word.dart';
import 'package:medlegten/models/Unit/unit_introduction_video.dart';
import 'package:medlegten/pages/CoursePages/Unit_introVideo/intro_video_helper.dart';
import 'package:medlegten/pages/CoursePages/Unit_introVideo/intro_video_subtitle.dart';
import 'package:medlegten/pages/CoursePages/base/base_video_page.dart';
import 'package:medlegten/pages/CoursePages/base/cue_wrapper.dart';
import 'package:medlegten/repositories/unit_repository.dart';

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

  late final ValueNotifier<bool> refreshNotifier = ValueNotifier(false)
    ..addListener(_listener);

  void _listener() {
    setState(() {});
  }

  @override
  Widget subtitleWidget() {
    return IntroVideoSubtitle(
        videoPlayerController, IntroVideohelper.convert(widget.unitIntroVideo),
        (val) {
      word = val;
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
        child: _showBottomSheet(context, word));
  }
}

Widget _showBottomSheet(BuildContext context, CWord? word) {
  if (word == null) return const SizedBox(height: 1);

  return BottomSheet(
    backgroundColor: colorWhite,
    enableDrag: false,
    builder: (BuildContext context) {
      return SizedBox(
        height: 250,
        width: double.infinity,
        child: Stack(
          children: [
            Positioned(
              top: 20,
              left: MediaQuery.of(context).size.width * 0.06,
              child: Container(
                height: 220,
                width: MediaQuery.of(context).size.width * 0.88,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                      color: const Color.fromRGBO(174, 177, 239, .3), width: 1),
                ),
                child: FutureBuilder<CueWord?>(
                  future:
                      UnitRepository().getCueWord(word.wordValue), // async work
                  builder:
                      (BuildContext context, AsyncSnapshot<CueWord?> snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        return const Loading();
                      default:
                        if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else {
                          return innerBottonSheetWidget(snapshot.data);
                        }
                    }
                  },
                ),
              ),
            ),
            Positioned(
              top: 9.8,
              left: 40,
              child: Image.network(
                "https://www.medlegten.com/static/uploads/content/image_small/polygon3.jpg",
                fit: BoxFit.cover,
                width: 27.56,
                height: 11.48,
              ),
            ),
          ],
        ),
      );
    },
    onClosing: () {},
  );
}

Widget innerBottonSheetWidget(CueWord? cueWord) {
  if (cueWord == null) {
    return Text('NULL', style: TextStyle(color: ColorTable.color48_53_159));
  }

  List<Widget> list = [];

  if (cueWord.rootWordInfo.rootWord != null) {
    list.add(
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            const Text(
              'Үгийн үндэс',
              style: TextStyle(
                  color: Color.fromRGBO(48, 53, 159, 1),
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
            addHorizontalSpace(20),
            Text(
              cueWord.rootWordInfo.rootWord!,
              style: const TextStyle(
                  color: Color.fromRGBO(48, 53, 159, .3),
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }

  for (var translation in cueWord.translation) {
    {
      list.add(
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                translation.trTypeShortName,
                style: const TextStyle(
                    color: Color.fromRGBO(48, 53, 159, 1),
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                translation.trText,
                style: const TextStyle(
                    color: Color.fromRGBO(48, 53, 159, .3),
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      );
    }
  }

  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.unmodifiable(() sync* {
          yield Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(120, 100, 254, 1),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            color: const Color.fromRGBO(174, 177, 239, .3),
                            width: 1),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 12, top: 8, right: 12, bottom: 8),
                        child: Text(
                          cueWord.word,
                          style: const TextStyle(
                              color: colorWhite,
                              fontWeight: FontWeight.w700,
                              fontSize: 16),
                        ),
                      ),
                    ),
                    IconButton(
                        onPressed: () => {},
                        icon: const Icon(
                          Icons.volume_up_outlined,
                          color: Color.fromRGBO(48, 53, 159, 1),
                          size: 28.0,
                        ))
                  ],
                ),
              ),
              SizedBox(
                child: IconButton(
                    onPressed: () => {},
                    icon: const Icon(
                      Icons.bookmark_outline_sharp,
                      color: Color.fromRGBO(48, 53, 159, 1),
                      size: 28.0,
                    )),
              )
            ],
          );
          yield* list;
        }()),
      ),
    ),
  );
}
