// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sonsgol.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Sonsgol _$$_SonsgolFromJson(Map<String, dynamic> json) => _$_Sonsgol(
      json['cueId'] as String?,
      json['startTime'] as String?,
      json['endTime'] as String?,
      json['fromLangTranslation'] as String?,
      json['toLangTranslation'] as String?,
      (json['words'] as List<dynamic>)
          .map((e) => SonsgolWord.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_SonsgolToJson(_$_Sonsgol instance) =>
    <String, dynamic>{
      'cueId': instance.cueId,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'fromLangTranslation': instance.fromLangTranslation,
      'toLangTranslation': instance.toLangTranslation,
      'words': instance.words,
    };
