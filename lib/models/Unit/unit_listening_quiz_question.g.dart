// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unit_listening_quiz_question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ListeningQuiz _$$_ListeningQuizFromJson(Map<String, dynamic> json) =>
    _$_ListeningQuiz(
      json['isSuccess'] as bool,
      json['errorCode'] as String,
      json['resultMessage'] as String,
      json['moduleTypeId'] as String,
      json['isCompleted'] as bool,
      UnitListening.fromJson(json['listening'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ListeningQuizToJson(_$_ListeningQuiz instance) =>
    <String, dynamic>{
      'isSuccess': instance.isSuccess,
      'errorCode': instance.errorCode,
      'resultMessage': instance.resultMessage,
      'moduleTypeId': instance.moduleTypeId,
      'isCompleted': instance.isCompleted,
      'listening': instance.listening,
    };
