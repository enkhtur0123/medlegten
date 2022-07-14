// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unit_test_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnitTestModel _$UnitTestModelFromJson(Map<String, dynamic> json) {
  return _UnitTestModel.fromJson(json);
}

/// @nodoc
class _$UnitTestModelTearOff {
  const _$UnitTestModelTearOff();

  _UnitTestModel call(String examId, String examName, String examType,
      List<UnitTestQuestionModel> questions) {
    return _UnitTestModel(
      examId,
      examName,
      examType,
      questions,
    );
  }

  UnitTestModel fromJson(Map<String, Object?> json) {
    return UnitTestModel.fromJson(json);
  }
}

/// @nodoc
const $UnitTestModel = _$UnitTestModelTearOff();

/// @nodoc
mixin _$UnitTestModel {
  String get examId => throw _privateConstructorUsedError;
  String get examName => throw _privateConstructorUsedError;
  String get examType => throw _privateConstructorUsedError;
  List<UnitTestQuestionModel> get questions =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnitTestModelCopyWith<UnitTestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnitTestModelCopyWith<$Res> {
  factory $UnitTestModelCopyWith(
          UnitTestModel value, $Res Function(UnitTestModel) then) =
      _$UnitTestModelCopyWithImpl<$Res>;
  $Res call(
      {String examId,
      String examName,
      String examType,
      List<UnitTestQuestionModel> questions});
}

/// @nodoc
class _$UnitTestModelCopyWithImpl<$Res>
    implements $UnitTestModelCopyWith<$Res> {
  _$UnitTestModelCopyWithImpl(this._value, this._then);

  final UnitTestModel _value;
  // ignore: unused_field
  final $Res Function(UnitTestModel) _then;

  @override
  $Res call({
    Object? examId = freezed,
    Object? examName = freezed,
    Object? examType = freezed,
    Object? questions = freezed,
  }) {
    return _then(_value.copyWith(
      examId: examId == freezed
          ? _value.examId
          : examId // ignore: cast_nullable_to_non_nullable
              as String,
      examName: examName == freezed
          ? _value.examName
          : examName // ignore: cast_nullable_to_non_nullable
              as String,
      examType: examType == freezed
          ? _value.examType
          : examType // ignore: cast_nullable_to_non_nullable
              as String,
      questions: questions == freezed
          ? _value.questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<UnitTestQuestionModel>,
    ));
  }
}

/// @nodoc
abstract class _$UnitTestModelCopyWith<$Res>
    implements $UnitTestModelCopyWith<$Res> {
  factory _$UnitTestModelCopyWith(
          _UnitTestModel value, $Res Function(_UnitTestModel) then) =
      __$UnitTestModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String examId,
      String examName,
      String examType,
      List<UnitTestQuestionModel> questions});
}

/// @nodoc
class __$UnitTestModelCopyWithImpl<$Res>
    extends _$UnitTestModelCopyWithImpl<$Res>
    implements _$UnitTestModelCopyWith<$Res> {
  __$UnitTestModelCopyWithImpl(
      _UnitTestModel _value, $Res Function(_UnitTestModel) _then)
      : super(_value, (v) => _then(v as _UnitTestModel));

  @override
  _UnitTestModel get _value => super._value as _UnitTestModel;

  @override
  $Res call({
    Object? examId = freezed,
    Object? examName = freezed,
    Object? examType = freezed,
    Object? questions = freezed,
  }) {
    return _then(_UnitTestModel(
      examId == freezed
          ? _value.examId
          : examId // ignore: cast_nullable_to_non_nullable
              as String,
      examName == freezed
          ? _value.examName
          : examName // ignore: cast_nullable_to_non_nullable
              as String,
      examType == freezed
          ? _value.examType
          : examType // ignore: cast_nullable_to_non_nullable
              as String,
      questions == freezed
          ? _value.questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<UnitTestQuestionModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnitTestModel implements _UnitTestModel {
  _$_UnitTestModel(this.examId, this.examName, this.examType, this.questions);

  factory _$_UnitTestModel.fromJson(Map<String, dynamic> json) =>
      _$$_UnitTestModelFromJson(json);

  @override
  final String examId;
  @override
  final String examName;
  @override
  final String examType;
  @override
  final List<UnitTestQuestionModel> questions;

  @override
  String toString() {
    return 'UnitTestModel(examId: $examId, examName: $examName, examType: $examType, questions: $questions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UnitTestModel &&
            const DeepCollectionEquality().equals(other.examId, examId) &&
            const DeepCollectionEquality().equals(other.examName, examName) &&
            const DeepCollectionEquality().equals(other.examType, examType) &&
            const DeepCollectionEquality().equals(other.questions, questions));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(examId),
      const DeepCollectionEquality().hash(examName),
      const DeepCollectionEquality().hash(examType),
      const DeepCollectionEquality().hash(questions));

  @JsonKey(ignore: true)
  @override
  _$UnitTestModelCopyWith<_UnitTestModel> get copyWith =>
      __$UnitTestModelCopyWithImpl<_UnitTestModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnitTestModelToJson(this);
  }
}

abstract class _UnitTestModel implements UnitTestModel {
  factory _UnitTestModel(String examId, String examName, String examType,
      List<UnitTestQuestionModel> questions) = _$_UnitTestModel;

  factory _UnitTestModel.fromJson(Map<String, dynamic> json) =
      _$_UnitTestModel.fromJson;

  @override
  String get examId;
  @override
  String get examName;
  @override
  String get examType;
  @override
  List<UnitTestQuestionModel> get questions;
  @override
  @JsonKey(ignore: true)
  _$UnitTestModelCopyWith<_UnitTestModel> get copyWith =>
      throw _privateConstructorUsedError;
}
