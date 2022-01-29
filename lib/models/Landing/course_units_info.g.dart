// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_units_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CourseUnitsInfo _$$_CourseUnitsInfoFromJson(Map<String, dynamic> json) =>
    _$_CourseUnitsInfo(
      json['unitId'] as String,
      json['courseId'] as String,
      json['unitNumber'] as String,
      json['unitName'] as String,
      json['hasTrial'] as String,
      json['isActive'] as String,
      json['minToWatch'] as String,
    );

Map<String, dynamic> _$$_CourseUnitsInfoToJson(_$_CourseUnitsInfo instance) =>
    <String, dynamic>{
      'unitId': instance.unitId,
      'courseId': instance.courseId,
      'unitNumber': instance.unitNumber,
      'unitName': instance.unitName,
      'hasTrial': instance.hasTrial,
      'isActive': instance.isActive,
      'minToWatch': instance.minToWatch,
    };
