// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'sentence_structure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SentenceStructure _$SentenceStructureFromJson(Map<String, dynamic> json) {
  return _SentenceStructure.fromJson(json);
}

/// @nodoc
class _$SentenceStructureTearOff {
  const _$SentenceStructureTearOff();

  _SentenceStructure call(String part, String word, String nameEng,
      String nameMon, String nameShort) {
    return _SentenceStructure(
      part,
      word,
      nameEng,
      nameMon,
      nameShort,
    );
  }

  SentenceStructure fromJson(Map<String, Object?> json) {
    return SentenceStructure.fromJson(json);
  }
}

/// @nodoc
const $SentenceStructure = _$SentenceStructureTearOff();

/// @nodoc
mixin _$SentenceStructure {
  String get part => throw _privateConstructorUsedError;
  String get word => throw _privateConstructorUsedError;
  String get nameEng => throw _privateConstructorUsedError;
  String get nameMon => throw _privateConstructorUsedError;
  String get nameShort => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SentenceStructureCopyWith<SentenceStructure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SentenceStructureCopyWith<$Res> {
  factory $SentenceStructureCopyWith(
          SentenceStructure value, $Res Function(SentenceStructure) then) =
      _$SentenceStructureCopyWithImpl<$Res>;
  $Res call(
      {String part,
      String word,
      String nameEng,
      String nameMon,
      String nameShort});
}

/// @nodoc
class _$SentenceStructureCopyWithImpl<$Res>
    implements $SentenceStructureCopyWith<$Res> {
  _$SentenceStructureCopyWithImpl(this._value, this._then);

  final SentenceStructure _value;
  // ignore: unused_field
  final $Res Function(SentenceStructure) _then;

  @override
  $Res call({
    Object? part = freezed,
    Object? word = freezed,
    Object? nameEng = freezed,
    Object? nameMon = freezed,
    Object? nameShort = freezed,
  }) {
    return _then(_value.copyWith(
      part: part == freezed
          ? _value.part
          : part // ignore: cast_nullable_to_non_nullable
              as String,
      word: word == freezed
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String,
      nameEng: nameEng == freezed
          ? _value.nameEng
          : nameEng // ignore: cast_nullable_to_non_nullable
              as String,
      nameMon: nameMon == freezed
          ? _value.nameMon
          : nameMon // ignore: cast_nullable_to_non_nullable
              as String,
      nameShort: nameShort == freezed
          ? _value.nameShort
          : nameShort // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$SentenceStructureCopyWith<$Res>
    implements $SentenceStructureCopyWith<$Res> {
  factory _$SentenceStructureCopyWith(
          _SentenceStructure value, $Res Function(_SentenceStructure) then) =
      __$SentenceStructureCopyWithImpl<$Res>;
  @override
  $Res call(
      {String part,
      String word,
      String nameEng,
      String nameMon,
      String nameShort});
}

/// @nodoc
class __$SentenceStructureCopyWithImpl<$Res>
    extends _$SentenceStructureCopyWithImpl<$Res>
    implements _$SentenceStructureCopyWith<$Res> {
  __$SentenceStructureCopyWithImpl(
      _SentenceStructure _value, $Res Function(_SentenceStructure) _then)
      : super(_value, (v) => _then(v as _SentenceStructure));

  @override
  _SentenceStructure get _value => super._value as _SentenceStructure;

  @override
  $Res call({
    Object? part = freezed,
    Object? word = freezed,
    Object? nameEng = freezed,
    Object? nameMon = freezed,
    Object? nameShort = freezed,
  }) {
    return _then(_SentenceStructure(
      part == freezed
          ? _value.part
          : part // ignore: cast_nullable_to_non_nullable
              as String,
      word == freezed
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String,
      nameEng == freezed
          ? _value.nameEng
          : nameEng // ignore: cast_nullable_to_non_nullable
              as String,
      nameMon == freezed
          ? _value.nameMon
          : nameMon // ignore: cast_nullable_to_non_nullable
              as String,
      nameShort == freezed
          ? _value.nameShort
          : nameShort // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SentenceStructure implements _SentenceStructure {
  _$_SentenceStructure(
      this.part, this.word, this.nameEng, this.nameMon, this.nameShort);

  factory _$_SentenceStructure.fromJson(Map<String, dynamic> json) =>
      _$$_SentenceStructureFromJson(json);

  @override
  final String part;
  @override
  final String word;
  @override
  final String nameEng;
  @override
  final String nameMon;
  @override
  final String nameShort;

  @override
  String toString() {
    return 'SentenceStructure(part: $part, word: $word, nameEng: $nameEng, nameMon: $nameMon, nameShort: $nameShort)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SentenceStructure &&
            const DeepCollectionEquality().equals(other.part, part) &&
            const DeepCollectionEquality().equals(other.word, word) &&
            const DeepCollectionEquality().equals(other.nameEng, nameEng) &&
            const DeepCollectionEquality().equals(other.nameMon, nameMon) &&
            const DeepCollectionEquality().equals(other.nameShort, nameShort));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(part),
      const DeepCollectionEquality().hash(word),
      const DeepCollectionEquality().hash(nameEng),
      const DeepCollectionEquality().hash(nameMon),
      const DeepCollectionEquality().hash(nameShort));

  @JsonKey(ignore: true)
  @override
  _$SentenceStructureCopyWith<_SentenceStructure> get copyWith =>
      __$SentenceStructureCopyWithImpl<_SentenceStructure>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SentenceStructureToJson(this);
  }
}

abstract class _SentenceStructure implements SentenceStructure {
  factory _SentenceStructure(String part, String word, String nameEng,
      String nameMon, String nameShort) = _$_SentenceStructure;

  factory _SentenceStructure.fromJson(Map<String, dynamic> json) =
      _$_SentenceStructure.fromJson;

  @override
  String get part;
  @override
  String get word;
  @override
  String get nameEng;
  @override
  String get nameMon;
  @override
  String get nameShort;
  @override
  @JsonKey(ignore: true)
  _$SentenceStructureCopyWith<_SentenceStructure> get copyWith =>
      throw _privateConstructorUsedError;
}
