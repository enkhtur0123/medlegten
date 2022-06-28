// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unit_writing_video.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnitWritingVideo _$UnitWritingVideoFromJson(Map<String, dynamic> json) {
  return _UnitWritingVideo.fromJson(json);
}

/// @nodoc
class _$UnitWritingVideoTearOff {
  const _$UnitWritingVideoTearOff();

  _UnitWritingVideo call(String videoId, String hostUrl, String hostType,
      String ordering, List<UnitWritingCueParagraph> cue) {
    return _UnitWritingVideo(
      videoId,
      hostUrl,
      hostType,
      ordering,
      cue,
    );
  }

  UnitWritingVideo fromJson(Map<String, Object?> json) {
    return UnitWritingVideo.fromJson(json);
  }
}

/// @nodoc
const $UnitWritingVideo = _$UnitWritingVideoTearOff();

/// @nodoc
mixin _$UnitWritingVideo {
  String get videoId => throw _privateConstructorUsedError;
  String get hostUrl => throw _privateConstructorUsedError;
  String get hostType => throw _privateConstructorUsedError;
  String get ordering => throw _privateConstructorUsedError;
  List<UnitWritingCueParagraph> get cue => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnitWritingVideoCopyWith<UnitWritingVideo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnitWritingVideoCopyWith<$Res> {
  factory $UnitWritingVideoCopyWith(
          UnitWritingVideo value, $Res Function(UnitWritingVideo) then) =
      _$UnitWritingVideoCopyWithImpl<$Res>;
  $Res call(
      {String videoId,
      String hostUrl,
      String hostType,
      String ordering,
      List<UnitWritingCueParagraph> cue});
}

/// @nodoc
class _$UnitWritingVideoCopyWithImpl<$Res>
    implements $UnitWritingVideoCopyWith<$Res> {
  _$UnitWritingVideoCopyWithImpl(this._value, this._then);

  final UnitWritingVideo _value;
  // ignore: unused_field
  final $Res Function(UnitWritingVideo) _then;

  @override
  $Res call({
    Object? videoId = freezed,
    Object? hostUrl = freezed,
    Object? hostType = freezed,
    Object? ordering = freezed,
    Object? cue = freezed,
  }) {
    return _then(_value.copyWith(
      videoId: videoId == freezed
          ? _value.videoId
          : videoId // ignore: cast_nullable_to_non_nullable
              as String,
      hostUrl: hostUrl == freezed
          ? _value.hostUrl
          : hostUrl // ignore: cast_nullable_to_non_nullable
              as String,
      hostType: hostType == freezed
          ? _value.hostType
          : hostType // ignore: cast_nullable_to_non_nullable
              as String,
      ordering: ordering == freezed
          ? _value.ordering
          : ordering // ignore: cast_nullable_to_non_nullable
              as String,
      cue: cue == freezed
          ? _value.cue
          : cue // ignore: cast_nullable_to_non_nullable
              as List<UnitWritingCueParagraph>,
    ));
  }
}

/// @nodoc
abstract class _$UnitWritingVideoCopyWith<$Res>
    implements $UnitWritingVideoCopyWith<$Res> {
  factory _$UnitWritingVideoCopyWith(
          _UnitWritingVideo value, $Res Function(_UnitWritingVideo) then) =
      __$UnitWritingVideoCopyWithImpl<$Res>;
  @override
  $Res call(
      {String videoId,
      String hostUrl,
      String hostType,
      String ordering,
      List<UnitWritingCueParagraph> cue});
}

/// @nodoc
class __$UnitWritingVideoCopyWithImpl<$Res>
    extends _$UnitWritingVideoCopyWithImpl<$Res>
    implements _$UnitWritingVideoCopyWith<$Res> {
  __$UnitWritingVideoCopyWithImpl(
      _UnitWritingVideo _value, $Res Function(_UnitWritingVideo) _then)
      : super(_value, (v) => _then(v as _UnitWritingVideo));

  @override
  _UnitWritingVideo get _value => super._value as _UnitWritingVideo;

  @override
  $Res call({
    Object? videoId = freezed,
    Object? hostUrl = freezed,
    Object? hostType = freezed,
    Object? ordering = freezed,
    Object? cue = freezed,
  }) {
    return _then(_UnitWritingVideo(
      videoId == freezed
          ? _value.videoId
          : videoId // ignore: cast_nullable_to_non_nullable
              as String,
      hostUrl == freezed
          ? _value.hostUrl
          : hostUrl // ignore: cast_nullable_to_non_nullable
              as String,
      hostType == freezed
          ? _value.hostType
          : hostType // ignore: cast_nullable_to_non_nullable
              as String,
      ordering == freezed
          ? _value.ordering
          : ordering // ignore: cast_nullable_to_non_nullable
              as String,
      cue == freezed
          ? _value.cue
          : cue // ignore: cast_nullable_to_non_nullable
              as List<UnitWritingCueParagraph>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnitWritingVideo implements _UnitWritingVideo {
  _$_UnitWritingVideo(
      this.videoId, this.hostUrl, this.hostType, this.ordering, this.cue);

  factory _$_UnitWritingVideo.fromJson(Map<String, dynamic> json) =>
      _$$_UnitWritingVideoFromJson(json);

  @override
  final String videoId;
  @override
  final String hostUrl;
  @override
  final String hostType;
  @override
  final String ordering;
  @override
  final List<UnitWritingCueParagraph> cue;

  @override
  String toString() {
    return 'UnitWritingVideo(videoId: $videoId, hostUrl: $hostUrl, hostType: $hostType, ordering: $ordering, cue: $cue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UnitWritingVideo &&
            const DeepCollectionEquality().equals(other.videoId, videoId) &&
            const DeepCollectionEquality().equals(other.hostUrl, hostUrl) &&
            const DeepCollectionEquality().equals(other.hostType, hostType) &&
            const DeepCollectionEquality().equals(other.ordering, ordering) &&
            const DeepCollectionEquality().equals(other.cue, cue));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(videoId),
      const DeepCollectionEquality().hash(hostUrl),
      const DeepCollectionEquality().hash(hostType),
      const DeepCollectionEquality().hash(ordering),
      const DeepCollectionEquality().hash(cue));

  @JsonKey(ignore: true)
  @override
  _$UnitWritingVideoCopyWith<_UnitWritingVideo> get copyWith =>
      __$UnitWritingVideoCopyWithImpl<_UnitWritingVideo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnitWritingVideoToJson(this);
  }
}

abstract class _UnitWritingVideo implements UnitWritingVideo {
  factory _UnitWritingVideo(String videoId, String hostUrl, String hostType,
      String ordering, List<UnitWritingCueParagraph> cue) = _$_UnitWritingVideo;

  factory _UnitWritingVideo.fromJson(Map<String, dynamic> json) =
      _$_UnitWritingVideo.fromJson;

  @override
  String get videoId;
  @override
  String get hostUrl;
  @override
  String get hostType;
  @override
  String get ordering;
  @override
  List<UnitWritingCueParagraph> get cue;
  @override
  @JsonKey(ignore: true)
  _$UnitWritingVideoCopyWith<_UnitWritingVideo> get copyWith =>
      throw _privateConstructorUsedError;
}
