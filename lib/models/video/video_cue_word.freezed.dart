// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'video_cue_word.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

VideoCueWord _$VideoCueWordFromJson(Map<String, dynamic> json) {
  return _VideoCueWord.fromJson(json);
}

/// @nodoc
class _$VideoCueWordTearOff {
  const _$VideoCueWordTearOff();

  _VideoCueWord call(String wordId, String mainText, String wordValue,
      String spaceNext, String ordering) {
    return _VideoCueWord(
      wordId,
      mainText,
      wordValue,
      spaceNext,
      ordering,
    );
  }

  VideoCueWord fromJson(Map<String, Object?> json) {
    return VideoCueWord.fromJson(json);
  }
}

/// @nodoc
const $VideoCueWord = _$VideoCueWordTearOff();

/// @nodoc
mixin _$VideoCueWord {
  String get wordId => throw _privateConstructorUsedError;
  String get mainText => throw _privateConstructorUsedError;
  String get wordValue => throw _privateConstructorUsedError;
  String get spaceNext => throw _privateConstructorUsedError;
  String get ordering => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VideoCueWordCopyWith<VideoCueWord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VideoCueWordCopyWith<$Res> {
  factory $VideoCueWordCopyWith(
          VideoCueWord value, $Res Function(VideoCueWord) then) =
      _$VideoCueWordCopyWithImpl<$Res>;
  $Res call(
      {String wordId,
      String mainText,
      String wordValue,
      String spaceNext,
      String ordering});
}

/// @nodoc
class _$VideoCueWordCopyWithImpl<$Res> implements $VideoCueWordCopyWith<$Res> {
  _$VideoCueWordCopyWithImpl(this._value, this._then);

  final VideoCueWord _value;
  // ignore: unused_field
  final $Res Function(VideoCueWord) _then;

  @override
  $Res call({
    Object? wordId = freezed,
    Object? mainText = freezed,
    Object? wordValue = freezed,
    Object? spaceNext = freezed,
    Object? ordering = freezed,
  }) {
    return _then(_value.copyWith(
      wordId: wordId == freezed
          ? _value.wordId
          : wordId // ignore: cast_nullable_to_non_nullable
              as String,
      mainText: mainText == freezed
          ? _value.mainText
          : mainText // ignore: cast_nullable_to_non_nullable
              as String,
      wordValue: wordValue == freezed
          ? _value.wordValue
          : wordValue // ignore: cast_nullable_to_non_nullable
              as String,
      spaceNext: spaceNext == freezed
          ? _value.spaceNext
          : spaceNext // ignore: cast_nullable_to_non_nullable
              as String,
      ordering: ordering == freezed
          ? _value.ordering
          : ordering // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$VideoCueWordCopyWith<$Res>
    implements $VideoCueWordCopyWith<$Res> {
  factory _$VideoCueWordCopyWith(
          _VideoCueWord value, $Res Function(_VideoCueWord) then) =
      __$VideoCueWordCopyWithImpl<$Res>;
  @override
  $Res call(
      {String wordId,
      String mainText,
      String wordValue,
      String spaceNext,
      String ordering});
}

/// @nodoc
class __$VideoCueWordCopyWithImpl<$Res> extends _$VideoCueWordCopyWithImpl<$Res>
    implements _$VideoCueWordCopyWith<$Res> {
  __$VideoCueWordCopyWithImpl(
      _VideoCueWord _value, $Res Function(_VideoCueWord) _then)
      : super(_value, (v) => _then(v as _VideoCueWord));

  @override
  _VideoCueWord get _value => super._value as _VideoCueWord;

  @override
  $Res call({
    Object? wordId = freezed,
    Object? mainText = freezed,
    Object? wordValue = freezed,
    Object? spaceNext = freezed,
    Object? ordering = freezed,
  }) {
    return _then(_VideoCueWord(
      wordId == freezed
          ? _value.wordId
          : wordId // ignore: cast_nullable_to_non_nullable
              as String,
      mainText == freezed
          ? _value.mainText
          : mainText // ignore: cast_nullable_to_non_nullable
              as String,
      wordValue == freezed
          ? _value.wordValue
          : wordValue // ignore: cast_nullable_to_non_nullable
              as String,
      spaceNext == freezed
          ? _value.spaceNext
          : spaceNext // ignore: cast_nullable_to_non_nullable
              as String,
      ordering == freezed
          ? _value.ordering
          : ordering // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_VideoCueWord implements _VideoCueWord {
  _$_VideoCueWord(this.wordId, this.mainText, this.wordValue, this.spaceNext,
      this.ordering);

  factory _$_VideoCueWord.fromJson(Map<String, dynamic> json) =>
      _$$_VideoCueWordFromJson(json);

  @override
  final String wordId;
  @override
  final String mainText;
  @override
  final String wordValue;
  @override
  final String spaceNext;
  @override
  final String ordering;

  @override
  String toString() {
    return 'VideoCueWord(wordId: $wordId, mainText: $mainText, wordValue: $wordValue, spaceNext: $spaceNext, ordering: $ordering)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _VideoCueWord &&
            const DeepCollectionEquality().equals(other.wordId, wordId) &&
            const DeepCollectionEquality().equals(other.mainText, mainText) &&
            const DeepCollectionEquality().equals(other.wordValue, wordValue) &&
            const DeepCollectionEquality().equals(other.spaceNext, spaceNext) &&
            const DeepCollectionEquality().equals(other.ordering, ordering));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(wordId),
      const DeepCollectionEquality().hash(mainText),
      const DeepCollectionEquality().hash(wordValue),
      const DeepCollectionEquality().hash(spaceNext),
      const DeepCollectionEquality().hash(ordering));

  @JsonKey(ignore: true)
  @override
  _$VideoCueWordCopyWith<_VideoCueWord> get copyWith =>
      __$VideoCueWordCopyWithImpl<_VideoCueWord>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_VideoCueWordToJson(this);
  }
}

abstract class _VideoCueWord implements VideoCueWord {
  factory _VideoCueWord(String wordId, String mainText, String wordValue,
      String spaceNext, String ordering) = _$_VideoCueWord;

  factory _VideoCueWord.fromJson(Map<String, dynamic> json) =
      _$_VideoCueWord.fromJson;

  @override
  String get wordId;
  @override
  String get mainText;
  @override
  String get wordValue;
  @override
  String get spaceNext;
  @override
  String get ordering;
  @override
  @JsonKey(ignore: true)
  _$VideoCueWordCopyWith<_VideoCueWord> get copyWith =>
      throw _privateConstructorUsedError;
}
