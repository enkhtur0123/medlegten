import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medlegten/models/Unit/root_word_info.dart';
import 'package:medlegten/models/Unit/translation.dart';
import 'package:medlegten/models/Unit/word_type.dart';

part 'cue_word.freezed.dart';
part 'cue_word.g.dart';

@freezed
class CueWord with _$CueWord {
  factory CueWord(
      bool isSuccess,
      String errorCode,
      String resultMessage,
      String wordId,
      String word,
      String tts,
      RootWordInfo rootWordInfo,
      WordType wordType,
      List<Translation> translation) = _CueWord;

  factory CueWord.fromJson(Map<String, dynamic> json) =>
      _$CueWordFromJson(json);
}
