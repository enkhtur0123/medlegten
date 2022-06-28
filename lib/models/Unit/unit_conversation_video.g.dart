// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unit_conversation_video.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnitConversationVideo _$$_UnitConversationVideoFromJson(
        Map<String, dynamic> json) =>
    _$_UnitConversationVideo(
      json['name'] as String,
      json['url'] as String,
      json['hostSource'] as String,
      (json['cue'] as List<dynamic>)
          .map((e) => UnitIntroCueParagraph.fromJson(e as Map<String, dynamic>))
          .toList(),
      isCompleted: json['isCompleted'] as bool?,
    );

Map<String, dynamic> _$$_UnitConversationVideoToJson(
        _$_UnitConversationVideo instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
      'hostSource': instance.hostSource,
      'cue': instance.cue,
      'isCompleted': instance.isCompleted,
    };
