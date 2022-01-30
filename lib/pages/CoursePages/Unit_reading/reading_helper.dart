import 'package:medlegten/models/Unit/reading.dart';
import 'package:medlegten/models/Unit/unit_introduction_cue_word.dart';
import 'package:medlegten/pages/CoursePages/base/cue_wrapper.dart';

class ReadingHelper {
  static List<CParagraph> convert(Reading reading) {
    List<CParagraph> retList = [];
    for (int i = 0; i < 20; i++) {
      for (var cue in reading.cue) {
        retList.add(CParagraph(
            cue.cueId,
            int.parse(cue.ordering),
            cue.fromLangTranslation,
            cue.toLangTranslation,
            convertWords(cue.words)));
      }
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
