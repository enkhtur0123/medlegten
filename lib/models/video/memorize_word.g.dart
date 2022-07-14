// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'memorize_word.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_VideoMemorizeWord _$$_VideoMemorizeWordFromJson(Map<String, dynamic> json) =>
    _$_VideoMemorizeWord(
      json['wordId'] as String?,
      json['word'] as String?,
      json['cueId'] as String?,
      json['ordering'] as String?,
      json['startTime'] as String?,
      json['endTime'] as String?,
      json['fromLangTranslation'] as String?,
      json['toLangTranslation'] as String?,
      (json['words'] as List<dynamic>?)
          ?.map((e) => VideoCueWord.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_VideoMemorizeWordToJson(
        _$_VideoMemorizeWord instance) =>
    <String, dynamic>{
      'wordId': instance.wordId,
      'word': instance.word,
      'cueId': instance.cueId,
      'ordering': instance.ordering,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'fromLangTranslation': instance.fromLangTranslation,
      'toLangTranslation': instance.toLangTranslation,
      'words': instance.words,
    };
