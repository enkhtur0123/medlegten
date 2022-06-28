// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_QuizHistory _$$_QuizHistoryFromJson(Map<String, dynamic> json) =>
    _$_QuizHistory(
      json['quizId'] as String,
      json['quizName'] as String,
      json['correctCount'] as String,
      json['incorrectCount'] as String,
      json['createdAt'] as String,
    );

Map<String, dynamic> _$$_QuizHistoryToJson(_$_QuizHistory instance) =>
    <String, dynamic>{
      'quizId': instance.quizId,
      'quizName': instance.quizName,
      'correctCount': instance.correctCount,
      'incorrectCount': instance.incorrectCount,
      'createdAt': instance.createdAt,
    };
