// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exam_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ExamResult _$$_ExamResultFromJson(Map<String, dynamic> json) =>
    _$_ExamResult(
      json['segmentName'] as String,
      json['totalPercent'] as String,
      (json['questions'] as List<dynamic>)
          .map((e) => ExamResultQuestion.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ExamResultToJson(_$_ExamResult instance) =>
    <String, dynamic>{
      'segmentName': instance.segmentName,
      'totalPercent': instance.totalPercent,
      'questions': instance.questions,
    };
