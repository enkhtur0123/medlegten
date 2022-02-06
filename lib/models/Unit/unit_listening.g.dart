// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unit_listening.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnitListening _$$_UnitListeningFromJson(Map<String, dynamic> json) =>
    _$_UnitListening(
      json['name'] as String,
      (json['cue'] as List<dynamic>)
          .map((e) => ListeningCue.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_UnitListeningToJson(_$_UnitListening instance) =>
    <String, dynamic>{
      'name': instance.name,
      'cue': instance.cue,
    };
