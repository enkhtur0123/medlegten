// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unit_writing.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnitWriting _$$_UnitWritingFromJson(Map<String, dynamic> json) =>
    _$_UnitWriting(
      json['name'] as String,
      (json['videos'] as List<dynamic>)
          .map((e) => UnitWritingVideo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_UnitWritingToJson(_$_UnitWriting instance) =>
    <String, dynamic>{
      'name': instance.name,
      'videos': instance.videos,
    };
