// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exam_answer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ExamResultAnswer _$$_ExamResultAnswerFromJson(Map<String, dynamic> json) =>
    _$_ExamResultAnswer(
      json['answerId'] as String,
      json['answer'] as String,
      json['isTrue'] as bool,
      json['choosenAnswerId'] as String,
      json['isChoosen'] as bool,
      json['ordering'] as String,
    );

Map<String, dynamic> _$$_ExamResultAnswerToJson(_$_ExamResultAnswer instance) =>
    <String, dynamic>{
      'answerId': instance.answerId,
      'answer': instance.answer,
      'isTrue': instance.isTrue,
      'choosenAnswerId': instance.choosenAnswerId,
      'isChoosen': instance.isChoosen,
      'ordering': instance.ordering,
    };
