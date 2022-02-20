// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'video_vocabulary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

VideoVocabulary _$VideoVocabularyFromJson(Map<String, dynamic> json) {
  return _VideoVocabulary.fromJson(json);
}

/// @nodoc
class _$VideoVocabularyTearOff {
  const _$VideoVocabularyTearOff();

  _VideoVocabulary call(int wordCount, List<VideoVocabularyWord> words) {
    return _VideoVocabulary(
      wordCount,
      words,
    );
  }

  VideoVocabulary fromJson(Map<String, Object?> json) {
    return VideoVocabulary.fromJson(json);
  }
}

/// @nodoc
const $VideoVocabulary = _$VideoVocabularyTearOff();

/// @nodoc
mixin _$VideoVocabulary {
  int get wordCount => throw _privateConstructorUsedError;
  List<VideoVocabularyWord> get words => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VideoVocabularyCopyWith<VideoVocabulary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VideoVocabularyCopyWith<$Res> {
  factory $VideoVocabularyCopyWith(
          VideoVocabulary value, $Res Function(VideoVocabulary) then) =
      _$VideoVocabularyCopyWithImpl<$Res>;
  $Res call({int wordCount, List<VideoVocabularyWord> words});
}

/// @nodoc
class _$VideoVocabularyCopyWithImpl<$Res>
    implements $VideoVocabularyCopyWith<$Res> {
  _$VideoVocabularyCopyWithImpl(this._value, this._then);

  final VideoVocabulary _value;
  // ignore: unused_field
  final $Res Function(VideoVocabulary) _then;

  @override
  $Res call({
    Object? wordCount = freezed,
    Object? words = freezed,
  }) {
    return _then(_value.copyWith(
      wordCount: wordCount == freezed
          ? _value.wordCount
          : wordCount // ignore: cast_nullable_to_non_nullable
              as int,
      words: words == freezed
          ? _value.words
          : words // ignore: cast_nullable_to_non_nullable
              as List<VideoVocabularyWord>,
    ));
  }
}

/// @nodoc
abstract class _$VideoVocabularyCopyWith<$Res>
    implements $VideoVocabularyCopyWith<$Res> {
  factory _$VideoVocabularyCopyWith(
          _VideoVocabulary value, $Res Function(_VideoVocabulary) then) =
      __$VideoVocabularyCopyWithImpl<$Res>;
  @override
  $Res call({int wordCount, List<VideoVocabularyWord> words});
}

/// @nodoc
class __$VideoVocabularyCopyWithImpl<$Res>
    extends _$VideoVocabularyCopyWithImpl<$Res>
    implements _$VideoVocabularyCopyWith<$Res> {
  __$VideoVocabularyCopyWithImpl(
      _VideoVocabulary _value, $Res Function(_VideoVocabulary) _then)
      : super(_value, (v) => _then(v as _VideoVocabulary));

  @override
  _VideoVocabulary get _value => super._value as _VideoVocabulary;

  @override
  $Res call({
    Object? wordCount = freezed,
    Object? words = freezed,
  }) {
    return _then(_VideoVocabulary(
      wordCount == freezed
          ? _value.wordCount
          : wordCount // ignore: cast_nullable_to_non_nullable
              as int,
      words == freezed
          ? _value.words
          : words // ignore: cast_nullable_to_non_nullable
              as List<VideoVocabularyWord>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_VideoVocabulary implements _VideoVocabulary {
  _$_VideoVocabulary(this.wordCount, this.words);

  factory _$_VideoVocabulary.fromJson(Map<String, dynamic> json) =>
      _$$_VideoVocabularyFromJson(json);

  @override
  final int wordCount;
  @override
  final List<VideoVocabularyWord> words;

  @override
  String toString() {
    return 'VideoVocabulary(wordCount: $wordCount, words: $words)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _VideoVocabulary &&
            const DeepCollectionEquality().equals(other.wordCount, wordCount) &&
            const DeepCollectionEquality().equals(other.words, words));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(wordCount),
      const DeepCollectionEquality().hash(words));

  @JsonKey(ignore: true)
  @override
  _$VideoVocabularyCopyWith<_VideoVocabulary> get copyWith =>
      __$VideoVocabularyCopyWithImpl<_VideoVocabulary>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_VideoVocabularyToJson(this);
  }
}

abstract class _VideoVocabulary implements VideoVocabulary {
  factory _VideoVocabulary(int wordCount, List<VideoVocabularyWord> words) =
      _$_VideoVocabulary;

  factory _VideoVocabulary.fromJson(Map<String, dynamic> json) =
      _$_VideoVocabulary.fromJson;

  @override
  int get wordCount;
  @override
  List<VideoVocabularyWord> get words;
  @override
  @JsonKey(ignore: true)
  _$VideoVocabularyCopyWith<_VideoVocabulary> get copyWith =>
      throw _privateConstructorUsedError;
}
