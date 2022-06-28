// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unit_mixed_video.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnitMixedVideo _$UnitMixedVideoFromJson(Map<String, dynamic> json) {
  return _UnitMixedVideo.fromJson(json);
}

/// @nodoc
class _$UnitMixedVideoTearOff {
  const _$UnitMixedVideoTearOff();

  _UnitMixedVideo call(String name, String url, String hostSource,
      List<UnitMixedCueParagraph> cue,
      {bool? isCompleted}) {
    return _UnitMixedVideo(
      name,
      url,
      hostSource,
      cue,
      isCompleted: isCompleted,
    );
  }

  UnitMixedVideo fromJson(Map<String, Object?> json) {
    return UnitMixedVideo.fromJson(json);
  }
}

/// @nodoc
const $UnitMixedVideo = _$UnitMixedVideoTearOff();

/// @nodoc
mixin _$UnitMixedVideo {
  String get name => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  String get hostSource => throw _privateConstructorUsedError;
  List<UnitMixedCueParagraph> get cue => throw _privateConstructorUsedError;
  bool? get isCompleted => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnitMixedVideoCopyWith<UnitMixedVideo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnitMixedVideoCopyWith<$Res> {
  factory $UnitMixedVideoCopyWith(
          UnitMixedVideo value, $Res Function(UnitMixedVideo) then) =
      _$UnitMixedVideoCopyWithImpl<$Res>;
  $Res call(
      {String name,
      String url,
      String hostSource,
      List<UnitMixedCueParagraph> cue,
      bool? isCompleted});
}

/// @nodoc
class _$UnitMixedVideoCopyWithImpl<$Res>
    implements $UnitMixedVideoCopyWith<$Res> {
  _$UnitMixedVideoCopyWithImpl(this._value, this._then);

  final UnitMixedVideo _value;
  // ignore: unused_field
  final $Res Function(UnitMixedVideo) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? url = freezed,
    Object? hostSource = freezed,
    Object? cue = freezed,
    Object? isCompleted = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      hostSource: hostSource == freezed
          ? _value.hostSource
          : hostSource // ignore: cast_nullable_to_non_nullable
              as String,
      cue: cue == freezed
          ? _value.cue
          : cue // ignore: cast_nullable_to_non_nullable
              as List<UnitMixedCueParagraph>,
      isCompleted: isCompleted == freezed
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
abstract class _$UnitMixedVideoCopyWith<$Res>
    implements $UnitMixedVideoCopyWith<$Res> {
  factory _$UnitMixedVideoCopyWith(
          _UnitMixedVideo value, $Res Function(_UnitMixedVideo) then) =
      __$UnitMixedVideoCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      String url,
      String hostSource,
      List<UnitMixedCueParagraph> cue,
      bool? isCompleted});
}

/// @nodoc
class __$UnitMixedVideoCopyWithImpl<$Res>
    extends _$UnitMixedVideoCopyWithImpl<$Res>
    implements _$UnitMixedVideoCopyWith<$Res> {
  __$UnitMixedVideoCopyWithImpl(
      _UnitMixedVideo _value, $Res Function(_UnitMixedVideo) _then)
      : super(_value, (v) => _then(v as _UnitMixedVideo));

  @override
  _UnitMixedVideo get _value => super._value as _UnitMixedVideo;

  @override
  $Res call({
    Object? name = freezed,
    Object? url = freezed,
    Object? hostSource = freezed,
    Object? cue = freezed,
    Object? isCompleted = freezed,
  }) {
    return _then(_UnitMixedVideo(
      name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      hostSource == freezed
          ? _value.hostSource
          : hostSource // ignore: cast_nullable_to_non_nullable
              as String,
      cue == freezed
          ? _value.cue
          : cue // ignore: cast_nullable_to_non_nullable
              as List<UnitMixedCueParagraph>,
      isCompleted: isCompleted == freezed
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnitMixedVideo implements _UnitMixedVideo {
  _$_UnitMixedVideo(this.name, this.url, this.hostSource, this.cue,
      {this.isCompleted});

  factory _$_UnitMixedVideo.fromJson(Map<String, dynamic> json) =>
      _$$_UnitMixedVideoFromJson(json);

  @override
  final String name;
  @override
  final String url;
  @override
  final String hostSource;
  @override
  final List<UnitMixedCueParagraph> cue;
  @override
  final bool? isCompleted;

  @override
  String toString() {
    return 'UnitMixedVideo(name: $name, url: $url, hostSource: $hostSource, cue: $cue, isCompleted: $isCompleted)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UnitMixedVideo &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.url, url) &&
            const DeepCollectionEquality()
                .equals(other.hostSource, hostSource) &&
            const DeepCollectionEquality().equals(other.cue, cue) &&
            const DeepCollectionEquality()
                .equals(other.isCompleted, isCompleted));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(url),
      const DeepCollectionEquality().hash(hostSource),
      const DeepCollectionEquality().hash(cue),
      const DeepCollectionEquality().hash(isCompleted));

  @JsonKey(ignore: true)
  @override
  _$UnitMixedVideoCopyWith<_UnitMixedVideo> get copyWith =>
      __$UnitMixedVideoCopyWithImpl<_UnitMixedVideo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnitMixedVideoToJson(this);
  }
}

abstract class _UnitMixedVideo implements UnitMixedVideo {
  factory _UnitMixedVideo(String name, String url, String hostSource,
      List<UnitMixedCueParagraph> cue,
      {bool? isCompleted}) = _$_UnitMixedVideo;

  factory _UnitMixedVideo.fromJson(Map<String, dynamic> json) =
      _$_UnitMixedVideo.fromJson;

  @override
  String get name;
  @override
  String get url;
  @override
  String get hostSource;
  @override
  List<UnitMixedCueParagraph> get cue;
  @override
  bool? get isCompleted;
  @override
  @JsonKey(ignore: true)
  _$UnitMixedVideoCopyWith<_UnitMixedVideo> get copyWith =>
      throw _privateConstructorUsedError;
}
