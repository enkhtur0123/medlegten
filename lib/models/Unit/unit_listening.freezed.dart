// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unit_listening.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnitListening _$UnitListeningFromJson(Map<String, dynamic> json) {
  return _UnitListening.fromJson(json);
}

/// @nodoc
class _$UnitListeningTearOff {
  const _$UnitListeningTearOff();

  _UnitListening call(String name, List<ListeningCue> cue) {
    return _UnitListening(
      name,
      cue,
    );
  }

  UnitListening fromJson(Map<String, Object?> json) {
    return UnitListening.fromJson(json);
  }
}

/// @nodoc
const $UnitListening = _$UnitListeningTearOff();

/// @nodoc
mixin _$UnitListening {
  String get name => throw _privateConstructorUsedError;
  List<ListeningCue> get cue => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnitListeningCopyWith<UnitListening> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnitListeningCopyWith<$Res> {
  factory $UnitListeningCopyWith(
          UnitListening value, $Res Function(UnitListening) then) =
      _$UnitListeningCopyWithImpl<$Res>;
  $Res call({String name, List<ListeningCue> cue});
}

/// @nodoc
class _$UnitListeningCopyWithImpl<$Res>
    implements $UnitListeningCopyWith<$Res> {
  _$UnitListeningCopyWithImpl(this._value, this._then);

  final UnitListening _value;
  // ignore: unused_field
  final $Res Function(UnitListening) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? cue = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      cue: cue == freezed
          ? _value.cue
          : cue // ignore: cast_nullable_to_non_nullable
              as List<ListeningCue>,
    ));
  }
}

/// @nodoc
abstract class _$UnitListeningCopyWith<$Res>
    implements $UnitListeningCopyWith<$Res> {
  factory _$UnitListeningCopyWith(
          _UnitListening value, $Res Function(_UnitListening) then) =
      __$UnitListeningCopyWithImpl<$Res>;
  @override
  $Res call({String name, List<ListeningCue> cue});
}

/// @nodoc
class __$UnitListeningCopyWithImpl<$Res>
    extends _$UnitListeningCopyWithImpl<$Res>
    implements _$UnitListeningCopyWith<$Res> {
  __$UnitListeningCopyWithImpl(
      _UnitListening _value, $Res Function(_UnitListening) _then)
      : super(_value, (v) => _then(v as _UnitListening));

  @override
  _UnitListening get _value => super._value as _UnitListening;

  @override
  $Res call({
    Object? name = freezed,
    Object? cue = freezed,
  }) {
    return _then(_UnitListening(
      name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      cue == freezed
          ? _value.cue
          : cue // ignore: cast_nullable_to_non_nullable
              as List<ListeningCue>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnitListening implements _UnitListening {
  _$_UnitListening(this.name, this.cue);

  factory _$_UnitListening.fromJson(Map<String, dynamic> json) =>
      _$$_UnitListeningFromJson(json);

  @override
  final String name;
  @override
  final List<ListeningCue> cue;

  @override
  String toString() {
    return 'UnitListening(name: $name, cue: $cue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UnitListening &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.cue, cue));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(cue));

  @JsonKey(ignore: true)
  @override
  _$UnitListeningCopyWith<_UnitListening> get copyWith =>
      __$UnitListeningCopyWithImpl<_UnitListening>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnitListeningToJson(this);
  }
}

abstract class _UnitListening implements UnitListening {
  factory _UnitListening(String name, List<ListeningCue> cue) =
      _$_UnitListening;

  factory _UnitListening.fromJson(Map<String, dynamic> json) =
      _$_UnitListening.fromJson;

  @override
  String get name;
  @override
  List<ListeningCue> get cue;
  @override
  @JsonKey(ignore: true)
  _$UnitListeningCopyWith<_UnitListening> get copyWith =>
      throw _privateConstructorUsedError;
}
