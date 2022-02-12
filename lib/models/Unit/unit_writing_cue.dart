import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medlegten/models/Unit/unit_writing_cueword.dart';

part 'unit_writing_cue.freezed.dart';
part 'unit_writing_cue.g.dart';

@freezed
class UnitWritingCueParagraph with _$UnitWritingCueParagraph {
  factory UnitWritingCueParagraph(
      String cueId,
      String ordering,
      String fromLangId,
      String fromLangTranslation,
      String fromLangIsDefault,
      String toLangId,
      String toLangTranslation,
      String toLangIsDefault,
      String missWordRequired,
      String startTime,
      String endTime,
      List<UnitWritingCueWord> missWords) = _UnitWritingCueParagraph;

  factory UnitWritingCueParagraph.fromJson(Map<String, dynamic> json) =>
      _$UnitWritingCueParagraphFromJson(json);
}
