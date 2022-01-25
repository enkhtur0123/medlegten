import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medlegten/models/Unit/grammar.dart';
import 'package:medlegten/models/Unit/sentence.dart';

part 'unit_grammar.freezed.dart';
part 'unit_grammar.g.dart';

@freezed
class UnitGrammar with _$UnitGrammar {
  factory UnitGrammar(
          String label, List<Grammar> grammar, List<Sentence> sentences) =
      _UnitGrammar;

  factory UnitGrammar.fromJson(Map<String, dynamic> json) =>
      _$UnitGrammarFromJson(json);
}
