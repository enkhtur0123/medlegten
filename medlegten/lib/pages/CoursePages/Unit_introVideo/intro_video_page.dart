import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/common/widget_functions.dart';
import 'package:medlegten/components/loading.dart';
import 'package:medlegten/components/video_player_chewie.dart';
import 'package:medlegten/hooks/useVideoController.dart';
import 'package:medlegten/models/Unit/cue_word.dart';
import 'package:medlegten/models/Unit/unit_introduction_cue_word.dart';
import 'package:medlegten/models/Unit/unit_introduction_video.dart';
import 'package:medlegten/pages/CoursePages/Unit_introVideo/intro_video_subtitle.dart';
import 'package:medlegten/repositories/unit_repository.dart';

typedef UnitIntroCueWordCallback = void Function(UnitIntroCueWord val);

class CourseUnitIntroVideoPage extends HookWidget {
  const CourseUnitIntroVideoPage(this.unitIntroVideo, {Key? key})
      : super(key: key);

  final UnitIntroVideo unitIntroVideo;

  @override
  Widget build(BuildContext context) {
    final refreshNotifier = useState(false);
    final word = useMemoized(() {
      final val = <UnitIntroCueWord?>[];
      val.add(null);
      return val;
    }, const []);
    final _videoPlayerController = useVideoController(unitIntroVideo.url);

    List<Widget> list = [];
    if (_videoPlayerController.value.isInitialized) {
      list.add(VideoPlayerChewie(_videoPlayerController));
      list.add(addVerticalSpace(20));
      list.add(
          IntroVideoSubtitle(_videoPlayerController, unitIntroVideo, (val) {
        word[0] = val;
        refreshNotifier.value = !refreshNotifier.value;
      }));
    } else {
      list.add(const Loading());
    }

    return Scaffold(
      backgroundColor: ColorTable.color255_255_255,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: list,
      ),
      bottomSheet: ValueListenableBuilder<bool>(
          builder: (BuildContext context, bool value, Widget? child) {
            return child!;
          },
          valueListenable: refreshNotifier,
          child: _showBottomSheet(context, word[0])),
    );
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

  Widget _showBottomSheet(BuildContext context, UnitIntroCueWord? word) {
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
                        color: const Color.fromRGBO(174, 177, 239, .3),
                        width: 1),
                  ),
                  child: FutureBuilder<CueWord?>(
                    future: UnitRepository()
                        .getCueWord(word.wordValue), // async work
                    builder: (BuildContext context,
                        AsyncSnapshot<CueWord?> snapshot) {
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
