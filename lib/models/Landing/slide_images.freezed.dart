// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'slide_images.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SlideImage _$SlideImageFromJson(Map<String, dynamic> json) {
  return _SlideImage.fromJson(json);
}

/// @nodoc
class _$SlideImageTearOff {
  const _$SlideImageTearOff();

  _SlideImage call(String title, String slideImageUrl, String ordering) {
    return _SlideImage(
      title,
      slideImageUrl,
      ordering,
    );
  }

  SlideImage fromJson(Map<String, Object?> json) {
    return SlideImage.fromJson(json);
  }
}

/// @nodoc
const $SlideImage = _$SlideImageTearOff();

/// @nodoc
mixin _$SlideImage {
  String get title => throw _privateConstructorUsedError;
  String get slideImageUrl => throw _privateConstructorUsedError;
  String get ordering => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SlideImageCopyWith<SlideImage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SlideImageCopyWith<$Res> {
  factory $SlideImageCopyWith(
          SlideImage value, $Res Function(SlideImage) then) =
      _$SlideImageCopyWithImpl<$Res>;
  $Res call({String title, String slideImageUrl, String ordering});
}

/// @nodoc
class _$SlideImageCopyWithImpl<$Res> implements $SlideImageCopyWith<$Res> {
  _$SlideImageCopyWithImpl(this._value, this._then);

  final SlideImage _value;
  // ignore: unused_field
  final $Res Function(SlideImage) _then;

  @override
  $Res call({
    Object? title = freezed,
    Object? slideImageUrl = freezed,
    Object? ordering = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      slideImageUrl: slideImageUrl == freezed
          ? _value.slideImageUrl
          : slideImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      ordering: ordering == freezed
          ? _value.ordering
          : ordering // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$SlideImageCopyWith<$Res> implements $SlideImageCopyWith<$Res> {
  factory _$SlideImageCopyWith(
          _SlideImage value, $Res Function(_SlideImage) then) =
      __$SlideImageCopyWithImpl<$Res>;
  @override
  $Res call({String title, String slideImageUrl, String ordering});
}

/// @nodoc
class __$SlideImageCopyWithImpl<$Res> extends _$SlideImageCopyWithImpl<$Res>
    implements _$SlideImageCopyWith<$Res> {
  __$SlideImageCopyWithImpl(
      _SlideImage _value, $Res Function(_SlideImage) _then)
      : super(_value, (v) => _then(v as _SlideImage));

  @override
  _SlideImage get _value => super._value as _SlideImage;

  @override
  $Res call({
    Object? title = freezed,
    Object? slideImageUrl = freezed,
    Object? ordering = freezed,
  }) {
    return _then(_SlideImage(
      title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      slideImageUrl == freezed
          ? _value.slideImageUrl
          : slideImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      ordering == freezed
          ? _value.ordering
          : ordering // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SlideImage implements _SlideImage {
  _$_SlideImage(this.title, this.slideImageUrl, this.ordering);

  factory _$_SlideImage.fromJson(Map<String, dynamic> json) =>
      _$$_SlideImageFromJson(json);

  @override
  final String title;
  @override
  final String slideImageUrl;
  @override
  final String ordering;

  @override
  String toString() {
    return 'SlideImage(title: $title, slideImageUrl: $slideImageUrl, ordering: $ordering)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SlideImage &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality()
                .equals(other.slideImageUrl, slideImageUrl) &&
            const DeepCollectionEquality().equals(other.ordering, ordering));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(slideImageUrl),
      const DeepCollectionEquality().hash(ordering));

  @JsonKey(ignore: true)
  @override
  _$SlideImageCopyWith<_SlideImage> get copyWith =>
      __$SlideImageCopyWithImpl<_SlideImage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SlideImageToJson(this);
  }
}

abstract class _SlideImage implements SlideImage {
  factory _SlideImage(String title, String slideImageUrl, String ordering) =
      _$_SlideImage;

  factory _SlideImage.fromJson(Map<String, dynamic> json) =
      _$_SlideImage.fromJson;

  @override
  String get title;
  @override
  String get slideImageUrl;
  @override
  String get ordering;
  @override
  @JsonKey(ignore: true)
  _$SlideImageCopyWith<_SlideImage> get copyWith =>
      throw _privateConstructorUsedError;
}
