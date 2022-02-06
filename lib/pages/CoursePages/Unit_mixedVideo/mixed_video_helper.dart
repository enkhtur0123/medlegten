import 'package:medlegten/models/Unit/unit_mixed_video.dart';
import 'package:medlegten/pages/CoursePages/base/cue_wrapper.dart';

class MixedVideohelper {
  static List<CParagraph> convert(UnitMixedVideo unitIntroVideo) {
    List<CParagraph> retList = [];
    int i = 0;
    for (var cue in unitIntroVideo.cue) {
      retList.add(CParagraph(
          cue.cueId, i++, cue.toLangTranslation, cue.fromLangTranslation,
          startTime: cue.startTime,
          endTime: cue.endTime,
          grammarIsHighLighted: cue.grammarIsHighLighted,
          grammarDescription: cue.grammarDescription));
    }
    return retList;
  }
}
