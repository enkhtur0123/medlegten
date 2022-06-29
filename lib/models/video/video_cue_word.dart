import 'package:freezed_annotation/freezed_annotation.dart';

part 'video_cue_word.freezed.dart';
part 'video_cue_word.g.dart';

@freezed
class VideoCueWord with _$VideoCueWord {
  factory VideoCueWord(String? wordId, String? mainText, String? wordValue, String? spaceNext, String? ordering) =
      _VideoCueWord;

  factory VideoCueWord.fromJson(Map<String, dynamic> json) => _$VideoCueWordFromJson(json);
}
