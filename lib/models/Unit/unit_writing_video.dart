import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medlegten/models/Unit/unit_writing_cue.dart';

part 'unit_writing_video.freezed.dart';
part 'unit_writing_video.g.dart';

@freezed
class UnitWritingVideo with _$UnitWritingVideo {
  factory UnitWritingVideo(String videoId, String hostUrl, String hostType,
      String ordering, List<UnitWritingCueParagraph> cue) = _UnitWritingVideo;

  factory UnitWritingVideo.fromJson(Map<String, dynamic> json) =>
      _$UnitWritingVideoFromJson(json);
}
