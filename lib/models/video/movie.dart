import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie.freezed.dart';
part 'movie.g.dart';

@freezed
class Movie with _$Movie {
  factory Movie(
      String contentId,
      String contentName,
      String categoryId,
      String categoryName,
      String evelId,
      String levelName,
      String vocabularyCount,
      String imgUrl,
      String intro,
      String isSerial,
      String hostUrl,
      String hostType,
      String runTime,
      String movieId,
      bool isPurchased,
      String segmentId,
      String segmentName) = _Movie;

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
}
