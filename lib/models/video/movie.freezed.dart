// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'movie.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Movie _$MovieFromJson(Map<String, dynamic> json) {
  return _Movie.fromJson(json);
}

/// @nodoc
class _$MovieTearOff {
  const _$MovieTearOff();

  _Movie call(
      String? contentId,
      String? contentName,
      String? categoryId,
      String? categoryName,
      String? levelId,
      String? levelName,
      String? vocabularyCount,
      String? imgUrl,
      String? intro,
      String? isSerial,
      String? hostUrl,
      String? hostType,
      String? runTime,
      String? movieId) {
    return _Movie(
      contentId,
      contentName,
      categoryId,
      categoryName,
      levelId,
      levelName,
      vocabularyCount,
      imgUrl,
      intro,
      isSerial,
      hostUrl,
      hostType,
      runTime,
      movieId,
    );
  }

  Movie fromJson(Map<String, Object?> json) {
    return Movie.fromJson(json);
  }
}

/// @nodoc
const $Movie = _$MovieTearOff();

/// @nodoc
mixin _$Movie {
  String? get contentId => throw _privateConstructorUsedError;
  String? get contentName => throw _privateConstructorUsedError;
  String? get categoryId => throw _privateConstructorUsedError;
  String? get categoryName => throw _privateConstructorUsedError;
  String? get levelId => throw _privateConstructorUsedError;
  String? get levelName => throw _privateConstructorUsedError;
  String? get vocabularyCount => throw _privateConstructorUsedError;
  String? get imgUrl => throw _privateConstructorUsedError;
  String? get intro => throw _privateConstructorUsedError;
  String? get isSerial => throw _privateConstructorUsedError;
  String? get hostUrl => throw _privateConstructorUsedError;
  String? get hostType => throw _privateConstructorUsedError;
  String? get runTime => throw _privateConstructorUsedError;
  String? get movieId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MovieCopyWith<Movie> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovieCopyWith<$Res> {
  factory $MovieCopyWith(Movie value, $Res Function(Movie) then) =
      _$MovieCopyWithImpl<$Res>;
  $Res call(
      {String? contentId,
      String? contentName,
      String? categoryId,
      String? categoryName,
      String? levelId,
      String? levelName,
      String? vocabularyCount,
      String? imgUrl,
      String? intro,
      String? isSerial,
      String? hostUrl,
      String? hostType,
      String? runTime,
      String? movieId});
}

/// @nodoc
class _$MovieCopyWithImpl<$Res> implements $MovieCopyWith<$Res> {
  _$MovieCopyWithImpl(this._value, this._then);

  final Movie _value;
  // ignore: unused_field
  final $Res Function(Movie) _then;

  @override
  $Res call({
    Object? contentId = freezed,
    Object? contentName = freezed,
    Object? categoryId = freezed,
    Object? categoryName = freezed,
    Object? levelId = freezed,
    Object? levelName = freezed,
    Object? vocabularyCount = freezed,
    Object? imgUrl = freezed,
    Object? intro = freezed,
    Object? isSerial = freezed,
    Object? hostUrl = freezed,
    Object? hostType = freezed,
    Object? runTime = freezed,
    Object? movieId = freezed,
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
      categoryId: categoryId == freezed
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryName: categoryName == freezed
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      levelId: levelId == freezed
          ? _value.levelId
          : levelId // ignore: cast_nullable_to_non_nullable
              as String?,
      levelName: levelName == freezed
          ? _value.levelName
          : levelName // ignore: cast_nullable_to_non_nullable
              as String?,
      vocabularyCount: vocabularyCount == freezed
          ? _value.vocabularyCount
          : vocabularyCount // ignore: cast_nullable_to_non_nullable
              as String?,
      imgUrl: imgUrl == freezed
          ? _value.imgUrl
          : imgUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      intro: intro == freezed
          ? _value.intro
          : intro // ignore: cast_nullable_to_non_nullable
              as String?,
      isSerial: isSerial == freezed
          ? _value.isSerial
          : isSerial // ignore: cast_nullable_to_non_nullable
              as String?,
      hostUrl: hostUrl == freezed
          ? _value.hostUrl
          : hostUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      hostType: hostType == freezed
          ? _value.hostType
          : hostType // ignore: cast_nullable_to_non_nullable
              as String?,
      runTime: runTime == freezed
          ? _value.runTime
          : runTime // ignore: cast_nullable_to_non_nullable
              as String?,
      movieId: movieId == freezed
          ? _value.movieId
          : movieId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$MovieCopyWith<$Res> implements $MovieCopyWith<$Res> {
  factory _$MovieCopyWith(_Movie value, $Res Function(_Movie) then) =
      __$MovieCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? contentId,
      String? contentName,
      String? categoryId,
      String? categoryName,
      String? levelId,
      String? levelName,
      String? vocabularyCount,
      String? imgUrl,
      String? intro,
      String? isSerial,
      String? hostUrl,
      String? hostType,
      String? runTime,
      String? movieId});
}

/// @nodoc
class __$MovieCopyWithImpl<$Res> extends _$MovieCopyWithImpl<$Res>
    implements _$MovieCopyWith<$Res> {
  __$MovieCopyWithImpl(_Movie _value, $Res Function(_Movie) _then)
      : super(_value, (v) => _then(v as _Movie));

  @override
  _Movie get _value => super._value as _Movie;

  @override
  $Res call({
    Object? contentId = freezed,
    Object? contentName = freezed,
    Object? categoryId = freezed,
    Object? categoryName = freezed,
    Object? levelId = freezed,
    Object? levelName = freezed,
    Object? vocabularyCount = freezed,
    Object? imgUrl = freezed,
    Object? intro = freezed,
    Object? isSerial = freezed,
    Object? hostUrl = freezed,
    Object? hostType = freezed,
    Object? runTime = freezed,
    Object? movieId = freezed,
  }) {
    return _then(_Movie(
      contentId == freezed
          ? _value.contentId
          : contentId // ignore: cast_nullable_to_non_nullable
              as String?,
      contentName == freezed
          ? _value.contentName
          : contentName // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryId == freezed
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryName == freezed
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      levelId == freezed
          ? _value.levelId
          : levelId // ignore: cast_nullable_to_non_nullable
              as String?,
      levelName == freezed
          ? _value.levelName
          : levelName // ignore: cast_nullable_to_non_nullable
              as String?,
      vocabularyCount == freezed
          ? _value.vocabularyCount
          : vocabularyCount // ignore: cast_nullable_to_non_nullable
              as String?,
      imgUrl == freezed
          ? _value.imgUrl
          : imgUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      intro == freezed
          ? _value.intro
          : intro // ignore: cast_nullable_to_non_nullable
              as String?,
      isSerial == freezed
          ? _value.isSerial
          : isSerial // ignore: cast_nullable_to_non_nullable
              as String?,
      hostUrl == freezed
          ? _value.hostUrl
          : hostUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      hostType == freezed
          ? _value.hostType
          : hostType // ignore: cast_nullable_to_non_nullable
              as String?,
      runTime == freezed
          ? _value.runTime
          : runTime // ignore: cast_nullable_to_non_nullable
              as String?,
      movieId == freezed
          ? _value.movieId
          : movieId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Movie implements _Movie {
  _$_Movie(
      this.contentId,
      this.contentName,
      this.categoryId,
      this.categoryName,
      this.levelId,
      this.levelName,
      this.vocabularyCount,
      this.imgUrl,
      this.intro,
      this.isSerial,
      this.hostUrl,
      this.hostType,
      this.runTime,
      this.movieId);

  factory _$_Movie.fromJson(Map<String, dynamic> json) =>
      _$$_MovieFromJson(json);

  @override
  final String? contentId;
  @override
  final String? contentName;
  @override
  final String? categoryId;
  @override
  final String? categoryName;
  @override
  final String? levelId;
  @override
  final String? levelName;
  @override
  final String? vocabularyCount;
  @override
  final String? imgUrl;
  @override
  final String? intro;
  @override
  final String? isSerial;
  @override
  final String? hostUrl;
  @override
  final String? hostType;
  @override
  final String? runTime;
  @override
  final String? movieId;

  @override
  String toString() {
    return 'Movie(contentId: $contentId, contentName: $contentName, categoryId: $categoryId, categoryName: $categoryName, levelId: $levelId, levelName: $levelName, vocabularyCount: $vocabularyCount, imgUrl: $imgUrl, intro: $intro, isSerial: $isSerial, hostUrl: $hostUrl, hostType: $hostType, runTime: $runTime, movieId: $movieId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Movie &&
            const DeepCollectionEquality().equals(other.contentId, contentId) &&
            const DeepCollectionEquality()
                .equals(other.contentName, contentName) &&
            const DeepCollectionEquality()
                .equals(other.categoryId, categoryId) &&
            const DeepCollectionEquality()
                .equals(other.categoryName, categoryName) &&
            const DeepCollectionEquality().equals(other.levelId, levelId) &&
            const DeepCollectionEquality().equals(other.levelName, levelName) &&
            const DeepCollectionEquality()
                .equals(other.vocabularyCount, vocabularyCount) &&
            const DeepCollectionEquality().equals(other.imgUrl, imgUrl) &&
            const DeepCollectionEquality().equals(other.intro, intro) &&
            const DeepCollectionEquality().equals(other.isSerial, isSerial) &&
            const DeepCollectionEquality().equals(other.hostUrl, hostUrl) &&
            const DeepCollectionEquality().equals(other.hostType, hostType) &&
            const DeepCollectionEquality().equals(other.runTime, runTime) &&
            const DeepCollectionEquality().equals(other.movieId, movieId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(contentId),
      const DeepCollectionEquality().hash(contentName),
      const DeepCollectionEquality().hash(categoryId),
      const DeepCollectionEquality().hash(categoryName),
      const DeepCollectionEquality().hash(levelId),
      const DeepCollectionEquality().hash(levelName),
      const DeepCollectionEquality().hash(vocabularyCount),
      const DeepCollectionEquality().hash(imgUrl),
      const DeepCollectionEquality().hash(intro),
      const DeepCollectionEquality().hash(isSerial),
      const DeepCollectionEquality().hash(hostUrl),
      const DeepCollectionEquality().hash(hostType),
      const DeepCollectionEquality().hash(runTime),
      const DeepCollectionEquality().hash(movieId));

  @JsonKey(ignore: true)
  @override
  _$MovieCopyWith<_Movie> get copyWith =>
      __$MovieCopyWithImpl<_Movie>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MovieToJson(this);
  }
}

abstract class _Movie implements Movie {
  factory _Movie(
      String? contentId,
      String? contentName,
      String? categoryId,
      String? categoryName,
      String? levelId,
      String? levelName,
      String? vocabularyCount,
      String? imgUrl,
      String? intro,
      String? isSerial,
      String? hostUrl,
      String? hostType,
      String? runTime,
      String? movieId) = _$_Movie;

  factory _Movie.fromJson(Map<String, dynamic> json) = _$_Movie.fromJson;

  @override
  String? get contentId;
  @override
  String? get contentName;
  @override
  String? get categoryId;
  @override
  String? get categoryName;
  @override
  String? get levelId;
  @override
  String? get levelName;
  @override
  String? get vocabularyCount;
  @override
  String? get imgUrl;
  @override
  String? get intro;
  @override
  String? get isSerial;
  @override
  String? get hostUrl;
  @override
  String? get hostType;
  @override
  String? get runTime;
  @override
  String? get movieId;
  @override
  @JsonKey(ignore: true)
  _$MovieCopyWith<_Movie> get copyWith => throw _privateConstructorUsedError;
}
