// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'root_word_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RootWordInfo _$$_RootWordInfoFromJson(Map<String, dynamic> json) =>
    _$_RootWordInfo(
      json['rootWordId'] as String?,
      json['rootWord'] as String?,
      (json['translation'] as List<dynamic>?)
          ?.map((e) => Translation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_RootWordInfoToJson(_$_RootWordInfo instance) =>
    <String, dynamic>{
      'rootWordId': instance.rootWordId,
      'rootWord': instance.rootWord,
      'translation': instance.translation,
    };
