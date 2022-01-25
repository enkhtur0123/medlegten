// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sentence.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Sentence _$$_SentenceFromJson(Map<String, dynamic> json) => _$_Sentence(
      json['group'] as String,
      json['label'] as String,
      json['eng'] as String,
      json['mon'] as String,
      SentenceStructure.fromJson(json['structure'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_SentenceToJson(_$_Sentence instance) =>
    <String, dynamic>{
      'group': instance.group,
      'label': instance.label,
      'eng': instance.eng,
      'mon': instance.mon,
      'structure': instance.structure,
    };
