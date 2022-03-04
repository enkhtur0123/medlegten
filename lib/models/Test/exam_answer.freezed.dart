// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'exam_answer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ExamResultAnswer _$ExamResultAnswerFromJson(Map<String, dynamic> json) {
  return _ExamResultAnswer.fromJson(json);
}

/// @nodoc
class _$ExamResultAnswerTearOff {
  const _$ExamResultAnswerTearOff();

  _ExamResultAnswer call(String answerId, String answer, bool isTrue,
      String choosenAnswerId, bool isChoosen, String ordering) {
    return _ExamResultAnswer(
      answerId,
      answer,
      isTrue,
      choosenAnswerId,
      isChoosen,
      ordering,
    );
  }

  ExamResultAnswer fromJson(Map<String, Object?> json) {
    return ExamResultAnswer.fromJson(json);
  }
}

/// @nodoc
const $ExamResultAnswer = _$ExamResultAnswerTearOff();

/// @nodoc
mixin _$ExamResultAnswer {
  String get answerId => throw _privateConstructorUsedError;
  String get answer => throw _privateConstructorUsedError;
  bool get isTrue => throw _privateConstructorUsedError;
  String get choosenAnswerId => throw _privateConstructorUsedError;
  bool get isChoosen => throw _privateConstructorUsedError;
  String get ordering => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ExamResultAnswerCopyWith<ExamResultAnswer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExamResultAnswerCopyWith<$Res> {
  factory $ExamResultAnswerCopyWith(
          ExamResultAnswer value, $Res Function(ExamResultAnswer) then) =
      _$ExamResultAnswerCopyWithImpl<$Res>;
  $Res call(
      {String answerId,
      String answer,
      bool isTrue,
      String choosenAnswerId,
      bool isChoosen,
      String ordering});
}

/// @nodoc
class _$ExamResultAnswerCopyWithImpl<$Res>
    implements $ExamResultAnswerCopyWith<$Res> {
  _$ExamResultAnswerCopyWithImpl(this._value, this._then);

  final ExamResultAnswer _value;
  // ignore: unused_field
  final $Res Function(ExamResultAnswer) _then;

  @override
  $Res call({
    Object? answerId = freezed,
    Object? answer = freezed,
    Object? isTrue = freezed,
    Object? choosenAnswerId = freezed,
    Object? isChoosen = freezed,
    Object? ordering = freezed,
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
              as bool,
      choosenAnswerId: choosenAnswerId == freezed
          ? _value.choosenAnswerId
          : choosenAnswerId // ignore: cast_nullable_to_non_nullable
              as String,
      isChoosen: isChoosen == freezed
          ? _value.isChoosen
          : isChoosen // ignore: cast_nullable_to_non_nullable
              as bool,
      ordering: ordering == freezed
          ? _value.ordering
          : ordering // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$ExamResultAnswerCopyWith<$Res>
    implements $ExamResultAnswerCopyWith<$Res> {
  factory _$ExamResultAnswerCopyWith(
          _ExamResultAnswer value, $Res Function(_ExamResultAnswer) then) =
      __$ExamResultAnswerCopyWithImpl<$Res>;
  @override
  $Res call(
      {String answerId,
      String answer,
      bool isTrue,
      String choosenAnswerId,
      bool isChoosen,
      String ordering});
}

/// @nodoc
class __$ExamResultAnswerCopyWithImpl<$Res>
    extends _$ExamResultAnswerCopyWithImpl<$Res>
    implements _$ExamResultAnswerCopyWith<$Res> {
  __$ExamResultAnswerCopyWithImpl(
      _ExamResultAnswer _value, $Res Function(_ExamResultAnswer) _then)
      : super(_value, (v) => _then(v as _ExamResultAnswer));

  @override
  _ExamResultAnswer get _value => super._value as _ExamResultAnswer;

  @override
  $Res call({
    Object? answerId = freezed,
    Object? answer = freezed,
    Object? isTrue = freezed,
    Object? choosenAnswerId = freezed,
    Object? isChoosen = freezed,
    Object? ordering = freezed,
  }) {
    return _then(_ExamResultAnswer(
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
              as bool,
      choosenAnswerId == freezed
          ? _value.choosenAnswerId
          : choosenAnswerId // ignore: cast_nullable_to_non_nullable
              as String,
      isChoosen == freezed
          ? _value.isChoosen
          : isChoosen // ignore: cast_nullable_to_non_nullable
              as bool,
      ordering == freezed
          ? _value.ordering
          : ordering // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ExamResultAnswer implements _ExamResultAnswer {
  _$_ExamResultAnswer(this.answerId, this.answer, this.isTrue,
      this.choosenAnswerId, this.isChoosen, this.ordering);

  factory _$_ExamResultAnswer.fromJson(Map<String, dynamic> json) =>
      _$$_ExamResultAnswerFromJson(json);

  @override
  final String answerId;
  @override
  final String answer;
  @override
  final bool isTrue;
  @override
  final String choosenAnswerId;
  @override
  final bool isChoosen;
  @override
  final String ordering;

  @override
  String toString() {
    return 'ExamResultAnswer(answerId: $answerId, answer: $answer, isTrue: $isTrue, choosenAnswerId: $choosenAnswerId, isChoosen: $isChoosen, ordering: $ordering)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ExamResultAnswer &&
            const DeepCollectionEquality().equals(other.answerId, answerId) &&
            const DeepCollectionEquality().equals(other.answer, answer) &&
            const DeepCollectionEquality().equals(other.isTrue, isTrue) &&
            const DeepCollectionEquality()
                .equals(other.choosenAnswerId, choosenAnswerId) &&
            const DeepCollectionEquality().equals(other.isChoosen, isChoosen) &&
            const DeepCollectionEquality().equals(other.ordering, ordering));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(answerId),
      const DeepCollectionEquality().hash(answer),
      const DeepCollectionEquality().hash(isTrue),
      const DeepCollectionEquality().hash(choosenAnswerId),
      const DeepCollectionEquality().hash(isChoosen),
      const DeepCollectionEquality().hash(ordering));

  @JsonKey(ignore: true)
  @override
  _$ExamResultAnswerCopyWith<_ExamResultAnswer> get copyWith =>
      __$ExamResultAnswerCopyWithImpl<_ExamResultAnswer>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ExamResultAnswerToJson(this);
  }
}

abstract class _ExamResultAnswer implements ExamResultAnswer {
  factory _ExamResultAnswer(
      String answerId,
      String answer,
      bool isTrue,
      String choosenAnswerId,
      bool isChoosen,
      String ordering) = _$_ExamResultAnswer;

  factory _ExamResultAnswer.fromJson(Map<String, dynamic> json) =
      _$_ExamResultAnswer.fromJson;

  @override
  String get answerId;
  @override
  String get answer;
  @override
  bool get isTrue;
  @override
  String get choosenAnswerId;
  @override
  bool get isChoosen;
  @override
  String get ordering;
  @override
  @JsonKey(ignore: true)
  _$ExamResultAnswerCopyWith<_ExamResultAnswer> get copyWith =>
      throw _privateConstructorUsedError;
}
