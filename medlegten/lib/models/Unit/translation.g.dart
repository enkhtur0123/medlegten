// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'translation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Translation _$$_TranslationFromJson(Map<String, dynamic> json) =>
    _$_Translation(
      json['wordTrId'] as String,
      json['trText'] as String,
      json['trOrigin'] as String,
      json['trTypeId'] as String,
      json['trTypeFullName'] as String,
      json['trTypeShortName'] as String,
    );

Map<String, dynamic> _$$_TranslationToJson(_$_Translation instance) =>
    <String, dynamic>{
      'wordTrId': instance.wordTrId,
      'trText': instance.trText,
      'trOrigin': instance.trOrigin,
      'trTypeId': instance.trTypeId,
      'trTypeFullName': instance.trTypeFullName,
      'trTypeShortName': instance.trTypeShortName,
    };
