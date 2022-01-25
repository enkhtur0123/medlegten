import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medlegten/models/Unit/sentence_structure.dart';

part 'sentence.freezed.dart';
part 'sentence.g.dart';

@freezed
class Sentence with _$Sentence {
  factory Sentence(String group, String label, String eng, String mon,
      SentenceStructure structure) = _Sentence;

  factory Sentence.fromJson(Map<String, dynamic> json) =>
      _$SentenceFromJson(json);
}
