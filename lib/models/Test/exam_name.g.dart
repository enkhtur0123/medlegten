// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exam_name.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ExamName _$$_ExamNameFromJson(Map<String, dynamic> json) => _$_ExamName(
      json['examName'] as String,
      (json['examResult'] as List<dynamic>)
          .map((e) => ExamResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ExamNameToJson(_$_ExamName instance) =>
    <String, dynamic>{
      'examName': instance.examName,
      'examResult': instance.examResult,
    };
