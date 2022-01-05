// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'customer_review.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CustomerReview _$CustomerReviewFromJson(Map<String, dynamic> json) {
  return _CustomerReview.fromJson(json);
}

/// @nodoc
class _$CustomerReviewTearOff {
  const _$CustomerReviewTearOff();

  _CustomerReview call(String reviewId, String profileImg, String fullName,
      String position, String description, int star) {
    return _CustomerReview(
      reviewId,
      profileImg,
      fullName,
      position,
      description,
      star,
    );
  }

  CustomerReview fromJson(Map<String, Object?> json) {
    return CustomerReview.fromJson(json);
  }
}

/// @nodoc
const $CustomerReview = _$CustomerReviewTearOff();

/// @nodoc
mixin _$CustomerReview {
  String get reviewId => throw _privateConstructorUsedError;
  String get profileImg => throw _privateConstructorUsedError;
  String get fullName => throw _privateConstructorUsedError;
  String get position => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  int get star => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CustomerReviewCopyWith<CustomerReview> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerReviewCopyWith<$Res> {
  factory $CustomerReviewCopyWith(
          CustomerReview value, $Res Function(CustomerReview) then) =
      _$CustomerReviewCopyWithImpl<$Res>;
  $Res call(
      {String reviewId,
      String profileImg,
      String fullName,
      String position,
      String description,
      int star});
}

/// @nodoc
class _$CustomerReviewCopyWithImpl<$Res>
    implements $CustomerReviewCopyWith<$Res> {
  _$CustomerReviewCopyWithImpl(this._value, this._then);

  final CustomerReview _value;
  // ignore: unused_field
  final $Res Function(CustomerReview) _then;

  @override
  $Res call({
    Object? reviewId = freezed,
    Object? profileImg = freezed,
    Object? fullName = freezed,
    Object? position = freezed,
    Object? description = freezed,
    Object? star = freezed,
  }) {
    return _then(_value.copyWith(
      reviewId: reviewId == freezed
          ? _value.reviewId
          : reviewId // ignore: cast_nullable_to_non_nullable
              as String,
      profileImg: profileImg == freezed
          ? _value.profileImg
          : profileImg // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: fullName == freezed
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      position: position == freezed
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      star: star == freezed
          ? _value.star
          : star // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$CustomerReviewCopyWith<$Res>
    implements $CustomerReviewCopyWith<$Res> {
  factory _$CustomerReviewCopyWith(
          _CustomerReview value, $Res Function(_CustomerReview) then) =
      __$CustomerReviewCopyWithImpl<$Res>;
  @override
  $Res call(
      {String reviewId,
      String profileImg,
      String fullName,
      String position,
      String description,
      int star});
}

/// @nodoc
class __$CustomerReviewCopyWithImpl<$Res>
    extends _$CustomerReviewCopyWithImpl<$Res>
    implements _$CustomerReviewCopyWith<$Res> {
  __$CustomerReviewCopyWithImpl(
      _CustomerReview _value, $Res Function(_CustomerReview) _then)
      : super(_value, (v) => _then(v as _CustomerReview));

  @override
  _CustomerReview get _value => super._value as _CustomerReview;

  @override
  $Res call({
    Object? reviewId = freezed,
    Object? profileImg = freezed,
    Object? fullName = freezed,
    Object? position = freezed,
    Object? description = freezed,
    Object? star = freezed,
  }) {
    return _then(_CustomerReview(
      reviewId == freezed
          ? _value.reviewId
          : reviewId // ignore: cast_nullable_to_non_nullable
              as String,
      profileImg == freezed
          ? _value.profileImg
          : profileImg // ignore: cast_nullable_to_non_nullable
              as String,
      fullName == freezed
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      position == freezed
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as String,
      description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      star == freezed
          ? _value.star
          : star // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CustomerReview implements _CustomerReview {
  _$_CustomerReview(this.reviewId, this.profileImg, this.fullName,
      this.position, this.description, this.star);

  factory _$_CustomerReview.fromJson(Map<String, dynamic> json) =>
      _$$_CustomerReviewFromJson(json);

  @override
  final String reviewId;
  @override
  final String profileImg;
  @override
  final String fullName;
  @override
  final String position;
  @override
  final String description;
  @override
  final int star;

  @override
  String toString() {
    return 'CustomerReview(reviewId: $reviewId, profileImg: $profileImg, fullName: $fullName, position: $position, description: $description, star: $star)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CustomerReview &&
            const DeepCollectionEquality().equals(other.reviewId, reviewId) &&
            const DeepCollectionEquality()
                .equals(other.profileImg, profileImg) &&
            const DeepCollectionEquality().equals(other.fullName, fullName) &&
            const DeepCollectionEquality().equals(other.position, position) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.star, star));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(reviewId),
      const DeepCollectionEquality().hash(profileImg),
      const DeepCollectionEquality().hash(fullName),
      const DeepCollectionEquality().hash(position),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(star));

  @JsonKey(ignore: true)
  @override
  _$CustomerReviewCopyWith<_CustomerReview> get copyWith =>
      __$CustomerReviewCopyWithImpl<_CustomerReview>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CustomerReviewToJson(this);
  }
}

abstract class _CustomerReview implements CustomerReview {
  factory _CustomerReview(String reviewId, String profileImg, String fullName,
      String position, String description, int star) = _$_CustomerReview;

  factory _CustomerReview.fromJson(Map<String, dynamic> json) =
      _$_CustomerReview.fromJson;

  @override
  String get reviewId;
  @override
  String get profileImg;
  @override
  String get fullName;
  @override
  String get position;
  @override
  String get description;
  @override
  int get star;
  @override
  @JsonKey(ignore: true)
  _$CustomerReviewCopyWith<_CustomerReview> get copyWith =>
      throw _privateConstructorUsedError;
}
