// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'self_quiz.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SelfQuiz _$$_SelfQuizFromJson(Map<String, dynamic> json) => _$_SelfQuiz(
      json['quizId'] as String,
      (json['questions'] as List<dynamic>)
          .map((e) => QuizQuestion.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_SelfQuizToJson(_$_SelfQuiz instance) =>
    <String, dynamic>{
      'quizId': instance.quizId,
      'questions': instance.questions,
    };
