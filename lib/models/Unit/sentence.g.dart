// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sentence.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Sentence _$$_SentenceFromJson(Map<String, dynamic> json) => _$_Sentence(
      json['group'] as String,
      json['grammarLabel'] as String,
      json['textEng'] as String,
      json['textMon'] as String,
      json['groupNumber'] as String,
      (json['structure'] as List<dynamic>)
          .map((e) => SentenceStructure.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_SentenceToJson(_$_Sentence instance) =>
    <String, dynamic>{
      'group': instance.group,
      'grammarLabel': instance.grammarLabel,
      'textEng': instance.textEng,
      'textMon': instance.textMon,
      'groupNumber': instance.groupNumber,
      'structure': instance.structure,
    };
