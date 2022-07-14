// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'title_text.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TitleText _$TitleTextFromJson(Map<String, dynamic> json) {
  return _TitleText.fromJson(json);
}

/// @nodoc
class _$TitleTextTearOff {
  const _$TitleTextTearOff();

  _TitleText call(String startPageTitle, String ppvPageTitle) {
    return _TitleText(
      startPageTitle,
      ppvPageTitle,
    );
  }

  TitleText fromJson(Map<String, Object?> json) {
    return TitleText.fromJson(json);
  }
}

/// @nodoc
const $TitleText = _$TitleTextTearOff();

/// @nodoc
mixin _$TitleText {
  String get startPageTitle => throw _privateConstructorUsedError;
  String get ppvPageTitle => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TitleTextCopyWith<TitleText> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TitleTextCopyWith<$Res> {
  factory $TitleTextCopyWith(TitleText value, $Res Function(TitleText) then) =
      _$TitleTextCopyWithImpl<$Res>;
  $Res call({String startPageTitle, String ppvPageTitle});
}

/// @nodoc
class _$TitleTextCopyWithImpl<$Res> implements $TitleTextCopyWith<$Res> {
  _$TitleTextCopyWithImpl(this._value, this._then);

  final TitleText _value;
  // ignore: unused_field
  final $Res Function(TitleText) _then;

  @override
  $Res call({
    Object? startPageTitle = freezed,
    Object? ppvPageTitle = freezed,
  }) {
    return _then(_value.copyWith(
      startPageTitle: startPageTitle == freezed
          ? _value.startPageTitle
          : startPageTitle // ignore: cast_nullable_to_non_nullable
              as String,
      ppvPageTitle: ppvPageTitle == freezed
          ? _value.ppvPageTitle
          : ppvPageTitle // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$TitleTextCopyWith<$Res> implements $TitleTextCopyWith<$Res> {
  factory _$TitleTextCopyWith(
          _TitleText value, $Res Function(_TitleText) then) =
      __$TitleTextCopyWithImpl<$Res>;
  @override
  $Res call({String startPageTitle, String ppvPageTitle});
}

/// @nodoc
class __$TitleTextCopyWithImpl<$Res> extends _$TitleTextCopyWithImpl<$Res>
    implements _$TitleTextCopyWith<$Res> {
  __$TitleTextCopyWithImpl(_TitleText _value, $Res Function(_TitleText) _then)
      : super(_value, (v) => _then(v as _TitleText));

  @override
  _TitleText get _value => super._value as _TitleText;

  @override
  $Res call({
    Object? startPageTitle = freezed,
    Object? ppvPageTitle = freezed,
  }) {
    return _then(_TitleText(
      startPageTitle == freezed
          ? _value.startPageTitle
          : startPageTitle // ignore: cast_nullable_to_non_nullable
              as String,
      ppvPageTitle == freezed
          ? _value.ppvPageTitle
          : ppvPageTitle // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TitleText implements _TitleText {
  _$_TitleText(this.startPageTitle, this.ppvPageTitle);

  factory _$_TitleText.fromJson(Map<String, dynamic> json) =>
      _$$_TitleTextFromJson(json);

  @override
  final String startPageTitle;
  @override
  final String ppvPageTitle;

  @override
  String toString() {
    return 'TitleText(startPageTitle: $startPageTitle, ppvPageTitle: $ppvPageTitle)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TitleText &&
            const DeepCollectionEquality()
                .equals(other.startPageTitle, startPageTitle) &&
            const DeepCollectionEquality()
                .equals(other.ppvPageTitle, ppvPageTitle));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(startPageTitle),
      const DeepCollectionEquality().hash(ppvPageTitle));

  @JsonKey(ignore: true)
  @override
  _$TitleTextCopyWith<_TitleText> get copyWith =>
      __$TitleTextCopyWithImpl<_TitleText>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TitleTextToJson(this);
  }
}

abstract class _TitleText implements TitleText {
  factory _TitleText(String startPageTitle, String ppvPageTitle) = _$_TitleText;

  factory _TitleText.fromJson(Map<String, dynamic> json) =
      _$_TitleText.fromJson;

  @override
  String get startPageTitle;
  @override
  String get ppvPageTitle;
  @override
  @JsonKey(ignore: true)
  _$TitleTextCopyWith<_TitleText> get copyWith =>
      throw _privateConstructorUsedError;
}
