// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'quiz.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

VideoQuiz _$VideoQuizFromJson(Map<String, dynamic> json) {
  return _VideoQuiz.fromJson(json);
}

/// @nodoc
class _$VideoQuizTearOff {
  const _$VideoQuizTearOff();

  _VideoQuiz call(String errorCode, int? quizDuration, String? resultMessage,
      List<QuizQuestion>? contextQuiz, List<QuizQuestion>? vocQuiz) {
    return _VideoQuiz(
      errorCode,
      quizDuration,
      resultMessage,
      contextQuiz,
      vocQuiz,
    );
  }

  VideoQuiz fromJson(Map<String, Object?> json) {
    return VideoQuiz.fromJson(json);
  }
}

/// @nodoc
const $VideoQuiz = _$VideoQuizTearOff();

/// @nodoc
mixin _$VideoQuiz {
  String get errorCode => throw _privateConstructorUsedError;
  int? get quizDuration => throw _privateConstructorUsedError;
  String? get resultMessage => throw _privateConstructorUsedError;
  List<QuizQuestion>? get contextQuiz => throw _privateConstructorUsedError;
  List<QuizQuestion>? get vocQuiz => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VideoQuizCopyWith<VideoQuiz> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VideoQuizCopyWith<$Res> {
  factory $VideoQuizCopyWith(VideoQuiz value, $Res Function(VideoQuiz) then) =
      _$VideoQuizCopyWithImpl<$Res>;
  $Res call(
      {String errorCode,
      int? quizDuration,
      String? resultMessage,
      List<QuizQuestion>? contextQuiz,
      List<QuizQuestion>? vocQuiz});
}

/// @nodoc
class _$VideoQuizCopyWithImpl<$Res> implements $VideoQuizCopyWith<$Res> {
  _$VideoQuizCopyWithImpl(this._value, this._then);

  final VideoQuiz _value;
  // ignore: unused_field
  final $Res Function(VideoQuiz) _then;

  @override
  $Res call({
    Object? errorCode = freezed,
    Object? quizDuration = freezed,
    Object? resultMessage = freezed,
    Object? contextQuiz = freezed,
    Object? vocQuiz = freezed,
  }) {
    return _then(_value.copyWith(
      errorCode: errorCode == freezed
          ? _value.errorCode
          : errorCode // ignore: cast_nullable_to_non_nullable
              as String,
      quizDuration: quizDuration == freezed
          ? _value.quizDuration
          : quizDuration // ignore: cast_nullable_to_non_nullable
              as int?,
      resultMessage: resultMessage == freezed
          ? _value.resultMessage
          : resultMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      contextQuiz: contextQuiz == freezed
          ? _value.contextQuiz
          : contextQuiz // ignore: cast_nullable_to_non_nullable
              as List<QuizQuestion>?,
      vocQuiz: vocQuiz == freezed
          ? _value.vocQuiz
          : vocQuiz // ignore: cast_nullable_to_non_nullable
              as List<QuizQuestion>?,
    ));
  }
}

/// @nodoc
abstract class _$VideoQuizCopyWith<$Res> implements $VideoQuizCopyWith<$Res> {
  factory _$VideoQuizCopyWith(
          _VideoQuiz value, $Res Function(_VideoQuiz) then) =
      __$VideoQuizCopyWithImpl<$Res>;
  @override
  $Res call(
      {String errorCode,
      int? quizDuration,
      String? resultMessage,
      List<QuizQuestion>? contextQuiz,
      List<QuizQuestion>? vocQuiz});
}

/// @nodoc
class __$VideoQuizCopyWithImpl<$Res> extends _$VideoQuizCopyWithImpl<$Res>
    implements _$VideoQuizCopyWith<$Res> {
  __$VideoQuizCopyWithImpl(_VideoQuiz _value, $Res Function(_VideoQuiz) _then)
      : super(_value, (v) => _then(v as _VideoQuiz));

  @override
  _VideoQuiz get _value => super._value as _VideoQuiz;

  @override
  $Res call({
    Object? errorCode = freezed,
    Object? quizDuration = freezed,
    Object? resultMessage = freezed,
    Object? contextQuiz = freezed,
    Object? vocQuiz = freezed,
  }) {
    return _then(_VideoQuiz(
      errorCode == freezed
          ? _value.errorCode
          : errorCode // ignore: cast_nullable_to_non_nullable
              as String,
      quizDuration == freezed
          ? _value.quizDuration
          : quizDuration // ignore: cast_nullable_to_non_nullable
              as int?,
      resultMessage == freezed
          ? _value.resultMessage
          : resultMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      contextQuiz == freezed
          ? _value.contextQuiz
          : contextQuiz // ignore: cast_nullable_to_non_nullable
              as List<QuizQuestion>?,
      vocQuiz == freezed
          ? _value.vocQuiz
          : vocQuiz // ignore: cast_nullable_to_non_nullable
              as List<QuizQuestion>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_VideoQuiz implements _VideoQuiz {
  _$_VideoQuiz(this.errorCode, this.quizDuration, this.resultMessage,
      this.contextQuiz, this.vocQuiz);

  factory _$_VideoQuiz.fromJson(Map<String, dynamic> json) =>
      _$$_VideoQuizFromJson(json);

  @override
  final String errorCode;
  @override
  final int? quizDuration;
  @override
  final String? resultMessage;
  @override
  final List<QuizQuestion>? contextQuiz;
  @override
  final List<QuizQuestion>? vocQuiz;

  @override
  String toString() {
    return 'VideoQuiz(errorCode: $errorCode, quizDuration: $quizDuration, resultMessage: $resultMessage, contextQuiz: $contextQuiz, vocQuiz: $vocQuiz)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _VideoQuiz &&
            const DeepCollectionEquality().equals(other.errorCode, errorCode) &&
            const DeepCollectionEquality()
                .equals(other.quizDuration, quizDuration) &&
            const DeepCollectionEquality()
                .equals(other.resultMessage, resultMessage) &&
            const DeepCollectionEquality()
                .equals(other.contextQuiz, contextQuiz) &&
            const DeepCollectionEquality().equals(other.vocQuiz, vocQuiz));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(errorCode),
      const DeepCollectionEquality().hash(quizDuration),
      const DeepCollectionEquality().hash(resultMessage),
      const DeepCollectionEquality().hash(contextQuiz),
      const DeepCollectionEquality().hash(vocQuiz));

  @JsonKey(ignore: true)
  @override
  _$VideoQuizCopyWith<_VideoQuiz> get copyWith =>
      __$VideoQuizCopyWithImpl<_VideoQuiz>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_VideoQuizToJson(this);
  }
}

abstract class _VideoQuiz implements VideoQuiz {
  factory _VideoQuiz(
      String errorCode,
      int? quizDuration,
      String? resultMessage,
      List<QuizQuestion>? contextQuiz,
      List<QuizQuestion>? vocQuiz) = _$_VideoQuiz;

  factory _VideoQuiz.fromJson(Map<String, dynamic> json) =
      _$_VideoQuiz.fromJson;

  @override
  String get errorCode;
  @override
  int? get quizDuration;
  @override
  String? get resultMessage;
  @override
  List<QuizQuestion>? get contextQuiz;
  @override
  List<QuizQuestion>? get vocQuiz;
  @override
  @JsonKey(ignore: true)
  _$VideoQuizCopyWith<_VideoQuiz> get copyWith =>
      throw _privateConstructorUsedError;
}
