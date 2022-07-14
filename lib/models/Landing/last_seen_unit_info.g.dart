// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'last_seen_unit_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LastSeenUnitInfo _$$_LastSeenUnitInfoFromJson(Map<String, dynamic> json) =>
    _$_LastSeenUnitInfo(
      json['moduleInfo'] == null
          ? null
          : CourseUnitModuleList.fromJson(
              json['moduleInfo'] as Map<String, dynamic>),
      json['unitInfo'] == null
          ? null
          : CourseUnit.fromJson(json['unitInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_LastSeenUnitInfoToJson(_$_LastSeenUnitInfo instance) =>
    <String, dynamic>{
      'moduleInfo': instance.moduleInfo,
      'unitInfo': instance.unitInfo,
    };
