// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'active_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ActiveService _$$_ActiveServiceFromJson(Map<String, dynamic> json) =>
    _$_ActiveService(
      json['productId'] as String,
      json['productName'] as String,
      json['expireDate'] as String,
      json['paymentType'] as String,
    );

Map<String, dynamic> _$$_ActiveServiceToJson(_$_ActiveService instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'productName': instance.productName,
      'expireDate': instance.expireDate,
      'paymentType': instance.paymentType,
    };
