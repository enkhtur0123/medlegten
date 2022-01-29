// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'promotion_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PromotionInfo _$$_PromotionInfoFromJson(Map<String, dynamic> json) =>
    _$_PromotionInfo(
      json['promoId'] as String,
      json['title'] as String,
      json['description'] as String,
      json['imgUrl'] as String,
      json['backroundImgUrl'] as String,
      json['ordering'] as int,
    );

Map<String, dynamic> _$$_PromotionInfoToJson(_$_PromotionInfo instance) =>
    <String, dynamic>{
      'promoId': instance.promoId,
      'title': instance.title,
      'description': instance.description,
      'imgUrl': instance.imgUrl,
      'backroundImgUrl': instance.backroundImgUrl,
      'ordering': instance.ordering,
    };
