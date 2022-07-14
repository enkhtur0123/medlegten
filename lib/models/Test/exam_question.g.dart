// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exam_question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ExamResultQuestion _$$_ExamResultQuestionFromJson(
        Map<String, dynamic> json) =>
    _$_ExamResultQuestion(
      json['question'] as String,
      (json['answers'] as List<dynamic>)
          .map((e) => ExamResultAnswer.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ExamResultQuestionToJson(
        _$_ExamResultQuestion instance) =>
    <String, dynamic>{
      'question': instance.question,
      'answers': instance.answers,
    };
