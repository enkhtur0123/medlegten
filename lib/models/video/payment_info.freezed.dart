// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'payment_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PaymentInfo _$PaymentInfoFromJson(Map<String, dynamic> json) {
  return _PaymentInfo.fromJson(json);
}

/// @nodoc
class _$PaymentInfoTearOff {
  const _$PaymentInfoTearOff();

  _PaymentInfo call(
      bool? isPurchased,
      String? isExpireDate,
      String? productId,
      String? productName,
      String? productDesc,
      String? price,
      List<Price> prices) {
    return _PaymentInfo(
      isPurchased,
      isExpireDate,
      productId,
      productName,
      productDesc,
      price,
      prices,
    );
  }

  PaymentInfo fromJson(Map<String, Object?> json) {
    return PaymentInfo.fromJson(json);
  }
}

/// @nodoc
const $PaymentInfo = _$PaymentInfoTearOff();

/// @nodoc
mixin _$PaymentInfo {
  bool? get isPurchased => throw _privateConstructorUsedError;
  String? get isExpireDate => throw _privateConstructorUsedError;
  String? get productId => throw _privateConstructorUsedError;
  String? get productName => throw _privateConstructorUsedError;
  String? get productDesc => throw _privateConstructorUsedError;
  String? get price => throw _privateConstructorUsedError;
  List<Price> get prices => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaymentInfoCopyWith<PaymentInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentInfoCopyWith<$Res> {
  factory $PaymentInfoCopyWith(
          PaymentInfo value, $Res Function(PaymentInfo) then) =
      _$PaymentInfoCopyWithImpl<$Res>;
  $Res call(
      {bool? isPurchased,
      String? isExpireDate,
      String? productId,
      String? productName,
      String? productDesc,
      String? price,
      List<Price> prices});
}

/// @nodoc
class _$PaymentInfoCopyWithImpl<$Res> implements $PaymentInfoCopyWith<$Res> {
  _$PaymentInfoCopyWithImpl(this._value, this._then);

  final PaymentInfo _value;
  // ignore: unused_field
  final $Res Function(PaymentInfo) _then;

  @override
  $Res call({
    Object? isPurchased = freezed,
    Object? isExpireDate = freezed,
    Object? productId = freezed,
    Object? productName = freezed,
    Object? productDesc = freezed,
    Object? price = freezed,
    Object? prices = freezed,
  }) {
    return _then(_value.copyWith(
      isPurchased: isPurchased == freezed
          ? _value.isPurchased
          : isPurchased // ignore: cast_nullable_to_non_nullable
              as bool?,
      isExpireDate: isExpireDate == freezed
          ? _value.isExpireDate
          : isExpireDate // ignore: cast_nullable_to_non_nullable
              as String?,
      productId: productId == freezed
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String?,
      productName: productName == freezed
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String?,
      productDesc: productDesc == freezed
          ? _value.productDesc
          : productDesc // ignore: cast_nullable_to_non_nullable
              as String?,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String?,
      prices: prices == freezed
          ? _value.prices
          : prices // ignore: cast_nullable_to_non_nullable
              as List<Price>,
    ));
  }
}

/// @nodoc
abstract class _$PaymentInfoCopyWith<$Res>
    implements $PaymentInfoCopyWith<$Res> {
  factory _$PaymentInfoCopyWith(
          _PaymentInfo value, $Res Function(_PaymentInfo) then) =
      __$PaymentInfoCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool? isPurchased,
      String? isExpireDate,
      String? productId,
      String? productName,
      String? productDesc,
      String? price,
      List<Price> prices});
}

/// @nodoc
class __$PaymentInfoCopyWithImpl<$Res> extends _$PaymentInfoCopyWithImpl<$Res>
    implements _$PaymentInfoCopyWith<$Res> {
  __$PaymentInfoCopyWithImpl(
      _PaymentInfo _value, $Res Function(_PaymentInfo) _then)
      : super(_value, (v) => _then(v as _PaymentInfo));

  @override
  _PaymentInfo get _value => super._value as _PaymentInfo;

  @override
  $Res call({
    Object? isPurchased = freezed,
    Object? isExpireDate = freezed,
    Object? productId = freezed,
    Object? productName = freezed,
    Object? productDesc = freezed,
    Object? price = freezed,
    Object? prices = freezed,
  }) {
    return _then(_PaymentInfo(
      isPurchased == freezed
          ? _value.isPurchased
          : isPurchased // ignore: cast_nullable_to_non_nullable
              as bool?,
      isExpireDate == freezed
          ? _value.isExpireDate
          : isExpireDate // ignore: cast_nullable_to_non_nullable
              as String?,
      productId == freezed
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String?,
      productName == freezed
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String?,
      productDesc == freezed
          ? _value.productDesc
          : productDesc // ignore: cast_nullable_to_non_nullable
              as String?,
      price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String?,
      prices == freezed
          ? _value.prices
          : prices // ignore: cast_nullable_to_non_nullable
              as List<Price>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PaymentInfo implements _PaymentInfo {
  _$_PaymentInfo(this.isPurchased, this.isExpireDate, this.productId,
      this.productName, this.productDesc, this.price, this.prices);

  factory _$_PaymentInfo.fromJson(Map<String, dynamic> json) =>
      _$$_PaymentInfoFromJson(json);

  @override
  final bool? isPurchased;
  @override
  final String? isExpireDate;
  @override
  final String? productId;
  @override
  final String? productName;
  @override
  final String? productDesc;
  @override
  final String? price;
  @override
  final List<Price> prices;

  @override
  String toString() {
    return 'PaymentInfo(isPurchased: $isPurchased, isExpireDate: $isExpireDate, productId: $productId, productName: $productName, productDesc: $productDesc, price: $price, prices: $prices)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PaymentInfo &&
            const DeepCollectionEquality()
                .equals(other.isPurchased, isPurchased) &&
            const DeepCollectionEquality()
                .equals(other.isExpireDate, isExpireDate) &&
            const DeepCollectionEquality().equals(other.productId, productId) &&
            const DeepCollectionEquality()
                .equals(other.productName, productName) &&
            const DeepCollectionEquality()
                .equals(other.productDesc, productDesc) &&
            const DeepCollectionEquality().equals(other.price, price) &&
            const DeepCollectionEquality().equals(other.prices, prices));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isPurchased),
      const DeepCollectionEquality().hash(isExpireDate),
      const DeepCollectionEquality().hash(productId),
      const DeepCollectionEquality().hash(productName),
      const DeepCollectionEquality().hash(productDesc),
      const DeepCollectionEquality().hash(price),
      const DeepCollectionEquality().hash(prices));

  @JsonKey(ignore: true)
  @override
  _$PaymentInfoCopyWith<_PaymentInfo> get copyWith =>
      __$PaymentInfoCopyWithImpl<_PaymentInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PaymentInfoToJson(this);
  }
}

abstract class _PaymentInfo implements PaymentInfo {
  factory _PaymentInfo(
      bool? isPurchased,
      String? isExpireDate,
      String? productId,
      String? productName,
      String? productDesc,
      String? price,
      List<Price> prices) = _$_PaymentInfo;

  factory _PaymentInfo.fromJson(Map<String, dynamic> json) =
      _$_PaymentInfo.fromJson;

  @override
  bool? get isPurchased;
  @override
  String? get isExpireDate;
  @override
  String? get productId;
  @override
  String? get productName;
  @override
  String? get productDesc;
  @override
  String? get price;
  @override
  List<Price> get prices;
  @override
  @JsonKey(ignore: true)
  _$PaymentInfoCopyWith<_PaymentInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
