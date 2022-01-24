// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unit_grammar.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnitGrammar _$UnitGrammarFromJson(Map<String, dynamic> json) {
  return _UnitGrammar.fromJson(json);
}

/// @nodoc
class _$UnitGrammarTearOff {
  const _$UnitGrammarTearOff();

  _UnitGrammar call(String label, String tosentence, String fromsentence,
      List<Grammar> grammar, List<Sentence> sentences) {
    return _UnitGrammar(
      label,
      tosentence,
      fromsentence,
      grammar,
      sentences,
    );
  }

  UnitGrammar fromJson(Map<String, Object?> json) {
    return UnitGrammar.fromJson(json);
  }
}

/// @nodoc
const $UnitGrammar = _$UnitGrammarTearOff();

/// @nodoc
mixin _$UnitGrammar {
  String get label => throw _privateConstructorUsedError;
  String get tosentence => throw _privateConstructorUsedError;
  String get fromsentence => throw _privateConstructorUsedError;
  List<Grammar> get grammar => throw _privateConstructorUsedError;
  List<Sentence> get sentences => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnitGrammarCopyWith<UnitGrammar> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnitGrammarCopyWith<$Res> {
  factory $UnitGrammarCopyWith(
          UnitGrammar value, $Res Function(UnitGrammar) then) =
      _$UnitGrammarCopyWithImpl<$Res>;
  $Res call(
      {String label,
      String tosentence,
      String fromsentence,
      List<Grammar> grammar,
      List<Sentence> sentences});
}

/// @nodoc
class _$UnitGrammarCopyWithImpl<$Res> implements $UnitGrammarCopyWith<$Res> {
  _$UnitGrammarCopyWithImpl(this._value, this._then);

  final UnitGrammar _value;
  // ignore: unused_field
  final $Res Function(UnitGrammar) _then;

  @override
  $Res call({
    Object? label = freezed,
    Object? tosentence = freezed,
    Object? fromsentence = freezed,
    Object? grammar = freezed,
    Object? sentences = freezed,
  }) {
    return _then(_value.copyWith(
      label: label == freezed
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      tosentence: tosentence == freezed
          ? _value.tosentence
          : tosentence // ignore: cast_nullable_to_non_nullable
              as String,
      fromsentence: fromsentence == freezed
          ? _value.fromsentence
          : fromsentence // ignore: cast_nullable_to_non_nullable
              as String,
      grammar: grammar == freezed
          ? _value.grammar
          : grammar // ignore: cast_nullable_to_non_nullable
              as List<Grammar>,
      sentences: sentences == freezed
          ? _value.sentences
          : sentences // ignore: cast_nullable_to_non_nullable
              as List<Sentence>,
    ));
  }
}

/// @nodoc
abstract class _$UnitGrammarCopyWith<$Res>
    implements $UnitGrammarCopyWith<$Res> {
  factory _$UnitGrammarCopyWith(
          _UnitGrammar value, $Res Function(_UnitGrammar) then) =
      __$UnitGrammarCopyWithImpl<$Res>;
  @override
  $Res call(
      {String label,
      String tosentence,
      String fromsentence,
      List<Grammar> grammar,
      List<Sentence> sentences});
}

/// @nodoc
class __$UnitGrammarCopyWithImpl<$Res> extends _$UnitGrammarCopyWithImpl<$Res>
    implements _$UnitGrammarCopyWith<$Res> {
  __$UnitGrammarCopyWithImpl(
      _UnitGrammar _value, $Res Function(_UnitGrammar) _then)
      : super(_value, (v) => _then(v as _UnitGrammar));

  @override
  _UnitGrammar get _value => super._value as _UnitGrammar;

  @override
  $Res call({
    Object? label = freezed,
    Object? tosentence = freezed,
    Object? fromsentence = freezed,
    Object? grammar = freezed,
    Object? sentences = freezed,
  }) {
    return _then(_UnitGrammar(
      label == freezed
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      tosentence == freezed
          ? _value.tosentence
          : tosentence // ignore: cast_nullable_to_non_nullable
              as String,
      fromsentence == freezed
          ? _value.fromsentence
          : fromsentence // ignore: cast_nullable_to_non_nullable
              as String,
      grammar == freezed
          ? _value.grammar
          : grammar // ignore: cast_nullable_to_non_nullable
              as List<Grammar>,
      sentences == freezed
          ? _value.sentences
          : sentences // ignore: cast_nullable_to_non_nullable
              as List<Sentence>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnitGrammar implements _UnitGrammar {
  _$_UnitGrammar(this.label, this.tosentence, this.fromsentence, this.grammar,
      this.sentences);

  factory _$_UnitGrammar.fromJson(Map<String, dynamic> json) =>
      _$$_UnitGrammarFromJson(json);

  @override
  final String label;
  @override
  final String tosentence;
  @override
  final String fromsentence;
  @override
  final List<Grammar> grammar;
  @override
  final List<Sentence> sentences;

  @override
  String toString() {
    return 'UnitGrammar(label: $label, tosentence: $tosentence, fromsentence: $fromsentence, grammar: $grammar, sentences: $sentences)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UnitGrammar &&
            const DeepCollectionEquality().equals(other.label, label) &&
            const DeepCollectionEquality()
                .equals(other.tosentence, tosentence) &&
            const DeepCollectionEquality()
                .equals(other.fromsentence, fromsentence) &&
            const DeepCollectionEquality().equals(other.grammar, grammar) &&
            const DeepCollectionEquality().equals(other.sentences, sentences));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(label),
      const DeepCollectionEquality().hash(tosentence),
      const DeepCollectionEquality().hash(fromsentence),
      const DeepCollectionEquality().hash(grammar),
      const DeepCollectionEquality().hash(sentences));

  @JsonKey(ignore: true)
  @override
  _$UnitGrammarCopyWith<_UnitGrammar> get copyWith =>
      __$UnitGrammarCopyWithImpl<_UnitGrammar>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnitGrammarToJson(this);
  }
}

abstract class _UnitGrammar implements UnitGrammar {
  factory _UnitGrammar(String label, String tosentence, String fromsentence,
      List<Grammar> grammar, List<Sentence> sentences) = _$_UnitGrammar;

  factory _UnitGrammar.fromJson(Map<String, dynamic> json) =
      _$_UnitGrammar.fromJson;

  @override
  String get label;
  @override
  String get tosentence;
  @override
  String get fromsentence;
  @override
  List<Grammar> get grammar;
  @override
  List<Sentence> get sentences;
  @override
  @JsonKey(ignore: true)
  _$UnitGrammarCopyWith<_UnitGrammar> get copyWith =>
      throw _privateConstructorUsedError;
}
