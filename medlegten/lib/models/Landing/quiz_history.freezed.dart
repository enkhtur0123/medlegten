// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'quiz_history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

QuizHistory _$QuizHistoryFromJson(Map<String, dynamic> json) {
  return _QuizHistory.fromJson(json);
}

/// @nodoc
class _$QuizHistoryTearOff {
  const _$QuizHistoryTearOff();

  _QuizHistory call(String quizId, String quizName, String correctCount,
      String incorrectCount, String createdAt) {
    return _QuizHistory(
      quizId,
      quizName,
      correctCount,
      incorrectCount,
      createdAt,
    );
  }

  QuizHistory fromJson(Map<String, Object?> json) {
    return QuizHistory.fromJson(json);
  }
}

/// @nodoc
const $QuizHistory = _$QuizHistoryTearOff();

/// @nodoc
mixin _$QuizHistory {
  String get quizId => throw _privateConstructorUsedError;
  String get quizName => throw _privateConstructorUsedError;
  String get correctCount => throw _privateConstructorUsedError;
  String get incorrectCount => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuizHistoryCopyWith<QuizHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizHistoryCopyWith<$Res> {
  factory $QuizHistoryCopyWith(
          QuizHistory value, $Res Function(QuizHistory) then) =
      _$QuizHistoryCopyWithImpl<$Res>;
  $Res call(
      {String quizId,
      String quizName,
      String correctCount,
      String incorrectCount,
      String createdAt});
}

/// @nodoc
class _$QuizHistoryCopyWithImpl<$Res> implements $QuizHistoryCopyWith<$Res> {
  _$QuizHistoryCopyWithImpl(this._value, this._then);

  final QuizHistory _value;
  // ignore: unused_field
  final $Res Function(QuizHistory) _then;

  @override
  $Res call({
    Object? quizId = freezed,
    Object? quizName = freezed,
    Object? correctCount = freezed,
    Object? incorrectCount = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      quizId: quizId == freezed
          ? _value.quizId
          : quizId // ignore: cast_nullable_to_non_nullable
              as String,
      quizName: quizName == freezed
          ? _value.quizName
          : quizName // ignore: cast_nullable_to_non_nullable
              as String,
      correctCount: correctCount == freezed
          ? _value.correctCount
          : correctCount // ignore: cast_nullable_to_non_nullable
              as String,
      incorrectCount: incorrectCount == freezed
          ? _value.incorrectCount
          : incorrectCount // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$QuizHistoryCopyWith<$Res>
    implements $QuizHistoryCopyWith<$Res> {
  factory _$QuizHistoryCopyWith(
          _QuizHistory value, $Res Function(_QuizHistory) then) =
      __$QuizHistoryCopyWithImpl<$Res>;
  @override
  $Res call(
      {String quizId,
      String quizName,
      String correctCount,
      String incorrectCount,
      String createdAt});
}

/// @nodoc
class __$QuizHistoryCopyWithImpl<$Res> extends _$QuizHistoryCopyWithImpl<$Res>
    implements _$QuizHistoryCopyWith<$Res> {
  __$QuizHistoryCopyWithImpl(
      _QuizHistory _value, $Res Function(_QuizHistory) _then)
      : super(_value, (v) => _then(v as _QuizHistory));

  @override
  _QuizHistory get _value => super._value as _QuizHistory;

  @override
  $Res call({
    Object? quizId = freezed,
    Object? quizName = freezed,
    Object? correctCount = freezed,
    Object? incorrectCount = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_QuizHistory(
      quizId == freezed
          ? _value.quizId
          : quizId // ignore: cast_nullable_to_non_nullable
              as String,
      quizName == freezed
          ? _value.quizName
          : quizName // ignore: cast_nullable_to_non_nullable
              as String,
      correctCount == freezed
          ? _value.correctCount
          : correctCount // ignore: cast_nullable_to_non_nullable
              as String,
      incorrectCount == freezed
          ? _value.incorrectCount
          : incorrectCount // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_QuizHistory implements _QuizHistory {
  _$_QuizHistory(this.quizId, this.quizName, this.correctCount,
      this.incorrectCount, this.createdAt);

  factory _$_QuizHistory.fromJson(Map<String, dynamic> json) =>
      _$$_QuizHistoryFromJson(json);

  @override
  final String quizId;
  @override
  final String quizName;
  @override
  final String correctCount;
  @override
  final String incorrectCount;
  @override
  final String createdAt;

  @override
  String toString() {
    return 'QuizHistory(quizId: $quizId, quizName: $quizName, correctCount: $correctCount, incorrectCount: $incorrectCount, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _QuizHistory &&
            const DeepCollectionEquality().equals(other.quizId, quizId) &&
            const DeepCollectionEquality().equals(other.quizName, quizName) &&
            const DeepCollectionEquality()
                .equals(other.correctCount, correctCount) &&
            const DeepCollectionEquality()
                .equals(other.incorrectCount, incorrectCount) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(quizId),
      const DeepCollectionEquality().hash(quizName),
      const DeepCollectionEquality().hash(correctCount),
      const DeepCollectionEquality().hash(incorrectCount),
      const DeepCollectionEquality().hash(createdAt));

  @JsonKey(ignore: true)
  @override
  _$QuizHistoryCopyWith<_QuizHistory> get copyWith =>
      __$QuizHistoryCopyWithImpl<_QuizHistory>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QuizHistoryToJson(this);
  }
}

abstract class _QuizHistory implements QuizHistory {
  factory _QuizHistory(String quizId, String quizName, String correctCount,
      String incorrectCount, String createdAt) = _$_QuizHistory;

  factory _QuizHistory.fromJson(Map<String, dynamic> json) =
      _$_QuizHistory.fromJson;

  @override
  String get quizId;
  @override
  String get quizName;
  @override
  String get correctCount;
  @override
  String get incorrectCount;
  @override
  String get createdAt;
  @override
  @JsonKey(ignore: true)
  _$QuizHistoryCopyWith<_QuizHistory> get copyWith =>
      throw _privateConstructorUsedError;
}
