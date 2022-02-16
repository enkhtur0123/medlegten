import 'package:medlegten/models/video/video_cue.dart';
import 'package:medlegten/models/video/video_cue_word.dart';
import 'package:medlegten/pages/CoursePages/base/cue_wrapper.dart';

class VideoHelper{
  static List<CParagraph> convert(List<VideoCueParagraph> videoCueParagraph) {
    List<CParagraph> retList = [];
    for (var cue in videoCueParagraph) {
      retList.add(CParagraph(cue.cueId, int.parse(cue.ordering) - 1,
          cue.toLangTranslation, cue.fromLangTranslation,
          words: convertWords(cue.words),
          startTime: cue.startTime,
          endTime: cue.endTime));
    }
    return retList;
  }

  static List<CWord> convertWords(List<VideoCueWord> list) {
    List<CWord> retList = [];
    for (var word in list) {
      retList.add(CWord(
          word.wordId, word.mainText, word.wordValue, word.spaceNext == '0'));
    }
    return retList;
  }

}