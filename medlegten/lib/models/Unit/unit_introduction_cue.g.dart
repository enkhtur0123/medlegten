// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unit_introduction_cue.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnitIntroCueParagraph _$$_UnitIntroCueParagraphFromJson(
        Map<String, dynamic> json) =>
    _$_UnitIntroCueParagraph(
      json['cueId'] as String,
      json['startTime'] as String,
      json['endTime'] as String,
      json['fromLangId'] as String,
      json['fromText'] as String,
      json['fromLangIsDefault'] as String,
      json['toLangId'] as String,
      json['toText'] as String,
      (json['words'] as List<dynamic>)
          .map((e) => UnitIntroCueWord.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_UnitIntroCueParagraphToJson(
        _$_UnitIntroCueParagraph instance) =>
    <String, dynamic>{
      'cueId': instance.cueId,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'fromLangId': instance.fromLangId,
      'fromText': instance.fromText,
      'fromLangIsDefault': instance.fromLangIsDefault,
      'toLangId': instance.toLangId,
      'toText': instance.toText,
      'words': instance.words,
    };
