// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'quiz_answer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

QuizAnswer _$QuizAnswerFromJson(Map<String, dynamic> json) {
  return _QuizAnswer.fromJson(json);
}

/// @nodoc
class _$QuizAnswerTearOff {
  const _$QuizAnswerTearOff();

  _QuizAnswer call(String answerId, String answer, String isTrue,
      String ordering, bool? isCorrect) {
    return _QuizAnswer(
      answerId,
      answer,
      isTrue,
      ordering,
      isCorrect,
    );
  }

  QuizAnswer fromJson(Map<String, Object?> json) {
    return QuizAnswer.fromJson(json);
  }
}

/// @nodoc
const $QuizAnswer = _$QuizAnswerTearOff();

/// @nodoc
mixin _$QuizAnswer {
  String get answerId => throw _privateConstructorUsedError;
  String get answer => throw _privateConstructorUsedError;
  String get isTrue => throw _privateConstructorUsedError;
  String get ordering => throw _privateConstructorUsedError;
  bool? get isCorrect => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuizAnswerCopyWith<QuizAnswer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizAnswerCopyWith<$Res> {
  factory $QuizAnswerCopyWith(
          QuizAnswer value, $Res Function(QuizAnswer) then) =
      _$QuizAnswerCopyWithImpl<$Res>;
  $Res call(
      {String answerId,
      String answer,
      String isTrue,
      String ordering,
      bool? isCorrect});
}

/// @nodoc
class _$QuizAnswerCopyWithImpl<$Res> implements $QuizAnswerCopyWith<$Res> {
  _$QuizAnswerCopyWithImpl(this._value, this._then);

  final QuizAnswer _value;
  // ignore: unused_field
  final $Res Function(QuizAnswer) _then;

  @override
  $Res call({
    Object? answerId = freezed,
    Object? answer = freezed,
    Object? isTrue = freezed,
    Object? ordering = freezed,
    Object? isCorrect = freezed,
  }) {
    return _then(_value.copyWith(
      answerId: answerId == freezed
          ? _value.answerId
          : answerId // ignore: cast_nullable_to_non_nullable
              as String,
      answer: answer == freezed
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
      isTrue: isTrue == freezed
          ? _value.isTrue
          : isTrue // ignore: cast_nullable_to_non_nullable
              as String,
      ordering: ordering == freezed
          ? _value.ordering
          : ordering // ignore: cast_nullable_to_non_nullable
              as String,
      isCorrect: isCorrect == freezed
          ? _value.isCorrect
          : isCorrect // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
abstract class _$QuizAnswerCopyWith<$Res> implements $QuizAnswerCopyWith<$Res> {
  factory _$QuizAnswerCopyWith(
          _QuizAnswer value, $Res Function(_QuizAnswer) then) =
      __$QuizAnswerCopyWithImpl<$Res>;
  @override
  $Res call(
      {String answerId,
      String answer,
      String isTrue,
      String ordering,
      bool? isCorrect});
}

/// @nodoc
class __$QuizAnswerCopyWithImpl<$Res> extends _$QuizAnswerCopyWithImpl<$Res>
    implements _$QuizAnswerCopyWith<$Res> {
  __$QuizAnswerCopyWithImpl(
      _QuizAnswer _value, $Res Function(_QuizAnswer) _then)
      : super(_value, (v) => _then(v as _QuizAnswer));

  @override
  _QuizAnswer get _value => super._value as _QuizAnswer;

  @override
  $Res call({
    Object? answerId = freezed,
    Object? answer = freezed,
    Object? isTrue = freezed,
    Object? ordering = freezed,
    Object? isCorrect = freezed,
  }) {
    return _then(_QuizAnswer(
      answerId == freezed
          ? _value.answerId
          : answerId // ignore: cast_nullable_to_non_nullable
              as String,
      answer == freezed
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
      isTrue == freezed
          ? _value.isTrue
          : isTrue // ignore: cast_nullable_to_non_nullable
              as String,
      ordering == freezed
          ? _value.ordering
          : ordering // ignore: cast_nullable_to_non_nullable
              as String,
      isCorrect == freezed
          ? _value.isCorrect
          : isCorrect // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_QuizAnswer implements _QuizAnswer {
  _$_QuizAnswer(
      this.answerId, this.answer, this.isTrue, this.ordering, this.isCorrect);

  factory _$_QuizAnswer.fromJson(Map<String, dynamic> json) =>
      _$$_QuizAnswerFromJson(json);

  @override
  final String answerId;
  @override
  final String answer;
  @override
  final String isTrue;
  @override
  final String ordering;
  @override
  final bool? isCorrect;

  @override
  String toString() {
    return 'QuizAnswer(answerId: $answerId, answer: $answer, isTrue: $isTrue, ordering: $ordering, isCorrect: $isCorrect)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _QuizAnswer &&
            const DeepCollectionEquality().equals(other.answerId, answerId) &&
            const DeepCollectionEquality().equals(other.answer, answer) &&
            const DeepCollectionEquality().equals(other.isTrue, isTrue) &&
            const DeepCollectionEquality().equals(other.ordering, ordering) &&
            const DeepCollectionEquality().equals(other.isCorrect, isCorrect));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(answerId),
      const DeepCollectionEquality().hash(answer),
      const DeepCollectionEquality().hash(isTrue),
      const DeepCollectionEquality().hash(ordering),
      const DeepCollectionEquality().hash(isCorrect));

  @JsonKey(ignore: true)
  @override
  _$QuizAnswerCopyWith<_QuizAnswer> get copyWith =>
      __$QuizAnswerCopyWithImpl<_QuizAnswer>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QuizAnswerToJson(this);
  }
}

abstract class _QuizAnswer implements QuizAnswer {
  factory _QuizAnswer(String answerId, String answer, String isTrue,
      String ordering, bool? isCorrect) = _$_QuizAnswer;

  factory _QuizAnswer.fromJson(Map<String, dynamic> json) =
      _$_QuizAnswer.fromJson;

  @override
  String get answerId;
  @override
  String get answer;
  @override
  String get isTrue;
  @override
  String get ordering;
  @override
  bool? get isCorrect;
  @override
  @JsonKey(ignore: true)
  _$QuizAnswerCopyWith<_QuizAnswer> get copyWith =>
      throw _privateConstructorUsedError;
}
