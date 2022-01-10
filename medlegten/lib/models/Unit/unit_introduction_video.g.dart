// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unit_introduction_video.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnitIntroVideo _$$_UnitIntroVideoFromJson(Map<String, dynamic> json) =>
    _$_UnitIntroVideo(
      json['id'] as String,
      json['name'] as String,
      json['url'] as String,
      (json['cues'] as List<dynamic>)
          .map((e) => UnitIntroCueParagraph.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_UnitIntroVideoToJson(_$_UnitIntroVideo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'url': instance.url,
      'cues': instance.cues,
    };
