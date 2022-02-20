import 'package:medlegten/models/Landing/article_info_detail.dart';
import 'package:medlegten/models/Unit/unit_introduction_cue_word.dart';
import 'package:medlegten/pages/CoursePages/base/cue_wrapper.dart';
import 'package:medlegten/utils/global.dart';

class ArticleHelper {
  List<CParagraph> paragraphs = [];
  Map<CParagraph, int> valueKeys = <CParagraph, int>{};
  int lastIndex = -1;

  double width = GlobalValues.screenWidth - 80;

  static List<CParagraph> convert(ArticleInfoDetail articleInfo) {
    List<CParagraph> retList = [];

    for (var cue in articleInfo.cues) {
      if (cue.words.isNotEmpty) {
        retList.add(CParagraph(cue.cueId, int.parse(cue.ordering),
            cue.toLangTranslation ?? '', cue.fromLangTranslation ?? '',
            words: convertWords(cue.words)));
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
