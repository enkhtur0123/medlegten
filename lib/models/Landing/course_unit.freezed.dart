// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'course_unit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CourseUnit _$CourseUnitFromJson(Map<String, dynamic> json) {
  return _CourseUnit.fromJson(json);
}

/// @nodoc
class _$CourseUnitTearOff {
  const _$CourseUnitTearOff();

  _CourseUnit call(String unitId, String courseId, String unitNumber,
      String unitName, String hasTrial, String minToWatch, bool isCompleted) {
    return _CourseUnit(
      unitId,
      courseId,
      unitNumber,
      unitName,
      hasTrial,
      minToWatch,
      isCompleted,
    );
  }

  CourseUnit fromJson(Map<String, Object?> json) {
    return CourseUnit.fromJson(json);
  }
}

/// @nodoc
const $CourseUnit = _$CourseUnitTearOff();

/// @nodoc
mixin _$CourseUnit {
  String get unitId => throw _privateConstructorUsedError;
  String get courseId => throw _privateConstructorUsedError;
  String get unitNumber => throw _privateConstructorUsedError;
  String get unitName => throw _privateConstructorUsedError;
  String get hasTrial => throw _privateConstructorUsedError;
  String get minToWatch => throw _privateConstructorUsedError;
  bool get isCompleted => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CourseUnitCopyWith<CourseUnit> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CourseUnitCopyWith<$Res> {
  factory $CourseUnitCopyWith(
          CourseUnit value, $Res Function(CourseUnit) then) =
      _$CourseUnitCopyWithImpl<$Res>;
  $Res call(
      {String unitId,
      String courseId,
      String unitNumber,
      String unitName,
      String hasTrial,
      String minToWatch,
      bool isCompleted});
}

/// @nodoc
class _$CourseUnitCopyWithImpl<$Res> implements $CourseUnitCopyWith<$Res> {
  _$CourseUnitCopyWithImpl(this._value, this._then);

  final CourseUnit _value;
  // ignore: unused_field
  final $Res Function(CourseUnit) _then;

  @override
  $Res call({
    Object? unitId = freezed,
    Object? courseId = freezed,
    Object? unitNumber = freezed,
    Object? unitName = freezed,
    Object? hasTrial = freezed,
    Object? minToWatch = freezed,
    Object? isCompleted = freezed,
  }) {
    return _then(_value.copyWith(
      unitId: unitId == freezed
          ? _value.unitId
          : unitId // ignore: cast_nullable_to_non_nullable
              as String,
      courseId: courseId == freezed
          ? _value.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as String,
      unitNumber: unitNumber == freezed
          ? _value.unitNumber
          : unitNumber // ignore: cast_nullable_to_non_nullable
              as String,
      unitName: unitName == freezed
          ? _value.unitName
          : unitName // ignore: cast_nullable_to_non_nullable
              as String,
      hasTrial: hasTrial == freezed
          ? _value.hasTrial
          : hasTrial // ignore: cast_nullable_to_non_nullable
              as String,
      minToWatch: minToWatch == freezed
          ? _value.minToWatch
          : minToWatch // ignore: cast_nullable_to_non_nullable
              as String,
      isCompleted: isCompleted == freezed
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$CourseUnitCopyWith<$Res> implements $CourseUnitCopyWith<$Res> {
  factory _$CourseUnitCopyWith(
          _CourseUnit value, $Res Function(_CourseUnit) then) =
      __$CourseUnitCopyWithImpl<$Res>;
  @override
  $Res call(
      {String unitId,
      String courseId,
      String unitNumber,
      String unitName,
      String hasTrial,
      String minToWatch,
      bool isCompleted});
}

/// @nodoc
class __$CourseUnitCopyWithImpl<$Res> extends _$CourseUnitCopyWithImpl<$Res>
    implements _$CourseUnitCopyWith<$Res> {
  __$CourseUnitCopyWithImpl(
      _CourseUnit _value, $Res Function(_CourseUnit) _then)
      : super(_value, (v) => _then(v as _CourseUnit));

  @override
  _CourseUnit get _value => super._value as _CourseUnit;

  @override
  $Res call({
    Object? unitId = freezed,
    Object? courseId = freezed,
    Object? unitNumber = freezed,
    Object? unitName = freezed,
    Object? hasTrial = freezed,
    Object? minToWatch = freezed,
    Object? isCompleted = freezed,
  }) {
    return _then(_CourseUnit(
      unitId == freezed
          ? _value.unitId
          : unitId // ignore: cast_nullable_to_non_nullable
              as String,
      courseId == freezed
          ? _value.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as String,
      unitNumber == freezed
          ? _value.unitNumber
          : unitNumber // ignore: cast_nullable_to_non_nullable
              as String,
      unitName == freezed
          ? _value.unitName
          : unitName // ignore: cast_nullable_to_non_nullable
              as String,
      hasTrial == freezed
          ? _value.hasTrial
          : hasTrial // ignore: cast_nullable_to_non_nullable
              as String,
      minToWatch == freezed
          ? _value.minToWatch
          : minToWatch // ignore: cast_nullable_to_non_nullable
              as String,
      isCompleted == freezed
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CourseUnit implements _CourseUnit {
  _$_CourseUnit(this.unitId, this.courseId, this.unitNumber, this.unitName,
      this.hasTrial, this.minToWatch, this.isCompleted);

  factory _$_CourseUnit.fromJson(Map<String, dynamic> json) =>
      _$$_CourseUnitFromJson(json);

  @override
  final String unitId;
  @override
  final String courseId;
  @override
  final String unitNumber;
  @override
  final String unitName;
  @override
  final String hasTrial;
  @override
  final String minToWatch;
  @override
  final bool isCompleted;

  @override
  String toString() {
    return 'CourseUnit(unitId: $unitId, courseId: $courseId, unitNumber: $unitNumber, unitName: $unitName, hasTrial: $hasTrial, minToWatch: $minToWatch, isCompleted: $isCompleted)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CourseUnit &&
            const DeepCollectionEquality().equals(other.unitId, unitId) &&
            const DeepCollectionEquality().equals(other.courseId, courseId) &&
            const DeepCollectionEquality()
                .equals(other.unitNumber, unitNumber) &&
            const DeepCollectionEquality().equals(other.unitName, unitName) &&
            const DeepCollectionEquality().equals(other.hasTrial, hasTrial) &&
            const DeepCollectionEquality()
                .equals(other.minToWatch, minToWatch) &&
            const DeepCollectionEquality()
                .equals(other.isCompleted, isCompleted));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(unitId),
      const DeepCollectionEquality().hash(courseId),
      const DeepCollectionEquality().hash(unitNumber),
      const DeepCollectionEquality().hash(unitName),
      const DeepCollectionEquality().hash(hasTrial),
      const DeepCollectionEquality().hash(minToWatch),
      const DeepCollectionEquality().hash(isCompleted));

  @JsonKey(ignore: true)
  @override
  _$CourseUnitCopyWith<_CourseUnit> get copyWith =>
      __$CourseUnitCopyWithImpl<_CourseUnit>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CourseUnitToJson(this);
  }
}

abstract class _CourseUnit implements CourseUnit {
  factory _CourseUnit(
      String unitId,
      String courseId,
      String unitNumber,
      String unitName,
      String hasTrial,
      String minToWatch,
      bool isCompleted) = _$_CourseUnit;

  factory _CourseUnit.fromJson(Map<String, dynamic> json) =
      _$_CourseUnit.fromJson;

  @override
  String get unitId;
  @override
  String get courseId;
  @override
  String get unitNumber;
  @override
  String get unitName;
  @override
  String get hasTrial;
  @override
  String get minToWatch;
  @override
  bool get isCompleted;
  @override
  @JsonKey(ignore: true)
  _$CourseUnitCopyWith<_CourseUnit> get copyWith =>
      throw _privateConstructorUsedError;
}
