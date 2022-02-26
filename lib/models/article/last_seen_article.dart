import 'package:freezed_annotation/freezed_annotation.dart';

part 'last_seen_article.freezed.dart';
part 'last_seen_article.g.dart';

@freezed
class LastSeenArticle with _$LastSeenArticle {
  factory LastSeenArticle(
     String articleId,
   String articleTitle,
    String slideImageUrl) = _LastSeenArticle;

  factory LastSeenArticle.fromJson(Map<String, dynamic> json) =>
      _$LastSeenArticleFromJson(json);
}
