// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'app_bar_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AppBarData _$AppBarDataFromJson(Map<String, dynamic> json) {
  return _AppBarData.fromJson(json);
}

/// @nodoc
class _$AppBarDataTearOff {
  const _$AppBarDataTearOff();

  _AppBarData call(String homePageText, String coursePageText,
      String ppvPageText, String articlePageText) {
    return _AppBarData(
      homePageText,
      coursePageText,
      ppvPageText,
      articlePageText,
    );
  }

  AppBarData fromJson(Map<String, Object?> json) {
    return AppBarData.fromJson(json);
  }
}

/// @nodoc
const $AppBarData = _$AppBarDataTearOff();

/// @nodoc
mixin _$AppBarData {
  String get homePageText => throw _privateConstructorUsedError;
  String get coursePageText => throw _privateConstructorUsedError;
  String get ppvPageText => throw _privateConstructorUsedError;
  String get articlePageText => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppBarDataCopyWith<AppBarData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppBarDataCopyWith<$Res> {
  factory $AppBarDataCopyWith(
          AppBarData value, $Res Function(AppBarData) then) =
      _$AppBarDataCopyWithImpl<$Res>;
  $Res call(
      {String homePageText,
      String coursePageText,
      String ppvPageText,
      String articlePageText});
}

/// @nodoc
class _$AppBarDataCopyWithImpl<$Res> implements $AppBarDataCopyWith<$Res> {
  _$AppBarDataCopyWithImpl(this._value, this._then);

  final AppBarData _value;
  // ignore: unused_field
  final $Res Function(AppBarData) _then;

  @override
  $Res call({
    Object? homePageText = freezed,
    Object? coursePageText = freezed,
    Object? ppvPageText = freezed,
    Object? articlePageText = freezed,
  }) {
    return _then(_value.copyWith(
      homePageText: homePageText == freezed
          ? _value.homePageText
          : homePageText // ignore: cast_nullable_to_non_nullable
              as String,
      coursePageText: coursePageText == freezed
          ? _value.coursePageText
          : coursePageText // ignore: cast_nullable_to_non_nullable
              as String,
      ppvPageText: ppvPageText == freezed
          ? _value.ppvPageText
          : ppvPageText // ignore: cast_nullable_to_non_nullable
              as String,
      articlePageText: articlePageText == freezed
          ? _value.articlePageText
          : articlePageText // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$AppBarDataCopyWith<$Res> implements $AppBarDataCopyWith<$Res> {
  factory _$AppBarDataCopyWith(
          _AppBarData value, $Res Function(_AppBarData) then) =
      __$AppBarDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {String homePageText,
      String coursePageText,
      String ppvPageText,
      String articlePageText});
}

/// @nodoc
class __$AppBarDataCopyWithImpl<$Res> extends _$AppBarDataCopyWithImpl<$Res>
    implements _$AppBarDataCopyWith<$Res> {
  __$AppBarDataCopyWithImpl(
      _AppBarData _value, $Res Function(_AppBarData) _then)
      : super(_value, (v) => _then(v as _AppBarData));

  @override
  _AppBarData get _value => super._value as _AppBarData;

  @override
  $Res call({
    Object? homePageText = freezed,
    Object? coursePageText = freezed,
    Object? ppvPageText = freezed,
    Object? articlePageText = freezed,
  }) {
    return _then(_AppBarData(
      homePageText == freezed
          ? _value.homePageText
          : homePageText // ignore: cast_nullable_to_non_nullable
              as String,
      coursePageText == freezed
          ? _value.coursePageText
          : coursePageText // ignore: cast_nullable_to_non_nullable
              as String,
      ppvPageText == freezed
          ? _value.ppvPageText
          : ppvPageText // ignore: cast_nullable_to_non_nullable
              as String,
      articlePageText == freezed
          ? _value.articlePageText
          : articlePageText // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AppBarData implements _AppBarData {
  _$_AppBarData(this.homePageText, this.coursePageText, this.ppvPageText,
      this.articlePageText);

  factory _$_AppBarData.fromJson(Map<String, dynamic> json) =>
      _$$_AppBarDataFromJson(json);

  @override
  final String homePageText;
  @override
  final String coursePageText;
  @override
  final String ppvPageText;
  @override
  final String articlePageText;

  @override
  String toString() {
    return 'AppBarData(homePageText: $homePageText, coursePageText: $coursePageText, ppvPageText: $ppvPageText, articlePageText: $articlePageText)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AppBarData &&
            const DeepCollectionEquality()
                .equals(other.homePageText, homePageText) &&
            const DeepCollectionEquality()
                .equals(other.coursePageText, coursePageText) &&
            const DeepCollectionEquality()
                .equals(other.ppvPageText, ppvPageText) &&
            const DeepCollectionEquality()
                .equals(other.articlePageText, articlePageText));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(homePageText),
      const DeepCollectionEquality().hash(coursePageText),
      const DeepCollectionEquality().hash(ppvPageText),
      const DeepCollectionEquality().hash(articlePageText));

  @JsonKey(ignore: true)
  @override
  _$AppBarDataCopyWith<_AppBarData> get copyWith =>
      __$AppBarDataCopyWithImpl<_AppBarData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AppBarDataToJson(this);
  }
}

abstract class _AppBarData implements AppBarData {
  factory _AppBarData(String homePageText, String coursePageText,
      String ppvPageText, String articlePageText) = _$_AppBarData;

  factory _AppBarData.fromJson(Map<String, dynamic> json) =
      _$_AppBarData.fromJson;

  @override
  String get homePageText;
  @override
  String get coursePageText;
  @override
  String get ppvPageText;
  @override
  String get articlePageText;
  @override
  @JsonKey(ignore: true)
  _$AppBarDataCopyWith<_AppBarData> get copyWith =>
      throw _privateConstructorUsedError;
}
