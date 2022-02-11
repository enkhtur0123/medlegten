// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'level_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LevelEvent _$LevelEventFromJson(Map<String, dynamic> json) {
  return _LevelEvent.fromJson(json);
}

/// @nodoc
class _$LevelEventTearOff {
  const _$LevelEventTearOff();

  _LevelEvent call(String? levelId, String? levelName, List<Event> events) {
    return _LevelEvent(
      levelId,
      levelName,
      events,
    );
  }

  LevelEvent fromJson(Map<String, Object?> json) {
    return LevelEvent.fromJson(json);
  }
}

/// @nodoc
const $LevelEvent = _$LevelEventTearOff();

/// @nodoc
mixin _$LevelEvent {
  String? get levelId => throw _privateConstructorUsedError;
  String? get levelName => throw _privateConstructorUsedError;
  List<Event> get events => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LevelEventCopyWith<LevelEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LevelEventCopyWith<$Res> {
  factory $LevelEventCopyWith(
          LevelEvent value, $Res Function(LevelEvent) then) =
      _$LevelEventCopyWithImpl<$Res>;
  $Res call({String? levelId, String? levelName, List<Event> events});
}

/// @nodoc
class _$LevelEventCopyWithImpl<$Res> implements $LevelEventCopyWith<$Res> {
  _$LevelEventCopyWithImpl(this._value, this._then);

  final LevelEvent _value;
  // ignore: unused_field
  final $Res Function(LevelEvent) _then;

  @override
  $Res call({
    Object? levelId = freezed,
    Object? levelName = freezed,
    Object? events = freezed,
  }) {
    return _then(_value.copyWith(
      levelId: levelId == freezed
          ? _value.levelId
          : levelId // ignore: cast_nullable_to_non_nullable
              as String?,
      levelName: levelName == freezed
          ? _value.levelName
          : levelName // ignore: cast_nullable_to_non_nullable
              as String?,
      events: events == freezed
          ? _value.events
          : events // ignore: cast_nullable_to_non_nullable
              as List<Event>,
    ));
  }
}

/// @nodoc
abstract class _$LevelEventCopyWith<$Res> implements $LevelEventCopyWith<$Res> {
  factory _$LevelEventCopyWith(
          _LevelEvent value, $Res Function(_LevelEvent) then) =
      __$LevelEventCopyWithImpl<$Res>;
  @override
  $Res call({String? levelId, String? levelName, List<Event> events});
}

/// @nodoc
class __$LevelEventCopyWithImpl<$Res> extends _$LevelEventCopyWithImpl<$Res>
    implements _$LevelEventCopyWith<$Res> {
  __$LevelEventCopyWithImpl(
      _LevelEvent _value, $Res Function(_LevelEvent) _then)
      : super(_value, (v) => _then(v as _LevelEvent));

  @override
  _LevelEvent get _value => super._value as _LevelEvent;

  @override
  $Res call({
    Object? levelId = freezed,
    Object? levelName = freezed,
    Object? events = freezed,
  }) {
    return _then(_LevelEvent(
      levelId == freezed
          ? _value.levelId
          : levelId // ignore: cast_nullable_to_non_nullable
              as String?,
      levelName == freezed
          ? _value.levelName
          : levelName // ignore: cast_nullable_to_non_nullable
              as String?,
      events == freezed
          ? _value.events
          : events // ignore: cast_nullable_to_non_nullable
              as List<Event>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LevelEvent implements _LevelEvent {
  _$_LevelEvent(this.levelId, this.levelName, this.events);

  factory _$_LevelEvent.fromJson(Map<String, dynamic> json) =>
      _$$_LevelEventFromJson(json);

  @override
  final String? levelId;
  @override
  final String? levelName;
  @override
  final List<Event> events;

  @override
  String toString() {
    return 'LevelEvent(levelId: $levelId, levelName: $levelName, events: $events)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LevelEvent &&
            const DeepCollectionEquality().equals(other.levelId, levelId) &&
            const DeepCollectionEquality().equals(other.levelName, levelName) &&
            const DeepCollectionEquality().equals(other.events, events));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(levelId),
      const DeepCollectionEquality().hash(levelName),
      const DeepCollectionEquality().hash(events));

  @JsonKey(ignore: true)
  @override
  _$LevelEventCopyWith<_LevelEvent> get copyWith =>
      __$LevelEventCopyWithImpl<_LevelEvent>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LevelEventToJson(this);
  }
}

abstract class _LevelEvent implements LevelEvent {
  factory _LevelEvent(String? levelId, String? levelName, List<Event> events) =
      _$_LevelEvent;

  factory _LevelEvent.fromJson(Map<String, dynamic> json) =
      _$_LevelEvent.fromJson;

  @override
  String? get levelId;
  @override
  String? get levelName;
  @override
  List<Event> get events;
  @override
  @JsonKey(ignore: true)
  _$LevelEventCopyWith<_LevelEvent> get copyWith =>
      throw _privateConstructorUsedError;
}
