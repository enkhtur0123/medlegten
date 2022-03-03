// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'last_seen_video.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LastSeenVideo _$LastSeenVideoFromJson(Map<String, dynamic> json) {
  return _LastSeenVideo.fromJson(json);
}

/// @nodoc
class _$LastSeenVideoTearOff {
  const _$LastSeenVideoTearOff();

  _LastSeenVideo call(String? contentId, String? contentName, String? imgUrl) {
    return _LastSeenVideo(
      contentId,
      contentName,
      imgUrl,
    );
  }

  LastSeenVideo fromJson(Map<String, Object?> json) {
    return LastSeenVideo.fromJson(json);
  }
}

/// @nodoc
const $LastSeenVideo = _$LastSeenVideoTearOff();

/// @nodoc
mixin _$LastSeenVideo {
  String? get contentId => throw _privateConstructorUsedError;
  String? get contentName => throw _privateConstructorUsedError;
  String? get imgUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LastSeenVideoCopyWith<LastSeenVideo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LastSeenVideoCopyWith<$Res> {
  factory $LastSeenVideoCopyWith(
          LastSeenVideo value, $Res Function(LastSeenVideo) then) =
      _$LastSeenVideoCopyWithImpl<$Res>;
  $Res call({String? contentId, String? contentName, String? imgUrl});
}

/// @nodoc
class _$LastSeenVideoCopyWithImpl<$Res>
    implements $LastSeenVideoCopyWith<$Res> {
  _$LastSeenVideoCopyWithImpl(this._value, this._then);

  final LastSeenVideo _value;
  // ignore: unused_field
  final $Res Function(LastSeenVideo) _then;

  @override
  $Res call({
    Object? contentId = freezed,
    Object? contentName = freezed,
    Object? imgUrl = freezed,
  }) {
    return _then(_value.copyWith(
      contentId: contentId == freezed
          ? _value.contentId
          : contentId // ignore: cast_nullable_to_non_nullable
              as String?,
      contentName: contentName == freezed
          ? _value.contentName
          : contentName // ignore: cast_nullable_to_non_nullable
              as String?,
      imgUrl: imgUrl == freezed
          ? _value.imgUrl
          : imgUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$LastSeenVideoCopyWith<$Res>
    implements $LastSeenVideoCopyWith<$Res> {
  factory _$LastSeenVideoCopyWith(
          _LastSeenVideo value, $Res Function(_LastSeenVideo) then) =
      __$LastSeenVideoCopyWithImpl<$Res>;
  @override
  $Res call({String? contentId, String? contentName, String? imgUrl});
}

/// @nodoc
class __$LastSeenVideoCopyWithImpl<$Res>
    extends _$LastSeenVideoCopyWithImpl<$Res>
    implements _$LastSeenVideoCopyWith<$Res> {
  __$LastSeenVideoCopyWithImpl(
      _LastSeenVideo _value, $Res Function(_LastSeenVideo) _then)
      : super(_value, (v) => _then(v as _LastSeenVideo));

  @override
  _LastSeenVideo get _value => super._value as _LastSeenVideo;

  @override
  $Res call({
    Object? contentId = freezed,
    Object? contentName = freezed,
    Object? imgUrl = freezed,
  }) {
    return _then(_LastSeenVideo(
      contentId == freezed
          ? _value.contentId
          : contentId // ignore: cast_nullable_to_non_nullable
              as String?,
      contentName == freezed
          ? _value.contentName
          : contentName // ignore: cast_nullable_to_non_nullable
              as String?,
      imgUrl == freezed
          ? _value.imgUrl
          : imgUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LastSeenVideo implements _LastSeenVideo {
  _$_LastSeenVideo(this.contentId, this.contentName, this.imgUrl);

  factory _$_LastSeenVideo.fromJson(Map<String, dynamic> json) =>
      _$$_LastSeenVideoFromJson(json);

  @override
  final String? contentId;
  @override
  final String? contentName;
  @override
  final String? imgUrl;

  @override
  String toString() {
    return 'LastSeenVideo(contentId: $contentId, contentName: $contentName, imgUrl: $imgUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LastSeenVideo &&
            const DeepCollectionEquality().equals(other.contentId, contentId) &&
            const DeepCollectionEquality()
                .equals(other.contentName, contentName) &&
            const DeepCollectionEquality().equals(other.imgUrl, imgUrl));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(contentId),
      const DeepCollectionEquality().hash(contentName),
      const DeepCollectionEquality().hash(imgUrl));

  @JsonKey(ignore: true)
  @override
  _$LastSeenVideoCopyWith<_LastSeenVideo> get copyWith =>
      __$LastSeenVideoCopyWithImpl<_LastSeenVideo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LastSeenVideoToJson(this);
  }
}

abstract class _LastSeenVideo implements LastSeenVideo {
  factory _LastSeenVideo(
          String? contentId, String? contentName, String? imgUrl) =
      _$_LastSeenVideo;

  factory _LastSeenVideo.fromJson(Map<String, dynamic> json) =
      _$_LastSeenVideo.fromJson;

  @override
  String? get contentId;
  @override
  String? get contentName;
  @override
  String? get imgUrl;
  @override
  @JsonKey(ignore: true)
  _$LastSeenVideoCopyWith<_LastSeenVideo> get copyWith =>
      throw _privateConstructorUsedError;
}
