// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PaymentInfo _$$_PaymentInfoFromJson(Map<String, dynamic> json) =>
    _$_PaymentInfo(
      json['isPurchased'] as bool?,
      json['isExpireDate'] as String?,
      json['productId'] as String?,
      json['productName'] as String?,
      json['productDesc'] as String?,
      json['price'] as String?,
    );

Map<String, dynamic> _$$_PaymentInfoToJson(_$_PaymentInfo instance) =>
    <String, dynamic>{
      'isPurchased': instance.isPurchased,
      'isExpireDate': instance.isExpireDate,
      'productId': instance.productId,
      'productName': instance.productName,
      'productDesc': instance.productDesc,
      'price': instance.price,
    };
