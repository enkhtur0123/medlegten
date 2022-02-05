// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unit_vocabulary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnitVocabulary _$$_UnitVocabularyFromJson(Map<String, dynamic> json) =>
    _$_UnitVocabulary(
      json['wordCount'] as int,
      (json['words'] as List<dynamic>)
          .map((e) => UnitVocabularyWord.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_UnitVocabularyToJson(_$_UnitVocabulary instance) =>
    <String, dynamic>{
      'wordCount': instance.wordCount,
      'words': instance.words,
    };
