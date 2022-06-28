import 'package:freezed_annotation/freezed_annotation.dart';

part 'unit_writing_cueword.freezed.dart';
part 'unit_writing_cueword.g.dart';

@freezed
class UnitWritingCueWord with _$UnitWritingCueWord {
  factory UnitWritingCueWord(
      String missWordId,
      String ordering,
      String mainText,
      String wordValue,
      String spaceNext,
      String isVisible) = _UnitWritingCueWord;

  factory UnitWritingCueWord.fromJson(Map<String, dynamic> json) =>
      _$UnitWritingCueWordFromJson(json);
}
