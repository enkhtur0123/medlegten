import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medlegten/models/Unit/translation.dart';
import 'package:medlegten/models/Unit/word_type.dart';

part 'video_vocabulary_word.freezed.dart';
part 'video_vocabulary_word.g.dart';

@freezed
class VideoVocabularyWord with _$VideoVocabularyWord {
  factory VideoVocabularyWord(
      String wordId,
      String word,
      bool bookMarked,
      bool isKnow,
      WordType wordType,
      List<Translation> translation) = _VideoVocabularyWord;

  factory VideoVocabularyWord.fromJson(Map<String, dynamic> json) =>
      _$VideoVocabularyWordFromJson(json);
}
