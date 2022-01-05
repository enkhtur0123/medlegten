// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CustomerReview _$$_CustomerReviewFromJson(Map<String, dynamic> json) =>
    _$_CustomerReview(
      json['reviewId'] as String,
      json['profileImg'] as String,
      json['fullName'] as String,
      json['position'] as String,
      json['description'] as String,
      json['star'] as int,
    );

Map<String, dynamic> _$$_CustomerReviewToJson(_$_CustomerReview instance) =>
    <String, dynamic>{
      'reviewId': instance.reviewId,
      'profileImg': instance.profileImg,
      'fullName': instance.fullName,
      'position': instance.position,
      'description': instance.description,
      'star': instance.star,
    };
