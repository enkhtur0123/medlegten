// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unit_conversation_video.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnitConversationVideo _$UnitConversationVideoFromJson(
    Map<String, dynamic> json) {
  return _UnitConversationVideo.fromJson(json);
}

/// @nodoc
class _$UnitConversationVideoTearOff {
  const _$UnitConversationVideoTearOff();

  _UnitConversationVideo call(String name, String url, String hostSource,
      List<UnitIntroCueParagraph> cue,
      {bool? isCompleted}) {
    return _UnitConversationVideo(
      name,
      url,
      hostSource,
      cue,
      isCompleted: isCompleted,
    );
  }

  UnitConversationVideo fromJson(Map<String, Object?> json) {
    return UnitConversationVideo.fromJson(json);
  }
}

/// @nodoc
const $UnitConversationVideo = _$UnitConversationVideoTearOff();

/// @nodoc
mixin _$UnitConversationVideo {
  String get name => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  String get hostSource => throw _privateConstructorUsedError;
  List<UnitIntroCueParagraph> get cue => throw _privateConstructorUsedError;
  bool? get isCompleted => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnitConversationVideoCopyWith<UnitConversationVideo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnitConversationVideoCopyWith<$Res> {
  factory $UnitConversationVideoCopyWith(UnitConversationVideo value,
          $Res Function(UnitConversationVideo) then) =
      _$UnitConversationVideoCopyWithImpl<$Res>;
  $Res call(
      {String name,
      String url,
      String hostSource,
      List<UnitIntroCueParagraph> cue,
      bool? isCompleted});
}

/// @nodoc
class _$UnitConversationVideoCopyWithImpl<$Res>
    implements $UnitConversationVideoCopyWith<$Res> {
  _$UnitConversationVideoCopyWithImpl(this._value, this._then);

  final UnitConversationVideo _value;
  // ignore: unused_field
  final $Res Function(UnitConversationVideo) _then;

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
              as List<UnitIntroCueParagraph>,
      isCompleted: isCompleted == freezed
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
abstract class _$UnitConversationVideoCopyWith<$Res>
    implements $UnitConversationVideoCopyWith<$Res> {
  factory _$UnitConversationVideoCopyWith(_UnitConversationVideo value,
          $Res Function(_UnitConversationVideo) then) =
      __$UnitConversationVideoCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      String url,
      String hostSource,
      List<UnitIntroCueParagraph> cue,
      bool? isCompleted});
}

/// @nodoc
class __$UnitConversationVideoCopyWithImpl<$Res>
    extends _$UnitConversationVideoCopyWithImpl<$Res>
    implements _$UnitConversationVideoCopyWith<$Res> {
  __$UnitConversationVideoCopyWithImpl(_UnitConversationVideo _value,
      $Res Function(_UnitConversationVideo) _then)
      : super(_value, (v) => _then(v as _UnitConversationVideo));

  @override
  _UnitConversationVideo get _value => super._value as _UnitConversationVideo;

  @override
  $Res call({
    Object? name = freezed,
    Object? url = freezed,
    Object? hostSource = freezed,
    Object? cue = freezed,
    Object? isCompleted = freezed,
  }) {
    return _then(_UnitConversationVideo(
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
class _$_UnitConversationVideo implements _UnitConversationVideo {
  _$_UnitConversationVideo(this.name, this.url, this.hostSource, this.cue,
      {this.isCompleted});

  factory _$_UnitConversationVideo.fromJson(Map<String, dynamic> json) =>
      _$$_UnitConversationVideoFromJson(json);

  @override
  final String name;
  @override
  final String url;
  @override
  final String hostSource;
  @override
  final List<UnitIntroCueParagraph> cue;
  @override
  final bool? isCompleted;

  @override
  String toString() {
    return 'UnitConversationVideo(name: $name, url: $url, hostSource: $hostSource, cue: $cue, isCompleted: $isCompleted)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UnitConversationVideo &&
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
  _$UnitConversationVideoCopyWith<_UnitConversationVideo> get copyWith =>
      __$UnitConversationVideoCopyWithImpl<_UnitConversationVideo>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnitConversationVideoToJson(this);
  }
}

abstract class _UnitConversationVideo implements UnitConversationVideo {
  factory _UnitConversationVideo(String name, String url, String hostSource,
          List<UnitIntroCueParagraph> cue, {bool? isCompleted}) =
      _$_UnitConversationVideo;

  factory _UnitConversationVideo.fromJson(Map<String, dynamic> json) =
      _$_UnitConversationVideo.fromJson;

  @override
  String get name;
  @override
  String get url;
  @override
  String get hostSource;
  @override
  List<UnitIntroCueParagraph> get cue;
  @override
  bool? get isCompleted;
  @override
  @JsonKey(ignore: true)
  _$UnitConversationVideoCopyWith<_UnitConversationVideo> get copyWith =>
      throw _privateConstructorUsedError;
}
