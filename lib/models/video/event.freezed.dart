// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Event _$EventFromJson(Map<String, dynamic> json) {
  return _Event.fromJson(json);
}

/// @nodoc
class _$EventTearOff {
  const _$EventTearOff();

  _Event call(
      String? contentId,
      String? contentName,
      String? eventId,
      String? eventName,
      String? categoryName,
      String? levelId,
      String? vocabularyCount,
      String? vocabularyKnow,
      String? isCompleted,
      String? imgUrl,
      String? intro,
      String? isSerial,
      String? runTime) {
    return _Event(
      contentId,
      contentName,
      eventId,
      eventName,
      categoryName,
      levelId,
      vocabularyCount,
      vocabularyKnow,
      isCompleted,
      imgUrl,
      intro,
      isSerial,
      runTime,
    );
  }

  Event fromJson(Map<String, Object?> json) {
    return Event.fromJson(json);
  }
}

/// @nodoc
const $Event = _$EventTearOff();

/// @nodoc
mixin _$Event {
  String? get contentId => throw _privateConstructorUsedError;
  String? get contentName => throw _privateConstructorUsedError;
  String? get eventId => throw _privateConstructorUsedError;
  String? get eventName => throw _privateConstructorUsedError;
  String? get categoryName =>
      throw _privateConstructorUsedError; // bool isPurchased,
  String? get levelId => throw _privateConstructorUsedError;
  String? get vocabularyCount => throw _privateConstructorUsedError;
  String? get vocabularyKnow => throw _privateConstructorUsedError;
  String? get isCompleted => throw _privateConstructorUsedError;
  String? get imgUrl => throw _privateConstructorUsedError;
  String? get intro => throw _privateConstructorUsedError;
  String? get isSerial => throw _privateConstructorUsedError;
  String? get runTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EventCopyWith<Event> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventCopyWith<$Res> {
  factory $EventCopyWith(Event value, $Res Function(Event) then) =
      _$EventCopyWithImpl<$Res>;
  $Res call(
      {String? contentId,
      String? contentName,
      String? eventId,
      String? eventName,
      String? categoryName,
      String? levelId,
      String? vocabularyCount,
      String? vocabularyKnow,
      String? isCompleted,
      String? imgUrl,
      String? intro,
      String? isSerial,
      String? runTime});
}

/// @nodoc
class _$EventCopyWithImpl<$Res> implements $EventCopyWith<$Res> {
  _$EventCopyWithImpl(this._value, this._then);

  final Event _value;
  // ignore: unused_field
  final $Res Function(Event) _then;

  @override
  $Res call({
    Object? contentId = freezed,
    Object? contentName = freezed,
    Object? eventId = freezed,
    Object? eventName = freezed,
    Object? categoryName = freezed,
    Object? levelId = freezed,
    Object? vocabularyCount = freezed,
    Object? vocabularyKnow = freezed,
    Object? isCompleted = freezed,
    Object? imgUrl = freezed,
    Object? intro = freezed,
    Object? isSerial = freezed,
    Object? runTime = freezed,
  }) {
    return _then(_value.copyWith(
      contentId: contentId == freezed
          ? _value.contentId
          : contentId // ignore: cast_nullable_to_non_nullable
              as String?,
      contentName: contentName == freezed
          ? _value.contentName
          : contentName // ignore: cast_nullable_to_non_nullable
              as String?,
      eventId: eventId == freezed
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String?,
      eventName: eventName == freezed
          ? _value.eventName
          : eventName // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryName: categoryName == freezed
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      levelId: levelId == freezed
          ? _value.levelId
          : levelId // ignore: cast_nullable_to_non_nullable
              as String?,
      vocabularyCount: vocabularyCount == freezed
          ? _value.vocabularyCount
          : vocabularyCount // ignore: cast_nullable_to_non_nullable
              as String?,
      vocabularyKnow: vocabularyKnow == freezed
          ? _value.vocabularyKnow
          : vocabularyKnow // ignore: cast_nullable_to_non_nullable
              as String?,
      isCompleted: isCompleted == freezed
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as String?,
      imgUrl: imgUrl == freezed
          ? _value.imgUrl
          : imgUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      intro: intro == freezed
          ? _value.intro
          : intro // ignore: cast_nullable_to_non_nullable
              as String?,
      isSerial: isSerial == freezed
          ? _value.isSerial
          : isSerial // ignore: cast_nullable_to_non_nullable
              as String?,
      runTime: runTime == freezed
          ? _value.runTime
          : runTime // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$EventCopyWith<$Res> implements $EventCopyWith<$Res> {
  factory _$EventCopyWith(_Event value, $Res Function(_Event) then) =
      __$EventCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? contentId,
      String? contentName,
      String? eventId,
      String? eventName,
      String? categoryName,
      String? levelId,
      String? vocabularyCount,
      String? vocabularyKnow,
      String? isCompleted,
      String? imgUrl,
      String? intro,
      String? isSerial,
      String? runTime});
}

/// @nodoc
class __$EventCopyWithImpl<$Res> extends _$EventCopyWithImpl<$Res>
    implements _$EventCopyWith<$Res> {
  __$EventCopyWithImpl(_Event _value, $Res Function(_Event) _then)
      : super(_value, (v) => _then(v as _Event));

  @override
  _Event get _value => super._value as _Event;

  @override
  $Res call({
    Object? contentId = freezed,
    Object? contentName = freezed,
    Object? eventId = freezed,
    Object? eventName = freezed,
    Object? categoryName = freezed,
    Object? levelId = freezed,
    Object? vocabularyCount = freezed,
    Object? vocabularyKnow = freezed,
    Object? isCompleted = freezed,
    Object? imgUrl = freezed,
    Object? intro = freezed,
    Object? isSerial = freezed,
    Object? runTime = freezed,
  }) {
    return _then(_Event(
      contentId == freezed
          ? _value.contentId
          : contentId // ignore: cast_nullable_to_non_nullable
              as String?,
      contentName == freezed
          ? _value.contentName
          : contentName // ignore: cast_nullable_to_non_nullable
              as String?,
      eventId == freezed
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String?,
      eventName == freezed
          ? _value.eventName
          : eventName // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryName == freezed
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      levelId == freezed
          ? _value.levelId
          : levelId // ignore: cast_nullable_to_non_nullable
              as String?,
      vocabularyCount == freezed
          ? _value.vocabularyCount
          : vocabularyCount // ignore: cast_nullable_to_non_nullable
              as String?,
      vocabularyKnow == freezed
          ? _value.vocabularyKnow
          : vocabularyKnow // ignore: cast_nullable_to_non_nullable
              as String?,
      isCompleted == freezed
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as String?,
      imgUrl == freezed
          ? _value.imgUrl
          : imgUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      intro == freezed
          ? _value.intro
          : intro // ignore: cast_nullable_to_non_nullable
              as String?,
      isSerial == freezed
          ? _value.isSerial
          : isSerial // ignore: cast_nullable_to_non_nullable
              as String?,
      runTime == freezed
          ? _value.runTime
          : runTime // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Event implements _Event {
  _$_Event(
      this.contentId,
      this.contentName,
      this.eventId,
      this.eventName,
      this.categoryName,
      this.levelId,
      this.vocabularyCount,
      this.vocabularyKnow,
      this.isCompleted,
      this.imgUrl,
      this.intro,
      this.isSerial,
      this.runTime);

  factory _$_Event.fromJson(Map<String, dynamic> json) =>
      _$$_EventFromJson(json);

  @override
  final String? contentId;
  @override
  final String? contentName;
  @override
  final String? eventId;
  @override
  final String? eventName;
  @override
  final String? categoryName;
  @override // bool isPurchased,
  final String? levelId;
  @override
  final String? vocabularyCount;
  @override
  final String? vocabularyKnow;
  @override
  final String? isCompleted;
  @override
  final String? imgUrl;
  @override
  final String? intro;
  @override
  final String? isSerial;
  @override
  final String? runTime;

  @override
  String toString() {
    return 'Event(contentId: $contentId, contentName: $contentName, eventId: $eventId, eventName: $eventName, categoryName: $categoryName, levelId: $levelId, vocabularyCount: $vocabularyCount, vocabularyKnow: $vocabularyKnow, isCompleted: $isCompleted, imgUrl: $imgUrl, intro: $intro, isSerial: $isSerial, runTime: $runTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Event &&
            const DeepCollectionEquality().equals(other.contentId, contentId) &&
            const DeepCollectionEquality()
                .equals(other.contentName, contentName) &&
            const DeepCollectionEquality().equals(other.eventId, eventId) &&
            const DeepCollectionEquality().equals(other.eventName, eventName) &&
            const DeepCollectionEquality()
                .equals(other.categoryName, categoryName) &&
            const DeepCollectionEquality().equals(other.levelId, levelId) &&
            const DeepCollectionEquality()
                .equals(other.vocabularyCount, vocabularyCount) &&
            const DeepCollectionEquality()
                .equals(other.vocabularyKnow, vocabularyKnow) &&
            const DeepCollectionEquality()
                .equals(other.isCompleted, isCompleted) &&
            const DeepCollectionEquality().equals(other.imgUrl, imgUrl) &&
            const DeepCollectionEquality().equals(other.intro, intro) &&
            const DeepCollectionEquality().equals(other.isSerial, isSerial) &&
            const DeepCollectionEquality().equals(other.runTime, runTime));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(contentId),
      const DeepCollectionEquality().hash(contentName),
      const DeepCollectionEquality().hash(eventId),
      const DeepCollectionEquality().hash(eventName),
      const DeepCollectionEquality().hash(categoryName),
      const DeepCollectionEquality().hash(levelId),
      const DeepCollectionEquality().hash(vocabularyCount),
      const DeepCollectionEquality().hash(vocabularyKnow),
      const DeepCollectionEquality().hash(isCompleted),
      const DeepCollectionEquality().hash(imgUrl),
      const DeepCollectionEquality().hash(intro),
      const DeepCollectionEquality().hash(isSerial),
      const DeepCollectionEquality().hash(runTime));

  @JsonKey(ignore: true)
  @override
  _$EventCopyWith<_Event> get copyWith =>
      __$EventCopyWithImpl<_Event>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EventToJson(this);
  }
}

abstract class _Event implements Event {
  factory _Event(
      String? contentId,
      String? contentName,
      String? eventId,
      String? eventName,
      String? categoryName,
      String? levelId,
      String? vocabularyCount,
      String? vocabularyKnow,
      String? isCompleted,
      String? imgUrl,
      String? intro,
      String? isSerial,
      String? runTime) = _$_Event;

  factory _Event.fromJson(Map<String, dynamic> json) = _$_Event.fromJson;

  @override
  String? get contentId;
  @override
  String? get contentName;
  @override
  String? get eventId;
  @override
  String? get eventName;
  @override
  String? get categoryName;
  @override // bool isPurchased,
  String? get levelId;
  @override
  String? get vocabularyCount;
  @override
  String? get vocabularyKnow;
  @override
  String? get isCompleted;
  @override
  String? get imgUrl;
  @override
  String? get intro;
  @override
  String? get isSerial;
  @override
  String? get runTime;
  @override
  @JsonKey(ignore: true)
  _$EventCopyWith<_Event> get copyWith => throw _privateConstructorUsedError;
}
