// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'cue_word.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CueWord _$CueWordFromJson(Map<String, dynamic> json) {
  return _CueWord.fromJson(json);
}

/// @nodoc
class _$CueWordTearOff {
  const _$CueWordTearOff();

  _CueWord call(
      bool isSuccess,
      String errorCode,
      String resultMessage,
      String wordId,
      String word,
      String pronunciationUrl,
      bool bookMarked,
      bool isKnow,
      RootWordInfo rootWordInfo,
      WordType wordType,
      List<Translation> translation) {
    return _CueWord(
      isSuccess,
      errorCode,
      resultMessage,
      wordId,
      word,
      pronunciationUrl,
      bookMarked,
      isKnow,
      rootWordInfo,
      wordType,
      translation,
    );
  }

  CueWord fromJson(Map<String, Object?> json) {
    return CueWord.fromJson(json);
  }
}

/// @nodoc
const $CueWord = _$CueWordTearOff();

/// @nodoc
mixin _$CueWord {
  bool get isSuccess => throw _privateConstructorUsedError;
  String get errorCode => throw _privateConstructorUsedError;
  String get resultMessage => throw _privateConstructorUsedError;
  String get wordId => throw _privateConstructorUsedError;
  String get word => throw _privateConstructorUsedError;
  String get pronunciationUrl => throw _privateConstructorUsedError;
  bool get bookMarked => throw _privateConstructorUsedError;
  bool get isKnow => throw _privateConstructorUsedError;
  RootWordInfo get rootWordInfo => throw _privateConstructorUsedError;
  WordType get wordType => throw _privateConstructorUsedError;
  List<Translation> get translation => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CueWordCopyWith<CueWord> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CueWordCopyWith<$Res> {
  factory $CueWordCopyWith(CueWord value, $Res Function(CueWord) then) =
      _$CueWordCopyWithImpl<$Res>;
  $Res call(
      {bool isSuccess,
      String errorCode,
      String resultMessage,
      String wordId,
      String word,
      String pronunciationUrl,
      bool bookMarked,
      bool isKnow,
      RootWordInfo rootWordInfo,
      WordType wordType,
      List<Translation> translation});

  $RootWordInfoCopyWith<$Res> get rootWordInfo;
  $WordTypeCopyWith<$Res> get wordType;
}

/// @nodoc
class _$CueWordCopyWithImpl<$Res> implements $CueWordCopyWith<$Res> {
  _$CueWordCopyWithImpl(this._value, this._then);

  final CueWord _value;
  // ignore: unused_field
  final $Res Function(CueWord) _then;

  @override
  $Res call({
    Object? isSuccess = freezed,
    Object? errorCode = freezed,
    Object? resultMessage = freezed,
    Object? wordId = freezed,
    Object? word = freezed,
    Object? pronunciationUrl = freezed,
    Object? bookMarked = freezed,
    Object? isKnow = freezed,
    Object? rootWordInfo = freezed,
    Object? wordType = freezed,
    Object? translation = freezed,
  }) {
    return _then(_value.copyWith(
      isSuccess: isSuccess == freezed
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      errorCode: errorCode == freezed
          ? _value.errorCode
          : errorCode // ignore: cast_nullable_to_non_nullable
              as String,
      resultMessage: resultMessage == freezed
          ? _value.resultMessage
          : resultMessage // ignore: cast_nullable_to_non_nullable
              as String,
      wordId: wordId == freezed
          ? _value.wordId
          : wordId // ignore: cast_nullable_to_non_nullable
              as String,
      word: word == freezed
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String,
      pronunciationUrl: pronunciationUrl == freezed
          ? _value.pronunciationUrl
          : pronunciationUrl // ignore: cast_nullable_to_non_nullable
              as String,
      bookMarked: bookMarked == freezed
          ? _value.bookMarked
          : bookMarked // ignore: cast_nullable_to_non_nullable
              as bool,
      isKnow: isKnow == freezed
          ? _value.isKnow
          : isKnow // ignore: cast_nullable_to_non_nullable
              as bool,
      rootWordInfo: rootWordInfo == freezed
          ? _value.rootWordInfo
          : rootWordInfo // ignore: cast_nullable_to_non_nullable
              as RootWordInfo,
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
  $RootWordInfoCopyWith<$Res> get rootWordInfo {
    return $RootWordInfoCopyWith<$Res>(_value.rootWordInfo, (value) {
      return _then(_value.copyWith(rootWordInfo: value));
    });
  }

  @override
  $WordTypeCopyWith<$Res> get wordType {
    return $WordTypeCopyWith<$Res>(_value.wordType, (value) {
      return _then(_value.copyWith(wordType: value));
    });
  }
}

/// @nodoc
abstract class _$CueWordCopyWith<$Res> implements $CueWordCopyWith<$Res> {
  factory _$CueWordCopyWith(_CueWord value, $Res Function(_CueWord) then) =
      __$CueWordCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isSuccess,
      String errorCode,
      String resultMessage,
      String wordId,
      String word,
      String pronunciationUrl,
      bool bookMarked,
      bool isKnow,
      RootWordInfo rootWordInfo,
      WordType wordType,
      List<Translation> translation});

  @override
  $RootWordInfoCopyWith<$Res> get rootWordInfo;
  @override
  $WordTypeCopyWith<$Res> get wordType;
}

/// @nodoc
class __$CueWordCopyWithImpl<$Res> extends _$CueWordCopyWithImpl<$Res>
    implements _$CueWordCopyWith<$Res> {
  __$CueWordCopyWithImpl(_CueWord _value, $Res Function(_CueWord) _then)
      : super(_value, (v) => _then(v as _CueWord));

  @override
  _CueWord get _value => super._value as _CueWord;

  @override
  $Res call({
    Object? isSuccess = freezed,
    Object? errorCode = freezed,
    Object? resultMessage = freezed,
    Object? wordId = freezed,
    Object? word = freezed,
    Object? pronunciationUrl = freezed,
    Object? bookMarked = freezed,
    Object? isKnow = freezed,
    Object? rootWordInfo = freezed,
    Object? wordType = freezed,
    Object? translation = freezed,
  }) {
    return _then(_CueWord(
      isSuccess == freezed
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      errorCode == freezed
          ? _value.errorCode
          : errorCode // ignore: cast_nullable_to_non_nullable
              as String,
      resultMessage == freezed
          ? _value.resultMessage
          : resultMessage // ignore: cast_nullable_to_non_nullable
              as String,
      wordId == freezed
          ? _value.wordId
          : wordId // ignore: cast_nullable_to_non_nullable
              as String,
      word == freezed
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String,
      pronunciationUrl == freezed
          ? _value.pronunciationUrl
          : pronunciationUrl // ignore: cast_nullable_to_non_nullable
              as String,
      bookMarked == freezed
          ? _value.bookMarked
          : bookMarked // ignore: cast_nullable_to_non_nullable
              as bool,
      isKnow == freezed
          ? _value.isKnow
          : isKnow // ignore: cast_nullable_to_non_nullable
              as bool,
      rootWordInfo == freezed
          ? _value.rootWordInfo
          : rootWordInfo // ignore: cast_nullable_to_non_nullable
              as RootWordInfo,
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
class _$_CueWord implements _CueWord {
  _$_CueWord(
      this.isSuccess,
      this.errorCode,
      this.resultMessage,
      this.wordId,
      this.word,
      this.pronunciationUrl,
      this.bookMarked,
      this.isKnow,
      this.rootWordInfo,
      this.wordType,
      this.translation);

  factory _$_CueWord.fromJson(Map<String, dynamic> json) =>
      _$$_CueWordFromJson(json);

  @override
  final bool isSuccess;
  @override
  final String errorCode;
  @override
  final String resultMessage;
  @override
  final String wordId;
  @override
  final String word;
  @override
  final String pronunciationUrl;
  @override
  final bool bookMarked;
  @override
  final bool isKnow;
  @override
  final RootWordInfo rootWordInfo;
  @override
  final WordType wordType;
  @override
  final List<Translation> translation;

  @override
  String toString() {
    return 'CueWord(isSuccess: $isSuccess, errorCode: $errorCode, resultMessage: $resultMessage, wordId: $wordId, word: $word, pronunciationUrl: $pronunciationUrl, bookMarked: $bookMarked, isKnow: $isKnow, rootWordInfo: $rootWordInfo, wordType: $wordType, translation: $translation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CueWord &&
            const DeepCollectionEquality().equals(other.isSuccess, isSuccess) &&
            const DeepCollectionEquality().equals(other.errorCode, errorCode) &&
            const DeepCollectionEquality()
                .equals(other.resultMessage, resultMessage) &&
            const DeepCollectionEquality().equals(other.wordId, wordId) &&
            const DeepCollectionEquality().equals(other.word, word) &&
            const DeepCollectionEquality()
                .equals(other.pronunciationUrl, pronunciationUrl) &&
            const DeepCollectionEquality()
                .equals(other.bookMarked, bookMarked) &&
            const DeepCollectionEquality().equals(other.isKnow, isKnow) &&
            const DeepCollectionEquality()
                .equals(other.rootWordInfo, rootWordInfo) &&
            const DeepCollectionEquality().equals(other.wordType, wordType) &&
            const DeepCollectionEquality()
                .equals(other.translation, translation));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isSuccess),
      const DeepCollectionEquality().hash(errorCode),
      const DeepCollectionEquality().hash(resultMessage),
      const DeepCollectionEquality().hash(wordId),
      const DeepCollectionEquality().hash(word),
      const DeepCollectionEquality().hash(pronunciationUrl),
      const DeepCollectionEquality().hash(bookMarked),
      const DeepCollectionEquality().hash(isKnow),
      const DeepCollectionEquality().hash(rootWordInfo),
      const DeepCollectionEquality().hash(wordType),
      const DeepCollectionEquality().hash(translation));

  @JsonKey(ignore: true)
  @override
  _$CueWordCopyWith<_CueWord> get copyWith =>
      __$CueWordCopyWithImpl<_CueWord>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CueWordToJson(this);
  }
}

abstract class _CueWord implements CueWord {
  factory _CueWord(
      bool isSuccess,
      String errorCode,
      String resultMessage,
      String wordId,
      String word,
      String pronunciationUrl,
      bool bookMarked,
      bool isKnow,
      RootWordInfo rootWordInfo,
      WordType wordType,
      List<Translation> translation) = _$_CueWord;

  factory _CueWord.fromJson(Map<String, dynamic> json) = _$_CueWord.fromJson;

  @override
  bool get isSuccess;
  @override
  String get errorCode;
  @override
  String get resultMessage;
  @override
  String get wordId;
  @override
  String get word;
  @override
  String get pronunciationUrl;
  @override
  bool get bookMarked;
  @override
  bool get isKnow;
  @override
  RootWordInfo get rootWordInfo;
  @override
  WordType get wordType;
  @override
  List<Translation> get translation;
  @override
  @JsonKey(ignore: true)
  _$CueWordCopyWith<_CueWord> get copyWith =>
      throw _privateConstructorUsedError;
}
