// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'journey.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Journey _$$_JourneyFromJson(Map<String, dynamic> json) => _$_Journey(
      json['eventId'] as String?,
      json['eventName'] as String?,
      json['imgUrl'] as String?,
      json['runTime'] as String?,
      json['vocabularyCount'] as String?,
      json['vocabularyKnow'] as String?,
      json['categoryName'] as String?,
      json['isSerial'] as String?,
    );

Map<String, dynamic> _$$_JourneyToJson(_$_Journey instance) =>
    <String, dynamic>{
      'eventId': instance.eventId,
      'eventName': instance.eventName,
      'imgUrl': instance.imgUrl,
      'runTime': instance.runTime,
      'vocabularyCount': instance.vocabularyCount,
      'vocabularyKnow': instance.vocabularyKnow,
      'categoryName': instance.categoryName,
      'isSerial': instance.isSerial,
    };
