// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reading_cue.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReadingCueParagraph _$$_ReadingCueParagraphFromJson(
        Map<String, dynamic> json) =>
    _$_ReadingCueParagraph(
      json['cueId'] as String,
      json['ordering'] as String,
      json['fromLangId'] as String,
      json['fromLangTranslation'] as String,
      json['fromLangIsDefault'] as String,
      json['toLangId'] as String,
      json['toLangTranslation'] as String,
      json['toLangIsDefault'] as String,
      json['grammarIsHighLighted'] as String,
      json['grammarDescription'] as String,
      (json['words'] as List<dynamic>)
          .map((e) => UnitIntroCueWord.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ReadingCueParagraphToJson(
        _$_ReadingCueParagraph instance) =>
    <String, dynamic>{
      'cueId': instance.cueId,
      'ordering': instance.ordering,
      'fromLangId': instance.fromLangId,
      'fromLangTranslation': instance.fromLangTranslation,
      'fromLangIsDefault': instance.fromLangIsDefault,
      'toLangId': instance.toLangId,
      'toLangTranslation': instance.toLangTranslation,
      'toLangIsDefault': instance.toLangIsDefault,
      'grammarIsHighLighted': instance.grammarIsHighLighted,
      'grammarDescription': instance.grammarDescription,
      'words': instance.words,
    };
