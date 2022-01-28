// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'root_word_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RootWordInfo _$RootWordInfoFromJson(Map<String, dynamic> json) {
  return _RootWordInfo.fromJson(json);
}

/// @nodoc
class _$RootWordInfoTearOff {
  const _$RootWordInfoTearOff();

  _RootWordInfo call(
      String? rootWordId, String? rootWord, List<Translation>? translation) {
    return _RootWordInfo(
      rootWordId,
      rootWord,
      translation,
    );
  }

  RootWordInfo fromJson(Map<String, Object?> json) {
    return RootWordInfo.fromJson(json);
  }
}

/// @nodoc
const $RootWordInfo = _$RootWordInfoTearOff();

/// @nodoc
mixin _$RootWordInfo {
  String? get rootWordId => throw _privateConstructorUsedError;
  String? get rootWord => throw _privateConstructorUsedError;
  List<Translation>? get translation => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RootWordInfoCopyWith<RootWordInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RootWordInfoCopyWith<$Res> {
  factory $RootWordInfoCopyWith(
          RootWordInfo value, $Res Function(RootWordInfo) then) =
      _$RootWordInfoCopyWithImpl<$Res>;
  $Res call(
      {String? rootWordId, String? rootWord, List<Translation>? translation});
}

/// @nodoc
class _$RootWordInfoCopyWithImpl<$Res> implements $RootWordInfoCopyWith<$Res> {
  _$RootWordInfoCopyWithImpl(this._value, this._then);

  final RootWordInfo _value;
  // ignore: unused_field
  final $Res Function(RootWordInfo) _then;

  @override
  $Res call({
    Object? rootWordId = freezed,
    Object? rootWord = freezed,
    Object? translation = freezed,
  }) {
    return _then(_value.copyWith(
      rootWordId: rootWordId == freezed
          ? _value.rootWordId
          : rootWordId // ignore: cast_nullable_to_non_nullable
              as String?,
      rootWord: rootWord == freezed
          ? _value.rootWord
          : rootWord // ignore: cast_nullable_to_non_nullable
              as String?,
      translation: translation == freezed
          ? _value.translation
          : translation // ignore: cast_nullable_to_non_nullable
              as List<Translation>?,
    ));
  }
}

/// @nodoc
abstract class _$RootWordInfoCopyWith<$Res>
    implements $RootWordInfoCopyWith<$Res> {
  factory _$RootWordInfoCopyWith(
          _RootWordInfo value, $Res Function(_RootWordInfo) then) =
      __$RootWordInfoCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? rootWordId, String? rootWord, List<Translation>? translation});
}

/// @nodoc
class __$RootWordInfoCopyWithImpl<$Res> extends _$RootWordInfoCopyWithImpl<$Res>
    implements _$RootWordInfoCopyWith<$Res> {
  __$RootWordInfoCopyWithImpl(
      _RootWordInfo _value, $Res Function(_RootWordInfo) _then)
      : super(_value, (v) => _then(v as _RootWordInfo));

  @override
  _RootWordInfo get _value => super._value as _RootWordInfo;

  @override
  $Res call({
    Object? rootWordId = freezed,
    Object? rootWord = freezed,
    Object? translation = freezed,
  }) {
    return _then(_RootWordInfo(
      rootWordId == freezed
          ? _value.rootWordId
          : rootWordId // ignore: cast_nullable_to_non_nullable
              as String?,
      rootWord == freezed
          ? _value.rootWord
          : rootWord // ignore: cast_nullable_to_non_nullable
              as String?,
      translation == freezed
          ? _value.translation
          : translation // ignore: cast_nullable_to_non_nullable
              as List<Translation>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RootWordInfo implements _RootWordInfo {
  _$_RootWordInfo(this.rootWordId, this.rootWord, this.translation);

  factory _$_RootWordInfo.fromJson(Map<String, dynamic> json) =>
      _$$_RootWordInfoFromJson(json);

  @override
  final String? rootWordId;
  @override
  final String? rootWord;
  @override
  final List<Translation>? translation;

  @override
  String toString() {
    return 'RootWordInfo(rootWordId: $rootWordId, rootWord: $rootWord, translation: $translation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RootWordInfo &&
            const DeepCollectionEquality()
                .equals(other.rootWordId, rootWordId) &&
            const DeepCollectionEquality().equals(other.rootWord, rootWord) &&
            const DeepCollectionEquality()
                .equals(other.translation, translation));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(rootWordId),
      const DeepCollectionEquality().hash(rootWord),
      const DeepCollectionEquality().hash(translation));

  @JsonKey(ignore: true)
  @override
  _$RootWordInfoCopyWith<_RootWordInfo> get copyWith =>
      __$RootWordInfoCopyWithImpl<_RootWordInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RootWordInfoToJson(this);
  }
}

abstract class _RootWordInfo implements RootWordInfo {
  factory _RootWordInfo(String? rootWordId, String? rootWord,
      List<Translation>? translation) = _$_RootWordInfo;

  factory _RootWordInfo.fromJson(Map<String, dynamic> json) =
      _$_RootWordInfo.fromJson;

  @override
  String? get rootWordId;
  @override
  String? get rootWord;
  @override
  List<Translation>? get translation;
  @override
  @JsonKey(ignore: true)
  _$RootWordInfoCopyWith<_RootWordInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
