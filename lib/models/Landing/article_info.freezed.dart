// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'article_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ArticleInfo _$ArticleInfoFromJson(Map<String, dynamic> json) {
  return _ArticleInfo.fromJson(json);
}

/// @nodoc
class _$ArticleInfoTearOff {
  const _$ArticleInfoTearOff();

  _ArticleInfo call(
      String articleId,
      String articleTitle,
      String createdDate,
      String categoryName,
      String categoryIcon,
      String viewCount,
      String likeCount,
      bool isLiked,
      List<SlideImage> slideImages,
      List<ArticleCueParagraph> cues) {
    return _ArticleInfo(
      articleId,
      articleTitle,
      createdDate,
      categoryName,
      categoryIcon,
      viewCount,
      likeCount,
      isLiked,
      slideImages,
      cues,
    );
  }

  ArticleInfo fromJson(Map<String, Object?> json) {
    return ArticleInfo.fromJson(json);
  }
}

/// @nodoc
const $ArticleInfo = _$ArticleInfoTearOff();

/// @nodoc
mixin _$ArticleInfo {
  String get articleId => throw _privateConstructorUsedError;
  String get articleTitle => throw _privateConstructorUsedError;
  String get createdDate => throw _privateConstructorUsedError;
  String get categoryName => throw _privateConstructorUsedError;
  String get categoryIcon => throw _privateConstructorUsedError;
  String get viewCount => throw _privateConstructorUsedError;
  String get likeCount => throw _privateConstructorUsedError;
  bool get isLiked => throw _privateConstructorUsedError;
  List<SlideImage> get slideImages => throw _privateConstructorUsedError;
  List<ArticleCueParagraph> get cues => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ArticleInfoCopyWith<ArticleInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArticleInfoCopyWith<$Res> {
  factory $ArticleInfoCopyWith(
          ArticleInfo value, $Res Function(ArticleInfo) then) =
      _$ArticleInfoCopyWithImpl<$Res>;
  $Res call(
      {String articleId,
      String articleTitle,
      String createdDate,
      String categoryName,
      String categoryIcon,
      String viewCount,
      String likeCount,
      bool isLiked,
      List<SlideImage> slideImages,
      List<ArticleCueParagraph> cues});
}

/// @nodoc
class _$ArticleInfoCopyWithImpl<$Res> implements $ArticleInfoCopyWith<$Res> {
  _$ArticleInfoCopyWithImpl(this._value, this._then);

  final ArticleInfo _value;
  // ignore: unused_field
  final $Res Function(ArticleInfo) _then;

  @override
  $Res call({
    Object? articleId = freezed,
    Object? articleTitle = freezed,
    Object? createdDate = freezed,
    Object? categoryName = freezed,
    Object? categoryIcon = freezed,
    Object? viewCount = freezed,
    Object? likeCount = freezed,
    Object? isLiked = freezed,
    Object? slideImages = freezed,
    Object? cues = freezed,
  }) {
    return _then(_value.copyWith(
      articleId: articleId == freezed
          ? _value.articleId
          : articleId // ignore: cast_nullable_to_non_nullable
              as String,
      articleTitle: articleTitle == freezed
          ? _value.articleTitle
          : articleTitle // ignore: cast_nullable_to_non_nullable
              as String,
      createdDate: createdDate == freezed
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String,
      categoryName: categoryName == freezed
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
      categoryIcon: categoryIcon == freezed
          ? _value.categoryIcon
          : categoryIcon // ignore: cast_nullable_to_non_nullable
              as String,
      viewCount: viewCount == freezed
          ? _value.viewCount
          : viewCount // ignore: cast_nullable_to_non_nullable
              as String,
      likeCount: likeCount == freezed
          ? _value.likeCount
          : likeCount // ignore: cast_nullable_to_non_nullable
              as String,
      isLiked: isLiked == freezed
          ? _value.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool,
      slideImages: slideImages == freezed
          ? _value.slideImages
          : slideImages // ignore: cast_nullable_to_non_nullable
              as List<SlideImage>,
      cues: cues == freezed
          ? _value.cues
          : cues // ignore: cast_nullable_to_non_nullable
              as List<ArticleCueParagraph>,
    ));
  }
}

/// @nodoc
abstract class _$ArticleInfoCopyWith<$Res>
    implements $ArticleInfoCopyWith<$Res> {
  factory _$ArticleInfoCopyWith(
          _ArticleInfo value, $Res Function(_ArticleInfo) then) =
      __$ArticleInfoCopyWithImpl<$Res>;
  @override
  $Res call(
      {String articleId,
      String articleTitle,
      String createdDate,
      String categoryName,
      String categoryIcon,
      String viewCount,
      String likeCount,
      bool isLiked,
      List<SlideImage> slideImages,
      List<ArticleCueParagraph> cues});
}

/// @nodoc
class __$ArticleInfoCopyWithImpl<$Res> extends _$ArticleInfoCopyWithImpl<$Res>
    implements _$ArticleInfoCopyWith<$Res> {
  __$ArticleInfoCopyWithImpl(
      _ArticleInfo _value, $Res Function(_ArticleInfo) _then)
      : super(_value, (v) => _then(v as _ArticleInfo));

  @override
  _ArticleInfo get _value => super._value as _ArticleInfo;

  @override
  $Res call({
    Object? articleId = freezed,
    Object? articleTitle = freezed,
    Object? createdDate = freezed,
    Object? categoryName = freezed,
    Object? categoryIcon = freezed,
    Object? viewCount = freezed,
    Object? likeCount = freezed,
    Object? isLiked = freezed,
    Object? slideImages = freezed,
    Object? cues = freezed,
  }) {
    return _then(_ArticleInfo(
      articleId == freezed
          ? _value.articleId
          : articleId // ignore: cast_nullable_to_non_nullable
              as String,
      articleTitle == freezed
          ? _value.articleTitle
          : articleTitle // ignore: cast_nullable_to_non_nullable
              as String,
      createdDate == freezed
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String,
      categoryName == freezed
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
      categoryIcon == freezed
          ? _value.categoryIcon
          : categoryIcon // ignore: cast_nullable_to_non_nullable
              as String,
      viewCount == freezed
          ? _value.viewCount
          : viewCount // ignore: cast_nullable_to_non_nullable
              as String,
      likeCount == freezed
          ? _value.likeCount
          : likeCount // ignore: cast_nullable_to_non_nullable
              as String,
      isLiked == freezed
          ? _value.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool,
      slideImages == freezed
          ? _value.slideImages
          : slideImages // ignore: cast_nullable_to_non_nullable
              as List<SlideImage>,
      cues == freezed
          ? _value.cues
          : cues // ignore: cast_nullable_to_non_nullable
              as List<ArticleCueParagraph>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ArticleInfo implements _ArticleInfo {
  _$_ArticleInfo(
      this.articleId,
      this.articleTitle,
      this.createdDate,
      this.categoryName,
      this.categoryIcon,
      this.viewCount,
      this.likeCount,
      this.isLiked,
      this.slideImages,
      this.cues);

  factory _$_ArticleInfo.fromJson(Map<String, dynamic> json) =>
      _$$_ArticleInfoFromJson(json);

  @override
  final String articleId;
  @override
  final String articleTitle;
  @override
  final String createdDate;
  @override
  final String categoryName;
  @override
  final String categoryIcon;
  @override
  final String viewCount;
  @override
  final String likeCount;
  @override
  final bool isLiked;
  @override
  final List<SlideImage> slideImages;
  @override
  final List<ArticleCueParagraph> cues;

  @override
  String toString() {
    return 'ArticleInfo(articleId: $articleId, articleTitle: $articleTitle, createdDate: $createdDate, categoryName: $categoryName, categoryIcon: $categoryIcon, viewCount: $viewCount, likeCount: $likeCount, isLiked: $isLiked, slideImages: $slideImages, cues: $cues)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ArticleInfo &&
            const DeepCollectionEquality().equals(other.articleId, articleId) &&
            const DeepCollectionEquality()
                .equals(other.articleTitle, articleTitle) &&
            const DeepCollectionEquality()
                .equals(other.createdDate, createdDate) &&
            const DeepCollectionEquality()
                .equals(other.categoryName, categoryName) &&
            const DeepCollectionEquality()
                .equals(other.categoryIcon, categoryIcon) &&
            const DeepCollectionEquality().equals(other.viewCount, viewCount) &&
            const DeepCollectionEquality().equals(other.likeCount, likeCount) &&
            const DeepCollectionEquality().equals(other.isLiked, isLiked) &&
            const DeepCollectionEquality()
                .equals(other.slideImages, slideImages) &&
            const DeepCollectionEquality().equals(other.cues, cues));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(articleId),
      const DeepCollectionEquality().hash(articleTitle),
      const DeepCollectionEquality().hash(createdDate),
      const DeepCollectionEquality().hash(categoryName),
      const DeepCollectionEquality().hash(categoryIcon),
      const DeepCollectionEquality().hash(viewCount),
      const DeepCollectionEquality().hash(likeCount),
      const DeepCollectionEquality().hash(isLiked),
      const DeepCollectionEquality().hash(slideImages),
      const DeepCollectionEquality().hash(cues));

  @JsonKey(ignore: true)
  @override
  _$ArticleInfoCopyWith<_ArticleInfo> get copyWith =>
      __$ArticleInfoCopyWithImpl<_ArticleInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ArticleInfoToJson(this);
  }
}

abstract class _ArticleInfo implements ArticleInfo {
  factory _ArticleInfo(
      String articleId,
      String articleTitle,
      String createdDate,
      String categoryName,
      String categoryIcon,
      String viewCount,
      String likeCount,
      bool isLiked,
      List<SlideImage> slideImages,
      List<ArticleCueParagraph> cues) = _$_ArticleInfo;

  factory _ArticleInfo.fromJson(Map<String, dynamic> json) =
      _$_ArticleInfo.fromJson;

  @override
  String get articleId;
  @override
  String get articleTitle;
  @override
  String get createdDate;
  @override
  String get categoryName;
  @override
  String get categoryIcon;
  @override
  String get viewCount;
  @override
  String get likeCount;
  @override
  bool get isLiked;
  @override
  List<SlideImage> get slideImages;
  @override
  List<ArticleCueParagraph> get cues;
  @override
  @JsonKey(ignore: true)
  _$ArticleInfoCopyWith<_ArticleInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
