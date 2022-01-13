import 'package:freezed_annotation/freezed_annotation.dart';

part 'unit_introduction_cue_word.freezed.dart';
part 'unit_introduction_cue_word.g.dart';

@freezed
class UnitIntroCueWord with _$UnitIntroCueWord {
  factory UnitIntroCueWord(String wordId, String mainText, String wordValue,
      String spaceNext, String ordering) = _UnitIntroCueWord;

  factory UnitIntroCueWord.fromJson(Map<String, dynamic> json) =>
      _$UnitIntroCueWordFromJson(json);
}
