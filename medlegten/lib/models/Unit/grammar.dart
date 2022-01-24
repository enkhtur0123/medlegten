import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medlegten/models/Unit/sentence_structure.dart';

part 'grammar.freezed.dart';
part 'grammar.g.dart';

@freezed
class Grammar with _$Grammar {
  factory Grammar(String label, SentenceStructure structure) = _Grammar;

  factory Grammar.fromJson(Map<String, dynamic> json) =>
      _$GrammarFromJson(json);
}
