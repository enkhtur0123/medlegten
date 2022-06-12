import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medlegten/models/video/video_cue_word.dart';

part 'memorize_word.freezed.dart';
part 'memorize_word.g.dart';

@freezed
class VideoMemorizeWord with _$VideoMemorizeWord {
  factory VideoMemorizeWord(
      String? wordId,
      String? word,
      String? cueId,
      String? ordering,
      String? startTime,
      String? endTime,
      String? fromLangTranslation,
      String? toLangTranslation,
      List<VideoCueWord>? words) = _VideoMemorizeWord;

  factory VideoMemorizeWord.fromJson(Map<String, dynamic> json) =>
      _$VideoMemorizeWordFromJson(json);
}
