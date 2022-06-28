// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'exam_name.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ExamName _$ExamNameFromJson(Map<String, dynamic> json) {
  return _ExamName.fromJson(json);
}

/// @nodoc
class _$ExamNameTearOff {
  const _$ExamNameTearOff();

  _ExamName call(String examName, List<ExamResult> examResult) {
    return _ExamName(
      examName,
      examResult,
    );
  }

  ExamName fromJson(Map<String, Object?> json) {
    return ExamName.fromJson(json);
  }
}

/// @nodoc
const $ExamName = _$ExamNameTearOff();

/// @nodoc
mixin _$ExamName {
  String get examName => throw _privateConstructorUsedError;
  List<ExamResult> get examResult => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ExamNameCopyWith<ExamName> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExamNameCopyWith<$Res> {
  factory $ExamNameCopyWith(ExamName value, $Res Function(ExamName) then) =
      _$ExamNameCopyWithImpl<$Res>;
  $Res call({String examName, List<ExamResult> examResult});
}

/// @nodoc
class _$ExamNameCopyWithImpl<$Res> implements $ExamNameCopyWith<$Res> {
  _$ExamNameCopyWithImpl(this._value, this._then);

  final ExamName _value;
  // ignore: unused_field
  final $Res Function(ExamName) _then;

  @override
  $Res call({
    Object? examName = freezed,
    Object? examResult = freezed,
  }) {
    return _then(_value.copyWith(
      examName: examName == freezed
          ? _value.examName
          : examName // ignore: cast_nullable_to_non_nullable
              as String,
      examResult: examResult == freezed
          ? _value.examResult
          : examResult // ignore: cast_nullable_to_non_nullable
              as List<ExamResult>,
    ));
  }
}

/// @nodoc
abstract class _$ExamNameCopyWith<$Res> implements $ExamNameCopyWith<$Res> {
  factory _$ExamNameCopyWith(_ExamName value, $Res Function(_ExamName) then) =
      __$ExamNameCopyWithImpl<$Res>;
  @override
  $Res call({String examName, List<ExamResult> examResult});
}

/// @nodoc
class __$ExamNameCopyWithImpl<$Res> extends _$ExamNameCopyWithImpl<$Res>
    implements _$ExamNameCopyWith<$Res> {
  __$ExamNameCopyWithImpl(_ExamName _value, $Res Function(_ExamName) _then)
      : super(_value, (v) => _then(v as _ExamName));

  @override
  _ExamName get _value => super._value as _ExamName;

  @override
  $Res call({
    Object? examName = freezed,
    Object? examResult = freezed,
  }) {
    return _then(_ExamName(
      examName == freezed
          ? _value.examName
          : examName // ignore: cast_nullable_to_non_nullable
              as String,
      examResult == freezed
          ? _value.examResult
          : examResult // ignore: cast_nullable_to_non_nullable
              as List<ExamResult>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ExamName implements _ExamName {
  _$_ExamName(this.examName, this.examResult);

  factory _$_ExamName.fromJson(Map<String, dynamic> json) =>
      _$$_ExamNameFromJson(json);

  @override
  final String examName;
  @override
  final List<ExamResult> examResult;

  @override
  String toString() {
    return 'ExamName(examName: $examName, examResult: $examResult)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ExamName &&
            const DeepCollectionEquality().equals(other.examName, examName) &&
            const DeepCollectionEquality()
                .equals(other.examResult, examResult));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(examName),
      const DeepCollectionEquality().hash(examResult));

  @JsonKey(ignore: true)
  @override
  _$ExamNameCopyWith<_ExamName> get copyWith =>
      __$ExamNameCopyWithImpl<_ExamName>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ExamNameToJson(this);
  }
}

abstract class _ExamName implements ExamName {
  factory _ExamName(String examName, List<ExamResult> examResult) = _$_ExamName;

  factory _ExamName.fromJson(Map<String, dynamic> json) = _$_ExamName.fromJson;

  @override
  String get examName;
  @override
  List<ExamResult> get examResult;
  @override
  @JsonKey(ignore: true)
  _$ExamNameCopyWith<_ExamName> get copyWith =>
      throw _privateConstructorUsedError;
}
