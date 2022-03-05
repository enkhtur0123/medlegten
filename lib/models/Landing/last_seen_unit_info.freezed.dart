// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'last_seen_unit_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LastSeenUnitInfo _$LastSeenUnitInfoFromJson(Map<String, dynamic> json) {
  return _LastSeenUnitInfo.fromJson(json);
}

/// @nodoc
class _$LastSeenUnitInfoTearOff {
  const _$LastSeenUnitInfoTearOff();

  _LastSeenUnitInfo call(
      CourseUnitModuleList? moduleInfo, CourseUnit? unitInfo) {
    return _LastSeenUnitInfo(
      moduleInfo,
      unitInfo,
    );
  }

  LastSeenUnitInfo fromJson(Map<String, Object?> json) {
    return LastSeenUnitInfo.fromJson(json);
  }
}

/// @nodoc
const $LastSeenUnitInfo = _$LastSeenUnitInfoTearOff();

/// @nodoc
mixin _$LastSeenUnitInfo {
  CourseUnitModuleList? get moduleInfo => throw _privateConstructorUsedError;
  CourseUnit? get unitInfo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LastSeenUnitInfoCopyWith<LastSeenUnitInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LastSeenUnitInfoCopyWith<$Res> {
  factory $LastSeenUnitInfoCopyWith(
          LastSeenUnitInfo value, $Res Function(LastSeenUnitInfo) then) =
      _$LastSeenUnitInfoCopyWithImpl<$Res>;
  $Res call({CourseUnitModuleList? moduleInfo, CourseUnit? unitInfo});

  $CourseUnitModuleListCopyWith<$Res>? get moduleInfo;
  $CourseUnitCopyWith<$Res>? get unitInfo;
}

/// @nodoc
class _$LastSeenUnitInfoCopyWithImpl<$Res>
    implements $LastSeenUnitInfoCopyWith<$Res> {
  _$LastSeenUnitInfoCopyWithImpl(this._value, this._then);

  final LastSeenUnitInfo _value;
  // ignore: unused_field
  final $Res Function(LastSeenUnitInfo) _then;

  @override
  $Res call({
    Object? moduleInfo = freezed,
    Object? unitInfo = freezed,
  }) {
    return _then(_value.copyWith(
      moduleInfo: moduleInfo == freezed
          ? _value.moduleInfo
          : moduleInfo // ignore: cast_nullable_to_non_nullable
              as CourseUnitModuleList?,
      unitInfo: unitInfo == freezed
          ? _value.unitInfo
          : unitInfo // ignore: cast_nullable_to_non_nullable
              as CourseUnit?,
    ));
  }

  @override
  $CourseUnitModuleListCopyWith<$Res>? get moduleInfo {
    if (_value.moduleInfo == null) {
      return null;
    }

    return $CourseUnitModuleListCopyWith<$Res>(_value.moduleInfo!, (value) {
      return _then(_value.copyWith(moduleInfo: value));
    });
  }

  @override
  $CourseUnitCopyWith<$Res>? get unitInfo {
    if (_value.unitInfo == null) {
      return null;
    }

    return $CourseUnitCopyWith<$Res>(_value.unitInfo!, (value) {
      return _then(_value.copyWith(unitInfo: value));
    });
  }
}

/// @nodoc
abstract class _$LastSeenUnitInfoCopyWith<$Res>
    implements $LastSeenUnitInfoCopyWith<$Res> {
  factory _$LastSeenUnitInfoCopyWith(
          _LastSeenUnitInfo value, $Res Function(_LastSeenUnitInfo) then) =
      __$LastSeenUnitInfoCopyWithImpl<$Res>;
  @override
  $Res call({CourseUnitModuleList? moduleInfo, CourseUnit? unitInfo});

  @override
  $CourseUnitModuleListCopyWith<$Res>? get moduleInfo;
  @override
  $CourseUnitCopyWith<$Res>? get unitInfo;
}

/// @nodoc
class __$LastSeenUnitInfoCopyWithImpl<$Res>
    extends _$LastSeenUnitInfoCopyWithImpl<$Res>
    implements _$LastSeenUnitInfoCopyWith<$Res> {
  __$LastSeenUnitInfoCopyWithImpl(
      _LastSeenUnitInfo _value, $Res Function(_LastSeenUnitInfo) _then)
      : super(_value, (v) => _then(v as _LastSeenUnitInfo));

  @override
  _LastSeenUnitInfo get _value => super._value as _LastSeenUnitInfo;

  @override
  $Res call({
    Object? moduleInfo = freezed,
    Object? unitInfo = freezed,
  }) {
    return _then(_LastSeenUnitInfo(
      moduleInfo == freezed
          ? _value.moduleInfo
          : moduleInfo // ignore: cast_nullable_to_non_nullable
              as CourseUnitModuleList?,
      unitInfo == freezed
          ? _value.unitInfo
          : unitInfo // ignore: cast_nullable_to_non_nullable
              as CourseUnit?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LastSeenUnitInfo implements _LastSeenUnitInfo {
  _$_LastSeenUnitInfo(this.moduleInfo, this.unitInfo);

  factory _$_LastSeenUnitInfo.fromJson(Map<String, dynamic> json) =>
      _$$_LastSeenUnitInfoFromJson(json);

  @override
  final CourseUnitModuleList? moduleInfo;
  @override
  final CourseUnit? unitInfo;

  @override
  String toString() {
    return 'LastSeenUnitInfo(moduleInfo: $moduleInfo, unitInfo: $unitInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LastSeenUnitInfo &&
            const DeepCollectionEquality()
                .equals(other.moduleInfo, moduleInfo) &&
            const DeepCollectionEquality().equals(other.unitInfo, unitInfo));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(moduleInfo),
      const DeepCollectionEquality().hash(unitInfo));

  @JsonKey(ignore: true)
  @override
  _$LastSeenUnitInfoCopyWith<_LastSeenUnitInfo> get copyWith =>
      __$LastSeenUnitInfoCopyWithImpl<_LastSeenUnitInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LastSeenUnitInfoToJson(this);
  }
}

abstract class _LastSeenUnitInfo implements LastSeenUnitInfo {
  factory _LastSeenUnitInfo(
          CourseUnitModuleList? moduleInfo, CourseUnit? unitInfo) =
      _$_LastSeenUnitInfo;

  factory _LastSeenUnitInfo.fromJson(Map<String, dynamic> json) =
      _$_LastSeenUnitInfo.fromJson;

  @override
  CourseUnitModuleList? get moduleInfo;
  @override
  CourseUnit? get unitInfo;
  @override
  @JsonKey(ignore: true)
  _$LastSeenUnitInfoCopyWith<_LastSeenUnitInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
