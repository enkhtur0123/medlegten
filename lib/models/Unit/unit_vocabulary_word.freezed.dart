// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unit_vocabulary_word.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnitVocabularyWord _$UnitVocabularyWordFromJson(Map<String, dynamic> json) {
  return _UnitVocabularyWord.fromJson(json);
}

/// @nodoc
class _$UnitVocabularyWordTearOff {
  const _$UnitVocabularyWordTearOff();

  _UnitVocabularyWord call(String wordId, String word, bool bookMarked,
      bool isKnow, WordType wordType, List<Translation> translation) {
    return _UnitVocabularyWord(
      wordId,
      word,
      bookMarked,
      isKnow,
      wordType,
      translation,
    );
  }

  UnitVocabularyWord fromJson(Map<String, Object?> json) {
    return UnitVocabularyWord.fromJson(json);
  }
}

/// @nodoc
const $UnitVocabularyWord = _$UnitVocabularyWordTearOff();

/// @nodoc
mixin _$UnitVocabularyWord {
  String get wordId => throw _privateConstructorUsedError;
  String get word => throw _privateConstructorUsedError;
  bool get bookMarked => throw _privateConstructorUsedError;
  bool get isKnow => throw _privateConstructorUsedError;
  WordType get wordType => throw _privateConstructorUsedError;
  List<Translation> get translation => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnitVocabularyWordCopyWith<UnitVocabularyWord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnitVocabularyWordCopyWith<$Res> {
  factory $UnitVocabularyWordCopyWith(
          UnitVocabularyWord value, $Res Function(UnitVocabularyWord) then) =
      _$UnitVocabularyWordCopyWithImpl<$Res>;
  $Res call(
      {String wordId,
      String word,
      bool bookMarked,
      bool isKnow,
      WordType wordType,
      List<Translation> translation});

  $WordTypeCopyWith<$Res> get wordType;
}

/// @nodoc
class _$UnitVocabularyWordCopyWithImpl<$Res>
    implements $UnitVocabularyWordCopyWith<$Res> {
  _$UnitVocabularyWordCopyWithImpl(this._value, this._then);

  final UnitVocabularyWord _value;
  // ignore: unused_field
  final $Res Function(UnitVocabularyWord) _then;

  @override
  $Res call({
    Object? wordId = freezed,
    Object? word = freezed,
    Object? bookMarked = freezed,
    Object? isKnow = freezed,
    Object? wordType = freezed,
    Object? translation = freezed,
  }) {
    return _then(_value.copyWith(
      wordId: wordId == freezed
          ? _value.wordId
          : wordId // ignore: cast_nullable_to_non_nullable
              as String,
      word: word == freezed
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String,
      bookMarked: bookMarked == freezed
          ? _value.bookMarked
          : bookMarked // ignore: cast_nullable_to_non_nullable
              as bool,
      isKnow: isKnow == freezed
          ? _value.isKnow
          : isKnow // ignore: cast_nullable_to_non_nullable
              as bool,
      wordType: wordType == freezed
          ? _value.wordType
          : wordType // ignore: cast_nullable_to_non_nullable
              as WordType,
      translation: translation == freezed
          ? _value.translation
          : translation // ignore: cast_nullable_to_non_nullable
              as List<Translation>,
    ));
  }

  @override
  $WordTypeCopyWith<$Res> get wordType {
    return $WordTypeCopyWith<$Res>(_value.wordType, (value) {
      return _then(_value.copyWith(wordType: value));
    });
  }
}

/// @nodoc
abstract class _$UnitVocabularyWordCopyWith<$Res>
    implements $UnitVocabularyWordCopyWith<$Res> {
  factory _$UnitVocabularyWordCopyWith(
          _UnitVocabularyWord value, $Res Function(_UnitVocabularyWord) then) =
      __$UnitVocabularyWordCopyWithImpl<$Res>;
  @override
  $Res call(
      {String wordId,
      String word,
      bool bookMarked,
      bool isKnow,
      WordType wordType,
      List<Translation> translation});

  @override
  $WordTypeCopyWith<$Res> get wordType;
}

/// @nodoc
class __$UnitVocabularyWordCopyWithImpl<$Res>
    extends _$UnitVocabularyWordCopyWithImpl<$Res>
    implements _$UnitVocabularyWordCopyWith<$Res> {
  __$UnitVocabularyWordCopyWithImpl(
      _UnitVocabularyWord _value, $Res Function(_UnitVocabularyWord) _then)
      : super(_value, (v) => _then(v as _UnitVocabularyWord));

  @override
  _UnitVocabularyWord get _value => super._value as _UnitVocabularyWord;

  @override
  $Res call({
    Object? wordId = freezed,
    Object? word = freezed,
    Object? bookMarked = freezed,
    Object? isKnow = freezed,
    Object? wordType = freezed,
    Object? translation = freezed,
  }) {
    return _then(_UnitVocabularyWord(
      wordId == freezed
          ? _value.wordId
          : wordId // ignore: cast_nullable_to_non_nullable
              as String,
      word == freezed
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String,
      bookMarked == freezed
          ? _value.bookMarked
          : bookMarked // ignore: cast_nullable_to_non_nullable
              as bool,
      isKnow == freezed
          ? _value.isKnow
          : isKnow // ignore: cast_nullable_to_non_nullable
              as bool,
      wordType == freezed
          ? _value.wordType
          : wordType // ignore: cast_nullable_to_non_nullable
              as WordType,
      translation == freezed
          ? _value.translation
          : translation // ignore: cast_nullable_to_non_nullable
              as List<Translation>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnitVocabularyWord implements _UnitVocabularyWord {
  _$_UnitVocabularyWord(this.wordId, this.word, this.bookMarked, this.isKnow,
      this.wordType, this.translation);

  factory _$_UnitVocabularyWord.fromJson(Map<String, dynamic> json) =>
      _$$_UnitVocabularyWordFromJson(json);

  @override
  final String wordId;
  @override
  final String word;
  @override
  final bool bookMarked;
  @override
  final bool isKnow;
  @override
  final WordType wordType;
  @override
  final List<Translation> translation;

  @override
  String toString() {
    return 'UnitVocabularyWord(wordId: $wordId, word: $word, bookMarked: $bookMarked, isKnow: $isKnow, wordType: $wordType, translation: $translation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UnitVocabularyWord &&
            const DeepCollectionEquality().equals(other.wordId, wordId) &&
            const DeepCollectionEquality().equals(other.word, word) &&
            const DeepCollectionEquality()
                .equals(other.bookMarked, bookMarked) &&
            const DeepCollectionEquality().equals(other.isKnow, isKnow) &&
            const DeepCollectionEquality().equals(other.wordType, wordType) &&
            const DeepCollectionEquality()
                .equals(other.translation, translation));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(wordId),
      const DeepCollectionEquality().hash(word),
      const DeepCollectionEquality().hash(bookMarked),
      const DeepCollectionEquality().hash(isKnow),
      const DeepCollectionEquality().hash(wordType),
      const DeepCollectionEquality().hash(translation));

  @JsonKey(ignore: true)
  @override
  _$UnitVocabularyWordCopyWith<_UnitVocabularyWord> get copyWith =>
      __$UnitVocabularyWordCopyWithImpl<_UnitVocabularyWord>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnitVocabularyWordToJson(this);
  }
}

abstract class _UnitVocabularyWord implements UnitVocabularyWord {
  factory _UnitVocabularyWord(
      String wordId,
      String word,
      bool bookMarked,
      bool isKnow,
      WordType wordType,
      List<Translation> translation) = _$_UnitVocabularyWord;

  factory _UnitVocabularyWord.fromJson(Map<String, dynamic> json) =
      _$_UnitVocabularyWord.fromJson;

  @override
  String get wordId;
  @override
  String get word;
  @override
  bool get bookMarked;
  @override
  bool get isKnow;
  @override
  WordType get wordType;
  @override
  List<Translation> get translation;
  @override
  @JsonKey(ignore: true)
  _$UnitVocabularyWordCopyWith<_UnitVocabularyWord> get copyWith =>
      throw _privateConstructorUsedError;
}
