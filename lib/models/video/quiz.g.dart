// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_VideoQuiz _$$_VideoQuizFromJson(Map<String, dynamic> json) => _$_VideoQuiz(
      json['quizDuration'] as int?,
      (json['contextQuiz'] as List<dynamic>?)
          ?.map((e) => QuizQuestion.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['vocQuiz'] as List<dynamic>?)
          ?.map((e) => QuizQuestion.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_VideoQuizToJson(_$_VideoQuiz instance) =>
    <String, dynamic>{
      'quizDuration': instance.quizDuration,
      'contextQuiz': instance.contextQuiz,
      'vocQuiz': instance.vocQuiz,
    };
