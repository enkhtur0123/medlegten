import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medlegten/models/Unit/unit_mixed_cue.dart';

part 'unit_mixed_video.freezed.dart';
part 'unit_mixed_video.g.dart';

@freezed
class UnitMixedVideo with _$UnitMixedVideo {
  factory UnitMixedVideo(String name, String url, String hostSource,
      List<UnitMixedCueParagraph> cue) = _UnitMixedVideo;

  factory UnitMixedVideo.fromJson(Map<String, dynamic> json) =>
      _$UnitMixedVideoFromJson(json);
}
