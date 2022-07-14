// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'level_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LevelEvent _$$_LevelEventFromJson(Map<String, dynamic> json) =>
    _$_LevelEvent(
      json['levelId'] as String?,
      json['levelName'] as String?,
      (json['events'] as List<dynamic>)
          .map((e) => Event.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_LevelEventToJson(_$_LevelEvent instance) =>
    <String, dynamic>{
      'levelId': instance.levelId,
      'levelName': instance.levelName,
      'events': instance.events,
    };
