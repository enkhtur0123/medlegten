// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'self_quiz.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SelfQuiz _$SelfQuizFromJson(Map<String, dynamic> json) {
  return _SelfQuiz.fromJson(json);
}

/// @nodoc
class _$SelfQuizTearOff {
  const _$SelfQuizTearOff();

  _SelfQuiz call(String quizId, List<QuizQuestion> questions) {
    return _SelfQuiz(
      quizId,
      questions,
    );
  }

  SelfQuiz fromJson(Map<String, Object?> json) {
    return SelfQuiz.fromJson(json);
  }
}

/// @nodoc
const $SelfQuiz = _$SelfQuizTearOff();

/// @nodoc
mixin _$SelfQuiz {
  String get quizId => throw _privateConstructorUsedError;
  List<QuizQuestion> get questions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SelfQuizCopyWith<SelfQuiz> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SelfQuizCopyWith<$Res> {
  factory $SelfQuizCopyWith(SelfQuiz value, $Res Function(SelfQuiz) then) =
      _$SelfQuizCopyWithImpl<$Res>;
  $Res call({String quizId, List<QuizQuestion> questions});
}

/// @nodoc
class _$SelfQuizCopyWithImpl<$Res> implements $SelfQuizCopyWith<$Res> {
  _$SelfQuizCopyWithImpl(this._value, this._then);

  final SelfQuiz _value;
  // ignore: unused_field
  final $Res Function(SelfQuiz) _then;

  @override
  $Res call({
    Object? quizId = freezed,
    Object? questions = freezed,
  }) {
    return _then(_value.copyWith(
      quizId: quizId == freezed
          ? _value.quizId
          : quizId // ignore: cast_nullable_to_non_nullable
              as String,
      questions: questions == freezed
          ? _value.questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<QuizQuestion>,
    ));
  }
}

/// @nodoc
abstract class _$SelfQuizCopyWith<$Res> implements $SelfQuizCopyWith<$Res> {
  factory _$SelfQuizCopyWith(_SelfQuiz value, $Res Function(_SelfQuiz) then) =
      __$SelfQuizCopyWithImpl<$Res>;
  @override
  $Res call({String quizId, List<QuizQuestion> questions});
}

/// @nodoc
class __$SelfQuizCopyWithImpl<$Res> extends _$SelfQuizCopyWithImpl<$Res>
    implements _$SelfQuizCopyWith<$Res> {
  __$SelfQuizCopyWithImpl(_SelfQuiz _value, $Res Function(_SelfQuiz) _then)
      : super(_value, (v) => _then(v as _SelfQuiz));

  @override
  _SelfQuiz get _value => super._value as _SelfQuiz;

  @override
  $Res call({
    Object? quizId = freezed,
    Object? questions = freezed,
  }) {
    return _then(_SelfQuiz(
      quizId == freezed
          ? _value.quizId
          : quizId // ignore: cast_nullable_to_non_nullable
              as String,
      questions == freezed
          ? _value.questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<QuizQuestion>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SelfQuiz implements _SelfQuiz {
  _$_SelfQuiz(this.quizId, this.questions);

  factory _$_SelfQuiz.fromJson(Map<String, dynamic> json) =>
      _$$_SelfQuizFromJson(json);

  @override
  final String quizId;
  @override
  final List<QuizQuestion> questions;

  @override
  String toString() {
    return 'SelfQuiz(quizId: $quizId, questions: $questions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SelfQuiz &&
            const DeepCollectionEquality().equals(other.quizId, quizId) &&
            const DeepCollectionEquality().equals(other.questions, questions));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(quizId),
      const DeepCollectionEquality().hash(questions));

  @JsonKey(ignore: true)
  @override
  _$SelfQuizCopyWith<_SelfQuiz> get copyWith =>
      __$SelfQuizCopyWithImpl<_SelfQuiz>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SelfQuizToJson(this);
  }
}

abstract class _SelfQuiz implements SelfQuiz {
  factory _SelfQuiz(String quizId, List<QuizQuestion> questions) = _$_SelfQuiz;

  factory _SelfQuiz.fromJson(Map<String, dynamic> json) = _$_SelfQuiz.fromJson;

  @override
  String get quizId;
  @override
  List<QuizQuestion> get questions;
  @override
  @JsonKey(ignore: true)
  _$SelfQuizCopyWith<_SelfQuiz> get copyWith =>
      throw _privateConstructorUsedError;
}
