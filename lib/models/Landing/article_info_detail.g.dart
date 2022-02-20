// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_info_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ArticleInfoDetail _$$_ArticleInfoDetailFromJson(Map<String, dynamic> json) =>
    _$_ArticleInfoDetail(
      json['articleId'] as String,
      json['articleTitle'] as String?,
      json['createdDate'] as String?,
      json['categoryName'] as String?,
      json['categoryIcon'] as String?,
      json['viewCount'] as String?,
      json['likeCount'] as String?,
      json['isLiked'] as bool,
      (json['slideImages'] as List<dynamic>)
          .map((e) => SlideImage.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['cues'] as List<dynamic>)
          .map((e) => ArticleCueParagraph.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ArticleInfoDetailToJson(
        _$_ArticleInfoDetail instance) =>
    <String, dynamic>{
      'articleId': instance.articleId,
      'articleTitle': instance.articleTitle,
      'createdDate': instance.createdDate,
      'categoryName': instance.categoryName,
      'categoryIcon': instance.categoryIcon,
      'viewCount': instance.viewCount,
      'likeCount': instance.likeCount,
      'isLiked': instance.isLiked,
      'slideImages': instance.slideImages,
      'cues': instance.cues,
    };
