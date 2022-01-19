// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cue_word.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CueWord _$$_CueWordFromJson(Map<String, dynamic> json) => _$_CueWord(
      json['isSuccess'] as bool,
      json['errorCode'] as String,
      json['resultMessage'] as String,
      json['wordId'] as String,
      json['word'] as String,
      json['tts'] as String,
      RootWordInfo.fromJson(json['rootWordInfo'] as Map<String, dynamic>),
      WordType.fromJson(json['wordType'] as Map<String, dynamic>),
      (json['translation'] as List<dynamic>)
          .map((e) => Translation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_CueWordToJson(_$_CueWord instance) =>
    <String, dynamic>{
      'isSuccess': instance.isSuccess,
      'errorCode': instance.errorCode,
      'resultMessage': instance.resultMessage,
      'wordId': instance.wordId,
      'word': instance.word,
      'tts': instance.tts,
      'rootWordInfo': instance.rootWordInfo,
      'wordType': instance.wordType,
      'translation': instance.translation,
    };
