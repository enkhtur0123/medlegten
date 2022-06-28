// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unit_test_question_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnitTestQuestionModel _$$_UnitTestQuestionModelFromJson(
        Map<String, dynamic> json) =>
    _$_UnitTestQuestionModel(
      json['questionId'] as String,
      json['question'] as String,
      json['ordering'] as String,
      json['type'] as String,
      json['typeText'] as String,
      json['segmentId'] as String,
      json['segmentName'] as String,
      (json['answers'] as List<dynamic>)
          .map((e) => QuizAnswer.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_UnitTestQuestionModelToJson(
        _$_UnitTestQuestionModel instance) =>
    <String, dynamic>{
      'questionId': instance.questionId,
      'question': instance.question,
      'ordering': instance.ordering,
      'type': instance.type,
      'typeText': instance.typeText,
      'segmentId': instance.segmentId,
      'segmentName': instance.segmentName,
      'answers': instance.answers,
    };
