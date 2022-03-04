// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'exam_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ExamResult _$ExamResultFromJson(Map<String, dynamic> json) {
  return _ExamResult.fromJson(json);
}

/// @nodoc
class _$ExamResultTearOff {
  const _$ExamResultTearOff();

  _ExamResult call(String segmentName, String totalPercent,
      List<ExamResultQuestion> questions) {
    return _ExamResult(
      segmentName,
      totalPercent,
      questions,
    );
  }

  ExamResult fromJson(Map<String, Object?> json) {
    return ExamResult.fromJson(json);
  }
}

/// @nodoc
const $ExamResult = _$ExamResultTearOff();

/// @nodoc
mixin _$ExamResult {
  String get segmentName => throw _privateConstructorUsedError;
  String get totalPercent => throw _privateConstructorUsedError;
  List<ExamResultQuestion> get questions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ExamResultCopyWith<ExamResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExamResultCopyWith<$Res> {
  factory $ExamResultCopyWith(
          ExamResult value, $Res Function(ExamResult) then) =
      _$ExamResultCopyWithImpl<$Res>;
  $Res call(
      {String segmentName,
      String totalPercent,
      List<ExamResultQuestion> questions});
}

/// @nodoc
class _$ExamResultCopyWithImpl<$Res> implements $ExamResultCopyWith<$Res> {
  _$ExamResultCopyWithImpl(this._value, this._then);

  final ExamResult _value;
  // ignore: unused_field
  final $Res Function(ExamResult) _then;

  @override
  $Res call({
    Object? segmentName = freezed,
    Object? totalPercent = freezed,
    Object? questions = freezed,
  }) {
    return _then(_value.copyWith(
      segmentName: segmentName == freezed
          ? _value.segmentName
          : segmentName // ignore: cast_nullable_to_non_nullable
              as String,
      totalPercent: totalPercent == freezed
          ? _value.totalPercent
          : totalPercent // ignore: cast_nullable_to_non_nullable
              as String,
      questions: questions == freezed
          ? _value.questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<ExamResultQuestion>,
    ));
  }
}

/// @nodoc
abstract class _$ExamResultCopyWith<$Res> implements $ExamResultCopyWith<$Res> {
  factory _$ExamResultCopyWith(
          _ExamResult value, $Res Function(_ExamResult) then) =
      __$ExamResultCopyWithImpl<$Res>;
  @override
  $Res call(
      {String segmentName,
      String totalPercent,
      List<ExamResultQuestion> questions});
}

/// @nodoc
class __$ExamResultCopyWithImpl<$Res> extends _$ExamResultCopyWithImpl<$Res>
    implements _$ExamResultCopyWith<$Res> {
  __$ExamResultCopyWithImpl(
      _ExamResult _value, $Res Function(_ExamResult) _then)
      : super(_value, (v) => _then(v as _ExamResult));

  @override
  _ExamResult get _value => super._value as _ExamResult;

  @override
  $Res call({
    Object? segmentName = freezed,
    Object? totalPercent = freezed,
    Object? questions = freezed,
  }) {
    return _then(_ExamResult(
      segmentName == freezed
          ? _value.segmentName
          : segmentName // ignore: cast_nullable_to_non_nullable
              as String,
      totalPercent == freezed
          ? _value.totalPercent
          : totalPercent // ignore: cast_nullable_to_non_nullable
              as String,
      questions == freezed
          ? _value.questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<ExamResultQuestion>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ExamResult implements _ExamResult {
  _$_ExamResult(this.segmentName, this.totalPercent, this.questions);

  factory _$_ExamResult.fromJson(Map<String, dynamic> json) =>
      _$$_ExamResultFromJson(json);

  @override
  final String segmentName;
  @override
  final String totalPercent;
  @override
  final List<ExamResultQuestion> questions;

  @override
  String toString() {
    return 'ExamResult(segmentName: $segmentName, totalPercent: $totalPercent, questions: $questions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ExamResult &&
            const DeepCollectionEquality()
                .equals(other.segmentName, segmentName) &&
            const DeepCollectionEquality()
                .equals(other.totalPercent, totalPercent) &&
            const DeepCollectionEquality().equals(other.questions, questions));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(segmentName),
      const DeepCollectionEquality().hash(totalPercent),
      const DeepCollectionEquality().hash(questions));

  @JsonKey(ignore: true)
  @override
  _$ExamResultCopyWith<_ExamResult> get copyWith =>
      __$ExamResultCopyWithImpl<_ExamResult>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ExamResultToJson(this);
  }
}

abstract class _ExamResult implements ExamResult {
  factory _ExamResult(String segmentName, String totalPercent,
      List<ExamResultQuestion> questions) = _$_ExamResult;

  factory _ExamResult.fromJson(Map<String, dynamic> json) =
      _$_ExamResult.fromJson;

  @override
  String get segmentName;
  @override
  String get totalPercent;
  @override
  List<ExamResultQuestion> get questions;
  @override
  @JsonKey(ignore: true)
  _$ExamResultCopyWith<_ExamResult> get copyWith =>
      throw _privateConstructorUsedError;
}
