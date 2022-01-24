// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grammar.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Grammar _$$_GrammarFromJson(Map<String, dynamic> json) => _$_Grammar(
      json['label'] as String,
      SentenceStructure.fromJson(json['structure'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_GrammarToJson(_$_Grammar instance) =>
    <String, dynamic>{
      'label': instance.label,
      'structure': instance.structure,
    };
