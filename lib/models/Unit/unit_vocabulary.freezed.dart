// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unit_vocabulary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnitVocabulary _$UnitVocabularyFromJson(Map<String, dynamic> json) {
  return _UnitVocabulary.fromJson(json);
}

/// @nodoc
class _$UnitVocabularyTearOff {
  const _$UnitVocabularyTearOff();

  _UnitVocabulary call(int wordCount, List<UnitVocabularyWord> words) {
    return _UnitVocabulary(
      wordCount,
      words,
    );
  }

  UnitVocabulary fromJson(Map<String, Object?> json) {
    return UnitVocabulary.fromJson(json);
  }
}

/// @nodoc
const $UnitVocabulary = _$UnitVocabularyTearOff();

/// @nodoc
mixin _$UnitVocabulary {
  int get wordCount => throw _privateConstructorUsedError;
  List<UnitVocabularyWord> get words => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnitVocabularyCopyWith<UnitVocabulary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnitVocabularyCopyWith<$Res> {
  factory $UnitVocabularyCopyWith(
          UnitVocabulary value, $Res Function(UnitVocabulary) then) =
      _$UnitVocabularyCopyWithImpl<$Res>;
  $Res call({int wordCount, List<UnitVocabularyWord> words});
}

/// @nodoc
class _$UnitVocabularyCopyWithImpl<$Res>
    implements $UnitVocabularyCopyWith<$Res> {
  _$UnitVocabularyCopyWithImpl(this._value, this._then);

  final UnitVocabulary _value;
  // ignore: unused_field
  final $Res Function(UnitVocabulary) _then;

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
              as List<UnitVocabularyWord>,
    ));
  }
}

/// @nodoc
abstract class _$UnitVocabularyCopyWith<$Res>
    implements $UnitVocabularyCopyWith<$Res> {
  factory _$UnitVocabularyCopyWith(
          _UnitVocabulary value, $Res Function(_UnitVocabulary) then) =
      __$UnitVocabularyCopyWithImpl<$Res>;
  @override
  $Res call({int wordCount, List<UnitVocabularyWord> words});
}

/// @nodoc
class __$UnitVocabularyCopyWithImpl<$Res>
    extends _$UnitVocabularyCopyWithImpl<$Res>
    implements _$UnitVocabularyCopyWith<$Res> {
  __$UnitVocabularyCopyWithImpl(
      _UnitVocabulary _value, $Res Function(_UnitVocabulary) _then)
      : super(_value, (v) => _then(v as _UnitVocabulary));

  @override
  _UnitVocabulary get _value => super._value as _UnitVocabulary;

  @override
  $Res call({
    Object? wordCount = freezed,
    Object? words = freezed,
  }) {
    return _then(_UnitVocabulary(
      wordCount == freezed
          ? _value.wordCount
          : wordCount // ignore: cast_nullable_to_non_nullable
              as int,
      words == freezed
          ? _value.words
          : words // ignore: cast_nullable_to_non_nullable
              as List<UnitVocabularyWord>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnitVocabulary implements _UnitVocabulary {
  _$_UnitVocabulary(this.wordCount, this.words);

  factory _$_UnitVocabulary.fromJson(Map<String, dynamic> json) =>
      _$$_UnitVocabularyFromJson(json);

  @override
  final int wordCount;
  @override
  final List<UnitVocabularyWord> words;

  @override
  String toString() {
    return 'UnitVocabulary(wordCount: $wordCount, words: $words)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UnitVocabulary &&
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
  _$UnitVocabularyCopyWith<_UnitVocabulary> get copyWith =>
      __$UnitVocabularyCopyWithImpl<_UnitVocabulary>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnitVocabularyToJson(this);
  }
}

abstract class _UnitVocabulary implements UnitVocabulary {
  factory _UnitVocabulary(int wordCount, List<UnitVocabularyWord> words) =
      _$_UnitVocabulary;

  factory _UnitVocabulary.fromJson(Map<String, dynamic> json) =
      _$_UnitVocabulary.fromJson;

  @override
  int get wordCount;
  @override
  List<UnitVocabularyWord> get words;
  @override
  @JsonKey(ignore: true)
  _$UnitVocabularyCopyWith<_UnitVocabulary> get copyWith =>
      throw _privateConstructorUsedError;
}
