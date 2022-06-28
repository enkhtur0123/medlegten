// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unit_complete_percent.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnitCompleteInfo _$UnitCompleteInfoFromJson(Map<String, dynamic> json) {
  return _UnitCompleteInfo.fromJson(json);
}

/// @nodoc
class _$UnitCompleteInfoTearOff {
  const _$UnitCompleteInfoTearOff();

  _UnitCompleteInfo call(bool isSuccess, String errorCode, String resultMessage,
      int completedCount, int unCompletedCount) {
    return _UnitCompleteInfo(
      isSuccess,
      errorCode,
      resultMessage,
      completedCount,
      unCompletedCount,
    );
  }

  UnitCompleteInfo fromJson(Map<String, Object?> json) {
    return UnitCompleteInfo.fromJson(json);
  }
}

/// @nodoc
const $UnitCompleteInfo = _$UnitCompleteInfoTearOff();

/// @nodoc
mixin _$UnitCompleteInfo {
  bool get isSuccess => throw _privateConstructorUsedError;
  String get errorCode => throw _privateConstructorUsedError;
  String get resultMessage => throw _privateConstructorUsedError;
  int get completedCount => throw _privateConstructorUsedError;
  int get unCompletedCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnitCompleteInfoCopyWith<UnitCompleteInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnitCompleteInfoCopyWith<$Res> {
  factory $UnitCompleteInfoCopyWith(
          UnitCompleteInfo value, $Res Function(UnitCompleteInfo) then) =
      _$UnitCompleteInfoCopyWithImpl<$Res>;
  $Res call(
      {bool isSuccess,
      String errorCode,
      String resultMessage,
      int completedCount,
      int unCompletedCount});
}

/// @nodoc
class _$UnitCompleteInfoCopyWithImpl<$Res>
    implements $UnitCompleteInfoCopyWith<$Res> {
  _$UnitCompleteInfoCopyWithImpl(this._value, this._then);

  final UnitCompleteInfo _value;
  // ignore: unused_field
  final $Res Function(UnitCompleteInfo) _then;

  @override
  $Res call({
    Object? isSuccess = freezed,
    Object? errorCode = freezed,
    Object? resultMessage = freezed,
    Object? completedCount = freezed,
    Object? unCompletedCount = freezed,
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
      completedCount: completedCount == freezed
          ? _value.completedCount
          : completedCount // ignore: cast_nullable_to_non_nullable
              as int,
      unCompletedCount: unCompletedCount == freezed
          ? _value.unCompletedCount
          : unCompletedCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$UnitCompleteInfoCopyWith<$Res>
    implements $UnitCompleteInfoCopyWith<$Res> {
  factory _$UnitCompleteInfoCopyWith(
          _UnitCompleteInfo value, $Res Function(_UnitCompleteInfo) then) =
      __$UnitCompleteInfoCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isSuccess,
      String errorCode,
      String resultMessage,
      int completedCount,
      int unCompletedCount});
}

/// @nodoc
class __$UnitCompleteInfoCopyWithImpl<$Res>
    extends _$UnitCompleteInfoCopyWithImpl<$Res>
    implements _$UnitCompleteInfoCopyWith<$Res> {
  __$UnitCompleteInfoCopyWithImpl(
      _UnitCompleteInfo _value, $Res Function(_UnitCompleteInfo) _then)
      : super(_value, (v) => _then(v as _UnitCompleteInfo));

  @override
  _UnitCompleteInfo get _value => super._value as _UnitCompleteInfo;

  @override
  $Res call({
    Object? isSuccess = freezed,
    Object? errorCode = freezed,
    Object? resultMessage = freezed,
    Object? completedCount = freezed,
    Object? unCompletedCount = freezed,
  }) {
    return _then(_UnitCompleteInfo(
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
      completedCount == freezed
          ? _value.completedCount
          : completedCount // ignore: cast_nullable_to_non_nullable
              as int,
      unCompletedCount == freezed
          ? _value.unCompletedCount
          : unCompletedCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnitCompleteInfo implements _UnitCompleteInfo {
  _$_UnitCompleteInfo(this.isSuccess, this.errorCode, this.resultMessage,
      this.completedCount, this.unCompletedCount);

  factory _$_UnitCompleteInfo.fromJson(Map<String, dynamic> json) =>
      _$$_UnitCompleteInfoFromJson(json);

  @override
  final bool isSuccess;
  @override
  final String errorCode;
  @override
  final String resultMessage;
  @override
  final int completedCount;
  @override
  final int unCompletedCount;

  @override
  String toString() {
    return 'UnitCompleteInfo(isSuccess: $isSuccess, errorCode: $errorCode, resultMessage: $resultMessage, completedCount: $completedCount, unCompletedCount: $unCompletedCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UnitCompleteInfo &&
            const DeepCollectionEquality().equals(other.isSuccess, isSuccess) &&
            const DeepCollectionEquality().equals(other.errorCode, errorCode) &&
            const DeepCollectionEquality()
                .equals(other.resultMessage, resultMessage) &&
            const DeepCollectionEquality()
                .equals(other.completedCount, completedCount) &&
            const DeepCollectionEquality()
                .equals(other.unCompletedCount, unCompletedCount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isSuccess),
      const DeepCollectionEquality().hash(errorCode),
      const DeepCollectionEquality().hash(resultMessage),
      const DeepCollectionEquality().hash(completedCount),
      const DeepCollectionEquality().hash(unCompletedCount));

  @JsonKey(ignore: true)
  @override
  _$UnitCompleteInfoCopyWith<_UnitCompleteInfo> get copyWith =>
      __$UnitCompleteInfoCopyWithImpl<_UnitCompleteInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnitCompleteInfoToJson(this);
  }
}

abstract class _UnitCompleteInfo implements UnitCompleteInfo {
  factory _UnitCompleteInfo(
      bool isSuccess,
      String errorCode,
      String resultMessage,
      int completedCount,
      int unCompletedCount) = _$_UnitCompleteInfo;

  factory _UnitCompleteInfo.fromJson(Map<String, dynamic> json) =
      _$_UnitCompleteInfo.fromJson;

  @override
  bool get isSuccess;
  @override
  String get errorCode;
  @override
  String get resultMessage;
  @override
  int get completedCount;
  @override
  int get unCompletedCount;
  @override
  @JsonKey(ignore: true)
  _$UnitCompleteInfoCopyWith<_UnitCompleteInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
