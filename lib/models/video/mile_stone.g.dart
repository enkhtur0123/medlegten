// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mile_stone.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MileStone _$$_MileStoneFromJson(Map<String, dynamic> json) => _$_MileStone(
      (json['mileStone'] as List<dynamic>?)
          ?.map((e) => MileStoneItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['completedPpvCount'] as int,
      json['knowingWordCount'] as int,
    );

Map<String, dynamic> _$$_MileStoneToJson(_$_MileStone instance) =>
    <String, dynamic>{
      'mileStone': instance.mileStone,
      'completedPpvCount': instance.completedPpvCount,
      'knowingWordCount': instance.knowingWordCount,
    };
