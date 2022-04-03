// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_vocabulary_word.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_VideoVocabularyWord _$$_VideoVocabularyWordFromJson(
        Map<String, dynamic> json) =>
    _$_VideoVocabularyWord(
      json['wordId'] as String,
      json['word'] as String,
      json['bookMarked'] as bool,
      json['isKnow'] as bool,
      RootWordInfo.fromJson(json['rootWordInfo'] as Map<String, dynamic>),
      WordType.fromJson(json['wordType'] as Map<String, dynamic>),
      (json['translation'] as List<dynamic>)
          .map((e) => Translation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_VideoVocabularyWordToJson(
        _$_VideoVocabularyWord instance) =>
    <String, dynamic>{
      'wordId': instance.wordId,
      'word': instance.word,
      'bookMarked': instance.bookMarked,
      'isKnow': instance.isKnow,
      'rootWordInfo': instance.rootWordInfo,
      'wordType': instance.wordType,
      'translation': instance.translation,
    };
