// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unit_grammar.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnitGrammar _$$_UnitGrammarFromJson(Map<String, dynamic> json) =>
    _$_UnitGrammar(
      json['label'] as String,
      json['tosentence'] as String,
      json['fromsentence'] as String,
      (json['grammar'] as List<dynamic>)
          .map((e) => Grammar.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['sentences'] as List<dynamic>)
          .map((e) => Sentence.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_UnitGrammarToJson(_$_UnitGrammar instance) =>
    <String, dynamic>{
      'label': instance.label,
      'tosentence': instance.tosentence,
      'fromsentence': instance.fromsentence,
      'grammar': instance.grammar,
      'sentences': instance.sentences,
    };
