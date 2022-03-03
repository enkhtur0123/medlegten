// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recommends_video.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RecommendVideo _$$_RecommendVideoFromJson(Map<String, dynamic> json) =>
    _$_RecommendVideo(
      json['contentId'] as String?,
      json['contentName'] as String?,
      json['categoryName'] as String?,
      json['levelId'] as String?,
      json['vocabularyCount'] as String?,
      json['imgUrl'] as String?,
      json['intro'] as String?,
      json['isSerial'] as String?,
      json['runTime'] as String?,
    );

Map<String, dynamic> _$$_RecommendVideoToJson(_$_RecommendVideo instance) =>
    <String, dynamic>{
      'contentId': instance.contentId,
      'contentName': instance.contentName,
      'categoryName': instance.categoryName,
      'levelId': instance.levelId,
      'vocabularyCount': instance.vocabularyCount,
      'imgUrl': instance.imgUrl,
      'intro': instance.intro,
      'isSerial': instance.isSerial,
      'runTime': instance.runTime,
    };
