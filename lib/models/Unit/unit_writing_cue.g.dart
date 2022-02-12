// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unit_writing_cue.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnitWritingCueParagraph _$$_UnitWritingCueParagraphFromJson(
        Map<String, dynamic> json) =>
    _$_UnitWritingCueParagraph(
      json['cueId'] as String,
      json['ordering'] as String,
      json['fromLangId'] as String,
      json['fromLangTranslation'] as String,
      json['fromLangIsDefault'] as String,
      json['toLangId'] as String,
      json['toLangTranslation'] as String,
      json['toLangIsDefault'] as String,
      json['missWordRequired'] as String,
      json['startTime'] as String,
      json['endTime'] as String,
      (json['missWords'] as List<dynamic>)
          .map((e) => UnitWritingCueWord.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_UnitWritingCueParagraphToJson(
        _$_UnitWritingCueParagraph instance) =>
    <String, dynamic>{
      'cueId': instance.cueId,
      'ordering': instance.ordering,
      'fromLangId': instance.fromLangId,
      'fromLangTranslation': instance.fromLangTranslation,
      'fromLangIsDefault': instance.fromLangIsDefault,
      'toLangId': instance.toLangId,
      'toLangTranslation': instance.toLangTranslation,
      'toLangIsDefault': instance.toLangIsDefault,
      'missWordRequired': instance.missWordRequired,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'missWords': instance.missWords,
    };
