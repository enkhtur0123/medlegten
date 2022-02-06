import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medlegten/models/Unit/unit_vocabulary_word.dart';

part 'unit_vocabulary.freezed.dart';
part 'unit_vocabulary.g.dart';

@freezed
class UnitVocabulary with _$UnitVocabulary {
  factory UnitVocabulary(int wordCount, List<UnitVocabularyWord> words) =
      _UnitVocabulary;

  factory UnitVocabulary.fromJson(Map<String, dynamic> json) =>
      _$UnitVocabularyFromJson(json);
}
