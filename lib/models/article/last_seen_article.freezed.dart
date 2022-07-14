// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'last_seen_article.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LastSeenArticle _$LastSeenArticleFromJson(Map<String, dynamic> json) {
  return _LastSeenArticle.fromJson(json);
}

/// @nodoc
class _$LastSeenArticleTearOff {
  const _$LastSeenArticleTearOff();

  _LastSeenArticle call(
      String? articleId, String? articleTitle, String? slideImageUrl) {
    return _LastSeenArticle(
      articleId,
      articleTitle,
      slideImageUrl,
    );
  }

  LastSeenArticle fromJson(Map<String, Object?> json) {
    return LastSeenArticle.fromJson(json);
  }
}

/// @nodoc
const $LastSeenArticle = _$LastSeenArticleTearOff();

/// @nodoc
mixin _$LastSeenArticle {
  String? get articleId => throw _privateConstructorUsedError;
  String? get articleTitle => throw _privateConstructorUsedError;
  String? get slideImageUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LastSeenArticleCopyWith<LastSeenArticle> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LastSeenArticleCopyWith<$Res> {
  factory $LastSeenArticleCopyWith(
          LastSeenArticle value, $Res Function(LastSeenArticle) then) =
      _$LastSeenArticleCopyWithImpl<$Res>;
  $Res call({String? articleId, String? articleTitle, String? slideImageUrl});
}

/// @nodoc
class _$LastSeenArticleCopyWithImpl<$Res>
    implements $LastSeenArticleCopyWith<$Res> {
  _$LastSeenArticleCopyWithImpl(this._value, this._then);

  final LastSeenArticle _value;
  // ignore: unused_field
  final $Res Function(LastSeenArticle) _then;

  @override
  $Res call({
    Object? articleId = freezed,
    Object? articleTitle = freezed,
    Object? slideImageUrl = freezed,
  }) {
    return _then(_value.copyWith(
      articleId: articleId == freezed
          ? _value.articleId
          : articleId // ignore: cast_nullable_to_non_nullable
              as String?,
      articleTitle: articleTitle == freezed
          ? _value.articleTitle
          : articleTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      slideImageUrl: slideImageUrl == freezed
          ? _value.slideImageUrl
          : slideImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$LastSeenArticleCopyWith<$Res>
    implements $LastSeenArticleCopyWith<$Res> {
  factory _$LastSeenArticleCopyWith(
          _LastSeenArticle value, $Res Function(_LastSeenArticle) then) =
      __$LastSeenArticleCopyWithImpl<$Res>;
  @override
  $Res call({String? articleId, String? articleTitle, String? slideImageUrl});
}

/// @nodoc
class __$LastSeenArticleCopyWithImpl<$Res>
    extends _$LastSeenArticleCopyWithImpl<$Res>
    implements _$LastSeenArticleCopyWith<$Res> {
  __$LastSeenArticleCopyWithImpl(
      _LastSeenArticle _value, $Res Function(_LastSeenArticle) _then)
      : super(_value, (v) => _then(v as _LastSeenArticle));

  @override
  _LastSeenArticle get _value => super._value as _LastSeenArticle;

  @override
  $Res call({
    Object? articleId = freezed,
    Object? articleTitle = freezed,
    Object? slideImageUrl = freezed,
  }) {
    return _then(_LastSeenArticle(
      articleId == freezed
          ? _value.articleId
          : articleId // ignore: cast_nullable_to_non_nullable
              as String?,
      articleTitle == freezed
          ? _value.articleTitle
          : articleTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      slideImageUrl == freezed
          ? _value.slideImageUrl
          : slideImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LastSeenArticle implements _LastSeenArticle {
  _$_LastSeenArticle(this.articleId, this.articleTitle, this.slideImageUrl);

  factory _$_LastSeenArticle.fromJson(Map<String, dynamic> json) =>
      _$$_LastSeenArticleFromJson(json);

  @override
  final String? articleId;
  @override
  final String? articleTitle;
  @override
  final String? slideImageUrl;

  @override
  String toString() {
    return 'LastSeenArticle(articleId: $articleId, articleTitle: $articleTitle, slideImageUrl: $slideImageUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LastSeenArticle &&
            const DeepCollectionEquality().equals(other.articleId, articleId) &&
            const DeepCollectionEquality()
                .equals(other.articleTitle, articleTitle) &&
            const DeepCollectionEquality()
                .equals(other.slideImageUrl, slideImageUrl));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(articleId),
      const DeepCollectionEquality().hash(articleTitle),
      const DeepCollectionEquality().hash(slideImageUrl));

  @JsonKey(ignore: true)
  @override
  _$LastSeenArticleCopyWith<_LastSeenArticle> get copyWith =>
      __$LastSeenArticleCopyWithImpl<_LastSeenArticle>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LastSeenArticleToJson(this);
  }
}

abstract class _LastSeenArticle implements LastSeenArticle {
  factory _LastSeenArticle(
          String? articleId, String? articleTitle, String? slideImageUrl) =
      _$_LastSeenArticle;

  factory _LastSeenArticle.fromJson(Map<String, dynamic> json) =
      _$_LastSeenArticle.fromJson;

  @override
  String? get articleId;
  @override
  String? get articleTitle;
  @override
  String? get slideImageUrl;
  @override
  @JsonKey(ignore: true)
  _$LastSeenArticleCopyWith<_LastSeenArticle> get copyWith =>
      throw _privateConstructorUsedError;
}
