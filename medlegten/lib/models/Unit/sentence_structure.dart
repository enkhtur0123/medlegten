import 'package:freezed_annotation/freezed_annotation.dart';

part 'sentence_structure.freezed.dart';
part 'sentence_structure.g.dart';

@freezed
class SentenceStructure with _$SentenceStructure {
  factory SentenceStructure(
      String? part1,
      String? part2,
      String? part3,
      String? part4,
      String? part5,
      String? part6,
      String? part7,
      String? part8,
      String? part9,
      String? part10,
      String? part11,
      String? part12,
      String? part13,
      String? part14,
      String? part15,
      String? part16,
      String? part17,
      String? part18,
      String? part19,
      String? part20) = _SentenceStructure;

  factory SentenceStructure.fromJson(Map<String, dynamic> json) =>
      _$SentenceStructureFromJson(json);
}
