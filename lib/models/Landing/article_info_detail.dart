import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medlegten/models/Landing/article_cue.dart';
import 'package:medlegten/models/Landing/slide_images.dart';

part 'article_info_detail.freezed.dart';
part 'article_info_detail.g.dart';

@freezed
class ArticleInfoDetail with _$ArticleInfoDetail {
  factory ArticleInfoDetail(
      String articleId,
      String? articleTitle,
      String? createdDate,
      String? categoryName,
      String? categoryIcon,
      String? viewCount,
      String? likeCount,
      bool isLiked,
      List<SlideImage> slideImages,
      List<ArticleCueParagraph> cues) = _ArticleInfoDetail;

  factory ArticleInfoDetail.fromJson(Map<String, dynamic> json) =>
      _$ArticleInfoDetailFromJson(json);
}
