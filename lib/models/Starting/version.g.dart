// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'version.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Version _$$_VersionFromJson(Map<String, dynamic> json) => _$_Version(
      json['isSuccess'] as bool,
      json['errorCode'] as String,
      json['resultMessage'] as String,
      json['appVersion'] as String?,
      json['appVersionDesc'] as String?,
      json['androidUrl'] as String?,
      json['iosUrl'] as String?,
    );

Map<String, dynamic> _$$_VersionToJson(_$_Version instance) =>
    <String, dynamic>{
      'isSuccess': instance.isSuccess,
      'errorCode': instance.errorCode,
      'resultMessage': instance.resultMessage,
      'appVersion': instance.appVersion,
      'appVersionDesc': instance.appVersionDesc,
      'androidUrl': instance.androidUrl,
      'iosUrl': instance.iosUrl,
    };
