// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_cue.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ArticleCueParagraph _$$_ArticleCueParagraphFromJson(
        Map<String, dynamic> json) =>
    _$_ArticleCueParagraph(
      json['cueId'] as String,
      json['ordering'] as String,
      json['fromLangId'] as String,
      json['fromLangTranslation'] as String,
      json['fromLangIsDefault'] as String,
      json['toLangId'] as String,
      json['toLangTranslation'] as String,
      (json['words'] as List<dynamic>)
          .map((e) => UnitIntroCueWord.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ArticleCueParagraphToJson(
        _$_ArticleCueParagraph instance) =>
    <String, dynamic>{
      'cueId': instance.cueId,
      'ordering': instance.ordering,
      'fromLangId': instance.fromLangId,
      'fromLangTranslation': instance.fromLangTranslation,
      'fromLangIsDefault': instance.fromLangIsDefault,
      'toLangId': instance.toLangId,
      'toLangTranslation': instance.toLangTranslation,
      'words': instance.words,
    };
