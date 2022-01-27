import 'package:freezed_annotation/freezed_annotation.dart';

part 'sentence_structure.freezed.dart';
part 'sentence_structure.g.dart';

@freezed
class SentenceStructure with _$SentenceStructure {
  factory SentenceStructure(String part, String word, String nameEng,
      String nameMon, String nameShort) = _SentenceStructure;

  factory SentenceStructure.fromJson(Map<String, dynamic> json) =>
      _$SentenceStructureFromJson(json);

}
