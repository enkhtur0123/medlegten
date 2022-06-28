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

  _UnitIntroVideo call(String name, String url, String hostSource,
      String needGuide, List<UnitIntroCueParagraph> cue,
      {bool? isCompleted}) {
    return _UnitIntroVideo(
      name,
      url,
      hostSource,
      needGuide,
      cue,
      isCompleted: isCompleted,
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
  String get name => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  String get hostSource => throw _privateConstructorUsedError;
  String get needGuide => throw _privateConstructorUsedError;
  List<UnitIntroCueParagraph> get cue => throw _privateConstructorUsedError;
  bool? get isCompleted => throw _privateConstructorUsedError;

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
      {String name,
      String url,
      String hostSource,
      String needGuide,
      List<UnitIntroCueParagraph> cue,
      bool? isCompleted});
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
    Object? name = freezed,
    Object? url = freezed,
    Object? hostSource = freezed,
    Object? needGuide = freezed,
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
      needGuide: needGuide == freezed
          ? _value.needGuide
          : needGuide // ignore: cast_nullable_to_non_nullable
              as String,
      cue: cue == freezed
          ? _value.cue
          : cue // ignore: cast_nullable_to_non_nullable
              as List<UnitIntroCueParagraph>,
      isCompleted: isCompleted == freezed
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool?,
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
      {String name,
      String url,
      String hostSource,
      String needGuide,
      List<UnitIntroCueParagraph> cue,
      bool? isCompleted});
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
    Object? name = freezed,
    Object? url = freezed,
    Object? hostSource = freezed,
    Object? needGuide = freezed,
    Object? cue = freezed,
    Object? isCompleted = freezed,
  }) {
    return _then(_UnitIntroVideo(
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
      needGuide == freezed
          ? _value.needGuide
          : needGuide // ignore: cast_nullable_to_non_nullable
              as String,
      cue == freezed
          ? _value.cue
          : cue // ignore: cast_nullable_to_non_nullable
              as List<UnitIntroCueParagraph>,
      isCompleted: isCompleted == freezed
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnitIntroVideo implements _UnitIntroVideo {
  _$_UnitIntroVideo(
      this.name, this.url, this.hostSource, this.needGuide, this.cue,
      {this.isCompleted});

  factory _$_UnitIntroVideo.fromJson(Map<String, dynamic> json) =>
      _$$_UnitIntroVideoFromJson(json);

  @override
  final String name;
  @override
  final String url;
  @override
  final String hostSource;
  @override
  final String needGuide;
  @override
  final List<UnitIntroCueParagraph> cue;
  @override
  final bool? isCompleted;

  @override
  String toString() {
    return 'UnitIntroVideo(name: $name, url: $url, hostSource: $hostSource, needGuide: $needGuide, cue: $cue, isCompleted: $isCompleted)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UnitIntroVideo &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.url, url) &&
            const DeepCollectionEquality()
                .equals(other.hostSource, hostSource) &&
            const DeepCollectionEquality().equals(other.needGuide, needGuide) &&
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
      const DeepCollectionEquality().hash(needGuide),
      const DeepCollectionEquality().hash(cue),
      const DeepCollectionEquality().hash(isCompleted));

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
  factory _UnitIntroVideo(String name, String url, String hostSource,
      String needGuide, List<UnitIntroCueParagraph> cue,
      {bool? isCompleted}) = _$_UnitIntroVideo;

  factory _UnitIntroVideo.fromJson(Map<String, dynamic> json) =
      _$_UnitIntroVideo.fromJson;

  @override
  String get name;
  @override
  String get url;
  @override
  String get hostSource;
  @override
  String get needGuide;
  @override
  List<UnitIntroCueParagraph> get cue;
  @override
  bool? get isCompleted;
  @override
  @JsonKey(ignore: true)
  _$UnitIntroVideoCopyWith<_UnitIntroVideo> get copyWith =>
      throw _privateConstructorUsedError;
}
