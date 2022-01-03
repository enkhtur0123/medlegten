// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_unit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CourseUnit _$$_CourseUnitFromJson(Map<String, dynamic> json) =>
    _$_CourseUnit(
      json['unitId'] as String,
      json['courseId'] as String,
      json['unitNumber'] as String,
      json['unitName'] as String,
      json['hasTrial'] as String,
      json['isActive'] as String,
      json['minToWatch'] as String,
    );

Map<String, dynamic> _$$_CourseUnitToJson(_$_CourseUnit instance) =>
    <String, dynamic>{
      'unitId': instance.unitId,
      'courseId': instance.courseId,
      'unitNumber': instance.unitNumber,
      'unitName': instance.unitName,
      'hasTrial': instance.hasTrial,
      'isActive': instance.isActive,
      'minToWatch': instance.minToWatch,
    };
