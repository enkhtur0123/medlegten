import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medlegten/models/Unit/unit_introduction_cue_word.dart';

part 'reading_cue.freezed.dart';
part 'reading_cue.g.dart';

@freezed
class ReadingCueParagraph with _$ReadingCueParagraph {
  factory ReadingCueParagraph(
      String cueId,
      String ordering,
      String fromLangId,
      String fromLangTranslation,
      String fromLangIsDefault,
      String toLangId,
      String toLangTranslation,
      String toLangIsDefault,
      String grammarIsHighLighted,
      String grammarDescription,
      List<UnitIntroCueWord> words) = _ReadingCueParagraph;

  factory ReadingCueParagraph.fromJson(Map<String, dynamic> json) =>
      _$ReadingCueParagraphFromJson(json);
}
