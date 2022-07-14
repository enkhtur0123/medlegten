// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'sonsgol_word.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SonsgolWord _$SonsgolWordFromJson(Map<String, dynamic> json) {
  return _SonsgolWord.fromJson(json);
}

/// @nodoc
class _$SonsgolWordTearOff {
  const _$SonsgolWordTearOff();

  _SonsgolWord call(
      String mainText, String wordValue, String spaceNext, String ordering) {
    return _SonsgolWord(
      mainText,
      wordValue,
      spaceNext,
      ordering,
    );
  }

  SonsgolWord fromJson(Map<String, Object?> json) {
    return SonsgolWord.fromJson(json);
  }
}

/// @nodoc
const $SonsgolWord = _$SonsgolWordTearOff();

/// @nodoc
mixin _$SonsgolWord {
  String get mainText => throw _privateConstructorUsedError;
  String get wordValue => throw _privateConstructorUsedError;
  String get spaceNext => throw _privateConstructorUsedError;
  String get ordering => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SonsgolWordCopyWith<SonsgolWord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SonsgolWordCopyWith<$Res> {
  factory $SonsgolWordCopyWith(
          SonsgolWord value, $Res Function(SonsgolWord) then) =
      _$SonsgolWordCopyWithImpl<$Res>;
  $Res call(
      {String mainText, String wordValue, String spaceNext, String ordering});
}

/// @nodoc
class _$SonsgolWordCopyWithImpl<$Res> implements $SonsgolWordCopyWith<$Res> {
  _$SonsgolWordCopyWithImpl(this._value, this._then);

  final SonsgolWord _value;
  // ignore: unused_field
  final $Res Function(SonsgolWord) _then;

  @override
  $Res call({
    Object? mainText = freezed,
    Object? wordValue = freezed,
    Object? spaceNext = freezed,
    Object? ordering = freezed,
  }) {
    return _then(_value.copyWith(
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
abstract class _$SonsgolWordCopyWith<$Res>
    implements $SonsgolWordCopyWith<$Res> {
  factory _$SonsgolWordCopyWith(
          _SonsgolWord value, $Res Function(_SonsgolWord) then) =
      __$SonsgolWordCopyWithImpl<$Res>;
  @override
  $Res call(
      {String mainText, String wordValue, String spaceNext, String ordering});
}

/// @nodoc
class __$SonsgolWordCopyWithImpl<$Res> extends _$SonsgolWordCopyWithImpl<$Res>
    implements _$SonsgolWordCopyWith<$Res> {
  __$SonsgolWordCopyWithImpl(
      _SonsgolWord _value, $Res Function(_SonsgolWord) _then)
      : super(_value, (v) => _then(v as _SonsgolWord));

  @override
  _SonsgolWord get _value => super._value as _SonsgolWord;

  @override
  $Res call({
    Object? mainText = freezed,
    Object? wordValue = freezed,
    Object? spaceNext = freezed,
    Object? ordering = freezed,
  }) {
    return _then(_SonsgolWord(
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
class _$_SonsgolWord implements _SonsgolWord {
  _$_SonsgolWord(this.mainText, this.wordValue, this.spaceNext, this.ordering);

  factory _$_SonsgolWord.fromJson(Map<String, dynamic> json) =>
      _$$_SonsgolWordFromJson(json);

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
    return 'SonsgolWord(mainText: $mainText, wordValue: $wordValue, spaceNext: $spaceNext, ordering: $ordering)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SonsgolWord &&
            const DeepCollectionEquality().equals(other.mainText, mainText) &&
            const DeepCollectionEquality().equals(other.wordValue, wordValue) &&
            const DeepCollectionEquality().equals(other.spaceNext, spaceNext) &&
            const DeepCollectionEquality().equals(other.ordering, ordering));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(mainText),
      const DeepCollectionEquality().hash(wordValue),
      const DeepCollectionEquality().hash(spaceNext),
      const DeepCollectionEquality().hash(ordering));

  @JsonKey(ignore: true)
  @override
  _$SonsgolWordCopyWith<_SonsgolWord> get copyWith =>
      __$SonsgolWordCopyWithImpl<_SonsgolWord>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SonsgolWordToJson(this);
  }
}

abstract class _SonsgolWord implements SonsgolWord {
  factory _SonsgolWord(String mainText, String wordValue, String spaceNext,
      String ordering) = _$_SonsgolWord;

  factory _SonsgolWord.fromJson(Map<String, dynamic> json) =
      _$_SonsgolWord.fromJson;

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
  _$SonsgolWordCopyWith<_SonsgolWord> get copyWith =>
      throw _privateConstructorUsedError;
}
