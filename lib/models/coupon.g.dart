// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coupon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Coupon _$$_CouponFromJson(Map<String, dynamic> json) => _$_Coupon(
      json['isUse'] as bool,
      json['couponCode'] as String,
      json['price'] as String,
      json['courseId'] as String,
      json['expireDate'] as String,
      json['usedCount'] as String,
      json['limit'] as String,
      json['month'] as String,
    );

Map<String, dynamic> _$$_CouponToJson(_$_Coupon instance) => <String, dynamic>{
      'isUse': instance.isUse,
      'couponCode': instance.couponCode,
      'price': instance.price,
      'courseId': instance.courseId,
      'expireDate': instance.expireDate,
      'usedCount': instance.usedCount,
      'limit': instance.limit,
      'month': instance.month,
    };
