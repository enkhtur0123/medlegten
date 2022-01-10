// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unit_introduction_video.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnitIntroVideo _$UnitIntroVideoFromJson(Map<String, dynamic> json) {
  return _UnitIntroVideo.fromJson(json);
}

/// @nodoc
class _$UnitIntroVideoTearOff {
  const _$UnitIntroVideoTearOff();

  _UnitIntroVideo call(
      String id, String name, String url, List<UnitIntroCueParagraph> cues) {
    return _UnitIntroVideo(
      id,
      name,
      url,
      cues,
    );
  }

  UnitIntroVideo fromJson(Map<String, Object?> json) {
    return UnitIntroVideo.fromJson(json);
  }
}

/// @nodoc
const $UnitIntroVideo = _$UnitIntroVideoTearOff();

/// @nodoc
mixin _$UnitIntroVideo {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  List<UnitIntroCueParagraph> get cues => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnitIntroVideoCopyWith<UnitIntroVideo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnitIntroVideoCopyWith<$Res> {
  factory $UnitIntroVideoCopyWith(
          UnitIntroVideo value, $Res Function(UnitIntroVideo) then) =
      _$UnitIntroVideoCopyWithImpl<$Res>;
  $Res call(
      {String id, String name, String url, List<UnitIntroCueParagraph> cues});
}

/// @nodoc
class _$UnitIntroVideoCopyWithImpl<$Res>
    implements $UnitIntroVideoCopyWith<$Res> {
  _$UnitIntroVideoCopyWithImpl(this._value, this._then);

  final UnitIntroVideo _value;
  // ignore: unused_field
  final $Res Function(UnitIntroVideo) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? url = freezed,
    Object? cues = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      cues: cues == freezed
          ? _value.cues
          : cues // ignore: cast_nullable_to_non_nullable
              as List<UnitIntroCueParagraph>,
    ));
  }
}

/// @nodoc
abstract class _$UnitIntroVideoCopyWith<$Res>
    implements $UnitIntroVideoCopyWith<$Res> {
  factory _$UnitIntroVideoCopyWith(
          _UnitIntroVideo value, $Res Function(_UnitIntroVideo) then) =
      __$UnitIntroVideoCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id, String name, String url, List<UnitIntroCueParagraph> cues});
}

/// @nodoc
class __$UnitIntroVideoCopyWithImpl<$Res>
    extends _$UnitIntroVideoCopyWithImpl<$Res>
    implements _$UnitIntroVideoCopyWith<$Res> {
  __$UnitIntroVideoCopyWithImpl(
      _UnitIntroVideo _value, $Res Function(_UnitIntroVideo) _then)
      : super(_value, (v) => _then(v as _UnitIntroVideo));

  @override
  _UnitIntroVideo get _value => super._value as _UnitIntroVideo;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? url = freezed,
    Object? cues = freezed,
  }) {
    return _then(_UnitIntroVideo(
      id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      cues == freezed
          ? _value.cues
          : cues // ignore: cast_nullable_to_non_nullable
              as List<UnitIntroCueParagraph>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnitIntroVideo implements _UnitIntroVideo {
  _$_UnitIntroVideo(this.id, this.name, this.url, this.cues);

  factory _$_UnitIntroVideo.fromJson(Map<String, dynamic> json) =>
      _$$_UnitIntroVideoFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String url;
  @override
  final List<UnitIntroCueParagraph> cues;

  @override
  String toString() {
    return 'UnitIntroVideo(id: $id, name: $name, url: $url, cues: $cues)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UnitIntroVideo &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.url, url) &&
            const DeepCollectionEquality().equals(other.cues, cues));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(url),
      const DeepCollectionEquality().hash(cues));

  @JsonKey(ignore: true)
  @override
  _$UnitIntroVideoCopyWith<_UnitIntroVideo> get copyWith =>
      __$UnitIntroVideoCopyWithImpl<_UnitIntroVideo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnitIntroVideoToJson(this);
  }
}

abstract class _UnitIntroVideo implements UnitIntroVideo {
  factory _UnitIntroVideo(String id, String name, String url,
      List<UnitIntroCueParagraph> cues) = _$_UnitIntroVideo;

  factory _UnitIntroVideo.fromJson(Map<String, dynamic> json) =
      _$_UnitIntroVideo.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get url;
  @override
  List<UnitIntroCueParagraph> get cues;
  @override
  @JsonKey(ignore: true)
  _$UnitIntroVideoCopyWith<_UnitIntroVideo> get copyWith =>
      throw _privateConstructorUsedError;
}
