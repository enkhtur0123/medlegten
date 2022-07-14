import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medlegten/models/Landing/article_cue.dart';
import 'package:medlegten/models/Landing/slide_images.dart';

part 'article_info.freezed.dart';
part 'article_info.g.dart';

@freezed
class ArticleInfo with _$ArticleInfo {
  factory ArticleInfo(
      String articleId,
      String articleTitle,
      String createdDate,
      String categoryName,
      String categoryIcon,
      String viewCount,
      String likeCount,
      bool isLiked,
      List<SlideImage> slideImages,
      List<ArticleCueParagraph> cues) = _ArticleInfo;

  factory ArticleInfo.fromJson(Map<String, dynamic> json) =>
      _$ArticleInfoFromJson(json);
}
