// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'muser_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MUserInfo _$$_MUserInfoFromJson(Map<String, dynamic> json) => _$_MUserInfo(
      json['userId'] as String,
      json['socialId'] as String?,
      json['firstName'] as String?,
      json['lastName'] as String?,
      json['phone'] as String?,
      json['email'] as String?,
      json['profileUrl'] as String?,
      json['socialType'] as String?,
      json['createdDate'] as String?,
      json['birthDate'] as String?,
      json['deviceInfo'] as String?,
      json['skipBirthDate'] as String?,
    );

Map<String, dynamic> _$$_MUserInfoToJson(_$_MUserInfo instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'socialId': instance.socialId,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'phone': instance.phone,
      'email': instance.email,
      'profileUrl': instance.profileUrl,
      'socialType': instance.socialType,
      'createdDate': instance.createdDate,
      'birthDate': instance.birthDate,
      'deviceInfo': instance.deviceInfo,
      'skipBirthDate': instance.skipBirthDate,
    };
