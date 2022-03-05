// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unit_introduction_video.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnitIntroVideo _$$_UnitIntroVideoFromJson(Map<String, dynamic> json) =>
    _$_UnitIntroVideo(
      json['name'] as String,
      json['url'] as String,
      json['hostSource'] as String,
      json['needGuide'] as String,
      (json['cue'] as List<dynamic>)
          .map((e) => UnitIntroCueParagraph.fromJson(e as Map<String, dynamic>))
          .toList(),
      isCompleted: json['isCompleted'] as bool?,
    );

Map<String, dynamic> _$$_UnitIntroVideoToJson(_$_UnitIntroVideo instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
      'hostSource': instance.hostSource,
      'needGuide': instance.needGuide,
      'cue': instance.cue,
      'isCompleted': instance.isCompleted,
    };
