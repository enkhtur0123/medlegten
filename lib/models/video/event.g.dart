// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Event _$$_EventFromJson(Map<String, dynamic> json) => _$_Event(
      json['eventId'] as String,
      json['eventName'] as String,
      json['categoryName'] as String,
      json['levelId'] as String,
      json['vocabularyCount'] as String,
      json['imgUrl'] as String,
      json['intro'] as String,
      json['isSerial'] as String,
      json['runTime'] as String,
    );

Map<String, dynamic> _$$_EventToJson(_$_Event instance) => <String, dynamic>{
      'eventId': instance.eventId,
      'eventName': instance.eventName,
      'categoryName': instance.categoryName,
      'levelId': instance.levelId,
      'vocabularyCount': instance.vocabularyCount,
      'imgUrl': instance.imgUrl,
      'intro': instance.intro,
      'isSerial': instance.isSerial,
      'runTime': instance.runTime,
    };
