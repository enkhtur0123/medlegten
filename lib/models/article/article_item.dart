import 'package:freezed_annotation/freezed_annotation.dart';

part 'article_item.freezed.dart';
part 'article_item.g.dart';

@freezed
class ArticleItem with _$ArticleItem {
  factory ArticleItem(
      String articleId,
      String articleTitle,
      String createdDate,
      String slideImageUrl,
      String categoryName,
      String categoryIcon,
      String viewCount,
      String likeCount,
      String ordering) = _ArticleItem;

  factory ArticleItem.fromJson(Map<String, dynamic> json) =>
      _$ArticleItemFromJson(json);
}
