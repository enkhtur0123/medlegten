// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'active_service.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ActiveService _$ActiveServiceFromJson(Map<String, dynamic> json) {
  return _ActiveService.fromJson(json);
}

/// @nodoc
class _$ActiveServiceTearOff {
  const _$ActiveServiceTearOff();

  _ActiveService call(String productId, String productName, String expireDate,
      String paymentType) {
    return _ActiveService(
      productId,
      productName,
      expireDate,
      paymentType,
    );
  }

  ActiveService fromJson(Map<String, Object?> json) {
    return ActiveService.fromJson(json);
  }
}

/// @nodoc
const $ActiveService = _$ActiveServiceTearOff();

/// @nodoc
mixin _$ActiveService {
  String get productId => throw _privateConstructorUsedError;
  String get productName => throw _privateConstructorUsedError;
  String get expireDate => throw _privateConstructorUsedError;
  String get paymentType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ActiveServiceCopyWith<ActiveService> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActiveServiceCopyWith<$Res> {
  factory $ActiveServiceCopyWith(
          ActiveService value, $Res Function(ActiveService) then) =
      _$ActiveServiceCopyWithImpl<$Res>;
  $Res call(
      {String productId,
      String productName,
      String expireDate,
      String paymentType});
}

/// @nodoc
class _$ActiveServiceCopyWithImpl<$Res>
    implements $ActiveServiceCopyWith<$Res> {
  _$ActiveServiceCopyWithImpl(this._value, this._then);

  final ActiveService _value;
  // ignore: unused_field
  final $Res Function(ActiveService) _then;

  @override
  $Res call({
    Object? productId = freezed,
    Object? productName = freezed,
    Object? expireDate = freezed,
    Object? paymentType = freezed,
  }) {
    return _then(_value.copyWith(
      productId: productId == freezed
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      productName: productName == freezed
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      expireDate: expireDate == freezed
          ? _value.expireDate
          : expireDate // ignore: cast_nullable_to_non_nullable
              as String,
      paymentType: paymentType == freezed
          ? _value.paymentType
          : paymentType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$ActiveServiceCopyWith<$Res>
    implements $ActiveServiceCopyWith<$Res> {
  factory _$ActiveServiceCopyWith(
          _ActiveService value, $Res Function(_ActiveService) then) =
      __$ActiveServiceCopyWithImpl<$Res>;
  @override
  $Res call(
      {String productId,
      String productName,
      String expireDate,
      String paymentType});
}

/// @nodoc
class __$ActiveServiceCopyWithImpl<$Res>
    extends _$ActiveServiceCopyWithImpl<$Res>
    implements _$ActiveServiceCopyWith<$Res> {
  __$ActiveServiceCopyWithImpl(
      _ActiveService _value, $Res Function(_ActiveService) _then)
      : super(_value, (v) => _then(v as _ActiveService));

  @override
  _ActiveService get _value => super._value as _ActiveService;

  @override
  $Res call({
    Object? productId = freezed,
    Object? productName = freezed,
    Object? expireDate = freezed,
    Object? paymentType = freezed,
  }) {
    return _then(_ActiveService(
      productId == freezed
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      productName == freezed
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      expireDate == freezed
          ? _value.expireDate
          : expireDate // ignore: cast_nullable_to_non_nullable
              as String,
      paymentType == freezed
          ? _value.paymentType
          : paymentType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ActiveService implements _ActiveService {
  _$_ActiveService(
      this.productId, this.productName, this.expireDate, this.paymentType);

  factory _$_ActiveService.fromJson(Map<String, dynamic> json) =>
      _$$_ActiveServiceFromJson(json);

  @override
  final String productId;
  @override
  final String productName;
  @override
  final String expireDate;
  @override
  final String paymentType;

  @override
  String toString() {
    return 'ActiveService(productId: $productId, productName: $productName, expireDate: $expireDate, paymentType: $paymentType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ActiveService &&
            const DeepCollectionEquality().equals(other.productId, productId) &&
            const DeepCollectionEquality()
                .equals(other.productName, productName) &&
            const DeepCollectionEquality()
                .equals(other.expireDate, expireDate) &&
            const DeepCollectionEquality()
                .equals(other.paymentType, paymentType));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(productId),
      const DeepCollectionEquality().hash(productName),
      const DeepCollectionEquality().hash(expireDate),
      const DeepCollectionEquality().hash(paymentType));

  @JsonKey(ignore: true)
  @override
  _$ActiveServiceCopyWith<_ActiveService> get copyWith =>
      __$ActiveServiceCopyWithImpl<_ActiveService>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ActiveServiceToJson(this);
  }
}

abstract class _ActiveService implements ActiveService {
  factory _ActiveService(String productId, String productName,
      String expireDate, String paymentType) = _$_ActiveService;

  factory _ActiveService.fromJson(Map<String, dynamic> json) =
      _$_ActiveService.fromJson;

  @override
  String get productId;
  @override
  String get productName;
  @override
  String get expireDate;
  @override
  String get paymentType;
  @override
  @JsonKey(ignore: true)
  _$ActiveServiceCopyWith<_ActiveService> get copyWith =>
      throw _privateConstructorUsedError;
}
