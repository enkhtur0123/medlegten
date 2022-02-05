import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medlegten/models/Unit/translation.dart';
import 'package:medlegten/models/Unit/word_type.dart';

part 'unit_vocabulary_word.freezed.dart';
part 'unit_vocabulary_word.g.dart';

@freezed
class UnitVocabularyWord with _$UnitVocabularyWord {
  factory UnitVocabularyWord(
      String wordId,
      String word,
      bool bookMarked,
      bool isKnow,
      WordType wordType,
      List<Translation> translation) = _UnitVocabularyWord;

  factory UnitVocabularyWord.fromJson(Map<String, dynamic> json) =>
      _$UnitVocabularyWordFromJson(json);
}
