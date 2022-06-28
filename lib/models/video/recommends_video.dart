import 'package:freezed_annotation/freezed_annotation.dart';

part 'recommends_video.freezed.dart';
part 'recommends_video.g.dart';

@freezed
class RecommendVideo with _$RecommendVideo {
  factory RecommendVideo(
    String? contentId,
      String? contentName,
      String? categoryName,
      String? levelId,
      String? vocabularyCount,
      String? imgUrl,
      String? intro,
      String? isSerial,
      String? runTime) =
      _RecommendVideo;

  factory RecommendVideo.fromJson(Map<String, dynamic> json) =>
      _$RecommendVideoFromJson(json);
}
