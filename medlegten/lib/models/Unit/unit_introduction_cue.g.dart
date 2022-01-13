// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unit_introduction_cue.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnitIntroCueParagraph _$$_UnitIntroCueParagraphFromJson(
        Map<String, dynamic> json) =>
    _$_UnitIntroCueParagraph(
      json['cueId'] as String,
      json['ordering'] as String,
      json['startTime'] as String,
      json['endTime'] as String,
      json['fromLangId'] as String,
      json['fromLangTranslation'] as String,
      json['fromLangIsDefault'] as String,
      json['toLangId'] as String,
      json['toLangTranslation'] as String,
      json['toLangIsDefault'] as String,
      (json['words'] as List<dynamic>)
          .map((e) => UnitIntroCueWord.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_UnitIntroCueParagraphToJson(
        _$_UnitIntroCueParagraph instance) =>
    <String, dynamic>{
      'cueId': instance.cueId,
      'ordering': instance.ordering,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'fromLangId': instance.fromLangId,
      'fromLangTranslation': instance.fromLangTranslation,
      'fromLangIsDefault': instance.fromLangIsDefault,
      'toLangId': instance.toLangId,
      'toLangTranslation': instance.toLangTranslation,
      'toLangIsDefault': instance.toLangIsDefault,
      'words': instance.words,
    };
