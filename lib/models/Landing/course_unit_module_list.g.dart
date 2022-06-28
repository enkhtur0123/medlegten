// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_unit_module_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CourseUnitModuleList _$$_CourseUnitModuleListFromJson(
        Map<String, dynamic> json) =>
    _$_CourseUnitModuleList(
      json['id'] as String,
      json['unitId'] as String,
      json['moduleId'] as String,
      json['moduleTypeId'] as String,
      json['moduleTypeName'] as String,
      json['mandatory'] as String,
      json['isCompleted'] as bool,
      json['isUpcoming'] as bool,
    );

Map<String, dynamic> _$$_CourseUnitModuleListToJson(
        _$_CourseUnitModuleList instance) =>
    <String, dynamic>{
      'id': instance.id,
      'unitId': instance.unitId,
      'moduleId': instance.moduleId,
      'moduleTypeId': instance.moduleTypeId,
      'moduleTypeName': instance.moduleTypeName,
      'mandatory': instance.mandatory,
      'isCompleted': instance.isCompleted,
      'isUpcoming': instance.isUpcoming,
    };
