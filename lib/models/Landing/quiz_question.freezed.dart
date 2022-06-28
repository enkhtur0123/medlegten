// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'quiz_question.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

QuizQuestion _$QuizQuestionFromJson(Map<String, dynamic> json) {
  return _QuizQuestion.fromJson(json);
}

/// @nodoc
class _$QuizQuestionTearOff {
  const _$QuizQuestionTearOff();

  _QuizQuestion call(String questionId, String question, String ordering,
      String? type, String? typeText, List<QuizAnswer> answers) {
    return _QuizQuestion(
      questionId,
      question,
      ordering,
      type,
      typeText,
      answers,
    );
  }

  QuizQuestion fromJson(Map<String, Object?> json) {
    return QuizQuestion.fromJson(json);
  }
}

/// @nodoc
const $QuizQuestion = _$QuizQuestionTearOff();

/// @nodoc
mixin _$QuizQuestion {
  String get questionId => throw _privateConstructorUsedError;
  String get question => throw _privateConstructorUsedError;
  String get ordering => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String? get typeText => throw _privateConstructorUsedError;
  List<QuizAnswer> get answers => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuizQuestionCopyWith<QuizQuestion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizQuestionCopyWith<$Res> {
  factory $QuizQuestionCopyWith(
          QuizQuestion value, $Res Function(QuizQuestion) then) =
      _$QuizQuestionCopyWithImpl<$Res>;
  $Res call(
      {String questionId,
      String question,
      String ordering,
      String? type,
      String? typeText,
      List<QuizAnswer> answers});
}

/// @nodoc
class _$QuizQuestionCopyWithImpl<$Res> implements $QuizQuestionCopyWith<$Res> {
  _$QuizQuestionCopyWithImpl(this._value, this._then);

  final QuizQuestion _value;
  // ignore: unused_field
  final $Res Function(QuizQuestion) _then;

  @override
  $Res call({
    Object? questionId = freezed,
    Object? question = freezed,
    Object? ordering = freezed,
    Object? type = freezed,
    Object? typeText = freezed,
    Object? answers = freezed,
  }) {
    return _then(_value.copyWith(
      questionId: questionId == freezed
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as String,
      question: question == freezed
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      ordering: ordering == freezed
          ? _value.ordering
          : ordering // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      typeText: typeText == freezed
          ? _value.typeText
          : typeText // ignore: cast_nullable_to_non_nullable
              as String?,
      answers: answers == freezed
          ? _value.answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<QuizAnswer>,
    ));
  }
}

/// @nodoc
abstract class _$QuizQuestionCopyWith<$Res>
    implements $QuizQuestionCopyWith<$Res> {
  factory _$QuizQuestionCopyWith(
          _QuizQuestion value, $Res Function(_QuizQuestion) then) =
      __$QuizQuestionCopyWithImpl<$Res>;
  @override
  $Res call(
      {String questionId,
      String question,
      String ordering,
      String? type,
      String? typeText,
      List<QuizAnswer> answers});
}

/// @nodoc
class __$QuizQuestionCopyWithImpl<$Res> extends _$QuizQuestionCopyWithImpl<$Res>
    implements _$QuizQuestionCopyWith<$Res> {
  __$QuizQuestionCopyWithImpl(
      _QuizQuestion _value, $Res Function(_QuizQuestion) _then)
      : super(_value, (v) => _then(v as _QuizQuestion));

  @override
  _QuizQuestion get _value => super._value as _QuizQuestion;

  @override
  $Res call({
    Object? questionId = freezed,
    Object? question = freezed,
    Object? ordering = freezed,
    Object? type = freezed,
    Object? typeText = freezed,
    Object? answers = freezed,
  }) {
    return _then(_QuizQuestion(
      questionId == freezed
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as String,
      question == freezed
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      ordering == freezed
          ? _value.ordering
          : ordering // ignore: cast_nullable_to_non_nullable
              as String,
      type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      typeText == freezed
          ? _value.typeText
          : typeText // ignore: cast_nullable_to_non_nullable
              as String?,
      answers == freezed
          ? _value.answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<QuizAnswer>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_QuizQuestion implements _QuizQuestion {
  _$_QuizQuestion(this.questionId, this.question, this.ordering, this.type,
      this.typeText, this.answers);

  factory _$_QuizQuestion.fromJson(Map<String, dynamic> json) =>
      _$$_QuizQuestionFromJson(json);

  @override
  final String questionId;
  @override
  final String question;
  @override
  final String ordering;
  @override
  final String? type;
  @override
  final String? typeText;
  @override
  final List<QuizAnswer> answers;

  @override
  String toString() {
    return 'QuizQuestion(questionId: $questionId, question: $question, ordering: $ordering, type: $type, typeText: $typeText, answers: $answers)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _QuizQuestion &&
            const DeepCollectionEquality()
                .equals(other.questionId, questionId) &&
            const DeepCollectionEquality().equals(other.question, question) &&
            const DeepCollectionEquality().equals(other.ordering, ordering) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.typeText, typeText) &&
            const DeepCollectionEquality().equals(other.answers, answers));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(questionId),
      const DeepCollectionEquality().hash(question),
      const DeepCollectionEquality().hash(ordering),
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(typeText),
      const DeepCollectionEquality().hash(answers));

  @JsonKey(ignore: true)
  @override
  _$QuizQuestionCopyWith<_QuizQuestion> get copyWith =>
      __$QuizQuestionCopyWithImpl<_QuizQuestion>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QuizQuestionToJson(this);
  }
}

abstract class _QuizQuestion implements QuizQuestion {
  factory _QuizQuestion(
      String questionId,
      String question,
      String ordering,
      String? type,
      String? typeText,
      List<QuizAnswer> answers) = _$_QuizQuestion;

  factory _QuizQuestion.fromJson(Map<String, dynamic> json) =
      _$_QuizQuestion.fromJson;

  @override
  String get questionId;
  @override
  String get question;
  @override
  String get ordering;
  @override
  String? get type;
  @override
  String? get typeText;
  @override
  List<QuizAnswer> get answers;
  @override
  @JsonKey(ignore: true)
  _$QuizQuestionCopyWith<_QuizQuestion> get copyWith =>
      throw _privateConstructorUsedError;
}
