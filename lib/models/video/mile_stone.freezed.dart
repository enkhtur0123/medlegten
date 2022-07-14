// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'mile_stone.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MileStone _$MileStoneFromJson(Map<String, dynamic> json) {
  return _MileStone.fromJson(json);
}

/// @nodoc
class _$MileStoneTearOff {
  const _$MileStoneTearOff();

  _MileStone call(List<MileStoneItem>? mileStone, int completedPpvCount,
      int knowingWordCount) {
    return _MileStone(
      mileStone,
      completedPpvCount,
      knowingWordCount,
    );
  }

  MileStone fromJson(Map<String, Object?> json) {
    return MileStone.fromJson(json);
  }
}

/// @nodoc
const $MileStone = _$MileStoneTearOff();

/// @nodoc
mixin _$MileStone {
  List<MileStoneItem>? get mileStone => throw _privateConstructorUsedError;
  int get completedPpvCount => throw _privateConstructorUsedError;
  int get knowingWordCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MileStoneCopyWith<MileStone> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MileStoneCopyWith<$Res> {
  factory $MileStoneCopyWith(MileStone value, $Res Function(MileStone) then) =
      _$MileStoneCopyWithImpl<$Res>;
  $Res call(
      {List<MileStoneItem>? mileStone,
      int completedPpvCount,
      int knowingWordCount});
}

/// @nodoc
class _$MileStoneCopyWithImpl<$Res> implements $MileStoneCopyWith<$Res> {
  _$MileStoneCopyWithImpl(this._value, this._then);

  final MileStone _value;
  // ignore: unused_field
  final $Res Function(MileStone) _then;

  @override
  $Res call({
    Object? mileStone = freezed,
    Object? completedPpvCount = freezed,
    Object? knowingWordCount = freezed,
  }) {
    return _then(_value.copyWith(
      mileStone: mileStone == freezed
          ? _value.mileStone
          : mileStone // ignore: cast_nullable_to_non_nullable
              as List<MileStoneItem>?,
      completedPpvCount: completedPpvCount == freezed
          ? _value.completedPpvCount
          : completedPpvCount // ignore: cast_nullable_to_non_nullable
              as int,
      knowingWordCount: knowingWordCount == freezed
          ? _value.knowingWordCount
          : knowingWordCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$MileStoneCopyWith<$Res> implements $MileStoneCopyWith<$Res> {
  factory _$MileStoneCopyWith(
          _MileStone value, $Res Function(_MileStone) then) =
      __$MileStoneCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<MileStoneItem>? mileStone,
      int completedPpvCount,
      int knowingWordCount});
}

/// @nodoc
class __$MileStoneCopyWithImpl<$Res> extends _$MileStoneCopyWithImpl<$Res>
    implements _$MileStoneCopyWith<$Res> {
  __$MileStoneCopyWithImpl(_MileStone _value, $Res Function(_MileStone) _then)
      : super(_value, (v) => _then(v as _MileStone));

  @override
  _MileStone get _value => super._value as _MileStone;

  @override
  $Res call({
    Object? mileStone = freezed,
    Object? completedPpvCount = freezed,
    Object? knowingWordCount = freezed,
  }) {
    return _then(_MileStone(
      mileStone == freezed
          ? _value.mileStone
          : mileStone // ignore: cast_nullable_to_non_nullable
              as List<MileStoneItem>?,
      completedPpvCount == freezed
          ? _value.completedPpvCount
          : completedPpvCount // ignore: cast_nullable_to_non_nullable
              as int,
      knowingWordCount == freezed
          ? _value.knowingWordCount
          : knowingWordCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MileStone implements _MileStone {
  _$_MileStone(this.mileStone, this.completedPpvCount, this.knowingWordCount);

  factory _$_MileStone.fromJson(Map<String, dynamic> json) =>
      _$$_MileStoneFromJson(json);

  @override
  final List<MileStoneItem>? mileStone;
  @override
  final int completedPpvCount;
  @override
  final int knowingWordCount;

  @override
  String toString() {
    return 'MileStone(mileStone: $mileStone, completedPpvCount: $completedPpvCount, knowingWordCount: $knowingWordCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MileStone &&
            const DeepCollectionEquality().equals(other.mileStone, mileStone) &&
            const DeepCollectionEquality()
                .equals(other.completedPpvCount, completedPpvCount) &&
            const DeepCollectionEquality()
                .equals(other.knowingWordCount, knowingWordCount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(mileStone),
      const DeepCollectionEquality().hash(completedPpvCount),
      const DeepCollectionEquality().hash(knowingWordCount));

  @JsonKey(ignore: true)
  @override
  _$MileStoneCopyWith<_MileStone> get copyWith =>
      __$MileStoneCopyWithImpl<_MileStone>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MileStoneToJson(this);
  }
}

abstract class _MileStone implements MileStone {
  factory _MileStone(List<MileStoneItem>? mileStone, int completedPpvCount,
      int knowingWordCount) = _$_MileStone;

  factory _MileStone.fromJson(Map<String, dynamic> json) =
      _$_MileStone.fromJson;

  @override
  List<MileStoneItem>? get mileStone;
  @override
  int get completedPpvCount;
  @override
  int get knowingWordCount;
  @override
  @JsonKey(ignore: true)
  _$MileStoneCopyWith<_MileStone> get copyWith =>
      throw _privateConstructorUsedError;
}
