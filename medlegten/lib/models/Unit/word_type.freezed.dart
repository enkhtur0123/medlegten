// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'word_type.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WordType _$WordTypeFromJson(Map<String, dynamic> json) {
  return _WordType.fromJson(json);
}

/// @nodoc
class _$WordTypeTearOff {
  const _$WordTypeTearOff();

  _WordType call(String wordTypeId, String typeFullName, String typeShortName) {
    return _WordType(
      wordTypeId,
      typeFullName,
      typeShortName,
    );
  }

  WordType fromJson(Map<String, Object?> json) {
    return WordType.fromJson(json);
  }
}

/// @nodoc
const $WordType = _$WordTypeTearOff();

/// @nodoc
mixin _$WordType {
  String get wordTypeId => throw _privateConstructorUsedError;
  String get typeFullName => throw _privateConstructorUsedError;
  String get typeShortName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WordTypeCopyWith<WordType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WordTypeCopyWith<$Res> {
  factory $WordTypeCopyWith(WordType value, $Res Function(WordType) then) =
      _$WordTypeCopyWithImpl<$Res>;
  $Res call({String wordTypeId, String typeFullName, String typeShortName});
}

/// @nodoc
class _$WordTypeCopyWithImpl<$Res> implements $WordTypeCopyWith<$Res> {
  _$WordTypeCopyWithImpl(this._value, this._then);

  final WordType _value;
  // ignore: unused_field
  final $Res Function(WordType) _then;

  @override
  $Res call({
    Object? wordTypeId = freezed,
    Object? typeFullName = freezed,
    Object? typeShortName = freezed,
  }) {
    return _then(_value.copyWith(
      wordTypeId: wordTypeId == freezed
          ? _value.wordTypeId
          : wordTypeId // ignore: cast_nullable_to_non_nullable
              as String,
      typeFullName: typeFullName == freezed
          ? _value.typeFullName
          : typeFullName // ignore: cast_nullable_to_non_nullable
              as String,
      typeShortName: typeShortName == freezed
          ? _value.typeShortName
          : typeShortName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$WordTypeCopyWith<$Res> implements $WordTypeCopyWith<$Res> {
  factory _$WordTypeCopyWith(_WordType value, $Res Function(_WordType) then) =
      __$WordTypeCopyWithImpl<$Res>;
  @override
  $Res call({String wordTypeId, String typeFullName, String typeShortName});
}

/// @nodoc
class __$WordTypeCopyWithImpl<$Res> extends _$WordTypeCopyWithImpl<$Res>
    implements _$WordTypeCopyWith<$Res> {
  __$WordTypeCopyWithImpl(_WordType _value, $Res Function(_WordType) _then)
      : super(_value, (v) => _then(v as _WordType));

  @override
  _WordType get _value => super._value as _WordType;

  @override
  $Res call({
    Object? wordTypeId = freezed,
    Object? typeFullName = freezed,
    Object? typeShortName = freezed,
  }) {
    return _then(_WordType(
      wordTypeId == freezed
          ? _value.wordTypeId
          : wordTypeId // ignore: cast_nullable_to_non_nullable
              as String,
      typeFullName == freezed
          ? _value.typeFullName
          : typeFullName // ignore: cast_nullable_to_non_nullable
              as String,
      typeShortName == freezed
          ? _value.typeShortName
          : typeShortName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WordType implements _WordType {
  _$_WordType(this.wordTypeId, this.typeFullName, this.typeShortName);

  factory _$_WordType.fromJson(Map<String, dynamic> json) =>
      _$$_WordTypeFromJson(json);

  @override
  final String wordTypeId;
  @override
  final String typeFullName;
  @override
  final String typeShortName;

  @override
  String toString() {
    return 'WordType(wordTypeId: $wordTypeId, typeFullName: $typeFullName, typeShortName: $typeShortName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WordType &&
            const DeepCollectionEquality()
                .equals(other.wordTypeId, wordTypeId) &&
            const DeepCollectionEquality()
                .equals(other.typeFullName, typeFullName) &&
            const DeepCollectionEquality()
                .equals(other.typeShortName, typeShortName));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(wordTypeId),
      const DeepCollectionEquality().hash(typeFullName),
      const DeepCollectionEquality().hash(typeShortName));

  @JsonKey(ignore: true)
  @override
  _$WordTypeCopyWith<_WordType> get copyWith =>
      __$WordTypeCopyWithImpl<_WordType>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WordTypeToJson(this);
  }
}

abstract class _WordType implements WordType {
  factory _WordType(
          String wordTypeId, String typeFullName, String typeShortName) =
      _$_WordType;

  factory _WordType.fromJson(Map<String, dynamic> json) = _$_WordType.fromJson;

  @override
  String get wordTypeId;
  @override
  String get typeFullName;
  @override
  String get typeShortName;
  @override
  @JsonKey(ignore: true)
  _$WordTypeCopyWith<_WordType> get copyWith =>
      throw _privateConstructorUsedError;
}
