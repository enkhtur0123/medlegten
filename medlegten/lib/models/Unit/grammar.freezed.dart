// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'grammar.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Grammar _$GrammarFromJson(Map<String, dynamic> json) {
  return _Grammar.fromJson(json);
}

/// @nodoc
class _$GrammarTearOff {
  const _$GrammarTearOff();

  _Grammar call(String label, SentenceStructure structure) {
    return _Grammar(
      label,
      structure,
    );
  }

  Grammar fromJson(Map<String, Object?> json) {
    return Grammar.fromJson(json);
  }
}

/// @nodoc
const $Grammar = _$GrammarTearOff();

/// @nodoc
mixin _$Grammar {
  String get label => throw _privateConstructorUsedError;
  SentenceStructure get structure => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GrammarCopyWith<Grammar> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GrammarCopyWith<$Res> {
  factory $GrammarCopyWith(Grammar value, $Res Function(Grammar) then) =
      _$GrammarCopyWithImpl<$Res>;
  $Res call({String label, SentenceStructure structure});

  $SentenceStructureCopyWith<$Res> get structure;
}

/// @nodoc
class _$GrammarCopyWithImpl<$Res> implements $GrammarCopyWith<$Res> {
  _$GrammarCopyWithImpl(this._value, this._then);

  final Grammar _value;
  // ignore: unused_field
  final $Res Function(Grammar) _then;

  @override
  $Res call({
    Object? label = freezed,
    Object? structure = freezed,
  }) {
    return _then(_value.copyWith(
      label: label == freezed
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      structure: structure == freezed
          ? _value.structure
          : structure // ignore: cast_nullable_to_non_nullable
              as SentenceStructure,
    ));
  }

  @override
  $SentenceStructureCopyWith<$Res> get structure {
    return $SentenceStructureCopyWith<$Res>(_value.structure, (value) {
      return _then(_value.copyWith(structure: value));
    });
  }
}

/// @nodoc
abstract class _$GrammarCopyWith<$Res> implements $GrammarCopyWith<$Res> {
  factory _$GrammarCopyWith(_Grammar value, $Res Function(_Grammar) then) =
      __$GrammarCopyWithImpl<$Res>;
  @override
  $Res call({String label, SentenceStructure structure});

  @override
  $SentenceStructureCopyWith<$Res> get structure;
}

/// @nodoc
class __$GrammarCopyWithImpl<$Res> extends _$GrammarCopyWithImpl<$Res>
    implements _$GrammarCopyWith<$Res> {
  __$GrammarCopyWithImpl(_Grammar _value, $Res Function(_Grammar) _then)
      : super(_value, (v) => _then(v as _Grammar));

  @override
  _Grammar get _value => super._value as _Grammar;

  @override
  $Res call({
    Object? label = freezed,
    Object? structure = freezed,
  }) {
    return _then(_Grammar(
      label == freezed
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      structure == freezed
          ? _value.structure
          : structure // ignore: cast_nullable_to_non_nullable
              as SentenceStructure,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Grammar implements _Grammar {
  _$_Grammar(this.label, this.structure);

  factory _$_Grammar.fromJson(Map<String, dynamic> json) =>
      _$$_GrammarFromJson(json);

  @override
  final String label;
  @override
  final SentenceStructure structure;

  @override
  String toString() {
    return 'Grammar(label: $label, structure: $structure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Grammar &&
            const DeepCollectionEquality().equals(other.label, label) &&
            const DeepCollectionEquality().equals(other.structure, structure));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(label),
      const DeepCollectionEquality().hash(structure));

  @JsonKey(ignore: true)
  @override
  _$GrammarCopyWith<_Grammar> get copyWith =>
      __$GrammarCopyWithImpl<_Grammar>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GrammarToJson(this);
  }
}

abstract class _Grammar implements Grammar {
  factory _Grammar(String label, SentenceStructure structure) = _$_Grammar;

  factory _Grammar.fromJson(Map<String, dynamic> json) = _$_Grammar.fromJson;

  @override
  String get label;
  @override
  SentenceStructure get structure;
  @override
  @JsonKey(ignore: true)
  _$GrammarCopyWith<_Grammar> get copyWith =>
      throw _privateConstructorUsedError;
}
