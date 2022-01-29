import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/models/Unit/unit_introduction_video.dart';
import 'package:medlegten/pages/CoursePages/Unit_introVideo/intro_video_helper.dart';
import 'package:medlegten/pages/CoursePages/Unit_reading/reading_paragraph.dart';
import 'package:medlegten/pages/CoursePages/base/cue_wrapper.dart';

class ReadingPage extends HookWidget {
  const ReadingPage(this.unitIntroVideo, {Key? key}) : super(key: key);

  final UnitIntroVideo unitIntroVideo;

  @override
  Widget build(BuildContext context) {
    final word = useMemoized(() => <CWord?>[null]);
    final refreshNotifier = useState(false);

    return Scaffold(
      appBar: AppBar(),
      backgroundColor: ColorTable.color255_255_255,
      body: ReadingParagraph(IntroVideohelper.convert(unitIntroVideo), (val) {
        word[0] = val;
        refreshNotifier.value = !refreshNotifier.value;
      }),
    );
  }
}
