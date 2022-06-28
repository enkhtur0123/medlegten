// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reading.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Reading _$$_ReadingFromJson(Map<String, dynamic> json) => _$_Reading(
      json['name'] as String,
      json['title'] as String,
      json['imgUrl'] as String,
      (json['cue'] as List<dynamic>)
          .map((e) => ReadingCueParagraph.fromJson(e as Map<String, dynamic>))
          .toList(),
      isCompleted: json['isCompleted'] as bool?,
    );

Map<String, dynamic> _$$_ReadingToJson(_$_Reading instance) =>
    <String, dynamic>{
      'name': instance.name,
      'title': instance.title,
      'imgUrl': instance.imgUrl,
      'cue': instance.cue,
      'isCompleted': instance.isCompleted,
    };
