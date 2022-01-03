// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'promotion_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PromotionInfo _$PromotionInfoFromJson(Map<String, dynamic> json) {
  return _PromotionInfo.fromJson(json);
}

/// @nodoc
class _$PromotionInfoTearOff {
  const _$PromotionInfoTearOff();

  _PromotionInfo call(String promoId, String title, String description,
      String imgUrl, String backroundImgUrl, int ordering) {
    return _PromotionInfo(
      promoId,
      title,
      description,
      imgUrl,
      backroundImgUrl,
      ordering,
    );
  }

  PromotionInfo fromJson(Map<String, Object?> json) {
    return PromotionInfo.fromJson(json);
  }
}

/// @nodoc
const $PromotionInfo = _$PromotionInfoTearOff();

/// @nodoc
mixin _$PromotionInfo {
  String get promoId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get imgUrl => throw _privateConstructorUsedError;
  String get backroundImgUrl => throw _privateConstructorUsedError;
  int get ordering => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PromotionInfoCopyWith<PromotionInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PromotionInfoCopyWith<$Res> {
  factory $PromotionInfoCopyWith(
          PromotionInfo value, $Res Function(PromotionInfo) then) =
      _$PromotionInfoCopyWithImpl<$Res>;
  $Res call(
      {String promoId,
      String title,
      String description,
      String imgUrl,
      String backroundImgUrl,
      int ordering});
}

/// @nodoc
class _$PromotionInfoCopyWithImpl<$Res>
    implements $PromotionInfoCopyWith<$Res> {
  _$PromotionInfoCopyWithImpl(this._value, this._then);

  final PromotionInfo _value;
  // ignore: unused_field
  final $Res Function(PromotionInfo) _then;

  @override
  $Res call({
    Object? promoId = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? imgUrl = freezed,
    Object? backroundImgUrl = freezed,
    Object? ordering = freezed,
  }) {
    return _then(_value.copyWith(
      promoId: promoId == freezed
          ? _value.promoId
          : promoId // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      imgUrl: imgUrl == freezed
          ? _value.imgUrl
          : imgUrl // ignore: cast_nullable_to_non_nullable
              as String,
      backroundImgUrl: backroundImgUrl == freezed
          ? _value.backroundImgUrl
          : backroundImgUrl // ignore: cast_nullable_to_non_nullable
              as String,
      ordering: ordering == freezed
          ? _value.ordering
          : ordering // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$PromotionInfoCopyWith<$Res>
    implements $PromotionInfoCopyWith<$Res> {
  factory _$PromotionInfoCopyWith(
          _PromotionInfo value, $Res Function(_PromotionInfo) then) =
      __$PromotionInfoCopyWithImpl<$Res>;
  @override
  $Res call(
      {String promoId,
      String title,
      String description,
      String imgUrl,
      String backroundImgUrl,
      int ordering});
}

/// @nodoc
class __$PromotionInfoCopyWithImpl<$Res>
    extends _$PromotionInfoCopyWithImpl<$Res>
    implements _$PromotionInfoCopyWith<$Res> {
  __$PromotionInfoCopyWithImpl(
      _PromotionInfo _value, $Res Function(_PromotionInfo) _then)
      : super(_value, (v) => _then(v as _PromotionInfo));

  @override
  _PromotionInfo get _value => super._value as _PromotionInfo;

  @override
  $Res call({
    Object? promoId = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? imgUrl = freezed,
    Object? backroundImgUrl = freezed,
    Object? ordering = freezed,
  }) {
    return _then(_PromotionInfo(
      promoId == freezed
          ? _value.promoId
          : promoId // ignore: cast_nullable_to_non_nullable
              as String,
      title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      imgUrl == freezed
          ? _value.imgUrl
          : imgUrl // ignore: cast_nullable_to_non_nullable
              as String,
      backroundImgUrl == freezed
          ? _value.backroundImgUrl
          : backroundImgUrl // ignore: cast_nullable_to_non_nullable
              as String,
      ordering == freezed
          ? _value.ordering
          : ordering // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PromotionInfo implements _PromotionInfo {
  _$_PromotionInfo(this.promoId, this.title, this.description, this.imgUrl,
      this.backroundImgUrl, this.ordering);

  factory _$_PromotionInfo.fromJson(Map<String, dynamic> json) =>
      _$$_PromotionInfoFromJson(json);

  @override
  final String promoId;
  @override
  final String title;
  @override
  final String description;
  @override
  final String imgUrl;
  @override
  final String backroundImgUrl;
  @override
  final int ordering;

  @override
  String toString() {
    return 'PromotionInfo(promoId: $promoId, title: $title, description: $description, imgUrl: $imgUrl, backroundImgUrl: $backroundImgUrl, ordering: $ordering)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PromotionInfo &&
            const DeepCollectionEquality().equals(other.promoId, promoId) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.imgUrl, imgUrl) &&
            const DeepCollectionEquality()
                .equals(other.backroundImgUrl, backroundImgUrl) &&
            const DeepCollectionEquality().equals(other.ordering, ordering));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(promoId),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(imgUrl),
      const DeepCollectionEquality().hash(backroundImgUrl),
      const DeepCollectionEquality().hash(ordering));

  @JsonKey(ignore: true)
  @override
  _$PromotionInfoCopyWith<_PromotionInfo> get copyWith =>
      __$PromotionInfoCopyWithImpl<_PromotionInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PromotionInfoToJson(this);
  }
}

abstract class _PromotionInfo implements PromotionInfo {
  factory _PromotionInfo(String promoId, String title, String description,
      String imgUrl, String backroundImgUrl, int ordering) = _$_PromotionInfo;

  factory _PromotionInfo.fromJson(Map<String, dynamic> json) =
      _$_PromotionInfo.fromJson;

  @override
  String get promoId;
  @override
  String get title;
  @override
  String get description;
  @override
  String get imgUrl;
  @override
  String get backroundImgUrl;
  @override
  int get ordering;
  @override
  @JsonKey(ignore: true)
  _$PromotionInfoCopyWith<_PromotionInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
