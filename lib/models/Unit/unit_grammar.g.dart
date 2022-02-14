// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unit_grammar.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnitGrammar _$$_UnitGrammarFromJson(Map<String, dynamic> json) =>
    _$_UnitGrammar(
      (json['grammar'] as List<dynamic>)
          .map((e) => Grammar.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['sentences'] as List<dynamic>)
          .map((e) => Sentence.fromJson(e as Map<String, dynamic>))
          .toList(),
      isCompleted: json['isCompleted'] as bool?,
    );

Map<String, dynamic> _$$_UnitGrammarToJson(_$_UnitGrammar instance) =>
    <String, dynamic>{
      'grammar': instance.grammar,
      'sentences': instance.sentences,
      'isCompleted': instance.isCompleted,
    };
