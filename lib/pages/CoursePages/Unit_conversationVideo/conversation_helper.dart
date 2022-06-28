import 'package:medlegten/models/Unit/unit_conversation_video.dart';
import 'package:medlegten/models/Unit/unit_introduction_cue_word.dart';
import 'package:medlegten/pages/CoursePages/base/cue_wrapper.dart';

class ConversationVideohelper {
  static List<CParagraph> convert(UnitConversationVideo unitConversationVideo) {
    List<CParagraph> retList = [];
    for (var cue in unitConversationVideo.cue) {
      retList.add(CParagraph(cue.cueId, int.parse(cue.ordering) - 1,
          cue.toLangTranslation, cue.fromLangTranslation,
          words: convertWords(cue.words),
          startTime: cue.startTime,
          endTime: cue.endTime));
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
