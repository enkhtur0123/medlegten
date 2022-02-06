// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unit_mixed_video.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnitMixedVideo _$$_UnitMixedVideoFromJson(Map<String, dynamic> json) =>
    _$_UnitMixedVideo(
      json['name'] as String,
      json['url'] as String,
      json['hostSource'] as String,
      (json['cue'] as List<dynamic>)
          .map((e) => UnitMixedCueParagraph.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_UnitMixedVideoToJson(_$_UnitMixedVideo instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
      'hostSource': instance.hostSource,
      'cue': instance.cue,
    };
