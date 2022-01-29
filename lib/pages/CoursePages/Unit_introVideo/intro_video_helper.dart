import 'package:medlegten/models/Unit/unit_introduction_cue_word.dart';
import 'package:medlegten/models/Unit/unit_introduction_video.dart';
import 'package:medlegten/pages/CoursePages/base/cue_wrapper.dart';

class IntroVideohelper {
  static List<CParagraph> convert(UnitIntroVideo unitIntroVideo) {
    List<CParagraph> retList = [];
    for (var cue in unitIntroVideo.cue) {
      retList.add(CParagraph(
          cue.cueId,
          int.parse(cue.ordering),
          cue.startTime,
          cue.endTime,
          cue.fromLangTranslation,
          cue.toLangTranslation,
          convertWords(cue.words)));
    }
    return retList;
  }

  static List<CWord> convertWords(List<UnitIntroCueWord> list) {
    List<CWord> retList = [];
    for (var word in list) {
      retList.add(CWord(
          word.wordId, word.mainText, word.wordValue, word.spaceNext == '0'));
    }
    return retList;
  }
}