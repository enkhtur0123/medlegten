// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'translation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Translation _$TranslationFromJson(Map<String, dynamic> json) {
  return _Translation.fromJson(json);
}

/// @nodoc
class _$TranslationTearOff {
  const _$TranslationTearOff();

  _Translation call(String wordTrId, String trText, String trOrigin,
      String trTypeId, String trTypeFullName, String trTypeShortName) {
    return _Translation(
      wordTrId,
      trText,
      trOrigin,
      trTypeId,
      trTypeFullName,
      trTypeShortName,
    );
  }

  Translation fromJson(Map<String, Object?> json) {
    return Translation.fromJson(json);
  }
}

/// @nodoc
const $Translation = _$TranslationTearOff();

/// @nodoc
mixin _$Translation {
  String get wordTrId => throw _privateConstructorUsedError;
  String get trText => throw _privateConstructorUsedError;
  String get trOrigin => throw _privateConstructorUsedError;
  String get trTypeId => throw _privateConstructorUsedError;
  String get trTypeFullName => throw _privateConstructorUsedError;
  String get trTypeShortName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TranslationCopyWith<Translation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TranslationCopyWith<$Res> {
  factory $TranslationCopyWith(
          Translation value, $Res Function(Translation) then) =
      _$TranslationCopyWithImpl<$Res>;
  $Res call(
      {String wordTrId,
      String trText,
      String trOrigin,
      String trTypeId,
      String trTypeFullName,
      String trTypeShortName});
}

/// @nodoc
class _$TranslationCopyWithImpl<$Res> implements $TranslationCopyWith<$Res> {
  _$TranslationCopyWithImpl(this._value, this._then);

  final Translation _value;
  // ignore: unused_field
  final $Res Function(Translation) _then;

  @override
  $Res call({
    Object? wordTrId = freezed,
    Object? trText = freezed,
    Object? trOrigin = freezed,
    Object? trTypeId = freezed,
    Object? trTypeFullName = freezed,
    Object? trTypeShortName = freezed,
  }) {
    return _then(_value.copyWith(
      wordTrId: wordTrId == freezed
          ? _value.wordTrId
          : wordTrId // ignore: cast_nullable_to_non_nullable
              as String,
      trText: trText == freezed
          ? _value.trText
          : trText // ignore: cast_nullable_to_non_nullable
              as String,
      trOrigin: trOrigin == freezed
          ? _value.trOrigin
          : trOrigin // ignore: cast_nullable_to_non_nullable
              as String,
      trTypeId: trTypeId == freezed
          ? _value.trTypeId
          : trTypeId // ignore: cast_nullable_to_non_nullable
              as String,
      trTypeFullName: trTypeFullName == freezed
          ? _value.trTypeFullName
          : trTypeFullName // ignore: cast_nullable_to_non_nullable
              as String,
      trTypeShortName: trTypeShortName == freezed
          ? _value.trTypeShortName
          : trTypeShortName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$TranslationCopyWith<$Res>
    implements $TranslationCopyWith<$Res> {
  factory _$TranslationCopyWith(
          _Translation value, $Res Function(_Translation) then) =
      __$TranslationCopyWithImpl<$Res>;
  @override
  $Res call(
      {String wordTrId,
      String trText,
      String trOrigin,
      String trTypeId,
      String trTypeFullName,
      String trTypeShortName});
}

/// @nodoc
class __$TranslationCopyWithImpl<$Res> extends _$TranslationCopyWithImpl<$Res>
    implements _$TranslationCopyWith<$Res> {
  __$TranslationCopyWithImpl(
      _Translation _value, $Res Function(_Translation) _then)
      : super(_value, (v) => _then(v as _Translation));

  @override
  _Translation get _value => super._value as _Translation;

  @override
  $Res call({
    Object? wordTrId = freezed,
    Object? trText = freezed,
    Object? trOrigin = freezed,
    Object? trTypeId = freezed,
    Object? trTypeFullName = freezed,
    Object? trTypeShortName = freezed,
  }) {
    return _then(_Translation(
      wordTrId == freezed
          ? _value.wordTrId
          : wordTrId // ignore: cast_nullable_to_non_nullable
              as String,
      trText == freezed
          ? _value.trText
          : trText // ignore: cast_nullable_to_non_nullable
              as String,
      trOrigin == freezed
          ? _value.trOrigin
          : trOrigin // ignore: cast_nullable_to_non_nullable
              as String,
      trTypeId == freezed
          ? _value.trTypeId
          : trTypeId // ignore: cast_nullable_to_non_nullable
              as String,
      trTypeFullName == freezed
          ? _value.trTypeFullName
          : trTypeFullName // ignore: cast_nullable_to_non_nullable
              as String,
      trTypeShortName == freezed
          ? _value.trTypeShortName
          : trTypeShortName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Translation implements _Translation {
  _$_Translation(this.wordTrId, this.trText, this.trOrigin, this.trTypeId,
      this.trTypeFullName, this.trTypeShortName);

  factory _$_Translation.fromJson(Map<String, dynamic> json) =>
      _$$_TranslationFromJson(json);

  @override
  final String wordTrId;
  @override
  final String trText;
  @override
  final String trOrigin;
  @override
  final String trTypeId;
  @override
  final String trTypeFullName;
  @override
  final String trTypeShortName;

  @override
  String toString() {
    return 'Translation(wordTrId: $wordTrId, trText: $trText, trOrigin: $trOrigin, trTypeId: $trTypeId, trTypeFullName: $trTypeFullName, trTypeShortName: $trTypeShortName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Translation &&
            const DeepCollectionEquality().equals(other.wordTrId, wordTrId) &&
            const DeepCollectionEquality().equals(other.trText, trText) &&
            const DeepCollectionEquality().equals(other.trOrigin, trOrigin) &&
            const DeepCollectionEquality().equals(other.trTypeId, trTypeId) &&
            const DeepCollectionEquality()
                .equals(other.trTypeFullName, trTypeFullName) &&
            const DeepCollectionEquality()
                .equals(other.trTypeShortName, trTypeShortName));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(wordTrId),
      const DeepCollectionEquality().hash(trText),
      const DeepCollectionEquality().hash(trOrigin),
      const DeepCollectionEquality().hash(trTypeId),
      const DeepCollectionEquality().hash(trTypeFullName),
      const DeepCollectionEquality().hash(trTypeShortName));

  @JsonKey(ignore: true)
  @override
  _$TranslationCopyWith<_Translation> get copyWith =>
      __$TranslationCopyWithImpl<_Translation>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TranslationToJson(this);
  }
}

abstract class _Translation implements Translation {
  factory _Translation(
      String wordTrId,
      String trText,
      String trOrigin,
      String trTypeId,
      String trTypeFullName,
      String trTypeShortName) = _$_Translation;

  factory _Translation.fromJson(Map<String, dynamic> json) =
      _$_Translation.fromJson;

  @override
  String get wordTrId;
  @override
  String get trText;
  @override
  String get trOrigin;
  @override
  String get trTypeId;
  @override
  String get trTypeFullName;
  @override
  String get trTypeShortName;
  @override
  @JsonKey(ignore: true)
  _$TranslationCopyWith<_Translation> get copyWith =>
      throw _privateConstructorUsedError;
}
