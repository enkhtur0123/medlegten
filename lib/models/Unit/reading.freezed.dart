// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'reading.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Reading _$ReadingFromJson(Map<String, dynamic> json) {
  return _Reading.fromJson(json);
}

/// @nodoc
class _$ReadingTearOff {
  const _$ReadingTearOff();

  _Reading call(
      String name, String title, String imgUrl, List<ReadingCueParagraph> cue) {
    return _Reading(
      name,
      title,
      imgUrl,
      cue,
    );
  }

  Reading fromJson(Map<String, Object?> json) {
    return Reading.fromJson(json);
  }
}

/// @nodoc
const $Reading = _$ReadingTearOff();

/// @nodoc
mixin _$Reading {
  String get name => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get imgUrl => throw _privateConstructorUsedError;
  List<ReadingCueParagraph> get cue => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReadingCopyWith<Reading> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReadingCopyWith<$Res> {
  factory $ReadingCopyWith(Reading value, $Res Function(Reading) then) =
      _$ReadingCopyWithImpl<$Res>;
  $Res call(
      {String name,
      String title,
      String imgUrl,
      List<ReadingCueParagraph> cue});
}

/// @nodoc
class _$ReadingCopyWithImpl<$Res> implements $ReadingCopyWith<$Res> {
  _$ReadingCopyWithImpl(this._value, this._then);

  final Reading _value;
  // ignore: unused_field
  final $Res Function(Reading) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? title = freezed,
    Object? imgUrl = freezed,
    Object? cue = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      imgUrl: imgUrl == freezed
          ? _value.imgUrl
          : imgUrl // ignore: cast_nullable_to_non_nullable
              as String,
      cue: cue == freezed
          ? _value.cue
          : cue // ignore: cast_nullable_to_non_nullable
              as List<ReadingCueParagraph>,
    ));
  }
}

/// @nodoc
abstract class _$ReadingCopyWith<$Res> implements $ReadingCopyWith<$Res> {
  factory _$ReadingCopyWith(_Reading value, $Res Function(_Reading) then) =
      __$ReadingCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      String title,
      String imgUrl,
      List<ReadingCueParagraph> cue});
}

/// @nodoc
class __$ReadingCopyWithImpl<$Res> extends _$ReadingCopyWithImpl<$Res>
    implements _$ReadingCopyWith<$Res> {
  __$ReadingCopyWithImpl(_Reading _value, $Res Function(_Reading) _then)
      : super(_value, (v) => _then(v as _Reading));

  @override
  _Reading get _value => super._value as _Reading;

  @override
  $Res call({
    Object? name = freezed,
    Object? title = freezed,
    Object? imgUrl = freezed,
    Object? cue = freezed,
  }) {
    return _then(_Reading(
      name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      imgUrl == freezed
          ? _value.imgUrl
          : imgUrl // ignore: cast_nullable_to_non_nullable
              as String,
      cue == freezed
          ? _value.cue
          : cue // ignore: cast_nullable_to_non_nullable
              as List<ReadingCueParagraph>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Reading implements _Reading {
  _$_Reading(this.name, this.title, this.imgUrl, this.cue);

  factory _$_Reading.fromJson(Map<String, dynamic> json) =>
      _$$_ReadingFromJson(json);

  @override
  final String name;
  @override
  final String title;
  @override
  final String imgUrl;
  @override
  final List<ReadingCueParagraph> cue;

  @override
  String toString() {
    return 'Reading(name: $name, title: $title, imgUrl: $imgUrl, cue: $cue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Reading &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.imgUrl, imgUrl) &&
            const DeepCollectionEquality().equals(other.cue, cue));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(imgUrl),
      const DeepCollectionEquality().hash(cue));

  @JsonKey(ignore: true)
  @override
  _$ReadingCopyWith<_Reading> get copyWith =>
      __$ReadingCopyWithImpl<_Reading>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReadingToJson(this);
  }
}

abstract class _Reading implements Reading {
  factory _Reading(String name, String title, String imgUrl,
      List<ReadingCueParagraph> cue) = _$_Reading;

  factory _Reading.fromJson(Map<String, dynamic> json) = _$_Reading.fromJson;

  @override
  String get name;
  @override
  String get title;
  @override
  String get imgUrl;
  @override
  List<ReadingCueParagraph> get cue;
  @override
  @JsonKey(ignore: true)
  _$ReadingCopyWith<_Reading> get copyWith =>
      throw _privateConstructorUsedError;
}
