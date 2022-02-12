// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unit_writing_video.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnitWritingVideo _$$_UnitWritingVideoFromJson(Map<String, dynamic> json) =>
    _$_UnitWritingVideo(
      json['videoId'] as String,
      json['hostUrl'] as String,
      json['hostType'] as String,
      json['ordering'] as String,
      (json['cue'] as List<dynamic>)
          .map((e) =>
              UnitWritingCueParagraph.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_UnitWritingVideoToJson(_$_UnitWritingVideo instance) =>
    <String, dynamic>{
      'videoId': instance.videoId,
      'hostUrl': instance.hostUrl,
      'hostType': instance.hostType,
      'ordering': instance.ordering,
      'cue': instance.cue,
    };
