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

  _Sentence call(String group, String grammarLabel, String textEng,
      String textMon, String groupNumber, List<SentenceStructure> structure) {
    return _Sentence(
      group,
      grammarLabel,
      textEng,
      textMon,
      groupNumber,
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
  String get grammarLabel => throw _privateConstructorUsedError;
  String get textEng => throw _privateConstructorUsedError;
  String get textMon => throw _privateConstructorUsedError;
  String get groupNumber => throw _privateConstructorUsedError;
  List<SentenceStructure> get structure => throw _privateConstructorUsedError;

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
      String grammarLabel,
      String textEng,
      String textMon,
      String groupNumber,
      List<SentenceStructure> structure});
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
    Object? grammarLabel = freezed,
    Object? textEng = freezed,
    Object? textMon = freezed,
    Object? groupNumber = freezed,
    Object? structure = freezed,
  }) {
    return _then(_value.copyWith(
      group: group == freezed
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as String,
      grammarLabel: grammarLabel == freezed
          ? _value.grammarLabel
          : grammarLabel // ignore: cast_nullable_to_non_nullable
              as String,
      textEng: textEng == freezed
          ? _value.textEng
          : textEng // ignore: cast_nullable_to_non_nullable
              as String,
      textMon: textMon == freezed
          ? _value.textMon
          : textMon // ignore: cast_nullable_to_non_nullable
              as String,
      groupNumber: groupNumber == freezed
          ? _value.groupNumber
          : groupNumber // ignore: cast_nullable_to_non_nullable
              as String,
      structure: structure == freezed
          ? _value.structure
          : structure // ignore: cast_nullable_to_non_nullable
              as List<SentenceStructure>,
    ));
  }
}

/// @nodoc
abstract class _$SentenceCopyWith<$Res> implements $SentenceCopyWith<$Res> {
  factory _$SentenceCopyWith(_Sentence value, $Res Function(_Sentence) then) =
      __$SentenceCopyWithImpl<$Res>;
  @override
  $Res call(
      {String group,
      String grammarLabel,
      String textEng,
      String textMon,
      String groupNumber,
      List<SentenceStructure> structure});
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
    Object? grammarLabel = freezed,
    Object? textEng = freezed,
    Object? textMon = freezed,
    Object? groupNumber = freezed,
    Object? structure = freezed,
  }) {
    return _then(_Sentence(
      group == freezed
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as String,
      grammarLabel == freezed
          ? _value.grammarLabel
          : grammarLabel // ignore: cast_nullable_to_non_nullable
              as String,
      textEng == freezed
          ? _value.textEng
          : textEng // ignore: cast_nullable_to_non_nullable
              as String,
      textMon == freezed
          ? _value.textMon
          : textMon // ignore: cast_nullable_to_non_nullable
              as String,
      groupNumber == freezed
          ? _value.groupNumber
          : groupNumber // ignore: cast_nullable_to_non_nullable
              as String,
      structure == freezed
          ? _value.structure
          : structure // ignore: cast_nullable_to_non_nullable
              as List<SentenceStructure>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Sentence extends _Sentence {
  _$_Sentence(this.group, this.grammarLabel, this.textEng, this.textMon,
      this.groupNumber, this.structure)
      : super._();

  factory _$_Sentence.fromJson(Map<String, dynamic> json) =>
      _$$_SentenceFromJson(json);

  @override
  final String group;
  @override
  final String grammarLabel;
  @override
  final String textEng;
  @override
  final String textMon;
  @override
  final String groupNumber;
  @override
  final List<SentenceStructure> structure;

  @override
  String toString() {
    return 'Sentence(group: $group, grammarLabel: $grammarLabel, textEng: $textEng, textMon: $textMon, groupNumber: $groupNumber, structure: $structure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Sentence &&
            const DeepCollectionEquality().equals(other.group, group) &&
            const DeepCollectionEquality()
                .equals(other.grammarLabel, grammarLabel) &&
            const DeepCollectionEquality().equals(other.textEng, textEng) &&
            const DeepCollectionEquality().equals(other.textMon, textMon) &&
            const DeepCollectionEquality()
                .equals(other.groupNumber, groupNumber) &&
            const DeepCollectionEquality().equals(other.structure, structure));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(group),
      const DeepCollectionEquality().hash(grammarLabel),
      const DeepCollectionEquality().hash(textEng),
      const DeepCollectionEquality().hash(textMon),
      const DeepCollectionEquality().hash(groupNumber),
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

abstract class _Sentence extends Sentence {
  factory _Sentence(
      String group,
      String grammarLabel,
      String textEng,
      String textMon,
      String groupNumber,
      List<SentenceStructure> structure) = _$_Sentence;
  _Sentence._() : super._();

  factory _Sentence.fromJson(Map<String, dynamic> json) = _$_Sentence.fromJson;

  @override
  String get group;
  @override
  String get grammarLabel;
  @override
  String get textEng;
  @override
  String get textMon;
  @override
  String get groupNumber;
  @override
  List<SentenceStructure> get structure;
  @override
  @JsonKey(ignore: true)
  _$SentenceCopyWith<_Sentence> get copyWith =>
      throw _privateConstructorUsedError;
}
