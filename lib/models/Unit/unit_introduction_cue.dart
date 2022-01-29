import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medlegten/models/Unit/unit_introduction_cue_word.dart';

part 'unit_introduction_cue.freezed.dart';
part 'unit_introduction_cue.g.dart';

@freezed
class UnitIntroCueParagraph with _$UnitIntroCueParagraph {
  factory UnitIntroCueParagraph(
      String cueId,
      String ordering,
      String startTime,
      String endTime,
      String fromLangId,
      String fromLangTranslation,
      String fromLangIsDefault,
      String toLangId,
      String toLangTranslation,
      String toLangIsDefault,
      List<UnitIntroCueWord> words) = _UnitIntroCueParagraph;

  factory UnitIntroCueParagraph.fromJson(Map<String, dynamic> json) =>
      _$UnitIntroCueParagraphFromJson(json);
}
