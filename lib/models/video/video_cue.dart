import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medlegten/models/video/video_cue_word.dart';

part 'video_cue.freezed.dart';
part 'video_cue.g.dart';

@freezed
class VideoCueParagraph with _$VideoCueParagraph {
  factory VideoCueParagraph(
    String  cueId,
      String ordering,
      String startTime,
      String endTime,
      String fromLangId,
      String fromLangTranslation,
      // String fromLangIsDefault,
      String toLangId,
      String toLangTranslation,
      List<VideoCueWord> words) = _VideoCueParagraph;

  factory VideoCueParagraph.fromJson(Map<String, dynamic> json) =>
      _$VideoCueParagraphFromJson(json);
}
