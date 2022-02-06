// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unit_vocabulary_word.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnitVocabularyWord _$$_UnitVocabularyWordFromJson(
        Map<String, dynamic> json) =>
    _$_UnitVocabularyWord(
      json['wordId'] as String,
      json['word'] as String,
      json['bookMarked'] as bool,
      json['isKnow'] as bool,
      WordType.fromJson(json['wordType'] as Map<String, dynamic>),
      (json['translation'] as List<dynamic>)
          .map((e) => Translation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_UnitVocabularyWordToJson(
        _$_UnitVocabularyWord instance) =>
    <String, dynamic>{
      'wordId': instance.wordId,
      'word': instance.word,
      'bookMarked': instance.bookMarked,
      'isKnow': instance.isKnow,
      'wordType': instance.wordType,
      'translation': instance.translation,
    };
