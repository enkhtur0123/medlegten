// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unit_listening_cue.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ListeningCue _$ListeningCueFromJson(Map<String, dynamic> json) {
  return _ListeningCue.fromJson(json);
}

/// @nodoc
class _$ListeningCueTearOff {
  const _$ListeningCueTearOff();

  _ListeningCue call(String cueId, String hostUrl, String hostSource,
      String ordering, String title, List<QuizQuestion> questions) {
    return _ListeningCue(
      cueId,
      hostUrl,
      hostSource,
      ordering,
      title,
      questions,
    );
  }

  ListeningCue fromJson(Map<String, Object?> json) {
    return ListeningCue.fromJson(json);
  }
}

/// @nodoc
const $ListeningCue = _$ListeningCueTearOff();

/// @nodoc
mixin _$ListeningCue {
  String get cueId => throw _privateConstructorUsedError;
  String get hostUrl => throw _privateConstructorUsedError;
  String get hostSource => throw _privateConstructorUsedError;
  String get ordering => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  List<QuizQuestion> get questions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ListeningCueCopyWith<ListeningCue> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListeningCueCopyWith<$Res> {
  factory $ListeningCueCopyWith(
          ListeningCue value, $Res Function(ListeningCue) then) =
      _$ListeningCueCopyWithImpl<$Res>;
  $Res call(
      {String cueId,
      String hostUrl,
      String hostSource,
      String ordering,
      String title,
      List<QuizQuestion> questions});
}

/// @nodoc
class _$ListeningCueCopyWithImpl<$Res> implements $ListeningCueCopyWith<$Res> {
  _$ListeningCueCopyWithImpl(this._value, this._then);

  final ListeningCue _value;
  // ignore: unused_field
  final $Res Function(ListeningCue) _then;

  @override
  $Res call({
    Object? cueId = freezed,
    Object? hostUrl = freezed,
    Object? hostSource = freezed,
    Object? ordering = freezed,
    Object? title = freezed,
    Object? questions = freezed,
  }) {
    return _then(_value.copyWith(
      cueId: cueId == freezed
          ? _value.cueId
          : cueId // ignore: cast_nullable_to_non_nullable
              as String,
      hostUrl: hostUrl == freezed
          ? _value.hostUrl
          : hostUrl // ignore: cast_nullable_to_non_nullable
              as String,
      hostSource: hostSource == freezed
          ? _value.hostSource
          : hostSource // ignore: cast_nullable_to_non_nullable
              as String,
      ordering: ordering == freezed
          ? _value.ordering
          : ordering // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      questions: questions == freezed
          ? _value.questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<QuizQuestion>,
    ));
  }
}

/// @nodoc
abstract class _$ListeningCueCopyWith<$Res>
    implements $ListeningCueCopyWith<$Res> {
  factory _$ListeningCueCopyWith(
          _ListeningCue value, $Res Function(_ListeningCue) then) =
      __$ListeningCueCopyWithImpl<$Res>;
  @override
  $Res call(
      {String cueId,
      String hostUrl,
      String hostSource,
      String ordering,
      String title,
      List<QuizQuestion> questions});
}

/// @nodoc
class __$ListeningCueCopyWithImpl<$Res> extends _$ListeningCueCopyWithImpl<$Res>
    implements _$ListeningCueCopyWith<$Res> {
  __$ListeningCueCopyWithImpl(
      _ListeningCue _value, $Res Function(_ListeningCue) _then)
      : super(_value, (v) => _then(v as _ListeningCue));

  @override
  _ListeningCue get _value => super._value as _ListeningCue;

  @override
  $Res call({
    Object? cueId = freezed,
    Object? hostUrl = freezed,
    Object? hostSource = freezed,
    Object? ordering = freezed,
    Object? title = freezed,
    Object? questions = freezed,
  }) {
    return _then(_ListeningCue(
      cueId == freezed
          ? _value.cueId
          : cueId // ignore: cast_nullable_to_non_nullable
              as String,
      hostUrl == freezed
          ? _value.hostUrl
          : hostUrl // ignore: cast_nullable_to_non_nullable
              as String,
      hostSource == freezed
          ? _value.hostSource
          : hostSource // ignore: cast_nullable_to_non_nullable
              as String,
      ordering == freezed
          ? _value.ordering
          : ordering // ignore: cast_nullable_to_non_nullable
              as String,
      title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
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
class _$_ListeningCue implements _ListeningCue {
  _$_ListeningCue(this.cueId, this.hostUrl, this.hostSource, this.ordering,
      this.title, this.questions);

  factory _$_ListeningCue.fromJson(Map<String, dynamic> json) =>
      _$$_ListeningCueFromJson(json);

  @override
  final String cueId;
  @override
  final String hostUrl;
  @override
  final String hostSource;
  @override
  final String ordering;
  @override
  final String title;
  @override
  final List<QuizQuestion> questions;

  @override
  String toString() {
    return 'ListeningCue(cueId: $cueId, hostUrl: $hostUrl, hostSource: $hostSource, ordering: $ordering, title: $title, questions: $questions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ListeningCue &&
            const DeepCollectionEquality().equals(other.cueId, cueId) &&
            const DeepCollectionEquality().equals(other.hostUrl, hostUrl) &&
            const DeepCollectionEquality()
                .equals(other.hostSource, hostSource) &&
            const DeepCollectionEquality().equals(other.ordering, ordering) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.questions, questions));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(cueId),
      const DeepCollectionEquality().hash(hostUrl),
      const DeepCollectionEquality().hash(hostSource),
      const DeepCollectionEquality().hash(ordering),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(questions));

  @JsonKey(ignore: true)
  @override
  _$ListeningCueCopyWith<_ListeningCue> get copyWith =>
      __$ListeningCueCopyWithImpl<_ListeningCue>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ListeningCueToJson(this);
  }
}

abstract class _ListeningCue implements ListeningCue {
  factory _ListeningCue(
      String cueId,
      String hostUrl,
      String hostSource,
      String ordering,
      String title,
      List<QuizQuestion> questions) = _$_ListeningCue;

  factory _ListeningCue.fromJson(Map<String, dynamic> json) =
      _$_ListeningCue.fromJson;

  @override
  String get cueId;
  @override
  String get hostUrl;
  @override
  String get hostSource;
  @override
  String get ordering;
  @override
  String get title;
  @override
  List<QuizQuestion> get questions;
  @override
  @JsonKey(ignore: true)
  _$ListeningCueCopyWith<_ListeningCue> get copyWith =>
      throw _privateConstructorUsedError;
}
