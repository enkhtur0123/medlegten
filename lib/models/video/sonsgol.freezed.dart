// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'sonsgol.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Sonsgol _$SonsgolFromJson(Map<String, dynamic> json) {
  return _Sonsgol.fromJson(json);
}

/// @nodoc
class _$SonsgolTearOff {
  const _$SonsgolTearOff();

  _Sonsgol call(
      String? cueId,
      String? startTime,
      String? endTime,
      String? fromLangTranslation,
      String? toLangTranslation,
      List<SonsgolWord> words) {
    return _Sonsgol(
      cueId,
      startTime,
      endTime,
      fromLangTranslation,
      toLangTranslation,
      words,
    );
  }

  Sonsgol fromJson(Map<String, Object?> json) {
    return Sonsgol.fromJson(json);
  }
}

/// @nodoc
const $Sonsgol = _$SonsgolTearOff();

/// @nodoc
mixin _$Sonsgol {
  String? get cueId => throw _privateConstructorUsedError;
  String? get startTime => throw _privateConstructorUsedError;
  String? get endTime => throw _privateConstructorUsedError;
  String? get fromLangTranslation => throw _privateConstructorUsedError;
  String? get toLangTranslation => throw _privateConstructorUsedError;
  List<SonsgolWord> get words => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SonsgolCopyWith<Sonsgol> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SonsgolCopyWith<$Res> {
  factory $SonsgolCopyWith(Sonsgol value, $Res Function(Sonsgol) then) =
      _$SonsgolCopyWithImpl<$Res>;
  $Res call(
      {String? cueId,
      String? startTime,
      String? endTime,
      String? fromLangTranslation,
      String? toLangTranslation,
      List<SonsgolWord> words});
}

/// @nodoc
class _$SonsgolCopyWithImpl<$Res> implements $SonsgolCopyWith<$Res> {
  _$SonsgolCopyWithImpl(this._value, this._then);

  final Sonsgol _value;
  // ignore: unused_field
  final $Res Function(Sonsgol) _then;

  @override
  $Res call({
    Object? cueId = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? fromLangTranslation = freezed,
    Object? toLangTranslation = freezed,
    Object? words = freezed,
  }) {
    return _then(_value.copyWith(
      cueId: cueId == freezed
          ? _value.cueId
          : cueId // ignore: cast_nullable_to_non_nullable
              as String?,
      startTime: startTime == freezed
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String?,
      endTime: endTime == freezed
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String?,
      fromLangTranslation: fromLangTranslation == freezed
          ? _value.fromLangTranslation
          : fromLangTranslation // ignore: cast_nullable_to_non_nullable
              as String?,
      toLangTranslation: toLangTranslation == freezed
          ? _value.toLangTranslation
          : toLangTranslation // ignore: cast_nullable_to_non_nullable
              as String?,
      words: words == freezed
          ? _value.words
          : words // ignore: cast_nullable_to_non_nullable
              as List<SonsgolWord>,
    ));
  }
}

/// @nodoc
abstract class _$SonsgolCopyWith<$Res> implements $SonsgolCopyWith<$Res> {
  factory _$SonsgolCopyWith(_Sonsgol value, $Res Function(_Sonsgol) then) =
      __$SonsgolCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? cueId,
      String? startTime,
      String? endTime,
      String? fromLangTranslation,
      String? toLangTranslation,
      List<SonsgolWord> words});
}

/// @nodoc
class __$SonsgolCopyWithImpl<$Res> extends _$SonsgolCopyWithImpl<$Res>
    implements _$SonsgolCopyWith<$Res> {
  __$SonsgolCopyWithImpl(_Sonsgol _value, $Res Function(_Sonsgol) _then)
      : super(_value, (v) => _then(v as _Sonsgol));

  @override
  _Sonsgol get _value => super._value as _Sonsgol;

  @override
  $Res call({
    Object? cueId = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? fromLangTranslation = freezed,
    Object? toLangTranslation = freezed,
    Object? words = freezed,
  }) {
    return _then(_Sonsgol(
      cueId == freezed
          ? _value.cueId
          : cueId // ignore: cast_nullable_to_non_nullable
              as String?,
      startTime == freezed
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String?,
      endTime == freezed
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String?,
      fromLangTranslation == freezed
          ? _value.fromLangTranslation
          : fromLangTranslation // ignore: cast_nullable_to_non_nullable
              as String?,
      toLangTranslation == freezed
          ? _value.toLangTranslation
          : toLangTranslation // ignore: cast_nullable_to_non_nullable
              as String?,
      words == freezed
          ? _value.words
          : words // ignore: cast_nullable_to_non_nullable
              as List<SonsgolWord>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Sonsgol implements _Sonsgol {
  _$_Sonsgol(this.cueId, this.startTime, this.endTime, this.fromLangTranslation,
      this.toLangTranslation, this.words);

  factory _$_Sonsgol.fromJson(Map<String, dynamic> json) =>
      _$$_SonsgolFromJson(json);

  @override
  final String? cueId;
  @override
  final String? startTime;
  @override
  final String? endTime;
  @override
  final String? fromLangTranslation;
  @override
  final String? toLangTranslation;
  @override
  final List<SonsgolWord> words;

  @override
  String toString() {
    return 'Sonsgol(cueId: $cueId, startTime: $startTime, endTime: $endTime, fromLangTranslation: $fromLangTranslation, toLangTranslation: $toLangTranslation, words: $words)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Sonsgol &&
            const DeepCollectionEquality().equals(other.cueId, cueId) &&
            const DeepCollectionEquality().equals(other.startTime, startTime) &&
            const DeepCollectionEquality().equals(other.endTime, endTime) &&
            const DeepCollectionEquality()
                .equals(other.fromLangTranslation, fromLangTranslation) &&
            const DeepCollectionEquality()
                .equals(other.toLangTranslation, toLangTranslation) &&
            const DeepCollectionEquality().equals(other.words, words));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(cueId),
      const DeepCollectionEquality().hash(startTime),
      const DeepCollectionEquality().hash(endTime),
      const DeepCollectionEquality().hash(fromLangTranslation),
      const DeepCollectionEquality().hash(toLangTranslation),
      const DeepCollectionEquality().hash(words));

  @JsonKey(ignore: true)
  @override
  _$SonsgolCopyWith<_Sonsgol> get copyWith =>
      __$SonsgolCopyWithImpl<_Sonsgol>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SonsgolToJson(this);
  }
}

abstract class _Sonsgol implements Sonsgol {
  factory _Sonsgol(
      String? cueId,
      String? startTime,
      String? endTime,
      String? fromLangTranslation,
      String? toLangTranslation,
      List<SonsgolWord> words) = _$_Sonsgol;

  factory _Sonsgol.fromJson(Map<String, dynamic> json) = _$_Sonsgol.fromJson;

  @override
  String? get cueId;
  @override
  String? get startTime;
  @override
  String? get endTime;
  @override
  String? get fromLangTranslation;
  @override
  String? get toLangTranslation;
  @override
  List<SonsgolWord> get words;
  @override
  @JsonKey(ignore: true)
  _$SonsgolCopyWith<_Sonsgol> get copyWith =>
      throw _privateConstructorUsedError;
}
