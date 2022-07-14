import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medlegten/models/Unit/unit_introduction_cue.dart';

part 'unit_introduction_video.freezed.dart';
part 'unit_introduction_video.g.dart';

@freezed
class UnitIntroVideo with _$UnitIntroVideo {
  factory UnitIntroVideo(String name, String url, String hostSource,
      String needGuide, List<UnitIntroCueParagraph> cue,
      {bool? isCompleted}) = _UnitIntroVideo;

  factory UnitIntroVideo.fromJson(Map<String, dynamic> json) =>
      _$UnitIntroVideoFromJson(json);
}
