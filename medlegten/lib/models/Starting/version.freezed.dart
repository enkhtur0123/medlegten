// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'version.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Version _$VersionFromJson(Map<String, dynamic> json) {
  return _Version.fromJson(json);
}

/// @nodoc
class _$VersionTearOff {
  const _$VersionTearOff();

  _Version call(bool isSuccess, String errorCode, String resultMessage,
      [String? appVersion,
      String? appVersionDesc,
      String? androidUrl,
      String? iosUrl]) {
    return _Version(
      isSuccess,
      errorCode,
      resultMessage,
      appVersion,
      appVersionDesc,
      androidUrl,
      iosUrl,
    );
  }

  Version fromJson(Map<String, Object?> json) {
    return Version.fromJson(json);
  }
}

/// @nodoc
const $Version = _$VersionTearOff();

/// @nodoc
mixin _$Version {
  bool get isSuccess => throw _privateConstructorUsedError;
  String get errorCode => throw _privateConstructorUsedError;
  String get resultMessage => throw _privateConstructorUsedError;
  String? get appVersion => throw _privateConstructorUsedError;
  String? get appVersionDesc => throw _privateConstructorUsedError;
  String? get androidUrl => throw _privateConstructorUsedError;
  String? get iosUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VersionCopyWith<Version> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VersionCopyWith<$Res> {
  factory $VersionCopyWith(Version value, $Res Function(Version) then) =
      _$VersionCopyWithImpl<$Res>;
  $Res call(
      {bool isSuccess,
      String errorCode,
      String resultMessage,
      String? appVersion,
      String? appVersionDesc,
      String? androidUrl,
      String? iosUrl});
}

/// @nodoc
class _$VersionCopyWithImpl<$Res> implements $VersionCopyWith<$Res> {
  _$VersionCopyWithImpl(this._value, this._then);

  final Version _value;
  // ignore: unused_field
  final $Res Function(Version) _then;

  @override
  $Res call({
    Object? isSuccess = freezed,
    Object? errorCode = freezed,
    Object? resultMessage = freezed,
    Object? appVersion = freezed,
    Object? appVersionDesc = freezed,
    Object? androidUrl = freezed,
    Object? iosUrl = freezed,
  }) {
    return _then(_value.copyWith(
      isSuccess: isSuccess == freezed
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      errorCode: errorCode == freezed
          ? _value.errorCode
          : errorCode // ignore: cast_nullable_to_non_nullable
              as String,
      resultMessage: resultMessage == freezed
          ? _value.resultMessage
          : resultMessage // ignore: cast_nullable_to_non_nullable
              as String,
      appVersion: appVersion == freezed
          ? _value.appVersion
          : appVersion // ignore: cast_nullable_to_non_nullable
              as String?,
      appVersionDesc: appVersionDesc == freezed
          ? _value.appVersionDesc
          : appVersionDesc // ignore: cast_nullable_to_non_nullable
              as String?,
      androidUrl: androidUrl == freezed
          ? _value.androidUrl
          : androidUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      iosUrl: iosUrl == freezed
          ? _value.iosUrl
          : iosUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$VersionCopyWith<$Res> implements $VersionCopyWith<$Res> {
  factory _$VersionCopyWith(_Version value, $Res Function(_Version) then) =
      __$VersionCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isSuccess,
      String errorCode,
      String resultMessage,
      String? appVersion,
      String? appVersionDesc,
      String? androidUrl,
      String? iosUrl});
}

/// @nodoc
class __$VersionCopyWithImpl<$Res> extends _$VersionCopyWithImpl<$Res>
    implements _$VersionCopyWith<$Res> {
  __$VersionCopyWithImpl(_Version _value, $Res Function(_Version) _then)
      : super(_value, (v) => _then(v as _Version));

  @override
  _Version get _value => super._value as _Version;

  @override
  $Res call({
    Object? isSuccess = freezed,
    Object? errorCode = freezed,
    Object? resultMessage = freezed,
    Object? appVersion = freezed,
    Object? appVersionDesc = freezed,
    Object? androidUrl = freezed,
    Object? iosUrl = freezed,
  }) {
    return _then(_Version(
      isSuccess == freezed
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      errorCode == freezed
          ? _value.errorCode
          : errorCode // ignore: cast_nullable_to_non_nullable
              as String,
      resultMessage == freezed
          ? _value.resultMessage
          : resultMessage // ignore: cast_nullable_to_non_nullable
              as String,
      appVersion == freezed
          ? _value.appVersion
          : appVersion // ignore: cast_nullable_to_non_nullable
              as String?,
      appVersionDesc == freezed
          ? _value.appVersionDesc
          : appVersionDesc // ignore: cast_nullable_to_non_nullable
              as String?,
      androidUrl == freezed
          ? _value.androidUrl
          : androidUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      iosUrl == freezed
          ? _value.iosUrl
          : iosUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Version implements _Version {
  _$_Version(this.isSuccess, this.errorCode, this.resultMessage,
      [this.appVersion, this.appVersionDesc, this.androidUrl, this.iosUrl]);

  factory _$_Version.fromJson(Map<String, dynamic> json) =>
      _$$_VersionFromJson(json);

  @override
  final bool isSuccess;
  @override
  final String errorCode;
  @override
  final String resultMessage;
  @override
  final String? appVersion;
  @override
  final String? appVersionDesc;
  @override
  final String? androidUrl;
  @override
  final String? iosUrl;

  @override
  String toString() {
    return 'Version(isSuccess: $isSuccess, errorCode: $errorCode, resultMessage: $resultMessage, appVersion: $appVersion, appVersionDesc: $appVersionDesc, androidUrl: $androidUrl, iosUrl: $iosUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Version &&
            const DeepCollectionEquality().equals(other.isSuccess, isSuccess) &&
            const DeepCollectionEquality().equals(other.errorCode, errorCode) &&
            const DeepCollectionEquality()
                .equals(other.resultMessage, resultMessage) &&
            const DeepCollectionEquality()
                .equals(other.appVersion, appVersion) &&
            const DeepCollectionEquality()
                .equals(other.appVersionDesc, appVersionDesc) &&
            const DeepCollectionEquality()
                .equals(other.androidUrl, androidUrl) &&
            const DeepCollectionEquality().equals(other.iosUrl, iosUrl));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isSuccess),
      const DeepCollectionEquality().hash(errorCode),
      const DeepCollectionEquality().hash(resultMessage),
      const DeepCollectionEquality().hash(appVersion),
      const DeepCollectionEquality().hash(appVersionDesc),
      const DeepCollectionEquality().hash(androidUrl),
      const DeepCollectionEquality().hash(iosUrl));

  @JsonKey(ignore: true)
  @override
  _$VersionCopyWith<_Version> get copyWith =>
      __$VersionCopyWithImpl<_Version>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_VersionToJson(this);
  }
}

abstract class _Version implements Version {
  factory _Version(bool isSuccess, String errorCode, String resultMessage,
      [String? appVersion,
      String? appVersionDesc,
      String? androidUrl,
      String? iosUrl]) = _$_Version;

  factory _Version.fromJson(Map<String, dynamic> json) = _$_Version.fromJson;

  @override
  bool get isSuccess;
  @override
  String get errorCode;
  @override
  String get resultMessage;
  @override
  String? get appVersion;
  @override
  String? get appVersionDesc;
  @override
  String? get androidUrl;
  @override
  String? get iosUrl;
  @override
  @JsonKey(ignore: true)
  _$VersionCopyWith<_Version> get copyWith =>
      throw _privateConstructorUsedError;
}
