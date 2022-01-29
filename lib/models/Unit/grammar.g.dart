// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grammar.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Grammar _$$_GrammarFromJson(Map<String, dynamic> json) => _$_Grammar(
      json['grammarNameEng'] as String,
      json['grammarNameMon'] as String,
      json['label'] as String,
      json['avatar'] as String,
      json['avatarHostSource'] as String,
      json['part1'] as String,
      json['part2'] as String,
      json['part3'] as String,
      json['part4'] as String,
      json['part5'] as String,
      json['part6'] as String,
      (json['structure'] as List<dynamic>)
          .map((e) => GrammarStructure.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_GrammarToJson(_$_Grammar instance) =>
    <String, dynamic>{
      'grammarNameEng': instance.grammarNameEng,
      'grammarNameMon': instance.grammarNameMon,
      'label': instance.label,
      'avatar': instance.avatar,
      'avatarHostSource': instance.avatarHostSource,
      'part1': instance.part1,
      'part2': instance.part2,
      'part3': instance.part3,
      'part4': instance.part4,
      'part5': instance.part5,
      'part6': instance.part6,
      'structure': instance.structure,
    };
