// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unit_listening_cue.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ListeningCue _$$_ListeningCueFromJson(Map<String, dynamic> json) =>
    _$_ListeningCue(
      json['cueId'] as String,
      json['hostUrl'] as String,
      json['hostSource'] as String,
      json['ordering'] as String,
      json['title'] as String,
      (json['questions'] as List<dynamic>)
          .map((e) => QuizQuestion.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ListeningCueToJson(_$_ListeningCue instance) =>
    <String, dynamic>{
      'cueId': instance.cueId,
      'hostUrl': instance.hostUrl,
      'hostSource': instance.hostSource,
      'ordering': instance.ordering,
      'title': instance.title,
      'questions': instance.questions,
    };
