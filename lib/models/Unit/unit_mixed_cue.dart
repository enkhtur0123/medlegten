import 'package:freezed_annotation/freezed_annotation.dart';

part 'unit_mixed_cue.freezed.dart';
part 'unit_mixed_cue.g.dart';

@freezed
class UnitMixedCueParagraph with _$UnitMixedCueParagraph {
  factory UnitMixedCueParagraph(
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
      String grammarIsHighLighted,
      String grammarDescription) = _UnitMixedCueParagraph;

  factory UnitMixedCueParagraph.fromJson(Map<String, dynamic> json) =>
      _$UnitMixedCueParagraphFromJson(json);
}
