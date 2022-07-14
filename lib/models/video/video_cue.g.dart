// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_cue.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_VideoCueParagraph _$$_VideoCueParagraphFromJson(Map<String, dynamic> json) =>
    _$_VideoCueParagraph(
      json['cueId'] as String,
      json['ordering'] as String,
      json['startTime'] as String,
      json['endTime'] as String,
      json['fromLangId'] as String,
      json['fromLangTranslation'] as String,
      json['toLangId'] as String,
      json['toLangTranslation'] as String,
      (json['words'] as List<dynamic>)
          .map((e) => VideoCueWord.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_VideoCueParagraphToJson(
        _$_VideoCueParagraph instance) =>
    <String, dynamic>{
      'cueId': instance.cueId,
      'ordering': instance.ordering,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'fromLangId': instance.fromLangId,
      'fromLangTranslation': instance.fromLangTranslation,
      'toLangId': instance.toLangId,
      'toLangTranslation': instance.toLangTranslation,
      'words': instance.words,
    };
