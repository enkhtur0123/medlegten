// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'coupon.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Coupon _$CouponFromJson(Map<String, dynamic> json) {
  return _Coupon.fromJson(json);
}

/// @nodoc
class _$CouponTearOff {
  const _$CouponTearOff();

  _Coupon call(bool isUse, String couponCode, String price, String courseId,
      String expireDate, String usedCount, String limit, String month) {
    return _Coupon(
      isUse,
      couponCode,
      price,
      courseId,
      expireDate,
      usedCount,
      limit,
      month,
    );
  }

  Coupon fromJson(Map<String, Object?> json) {
    return Coupon.fromJson(json);
  }
}

/// @nodoc
const $Coupon = _$CouponTearOff();

/// @nodoc
mixin _$Coupon {
  bool get isUse => throw _privateConstructorUsedError;
  String get couponCode => throw _privateConstructorUsedError;
  String get price => throw _privateConstructorUsedError;
  String get courseId => throw _privateConstructorUsedError;
  String get expireDate => throw _privateConstructorUsedError;
  String get usedCount => throw _privateConstructorUsedError;
  String get limit => throw _privateConstructorUsedError;
  String get month => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CouponCopyWith<Coupon> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CouponCopyWith<$Res> {
  factory $CouponCopyWith(Coupon value, $Res Function(Coupon) then) =
      _$CouponCopyWithImpl<$Res>;
  $Res call(
      {bool isUse,
      String couponCode,
      String price,
      String courseId,
      String expireDate,
      String usedCount,
      String limit,
      String month});
}

/// @nodoc
class _$CouponCopyWithImpl<$Res> implements $CouponCopyWith<$Res> {
  _$CouponCopyWithImpl(this._value, this._then);

  final Coupon _value;
  // ignore: unused_field
  final $Res Function(Coupon) _then;

  @override
  $Res call({
    Object? isUse = freezed,
    Object? couponCode = freezed,
    Object? price = freezed,
    Object? courseId = freezed,
    Object? expireDate = freezed,
    Object? usedCount = freezed,
    Object? limit = freezed,
    Object? month = freezed,
  }) {
    return _then(_value.copyWith(
      isUse: isUse == freezed
          ? _value.isUse
          : isUse // ignore: cast_nullable_to_non_nullable
              as bool,
      couponCode: couponCode == freezed
          ? _value.couponCode
          : couponCode // ignore: cast_nullable_to_non_nullable
              as String,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      courseId: courseId == freezed
          ? _value.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as String,
      expireDate: expireDate == freezed
          ? _value.expireDate
          : expireDate // ignore: cast_nullable_to_non_nullable
              as String,
      usedCount: usedCount == freezed
          ? _value.usedCount
          : usedCount // ignore: cast_nullable_to_non_nullable
              as String,
      limit: limit == freezed
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as String,
      month: month == freezed
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$CouponCopyWith<$Res> implements $CouponCopyWith<$Res> {
  factory _$CouponCopyWith(_Coupon value, $Res Function(_Coupon) then) =
      __$CouponCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isUse,
      String couponCode,
      String price,
      String courseId,
      String expireDate,
      String usedCount,
      String limit,
      String month});
}

/// @nodoc
class __$CouponCopyWithImpl<$Res> extends _$CouponCopyWithImpl<$Res>
    implements _$CouponCopyWith<$Res> {
  __$CouponCopyWithImpl(_Coupon _value, $Res Function(_Coupon) _then)
      : super(_value, (v) => _then(v as _Coupon));

  @override
  _Coupon get _value => super._value as _Coupon;

  @override
  $Res call({
    Object? isUse = freezed,
    Object? couponCode = freezed,
    Object? price = freezed,
    Object? courseId = freezed,
    Object? expireDate = freezed,
    Object? usedCount = freezed,
    Object? limit = freezed,
    Object? month = freezed,
  }) {
    return _then(_Coupon(
      isUse == freezed
          ? _value.isUse
          : isUse // ignore: cast_nullable_to_non_nullable
              as bool,
      couponCode == freezed
          ? _value.couponCode
          : couponCode // ignore: cast_nullable_to_non_nullable
              as String,
      price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      courseId == freezed
          ? _value.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as String,
      expireDate == freezed
          ? _value.expireDate
          : expireDate // ignore: cast_nullable_to_non_nullable
              as String,
      usedCount == freezed
          ? _value.usedCount
          : usedCount // ignore: cast_nullable_to_non_nullable
              as String,
      limit == freezed
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as String,
      month == freezed
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Coupon implements _Coupon {
  _$_Coupon(this.isUse, this.couponCode, this.price, this.courseId,
      this.expireDate, this.usedCount, this.limit, this.month);

  factory _$_Coupon.fromJson(Map<String, dynamic> json) =>
      _$$_CouponFromJson(json);

  @override
  final bool isUse;
  @override
  final String couponCode;
  @override
  final String price;
  @override
  final String courseId;
  @override
  final String expireDate;
  @override
  final String usedCount;
  @override
  final String limit;
  @override
  final String month;

  @override
  String toString() {
    return 'Coupon(isUse: $isUse, couponCode: $couponCode, price: $price, courseId: $courseId, expireDate: $expireDate, usedCount: $usedCount, limit: $limit, month: $month)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Coupon &&
            const DeepCollectionEquality().equals(other.isUse, isUse) &&
            const DeepCollectionEquality()
                .equals(other.couponCode, couponCode) &&
            const DeepCollectionEquality().equals(other.price, price) &&
            const DeepCollectionEquality().equals(other.courseId, courseId) &&
            const DeepCollectionEquality()
                .equals(other.expireDate, expireDate) &&
            const DeepCollectionEquality().equals(other.usedCount, usedCount) &&
            const DeepCollectionEquality().equals(other.limit, limit) &&
            const DeepCollectionEquality().equals(other.month, month));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isUse),
      const DeepCollectionEquality().hash(couponCode),
      const DeepCollectionEquality().hash(price),
      const DeepCollectionEquality().hash(courseId),
      const DeepCollectionEquality().hash(expireDate),
      const DeepCollectionEquality().hash(usedCount),
      const DeepCollectionEquality().hash(limit),
      const DeepCollectionEquality().hash(month));

  @JsonKey(ignore: true)
  @override
  _$CouponCopyWith<_Coupon> get copyWith =>
      __$CouponCopyWithImpl<_Coupon>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CouponToJson(this);
  }
}

abstract class _Coupon implements Coupon {
  factory _Coupon(
      bool isUse,
      String couponCode,
      String price,
      String courseId,
      String expireDate,
      String usedCount,
      String limit,
      String month) = _$_Coupon;

  factory _Coupon.fromJson(Map<String, dynamic> json) = _$_Coupon.fromJson;

  @override
  bool get isUse;
  @override
  String get couponCode;
  @override
  String get price;
  @override
  String get courseId;
  @override
  String get expireDate;
  @override
  String get usedCount;
  @override
  String get limit;
  @override
  String get month;
  @override
  @JsonKey(ignore: true)
  _$CouponCopyWith<_Coupon> get copyWith => throw _privateConstructorUsedError;
}
