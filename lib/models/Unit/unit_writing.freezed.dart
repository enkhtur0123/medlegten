// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unit_writing.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnitWriting _$UnitWritingFromJson(Map<String, dynamic> json) {
  return _UnitWriting.fromJson(json);
}

/// @nodoc
class _$UnitWritingTearOff {
  const _$UnitWritingTearOff();

  _UnitWriting call(String name, List<UnitWritingVideo> videos) {
    return _UnitWriting(
      name,
      videos,
    );
  }

  UnitWriting fromJson(Map<String, Object?> json) {
    return UnitWriting.fromJson(json);
  }
}

/// @nodoc
const $UnitWriting = _$UnitWritingTearOff();

/// @nodoc
mixin _$UnitWriting {
  String get name => throw _privateConstructorUsedError;
  List<UnitWritingVideo> get videos => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnitWritingCopyWith<UnitWriting> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnitWritingCopyWith<$Res> {
  factory $UnitWritingCopyWith(
          UnitWriting value, $Res Function(UnitWriting) then) =
      _$UnitWritingCopyWithImpl<$Res>;
  $Res call({String name, List<UnitWritingVideo> videos});
}

/// @nodoc
class _$UnitWritingCopyWithImpl<$Res> implements $UnitWritingCopyWith<$Res> {
  _$UnitWritingCopyWithImpl(this._value, this._then);

  final UnitWriting _value;
  // ignore: unused_field
  final $Res Function(UnitWriting) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? videos = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      videos: videos == freezed
          ? _value.videos
          : videos // ignore: cast_nullable_to_non_nullable
              as List<UnitWritingVideo>,
    ));
  }
}

/// @nodoc
abstract class _$UnitWritingCopyWith<$Res>
    implements $UnitWritingCopyWith<$Res> {
  factory _$UnitWritingCopyWith(
          _UnitWriting value, $Res Function(_UnitWriting) then) =
      __$UnitWritingCopyWithImpl<$Res>;
  @override
  $Res call({String name, List<UnitWritingVideo> videos});
}

/// @nodoc
class __$UnitWritingCopyWithImpl<$Res> extends _$UnitWritingCopyWithImpl<$Res>
    implements _$UnitWritingCopyWith<$Res> {
  __$UnitWritingCopyWithImpl(
      _UnitWriting _value, $Res Function(_UnitWriting) _then)
      : super(_value, (v) => _then(v as _UnitWriting));

  @override
  _UnitWriting get _value => super._value as _UnitWriting;

  @override
  $Res call({
    Object? name = freezed,
    Object? videos = freezed,
  }) {
    return _then(_UnitWriting(
      name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      videos == freezed
          ? _value.videos
          : videos // ignore: cast_nullable_to_non_nullable
              as List<UnitWritingVideo>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnitWriting implements _UnitWriting {
  _$_UnitWriting(this.name, this.videos);

  factory _$_UnitWriting.fromJson(Map<String, dynamic> json) =>
      _$$_UnitWritingFromJson(json);

  @override
  final String name;
  @override
  final List<UnitWritingVideo> videos;

  @override
  String toString() {
    return 'UnitWriting(name: $name, videos: $videos)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UnitWriting &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.videos, videos));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(videos));

  @JsonKey(ignore: true)
  @override
  _$UnitWritingCopyWith<_UnitWriting> get copyWith =>
      __$UnitWritingCopyWithImpl<_UnitWriting>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnitWritingToJson(this);
  }
}

abstract class _UnitWriting implements UnitWriting {
  factory _UnitWriting(String name, List<UnitWritingVideo> videos) =
      _$_UnitWriting;

  factory _UnitWriting.fromJson(Map<String, dynamic> json) =
      _$_UnitWriting.fromJson;

  @override
  String get name;
  @override
  List<UnitWritingVideo> get videos;
  @override
  @JsonKey(ignore: true)
  _$UnitWritingCopyWith<_UnitWriting> get copyWith =>
      throw _privateConstructorUsedError;
}
