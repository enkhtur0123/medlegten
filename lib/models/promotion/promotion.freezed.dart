// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'promotion.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Promotion _$PromotionFromJson(Map<String, dynamic> json) {
  return _Promotion.fromJson(json);
}

/// @nodoc
class _$PromotionTearOff {
  const _$PromotionTearOff();

  _Promotion call(
      String? promoId, String? promoName, String? imageUrl, String? webUrl) {
    return _Promotion(
      promoId,
      promoName,
      imageUrl,
      webUrl,
    );
  }

  Promotion fromJson(Map<String, Object?> json) {
    return Promotion.fromJson(json);
  }
}

/// @nodoc
const $Promotion = _$PromotionTearOff();

/// @nodoc
mixin _$Promotion {
  String? get promoId => throw _privateConstructorUsedError;
  String? get promoName => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  String? get webUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PromotionCopyWith<Promotion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PromotionCopyWith<$Res> {
  factory $PromotionCopyWith(Promotion value, $Res Function(Promotion) then) =
      _$PromotionCopyWithImpl<$Res>;
  $Res call(
      {String? promoId, String? promoName, String? imageUrl, String? webUrl});
}

/// @nodoc
class _$PromotionCopyWithImpl<$Res> implements $PromotionCopyWith<$Res> {
  _$PromotionCopyWithImpl(this._value, this._then);

  final Promotion _value;
  // ignore: unused_field
  final $Res Function(Promotion) _then;

  @override
  $Res call({
    Object? promoId = freezed,
    Object? promoName = freezed,
    Object? imageUrl = freezed,
    Object? webUrl = freezed,
  }) {
    return _then(_value.copyWith(
      promoId: promoId == freezed
          ? _value.promoId
          : promoId // ignore: cast_nullable_to_non_nullable
              as String?,
      promoName: promoName == freezed
          ? _value.promoName
          : promoName // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      webUrl: webUrl == freezed
          ? _value.webUrl
          : webUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$PromotionCopyWith<$Res> implements $PromotionCopyWith<$Res> {
  factory _$PromotionCopyWith(
          _Promotion value, $Res Function(_Promotion) then) =
      __$PromotionCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? promoId, String? promoName, String? imageUrl, String? webUrl});
}

/// @nodoc
class __$PromotionCopyWithImpl<$Res> extends _$PromotionCopyWithImpl<$Res>
    implements _$PromotionCopyWith<$Res> {
  __$PromotionCopyWithImpl(_Promotion _value, $Res Function(_Promotion) _then)
      : super(_value, (v) => _then(v as _Promotion));

  @override
  _Promotion get _value => super._value as _Promotion;

  @override
  $Res call({
    Object? promoId = freezed,
    Object? promoName = freezed,
    Object? imageUrl = freezed,
    Object? webUrl = freezed,
  }) {
    return _then(_Promotion(
      promoId == freezed
          ? _value.promoId
          : promoId // ignore: cast_nullable_to_non_nullable
              as String?,
      promoName == freezed
          ? _value.promoName
          : promoName // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      webUrl == freezed
          ? _value.webUrl
          : webUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Promotion implements _Promotion {
  _$_Promotion(this.promoId, this.promoName, this.imageUrl, this.webUrl);

  factory _$_Promotion.fromJson(Map<String, dynamic> json) =>
      _$$_PromotionFromJson(json);

  @override
  final String? promoId;
  @override
  final String? promoName;
  @override
  final String? imageUrl;
  @override
  final String? webUrl;

  @override
  String toString() {
    return 'Promotion(promoId: $promoId, promoName: $promoName, imageUrl: $imageUrl, webUrl: $webUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Promotion &&
            const DeepCollectionEquality().equals(other.promoId, promoId) &&
            const DeepCollectionEquality().equals(other.promoName, promoName) &&
            const DeepCollectionEquality().equals(other.imageUrl, imageUrl) &&
            const DeepCollectionEquality().equals(other.webUrl, webUrl));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(promoId),
      const DeepCollectionEquality().hash(promoName),
      const DeepCollectionEquality().hash(imageUrl),
      const DeepCollectionEquality().hash(webUrl));

  @JsonKey(ignore: true)
  @override
  _$PromotionCopyWith<_Promotion> get copyWith =>
      __$PromotionCopyWithImpl<_Promotion>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PromotionToJson(this);
  }
}

abstract class _Promotion implements Promotion {
  factory _Promotion(String? promoId, String? promoName, String? imageUrl,
      String? webUrl) = _$_Promotion;

  factory _Promotion.fromJson(Map<String, dynamic> json) =
      _$_Promotion.fromJson;

  @override
  String? get promoId;
  @override
  String? get promoName;
  @override
  String? get imageUrl;
  @override
  String? get webUrl;
  @override
  @JsonKey(ignore: true)
  _$PromotionCopyWith<_Promotion> get copyWith =>
      throw _privateConstructorUsedError;
}
