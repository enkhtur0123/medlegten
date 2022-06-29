// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_answer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_QuizAnswer _$$_QuizAnswerFromJson(Map<String, dynamic> json) => _$_QuizAnswer(
      json['answerId'] as String?,
      json['answer'] as String?,
      json['isTrue'] as String?,
      json['ordering'] as String?,
      json['isCorrect'] as bool?,
    );

Map<String, dynamic> _$$_QuizAnswerToJson(_$_QuizAnswer instance) => <String, dynamic>{
      'answerId': instance.answerId,
      'answer': instance.answer,
      'isTrue': instance.isTrue,
      'ordering': instance.ordering,
      'isCorrect': instance.isCorrect,
    };
