// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_QuizQuestion _$$_QuizQuestionFromJson(Map<String, dynamic> json) =>
    _$_QuizQuestion(
      json['questionId'] as String,
      json['question'] as String,
      json['ordering'] as String,
      (json['answers'] as List<dynamic>)
          .map((e) => QuizAnswer.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_QuizQuestionToJson(_$_QuizQuestion instance) =>
    <String, dynamic>{
      'questionId': instance.questionId,
      'question': instance.question,
      'ordering': instance.ordering,
      'answers': instance.answers,
    };
