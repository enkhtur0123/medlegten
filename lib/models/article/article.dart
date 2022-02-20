import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medlegten/models/article/article_item.dart';

part 'article.freezed.dart';
part 'article.g.dart';

@freezed
class Article with _$Article {
  factory Article(
   String typeId,
    String typeName,
    List<ArticleItem> articles) = _Article;

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);
}
