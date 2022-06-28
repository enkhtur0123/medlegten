// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unit_complete_percent.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnitCompleteInfo _$$_UnitCompleteInfoFromJson(Map<String, dynamic> json) =>
    _$_UnitCompleteInfo(
      json['isSuccess'] as bool,
      json['errorCode'] as String,
      json['resultMessage'] as String,
      json['completedCount'] as int,
      json['unCompletedCount'] as int,
    );

Map<String, dynamic> _$$_UnitCompleteInfoToJson(_$_UnitCompleteInfo instance) =>
    <String, dynamic>{
      'isSuccess': instance.isSuccess,
      'errorCode': instance.errorCode,
      'resultMessage': instance.resultMessage,
      'completedCount': instance.completedCount,
      'unCompletedCount': instance.unCompletedCount,
    };
