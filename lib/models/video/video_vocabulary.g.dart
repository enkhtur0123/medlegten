// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_vocabulary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_VideoVocabulary _$$_VideoVocabularyFromJson(Map<String, dynamic> json) =>
    _$_VideoVocabulary(
      json['wordCount'] as int,
      (json['words'] as List<dynamic>)
          .map((e) => VideoVocabularyWord.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_VideoVocabularyToJson(_$_VideoVocabulary instance) =>
    <String, dynamic>{
      'wordCount': instance.wordCount,
      'words': instance.words,
    };
