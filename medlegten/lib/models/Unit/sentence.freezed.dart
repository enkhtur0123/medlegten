// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'sentence.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Sentence _$SentenceFromJson(Map<String, dynamic> json) {
  return _Sentence.fromJson(json);
}

/// @nodoc
class _$SentenceTearOff {
  const _$SentenceTearOff();

  _Sentence call(String group, String label, String eng, String mon,
      SentenceStructure structure) {
    return _Sentence(
      group,
      label,
      eng,
      mon,
      structure,
    );
  }

  Sentence fromJson(Map<String, Object?> json) {
    return Sentence.fromJson(json);
  }
}

/// @nodoc
const $Sentence = _$SentenceTearOff();

/// @nodoc
mixin _$Sentence {
  String get group => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  String get eng => throw _privateConstructorUsedError;
  String get mon => throw _privateConstructorUsedError;
  SentenceStructure get structure => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SentenceCopyWith<Sentence> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SentenceCopyWith<$Res> {
  factory $SentenceCopyWith(Sentence value, $Res Function(Sentence) then) =
      _$SentenceCopyWithImpl<$Res>;
  $Res call(
      {String group,
      String label,
      String eng,
      String mon,
      SentenceStructure structure});

  $SentenceStructureCopyWith<$Res> get structure;
}

/// @nodoc
class _$SentenceCopyWithImpl<$Res> implements $SentenceCopyWith<$Res> {
  _$SentenceCopyWithImpl(this._value, this._then);

  final Sentence _value;
  // ignore: unused_field
  final $Res Function(Sentence) _then;

  @override
  $Res call({
    Object? group = freezed,
    Object? label = freezed,
    Object? eng = freezed,
    Object? mon = freezed,
    Object? structure = freezed,
  }) {
    return _then(_value.copyWith(
      group: group == freezed
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as String,
      label: label == freezed
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      eng: eng == freezed
          ? _value.eng
          : eng // ignore: cast_nullable_to_non_nullable
              as String,
      mon: mon == freezed
          ? _value.mon
          : mon // ignore: cast_nullable_to_non_nullable
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
abstract class _$SentenceCopyWith<$Res> implements $SentenceCopyWith<$Res> {
  factory _$SentenceCopyWith(_Sentence value, $Res Function(_Sentence) then) =
      __$SentenceCopyWithImpl<$Res>;
  @override
  $Res call(
      {String group,
      String label,
      String eng,
      String mon,
      SentenceStructure structure});

  @override
  $SentenceStructureCopyWith<$Res> get structure;
}

/// @nodoc
class __$SentenceCopyWithImpl<$Res> extends _$SentenceCopyWithImpl<$Res>
    implements _$SentenceCopyWith<$Res> {
  __$SentenceCopyWithImpl(_Sentence _value, $Res Function(_Sentence) _then)
      : super(_value, (v) => _then(v as _Sentence));

  @override
  _Sentence get _value => super._value as _Sentence;

  @override
  $Res call({
    Object? group = freezed,
    Object? label = freezed,
    Object? eng = freezed,
    Object? mon = freezed,
    Object? structure = freezed,
  }) {
    return _then(_Sentence(
      group == freezed
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as String,
      label == freezed
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      eng == freezed
          ? _value.eng
          : eng // ignore: cast_nullable_to_non_nullable
              as String,
      mon == freezed
          ? _value.mon
          : mon // ignore: cast_nullable_to_non_nullable
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
class _$_Sentence implements _Sentence {
  _$_Sentence(this.group, this.label, this.eng, this.mon, this.structure);

  factory _$_Sentence.fromJson(Map<String, dynamic> json) =>
      _$$_SentenceFromJson(json);

  @override
  final String group;
  @override
  final String label;
  @override
  final String eng;
  @override
  final String mon;
  @override
  final SentenceStructure structure;

  @override
  String toString() {
    return 'Sentence(group: $group, label: $label, eng: $eng, mon: $mon, structure: $structure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Sentence &&
            const DeepCollectionEquality().equals(other.group, group) &&
            const DeepCollectionEquality().equals(other.label, label) &&
            const DeepCollectionEquality().equals(other.eng, eng) &&
            const DeepCollectionEquality().equals(other.mon, mon) &&
            const DeepCollectionEquality().equals(other.structure, structure));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(group),
      const DeepCollectionEquality().hash(label),
      const DeepCollectionEquality().hash(eng),
      const DeepCollectionEquality().hash(mon),
      const DeepCollectionEquality().hash(structure));

  @JsonKey(ignore: true)
  @override
  _$SentenceCopyWith<_Sentence> get copyWith =>
      __$SentenceCopyWithImpl<_Sentence>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SentenceToJson(this);
  }
}

abstract class _Sentence implements Sentence {
  factory _Sentence(String group, String label, String eng, String mon,
      SentenceStructure structure) = _$_Sentence;

  factory _Sentence.fromJson(Map<String, dynamic> json) = _$_Sentence.fromJson;

  @override
  String get group;
  @override
  String get label;
  @override
  String get eng;
  @override
  String get mon;
  @override
  SentenceStructure get structure;
  @override
  @JsonKey(ignore: true)
  _$SentenceCopyWith<_Sentence> get copyWith =>
      throw _privateConstructorUsedError;
}
