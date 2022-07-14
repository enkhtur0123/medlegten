// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ArticleItem _$$_ArticleItemFromJson(Map<String, dynamic> json) =>
    _$_ArticleItem(
      json['articleId'] as String,
      json['articleTitle'] as String,
      json['createdDate'] as String,
      json['slideImageUrl'] as String,
      json['categoryName'] as String,
      json['categoryIcon'] as String,
      json['viewCount'] as String,
      json['likeCount'] as String,
      json['ordering'] as String,
    );

Map<String, dynamic> _$$_ArticleItemToJson(_$_ArticleItem instance) =>
    <String, dynamic>{
      'articleId': instance.articleId,
      'articleTitle': instance.articleTitle,
      'createdDate': instance.createdDate,
      'slideImageUrl': instance.slideImageUrl,
      'categoryName': instance.categoryName,
      'categoryIcon': instance.categoryIcon,
      'viewCount': instance.viewCount,
      'likeCount': instance.likeCount,
      'ordering': instance.ordering,
    };
