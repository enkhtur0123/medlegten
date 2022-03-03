// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'last_seen.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LastSeen _$$_LastSeenFromJson(Map<String, dynamic> json) => _$_LastSeen(
      json['isSuccess'] as bool?,
      json['errorCode'] as String?,
      json['resultMessage'] as String?,
      json['lastSeenArticle'] == null
          ? null
          : LastSeenArticle.fromJson(
              json['lastSeenArticle'] as Map<String, dynamic>),
      json['lastSeenPPV'] == null
          ? null
          : LastSeenVideo.fromJson(json['lastSeenPPV'] as Map<String, dynamic>),
      (json['recommends'] as List<dynamic>?)
          ?.map((e) => Event.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['promotions'] as List<dynamic>?)
          ?.map((e) => Promotion.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_LastSeenToJson(_$_LastSeen instance) =>
    <String, dynamic>{
      'isSuccess': instance.isSuccess,
      'errorCode': instance.errorCode,
      'resultMessage': instance.resultMessage,
      'lastSeenArticle': instance.lastSeenArticle,
      'lastSeenPPV': instance.lastSeenPPV,
      'recommends': instance.recommends,
      'promotions': instance.promotions,
    };
