// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'last_seen.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LastSeen _$LastSeenFromJson(Map<String, dynamic> json) {
  return _LastSeen.fromJson(json);
}

/// @nodoc
class _$LastSeenTearOff {
  const _$LastSeenTearOff();

  _LastSeen call(
      bool? isSuccess,
      String? errorCode,
      String? resultMessage,
      LastSeenArticle? lastSeenArticle,
      LastSeenVideo? lastSeenPPV,
      List<Event>? recommends,
      LastSeenUnit? lastSeenUnit,
      List<Promotion>? promotions) {
    return _LastSeen(
      isSuccess,
      errorCode,
      resultMessage,
      lastSeenArticle,
      lastSeenPPV,
      recommends,
      lastSeenUnit,
      promotions,
    );
  }

  LastSeen fromJson(Map<String, Object?> json) {
    return LastSeen.fromJson(json);
  }
}

/// @nodoc
const $LastSeen = _$LastSeenTearOff();

/// @nodoc
mixin _$LastSeen {
  bool? get isSuccess => throw _privateConstructorUsedError;
  String? get errorCode => throw _privateConstructorUsedError;
  String? get resultMessage => throw _privateConstructorUsedError;
  LastSeenArticle? get lastSeenArticle => throw _privateConstructorUsedError;
  LastSeenVideo? get lastSeenPPV => throw _privateConstructorUsedError;
  List<Event>? get recommends => throw _privateConstructorUsedError;
  LastSeenUnit? get lastSeenUnit => throw _privateConstructorUsedError;
  List<Promotion>? get promotions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LastSeenCopyWith<LastSeen> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LastSeenCopyWith<$Res> {
  factory $LastSeenCopyWith(LastSeen value, $Res Function(LastSeen) then) =
      _$LastSeenCopyWithImpl<$Res>;
  $Res call(
      {bool? isSuccess,
      String? errorCode,
      String? resultMessage,
      LastSeenArticle? lastSeenArticle,
      LastSeenVideo? lastSeenPPV,
      List<Event>? recommends,
      LastSeenUnit? lastSeenUnit,
      List<Promotion>? promotions});

  $LastSeenArticleCopyWith<$Res>? get lastSeenArticle;
  $LastSeenVideoCopyWith<$Res>? get lastSeenPPV;
  $LastSeenUnitCopyWith<$Res>? get lastSeenUnit;
}

/// @nodoc
class _$LastSeenCopyWithImpl<$Res> implements $LastSeenCopyWith<$Res> {
  _$LastSeenCopyWithImpl(this._value, this._then);

  final LastSeen _value;
  // ignore: unused_field
  final $Res Function(LastSeen) _then;

  @override
  $Res call({
    Object? isSuccess = freezed,
    Object? errorCode = freezed,
    Object? resultMessage = freezed,
    Object? lastSeenArticle = freezed,
    Object? lastSeenPPV = freezed,
    Object? recommends = freezed,
    Object? lastSeenUnit = freezed,
    Object? promotions = freezed,
  }) {
    return _then(_value.copyWith(
      isSuccess: isSuccess == freezed
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool?,
      errorCode: errorCode == freezed
          ? _value.errorCode
          : errorCode // ignore: cast_nullable_to_non_nullable
              as String?,
      resultMessage: resultMessage == freezed
          ? _value.resultMessage
          : resultMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      lastSeenArticle: lastSeenArticle == freezed
          ? _value.lastSeenArticle
          : lastSeenArticle // ignore: cast_nullable_to_non_nullable
              as LastSeenArticle?,
      lastSeenPPV: lastSeenPPV == freezed
          ? _value.lastSeenPPV
          : lastSeenPPV // ignore: cast_nullable_to_non_nullable
              as LastSeenVideo?,
      recommends: recommends == freezed
          ? _value.recommends
          : recommends // ignore: cast_nullable_to_non_nullable
              as List<Event>?,
      lastSeenUnit: lastSeenUnit == freezed
          ? _value.lastSeenUnit
          : lastSeenUnit // ignore: cast_nullable_to_non_nullable
              as LastSeenUnit?,
      promotions: promotions == freezed
          ? _value.promotions
          : promotions // ignore: cast_nullable_to_non_nullable
              as List<Promotion>?,
    ));
  }

  @override
  $LastSeenArticleCopyWith<$Res>? get lastSeenArticle {
    if (_value.lastSeenArticle == null) {
      return null;
    }

    return $LastSeenArticleCopyWith<$Res>(_value.lastSeenArticle!, (value) {
      return _then(_value.copyWith(lastSeenArticle: value));
    });
  }

  @override
  $LastSeenVideoCopyWith<$Res>? get lastSeenPPV {
    if (_value.lastSeenPPV == null) {
      return null;
    }

    return $LastSeenVideoCopyWith<$Res>(_value.lastSeenPPV!, (value) {
      return _then(_value.copyWith(lastSeenPPV: value));
    });
  }

  @override
  $LastSeenUnitCopyWith<$Res>? get lastSeenUnit {
    if (_value.lastSeenUnit == null) {
      return null;
    }

    return $LastSeenUnitCopyWith<$Res>(_value.lastSeenUnit!, (value) {
      return _then(_value.copyWith(lastSeenUnit: value));
    });
  }
}

/// @nodoc
abstract class _$LastSeenCopyWith<$Res> implements $LastSeenCopyWith<$Res> {
  factory _$LastSeenCopyWith(_LastSeen value, $Res Function(_LastSeen) then) =
      __$LastSeenCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool? isSuccess,
      String? errorCode,
      String? resultMessage,
      LastSeenArticle? lastSeenArticle,
      LastSeenVideo? lastSeenPPV,
      List<Event>? recommends,
      LastSeenUnit? lastSeenUnit,
      List<Promotion>? promotions});

  @override
  $LastSeenArticleCopyWith<$Res>? get lastSeenArticle;
  @override
  $LastSeenVideoCopyWith<$Res>? get lastSeenPPV;
  @override
  $LastSeenUnitCopyWith<$Res>? get lastSeenUnit;
}

/// @nodoc
class __$LastSeenCopyWithImpl<$Res> extends _$LastSeenCopyWithImpl<$Res>
    implements _$LastSeenCopyWith<$Res> {
  __$LastSeenCopyWithImpl(_LastSeen _value, $Res Function(_LastSeen) _then)
      : super(_value, (v) => _then(v as _LastSeen));

  @override
  _LastSeen get _value => super._value as _LastSeen;

  @override
  $Res call({
    Object? isSuccess = freezed,
    Object? errorCode = freezed,
    Object? resultMessage = freezed,
    Object? lastSeenArticle = freezed,
    Object? lastSeenPPV = freezed,
    Object? recommends = freezed,
    Object? lastSeenUnit = freezed,
    Object? promotions = freezed,
  }) {
    return _then(_LastSeen(
      isSuccess == freezed
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool?,
      errorCode == freezed
          ? _value.errorCode
          : errorCode // ignore: cast_nullable_to_non_nullable
              as String?,
      resultMessage == freezed
          ? _value.resultMessage
          : resultMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      lastSeenArticle == freezed
          ? _value.lastSeenArticle
          : lastSeenArticle // ignore: cast_nullable_to_non_nullable
              as LastSeenArticle?,
      lastSeenPPV == freezed
          ? _value.lastSeenPPV
          : lastSeenPPV // ignore: cast_nullable_to_non_nullable
              as LastSeenVideo?,
      recommends == freezed
          ? _value.recommends
          : recommends // ignore: cast_nullable_to_non_nullable
              as List<Event>?,
      lastSeenUnit == freezed
          ? _value.lastSeenUnit
          : lastSeenUnit // ignore: cast_nullable_to_non_nullable
              as LastSeenUnit?,
      promotions == freezed
          ? _value.promotions
          : promotions // ignore: cast_nullable_to_non_nullable
              as List<Promotion>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LastSeen implements _LastSeen {
  _$_LastSeen(
      this.isSuccess,
      this.errorCode,
      this.resultMessage,
      this.lastSeenArticle,
      this.lastSeenPPV,
      this.recommends,
      this.lastSeenUnit,
      this.promotions);

  factory _$_LastSeen.fromJson(Map<String, dynamic> json) =>
      _$$_LastSeenFromJson(json);

  @override
  final bool? isSuccess;
  @override
  final String? errorCode;
  @override
  final String? resultMessage;
  @override
  final LastSeenArticle? lastSeenArticle;
  @override
  final LastSeenVideo? lastSeenPPV;
  @override
  final List<Event>? recommends;
  @override
  final LastSeenUnit? lastSeenUnit;
  @override
  final List<Promotion>? promotions;

  @override
  String toString() {
    return 'LastSeen(isSuccess: $isSuccess, errorCode: $errorCode, resultMessage: $resultMessage, lastSeenArticle: $lastSeenArticle, lastSeenPPV: $lastSeenPPV, recommends: $recommends, lastSeenUnit: $lastSeenUnit, promotions: $promotions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LastSeen &&
            const DeepCollectionEquality().equals(other.isSuccess, isSuccess) &&
            const DeepCollectionEquality().equals(other.errorCode, errorCode) &&
            const DeepCollectionEquality()
                .equals(other.resultMessage, resultMessage) &&
            const DeepCollectionEquality()
                .equals(other.lastSeenArticle, lastSeenArticle) &&
            const DeepCollectionEquality()
                .equals(other.lastSeenPPV, lastSeenPPV) &&
            const DeepCollectionEquality()
                .equals(other.recommends, recommends) &&
            const DeepCollectionEquality()
                .equals(other.lastSeenUnit, lastSeenUnit) &&
            const DeepCollectionEquality()
                .equals(other.promotions, promotions));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isSuccess),
      const DeepCollectionEquality().hash(errorCode),
      const DeepCollectionEquality().hash(resultMessage),
      const DeepCollectionEquality().hash(lastSeenArticle),
      const DeepCollectionEquality().hash(lastSeenPPV),
      const DeepCollectionEquality().hash(recommends),
      const DeepCollectionEquality().hash(lastSeenUnit),
      const DeepCollectionEquality().hash(promotions));

  @JsonKey(ignore: true)
  @override
  _$LastSeenCopyWith<_LastSeen> get copyWith =>
      __$LastSeenCopyWithImpl<_LastSeen>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LastSeenToJson(this);
  }
}

abstract class _LastSeen implements LastSeen {
  factory _LastSeen(
      bool? isSuccess,
      String? errorCode,
      String? resultMessage,
      LastSeenArticle? lastSeenArticle,
      LastSeenVideo? lastSeenPPV,
      List<Event>? recommends,
      LastSeenUnit? lastSeenUnit,
      List<Promotion>? promotions) = _$_LastSeen;

  factory _LastSeen.fromJson(Map<String, dynamic> json) = _$_LastSeen.fromJson;

  @override
  bool? get isSuccess;
  @override
  String? get errorCode;
  @override
  String? get resultMessage;
  @override
  LastSeenArticle? get lastSeenArticle;
  @override
  LastSeenVideo? get lastSeenPPV;
  @override
  List<Event>? get recommends;
  @override
  LastSeenUnit? get lastSeenUnit;
  @override
  List<Promotion>? get promotions;
  @override
  @JsonKey(ignore: true)
  _$LastSeenCopyWith<_LastSeen> get copyWith =>
      throw _privateConstructorUsedError;
}
