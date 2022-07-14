// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'exam_question.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ExamResultQuestion _$ExamResultQuestionFromJson(Map<String, dynamic> json) {
  return _ExamResultQuestion.fromJson(json);
}

/// @nodoc
class _$ExamResultQuestionTearOff {
  const _$ExamResultQuestionTearOff();

  _ExamResultQuestion call(String question, List<ExamResultAnswer> answers) {
    return _ExamResultQuestion(
      question,
      answers,
    );
  }

  ExamResultQuestion fromJson(Map<String, Object?> json) {
    return ExamResultQuestion.fromJson(json);
  }
}

/// @nodoc
const $ExamResultQuestion = _$ExamResultQuestionTearOff();

/// @nodoc
mixin _$ExamResultQuestion {
  String get question => throw _privateConstructorUsedError;
  List<ExamResultAnswer> get answers => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ExamResultQuestionCopyWith<ExamResultQuestion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExamResultQuestionCopyWith<$Res> {
  factory $ExamResultQuestionCopyWith(
          ExamResultQuestion value, $Res Function(ExamResultQuestion) then) =
      _$ExamResultQuestionCopyWithImpl<$Res>;
  $Res call({String question, List<ExamResultAnswer> answers});
}

/// @nodoc
class _$ExamResultQuestionCopyWithImpl<$Res>
    implements $ExamResultQuestionCopyWith<$Res> {
  _$ExamResultQuestionCopyWithImpl(this._value, this._then);

  final ExamResultQuestion _value;
  // ignore: unused_field
  final $Res Function(ExamResultQuestion) _then;

  @override
  $Res call({
    Object? question = freezed,
    Object? answers = freezed,
  }) {
    return _then(_value.copyWith(
      question: question == freezed
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      answers: answers == freezed
          ? _value.answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<ExamResultAnswer>,
    ));
  }
}

/// @nodoc
abstract class _$ExamResultQuestionCopyWith<$Res>
    implements $ExamResultQuestionCopyWith<$Res> {
  factory _$ExamResultQuestionCopyWith(
          _ExamResultQuestion value, $Res Function(_ExamResultQuestion) then) =
      __$ExamResultQuestionCopyWithImpl<$Res>;
  @override
  $Res call({String question, List<ExamResultAnswer> answers});
}

/// @nodoc
class __$ExamResultQuestionCopyWithImpl<$Res>
    extends _$ExamResultQuestionCopyWithImpl<$Res>
    implements _$ExamResultQuestionCopyWith<$Res> {
  __$ExamResultQuestionCopyWithImpl(
      _ExamResultQuestion _value, $Res Function(_ExamResultQuestion) _then)
      : super(_value, (v) => _then(v as _ExamResultQuestion));

  @override
  _ExamResultQuestion get _value => super._value as _ExamResultQuestion;

  @override
  $Res call({
    Object? question = freezed,
    Object? answers = freezed,
  }) {
    return _then(_ExamResultQuestion(
      question == freezed
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      answers == freezed
          ? _value.answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<ExamResultAnswer>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ExamResultQuestion implements _ExamResultQuestion {
  _$_ExamResultQuestion(this.question, this.answers);

  factory _$_ExamResultQuestion.fromJson(Map<String, dynamic> json) =>
      _$$_ExamResultQuestionFromJson(json);

  @override
  final String question;
  @override
  final List<ExamResultAnswer> answers;

  @override
  String toString() {
    return 'ExamResultQuestion(question: $question, answers: $answers)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ExamResultQuestion &&
            const DeepCollectionEquality().equals(other.question, question) &&
            const DeepCollectionEquality().equals(other.answers, answers));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(question),
      const DeepCollectionEquality().hash(answers));

  @JsonKey(ignore: true)
  @override
  _$ExamResultQuestionCopyWith<_ExamResultQuestion> get copyWith =>
      __$ExamResultQuestionCopyWithImpl<_ExamResultQuestion>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ExamResultQuestionToJson(this);
  }
}

abstract class _ExamResultQuestion implements ExamResultQuestion {
  factory _ExamResultQuestion(String question, List<ExamResultAnswer> answers) =
      _$_ExamResultQuestion;

  factory _ExamResultQuestion.fromJson(Map<String, dynamic> json) =
      _$_ExamResultQuestion.fromJson;

  @override
  String get question;
  @override
  List<ExamResultAnswer> get answers;
  @override
  @JsonKey(ignore: true)
  _$ExamResultQuestionCopyWith<_ExamResultQuestion> get copyWith =>
      throw _privateConstructorUsedError;
}
