import 'package:freezed_annotation/freezed_annotation.dart';

part 'unit_introduction_cue_word.freezed.dart';
part 'unit_introduction_cue_word.g.dart';

@freezed
class UnitIntroCueWord with _$UnitIntroCueWord {
  factory UnitIntroCueWord(String id, String cueId, String mainText,
      String valueText, String spaceNext) = _UnitIntroCueWord;

  factory UnitIntroCueWord.fromJson(Map<String, dynamic> json) =>
      _$UnitIntroCueWordFromJson(json);
}
