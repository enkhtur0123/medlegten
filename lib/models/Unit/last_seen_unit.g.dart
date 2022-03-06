// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'last_seen_unit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LastSeenUnit _$$_LastSeenUnitFromJson(Map<String, dynamic> json) =>
    _$_LastSeenUnit(
      json['unitId'] as String,
      json['unitName'] as String,
      json['unitNumber'] as String,
      json['moduleId'] as String,
      json['moduleTypeId'] as String,
      json['moduleTypeName'] as String,
      json['completedCount'] as int,
      json['unCompletedCount'] as int,
    );

Map<String, dynamic> _$$_LastSeenUnitToJson(_$_LastSeenUnit instance) =>
    <String, dynamic>{
      'unitId': instance.unitId,
      'unitName': instance.unitName,
      'unitNumber': instance.unitNumber,
      'moduleId': instance.moduleId,
      'moduleTypeId': instance.moduleTypeId,
      'moduleTypeName': instance.moduleTypeName,
      'completedCount': instance.completedCount,
      'unCompletedCount': instance.unCompletedCount,
    };
