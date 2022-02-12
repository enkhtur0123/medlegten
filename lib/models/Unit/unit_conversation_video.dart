import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medlegten/models/Unit/unit_introduction_cue.dart';

part 'unit_conversation_video.freezed.dart';
part 'unit_conversation_video.g.dart';

@freezed
class UnitConversationVideo with _$UnitConversationVideo {
  factory UnitConversationVideo(String name, String url, String hostSource,
      List<UnitIntroCueParagraph> cue) = _UnitConversationVideo;

  factory UnitConversationVideo.fromJson(Map<String, dynamic> json) =>
      _$UnitConversationVideoFromJson(json);
}
