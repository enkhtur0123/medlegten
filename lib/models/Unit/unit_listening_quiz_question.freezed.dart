// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unit_listening_quiz_question.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ListeningQuiz _$ListeningQuizFromJson(Map<String, dynamic> json) {
  return _ListeningQuiz.fromJson(json);
}

/// @nodoc
class _$ListeningQuizTearOff {
  const _$ListeningQuizTearOff();

  _ListeningQuiz call(bool isSuccess, String errorCode, String resultMessage,
      String moduleTypeId, bool isCompleted, UnitListening listening) {
    return _ListeningQuiz(
      isSuccess,
      errorCode,
      resultMessage,
      moduleTypeId,
      isCompleted,
      listening,
    );
  }

  ListeningQuiz fromJson(Map<String, Object?> json) {
    return ListeningQuiz.fromJson(json);
  }
}

/// @nodoc
const $ListeningQuiz = _$ListeningQuizTearOff();

/// @nodoc
mixin _$ListeningQuiz {
  bool get isSuccess => throw _privateConstructorUsedError;
  String get errorCode => throw _privateConstructorUsedError;
  String get resultMessage => throw _privateConstructorUsedError;
  String get moduleTypeId => throw _privateConstructorUsedError;
  bool get isCompleted => throw _privateConstructorUsedError;
  UnitListening get listening => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ListeningQuizCopyWith<ListeningQuiz> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListeningQuizCopyWith<$Res> {
  factory $ListeningQuizCopyWith(
          ListeningQuiz value, $Res Function(ListeningQuiz) then) =
      _$ListeningQuizCopyWithImpl<$Res>;
  $Res call(
      {bool isSuccess,
      String errorCode,
      String resultMessage,
      String moduleTypeId,
      bool isCompleted,
      UnitListening listening});

  $UnitListeningCopyWith<$Res> get listening;
}

/// @nodoc
class _$ListeningQuizCopyWithImpl<$Res>
    implements $ListeningQuizCopyWith<$Res> {
  _$ListeningQuizCopyWithImpl(this._value, this._then);

  final ListeningQuiz _value;
  // ignore: unused_field
  final $Res Function(ListeningQuiz) _then;

  @override
  $Res call({
    Object? isSuccess = freezed,
    Object? errorCode = freezed,
    Object? resultMessage = freezed,
    Object? moduleTypeId = freezed,
    Object? isCompleted = freezed,
    Object? listening = freezed,
  }) {
    return _then(_value.copyWith(
      isSuccess: isSuccess == freezed
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      errorCode: errorCode == freezed
          ? _value.errorCode
          : errorCode // ignore: cast_nullable_to_non_nullable
              as String,
      resultMessage: resultMessage == freezed
          ? _value.resultMessage
          : resultMessage // ignore: cast_nullable_to_non_nullable
              as String,
      moduleTypeId: moduleTypeId == freezed
          ? _value.moduleTypeId
          : moduleTypeId // ignore: cast_nullable_to_non_nullable
              as String,
      isCompleted: isCompleted == freezed
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      listening: listening == freezed
          ? _value.listening
          : listening // ignore: cast_nullable_to_non_nullable
              as UnitListening,
    ));
  }

  @override
  $UnitListeningCopyWith<$Res> get listening {
    return $UnitListeningCopyWith<$Res>(_value.listening, (value) {
      return _then(_value.copyWith(listening: value));
    });
  }
}

/// @nodoc
abstract class _$ListeningQuizCopyWith<$Res>
    implements $ListeningQuizCopyWith<$Res> {
  factory _$ListeningQuizCopyWith(
          _ListeningQuiz value, $Res Function(_ListeningQuiz) then) =
      __$ListeningQuizCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isSuccess,
      String errorCode,
      String resultMessage,
      String moduleTypeId,
      bool isCompleted,
      UnitListening listening});

  @override
  $UnitListeningCopyWith<$Res> get listening;
}

/// @nodoc
class __$ListeningQuizCopyWithImpl<$Res>
    extends _$ListeningQuizCopyWithImpl<$Res>
    implements _$ListeningQuizCopyWith<$Res> {
  __$ListeningQuizCopyWithImpl(
      _ListeningQuiz _value, $Res Function(_ListeningQuiz) _then)
      : super(_value, (v) => _then(v as _ListeningQuiz));

  @override
  _ListeningQuiz get _value => super._value as _ListeningQuiz;

  @override
  $Res call({
    Object? isSuccess = freezed,
    Object? errorCode = freezed,
    Object? resultMessage = freezed,
    Object? moduleTypeId = freezed,
    Object? isCompleted = freezed,
    Object? listening = freezed,
  }) {
    return _then(_ListeningQuiz(
      isSuccess == freezed
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      errorCode == freezed
          ? _value.errorCode
          : errorCode // ignore: cast_nullable_to_non_nullable
              as String,
      resultMessage == freezed
          ? _value.resultMessage
          : resultMessage // ignore: cast_nullable_to_non_nullable
              as String,
      moduleTypeId == freezed
          ? _value.moduleTypeId
          : moduleTypeId // ignore: cast_nullable_to_non_nullable
              as String,
      isCompleted == freezed
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      listening == freezed
          ? _value.listening
          : listening // ignore: cast_nullable_to_non_nullable
              as UnitListening,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ListeningQuiz implements _ListeningQuiz {
  _$_ListeningQuiz(this.isSuccess, this.errorCode, this.resultMessage,
      this.moduleTypeId, this.isCompleted, this.listening);

  factory _$_ListeningQuiz.fromJson(Map<String, dynamic> json) =>
      _$$_ListeningQuizFromJson(json);

  @override
  final bool isSuccess;
  @override
  final String errorCode;
  @override
  final String resultMessage;
  @override
  final String moduleTypeId;
  @override
  final bool isCompleted;
  @override
  final UnitListening listening;

  @override
  String toString() {
    return 'ListeningQuiz(isSuccess: $isSuccess, errorCode: $errorCode, resultMessage: $resultMessage, moduleTypeId: $moduleTypeId, isCompleted: $isCompleted, listening: $listening)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ListeningQuiz &&
            const DeepCollectionEquality().equals(other.isSuccess, isSuccess) &&
            const DeepCollectionEquality().equals(other.errorCode, errorCode) &&
            const DeepCollectionEquality()
                .equals(other.resultMessage, resultMessage) &&
            const DeepCollectionEquality()
                .equals(other.moduleTypeId, moduleTypeId) &&
            const DeepCollectionEquality()
                .equals(other.isCompleted, isCompleted) &&
            const DeepCollectionEquality().equals(other.listening, listening));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isSuccess),
      const DeepCollectionEquality().hash(errorCode),
      const DeepCollectionEquality().hash(resultMessage),
      const DeepCollectionEquality().hash(moduleTypeId),
      const DeepCollectionEquality().hash(isCompleted),
      const DeepCollectionEquality().hash(listening));

  @JsonKey(ignore: true)
  @override
  _$ListeningQuizCopyWith<_ListeningQuiz> get copyWith =>
      __$ListeningQuizCopyWithImpl<_ListeningQuiz>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ListeningQuizToJson(this);
  }
}

abstract class _ListeningQuiz implements ListeningQuiz {
  factory _ListeningQuiz(
      bool isSuccess,
      String errorCode,
      String resultMessage,
      String moduleTypeId,
      bool isCompleted,
      UnitListening listening) = _$_ListeningQuiz;

  factory _ListeningQuiz.fromJson(Map<String, dynamic> json) =
      _$_ListeningQuiz.fromJson;

  @override
  bool get isSuccess;
  @override
  String get errorCode;
  @override
  String get resultMessage;
  @override
  String get moduleTypeId;
  @override
  bool get isCompleted;
  @override
  UnitListening get listening;
  @override
  @JsonKey(ignore: true)
  _$ListeningQuizCopyWith<_ListeningQuiz> get copyWith =>
      throw _privateConstructorUsedError;
}
