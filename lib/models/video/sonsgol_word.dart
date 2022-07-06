import 'package:freezed_annotation/freezed_annotation.dart';

part 'sonsgol_word.freezed.dart';
part 'sonsgol_word.g.dart';

@freezed
class SonsgolWord with _$SonsgolWord {
  factory SonsgolWord(String mainText, String wordValue, String spaceNext, String ordering) = _SonsgolWord;

  factory SonsgolWord.fromJson(Map<String, dynamic> json) => _$SonsgolWordFromJson(json);
}
