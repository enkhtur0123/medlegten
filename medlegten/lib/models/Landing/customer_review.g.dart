// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CustomerReview _$$_CustomerReviewFromJson(Map<String, dynamic> json) =>
    _$_CustomerReview(
      json['reviewId'] as String,
      json['fullName'] as String,
      json['bioTitle'] as String,
      json['startRating'] as String,
      json['profileImg'] as String,
      json['desc'] as String,
      json['ordering'] as String,
    );

Map<String, dynamic> _$$_CustomerReviewToJson(_$_CustomerReview instance) =>
    <String, dynamic>{
      'reviewId': instance.reviewId,
      'fullName': instance.fullName,
      'bioTitle': instance.bioTitle,
      'startRating': instance.startRating,
      'profileImg': instance.profileImg,
      'desc': instance.desc,
      'ordering': instance.ordering,
    };
