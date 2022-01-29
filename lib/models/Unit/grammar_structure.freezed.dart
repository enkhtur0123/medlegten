// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'grammar_structure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GrammarStructure _$GrammarStructureFromJson(Map<String, dynamic> json) {
  return _GrammarStructure.fromJson(json);
}

/// @nodoc
class _$GrammarStructureTearOff {
  const _$GrammarStructureTearOff();

  _GrammarStructure call(
      String part, String nameEng, String nameMon, String nameShort) {
    return _GrammarStructure(
      part,
      nameEng,
      nameMon,
      nameShort,
    );
  }

  GrammarStructure fromJson(Map<String, Object?> json) {
    return GrammarStructure.fromJson(json);
  }
}

/// @nodoc
const $GrammarStructure = _$GrammarStructureTearOff();

/// @nodoc
mixin _$GrammarStructure {
  String get part => throw _privateConstructorUsedError;
  String get nameEng => throw _privateConstructorUsedError;
  String get nameMon => throw _privateConstructorUsedError;
  String get nameShort => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GrammarStructureCopyWith<GrammarStructure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GrammarStructureCopyWith<$Res> {
  factory $GrammarStructureCopyWith(
          GrammarStructure value, $Res Function(GrammarStructure) then) =
      _$GrammarStructureCopyWithImpl<$Res>;
  $Res call({String part, String nameEng, String nameMon, String nameShort});
}

/// @nodoc
class _$GrammarStructureCopyWithImpl<$Res>
    implements $GrammarStructureCopyWith<$Res> {
  _$GrammarStructureCopyWithImpl(this._value, this._then);

  final GrammarStructure _value;
  // ignore: unused_field
  final $Res Function(GrammarStructure) _then;

  @override
  $Res call({
    Object? part = freezed,
    Object? nameEng = freezed,
    Object? nameMon = freezed,
    Object? nameShort = freezed,
  }) {
    return _then(_value.copyWith(
      part: part == freezed
          ? _value.part
          : part // ignore: cast_nullable_to_non_nullable
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
abstract class _$GrammarStructureCopyWith<$Res>
    implements $GrammarStructureCopyWith<$Res> {
  factory _$GrammarStructureCopyWith(
          _GrammarStructure value, $Res Function(_GrammarStructure) then) =
      __$GrammarStructureCopyWithImpl<$Res>;
  @override
  $Res call({String part, String nameEng, String nameMon, String nameShort});
}

/// @nodoc
class __$GrammarStructureCopyWithImpl<$Res>
    extends _$GrammarStructureCopyWithImpl<$Res>
    implements _$GrammarStructureCopyWith<$Res> {
  __$GrammarStructureCopyWithImpl(
      _GrammarStructure _value, $Res Function(_GrammarStructure) _then)
      : super(_value, (v) => _then(v as _GrammarStructure));

  @override
  _GrammarStructure get _value => super._value as _GrammarStructure;

  @override
  $Res call({
    Object? part = freezed,
    Object? nameEng = freezed,
    Object? nameMon = freezed,
    Object? nameShort = freezed,
  }) {
    return _then(_GrammarStructure(
      part == freezed
          ? _value.part
          : part // ignore: cast_nullable_to_non_nullable
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
class _$_GrammarStructure implements _GrammarStructure {
  _$_GrammarStructure(this.part, this.nameEng, this.nameMon, this.nameShort);

  factory _$_GrammarStructure.fromJson(Map<String, dynamic> json) =>
      _$$_GrammarStructureFromJson(json);

  @override
  final String part;
  @override
  final String nameEng;
  @override
  final String nameMon;
  @override
  final String nameShort;

  @override
  String toString() {
    return 'GrammarStructure(part: $part, nameEng: $nameEng, nameMon: $nameMon, nameShort: $nameShort)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GrammarStructure &&
            const DeepCollectionEquality().equals(other.part, part) &&
            const DeepCollectionEquality().equals(other.nameEng, nameEng) &&
            const DeepCollectionEquality().equals(other.nameMon, nameMon) &&
            const DeepCollectionEquality().equals(other.nameShort, nameShort));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(part),
      const DeepCollectionEquality().hash(nameEng),
      const DeepCollectionEquality().hash(nameMon),
      const DeepCollectionEquality().hash(nameShort));

  @JsonKey(ignore: true)
  @override
  _$GrammarStructureCopyWith<_GrammarStructure> get copyWith =>
      __$GrammarStructureCopyWithImpl<_GrammarStructure>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GrammarStructureToJson(this);
  }
}

abstract class _GrammarStructure implements GrammarStructure {
  factory _GrammarStructure(
          String part, String nameEng, String nameMon, String nameShort) =
      _$_GrammarStructure;

  factory _GrammarStructure.fromJson(Map<String, dynamic> json) =
      _$_GrammarStructure.fromJson;

  @override
  String get part;
  @override
  String get nameEng;
  @override
  String get nameMon;
  @override
  String get nameShort;
  @override
  @JsonKey(ignore: true)
  _$GrammarStructureCopyWith<_GrammarStructure> get copyWith =>
      throw _privateConstructorUsedError;
}
