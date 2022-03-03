// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CourseInfo _$$_CourseInfoFromJson(Map<String, dynamic> json) =>
    _$_CourseInfo(
      json['courseId'] as String,
      json['courseName'] as String,
      json['price'] as String,
      json['introVideo'] as String,
      json['ordering'] as String,
      json['shortDesc'] as String,
      json['levelName'] as String,
      json['hours'] as String,
      json['units'] as String,
      json['vocCount'] as String,
      json['introVideoHostType'] as String,
      json['introVideoUrl'] as String,
      json['minToWatch'] as String,
      json['isPurchased'] as bool,
      json['purchaseExpireDate'] as String,
      json['isCreatedPlan'] as bool,
      (json['purchaseDesc'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_CourseInfoToJson(_$_CourseInfo instance) =>
    <String, dynamic>{
      'courseId': instance.courseId,
      'courseName': instance.courseName,
      'price': instance.price,
      'introVideo': instance.introVideo,
      'ordering': instance.ordering,
      'shortDesc': instance.shortDesc,
      'levelName': instance.levelName,
      'hours': instance.hours,
      'units': instance.units,
      'vocCount': instance.vocCount,
      'introVideoHostType': instance.introVideoHostType,
      'introVideoUrl': instance.introVideoUrl,
      'minToWatch': instance.minToWatch,
      'isPurchased': instance.isPurchased,
      'purchaseExpireDate': instance.purchaseExpireDate,
      'isCreatedPlan': instance.isCreatedPlan,
      'purchaseDesc': instance.purchaseDesc,
    };
