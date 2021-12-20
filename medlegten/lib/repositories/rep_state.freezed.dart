// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'rep_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$RepStateTearOff {
  const _$RepStateTearOff();

  _ReptateInitial<T> initial<T>() {
    return _ReptateInitial<T>();
  }

  _RepStateLoading<T> loading<T>() {
    return _RepStateLoading<T>();
  }

  _RepStateData<T> data<T>({required T data}) {
    return _RepStateData<T>(
      data: data,
    );
  }

  _RepStateError<T> error<T>([String? error]) {
    return _RepStateError<T>(
      error,
    );
  }
}

/// @nodoc
const $RepState = _$RepStateTearOff();

/// @nodoc
mixin _$RepState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) data,
    required TResult Function(String? error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? data,
    TResult Function(String? error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? data,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ReptateInitial<T> value) initial,
    required TResult Function(_RepStateLoading<T> value) loading,
    required TResult Function(_RepStateData<T> value) data,
    required TResult Function(_RepStateError<T> value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ReptateInitial<T> value)? initial,
    TResult Function(_RepStateLoading<T> value)? loading,
    TResult Function(_RepStateData<T> value)? data,
    TResult Function(_RepStateError<T> value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ReptateInitial<T> value)? initial,
    TResult Function(_RepStateLoading<T> value)? loading,
    TResult Function(_RepStateData<T> value)? data,
    TResult Function(_RepStateError<T> value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RepStateCopyWith<T, $Res> {
  factory $RepStateCopyWith(
          RepState<T> value, $Res Function(RepState<T>) then) =
      _$RepStateCopyWithImpl<T, $Res>;
}

/// @nodoc
class _$RepStateCopyWithImpl<T, $Res> implements $RepStateCopyWith<T, $Res> {
  _$RepStateCopyWithImpl(this._value, this._then);

  final RepState<T> _value;
  // ignore: unused_field
  final $Res Function(RepState<T>) _then;
}

/// @nodoc
abstract class _$ReptateInitialCopyWith<T, $Res> {
  factory _$ReptateInitialCopyWith(
          _ReptateInitial<T> value, $Res Function(_ReptateInitial<T>) then) =
      __$ReptateInitialCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$ReptateInitialCopyWithImpl<T, $Res>
    extends _$RepStateCopyWithImpl<T, $Res>
    implements _$ReptateInitialCopyWith<T, $Res> {
  __$ReptateInitialCopyWithImpl(
      _ReptateInitial<T> _value, $Res Function(_ReptateInitial<T>) _then)
      : super(_value, (v) => _then(v as _ReptateInitial<T>));

  @override
  _ReptateInitial<T> get _value => super._value as _ReptateInitial<T>;
}

/// @nodoc

class _$_ReptateInitial<T> implements _ReptateInitial<T> {
  const _$_ReptateInitial();

  @override
  String toString() {
    return 'RepState<$T>.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _ReptateInitial<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) data,
    required TResult Function(String? error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? data,
    TResult Function(String? error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? data,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ReptateInitial<T> value) initial,
    required TResult Function(_RepStateLoading<T> value) loading,
    required TResult Function(_RepStateData<T> value) data,
    required TResult Function(_RepStateError<T> value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ReptateInitial<T> value)? initial,
    TResult Function(_RepStateLoading<T> value)? loading,
    TResult Function(_RepStateData<T> value)? data,
    TResult Function(_RepStateError<T> value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ReptateInitial<T> value)? initial,
    TResult Function(_RepStateLoading<T> value)? loading,
    TResult Function(_RepStateData<T> value)? data,
    TResult Function(_RepStateError<T> value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _ReptateInitial<T> implements RepState<T> {
  const factory _ReptateInitial() = _$_ReptateInitial<T>;
}

/// @nodoc
abstract class _$RepStateLoadingCopyWith<T, $Res> {
  factory _$RepStateLoadingCopyWith(
          _RepStateLoading<T> value, $Res Function(_RepStateLoading<T>) then) =
      __$RepStateLoadingCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$RepStateLoadingCopyWithImpl<T, $Res>
    extends _$RepStateCopyWithImpl<T, $Res>
    implements _$RepStateLoadingCopyWith<T, $Res> {
  __$RepStateLoadingCopyWithImpl(
      _RepStateLoading<T> _value, $Res Function(_RepStateLoading<T>) _then)
      : super(_value, (v) => _then(v as _RepStateLoading<T>));

  @override
  _RepStateLoading<T> get _value => super._value as _RepStateLoading<T>;
}

/// @nodoc

class _$_RepStateLoading<T> implements _RepStateLoading<T> {
  const _$_RepStateLoading();

  @override
  String toString() {
    return 'RepState<$T>.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _RepStateLoading<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) data,
    required TResult Function(String? error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? data,
    TResult Function(String? error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? data,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ReptateInitial<T> value) initial,
    required TResult Function(_RepStateLoading<T> value) loading,
    required TResult Function(_RepStateData<T> value) data,
    required TResult Function(_RepStateError<T> value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ReptateInitial<T> value)? initial,
    TResult Function(_RepStateLoading<T> value)? loading,
    TResult Function(_RepStateData<T> value)? data,
    TResult Function(_RepStateError<T> value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ReptateInitial<T> value)? initial,
    TResult Function(_RepStateLoading<T> value)? loading,
    TResult Function(_RepStateData<T> value)? data,
    TResult Function(_RepStateError<T> value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _RepStateLoading<T> implements RepState<T> {
  const factory _RepStateLoading() = _$_RepStateLoading<T>;
}

/// @nodoc
abstract class _$RepStateDataCopyWith<T, $Res> {
  factory _$RepStateDataCopyWith(
          _RepStateData<T> value, $Res Function(_RepStateData<T>) then) =
      __$RepStateDataCopyWithImpl<T, $Res>;
  $Res call({T data});
}

/// @nodoc
class __$RepStateDataCopyWithImpl<T, $Res>
    extends _$RepStateCopyWithImpl<T, $Res>
    implements _$RepStateDataCopyWith<T, $Res> {
  __$RepStateDataCopyWithImpl(
      _RepStateData<T> _value, $Res Function(_RepStateData<T>) _then)
      : super(_value, (v) => _then(v as _RepStateData<T>));

  @override
  _RepStateData<T> get _value => super._value as _RepStateData<T>;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_RepStateData<T>(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$_RepStateData<T> implements _RepStateData<T> {
  const _$_RepStateData({required this.data});

  @override
  final T data;

  @override
  String toString() {
    return 'RepState<$T>.data(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RepStateData<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  _$RepStateDataCopyWith<T, _RepStateData<T>> get copyWith =>
      __$RepStateDataCopyWithImpl<T, _RepStateData<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) data,
    required TResult Function(String? error) error,
  }) {
    return data(this.data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? data,
    TResult Function(String? error)? error,
  }) {
    return data?.call(this.data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? data,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this.data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ReptateInitial<T> value) initial,
    required TResult Function(_RepStateLoading<T> value) loading,
    required TResult Function(_RepStateData<T> value) data,
    required TResult Function(_RepStateError<T> value) error,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ReptateInitial<T> value)? initial,
    TResult Function(_RepStateLoading<T> value)? loading,
    TResult Function(_RepStateData<T> value)? data,
    TResult Function(_RepStateError<T> value)? error,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ReptateInitial<T> value)? initial,
    TResult Function(_RepStateLoading<T> value)? loading,
    TResult Function(_RepStateData<T> value)? data,
    TResult Function(_RepStateError<T> value)? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class _RepStateData<T> implements RepState<T> {
  const factory _RepStateData({required T data}) = _$_RepStateData<T>;

  T get data;
  @JsonKey(ignore: true)
  _$RepStateDataCopyWith<T, _RepStateData<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$RepStateErrorCopyWith<T, $Res> {
  factory _$RepStateErrorCopyWith(
          _RepStateError<T> value, $Res Function(_RepStateError<T>) then) =
      __$RepStateErrorCopyWithImpl<T, $Res>;
  $Res call({String? error});
}

/// @nodoc
class __$RepStateErrorCopyWithImpl<T, $Res>
    extends _$RepStateCopyWithImpl<T, $Res>
    implements _$RepStateErrorCopyWith<T, $Res> {
  __$RepStateErrorCopyWithImpl(
      _RepStateError<T> _value, $Res Function(_RepStateError<T>) _then)
      : super(_value, (v) => _then(v as _RepStateError<T>));

  @override
  _RepStateError<T> get _value => super._value as _RepStateError<T>;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_RepStateError<T>(
      error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_RepStateError<T> implements _RepStateError<T> {
  const _$_RepStateError([this.error]);

  @override
  final String? error;

  @override
  String toString() {
    return 'RepState<$T>.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RepStateError<T> &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  _$RepStateErrorCopyWith<T, _RepStateError<T>> get copyWith =>
      __$RepStateErrorCopyWithImpl<T, _RepStateError<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) data,
    required TResult Function(String? error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? data,
    TResult Function(String? error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? data,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ReptateInitial<T> value) initial,
    required TResult Function(_RepStateLoading<T> value) loading,
    required TResult Function(_RepStateData<T> value) data,
    required TResult Function(_RepStateError<T> value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ReptateInitial<T> value)? initial,
    TResult Function(_RepStateLoading<T> value)? loading,
    TResult Function(_RepStateData<T> value)? data,
    TResult Function(_RepStateError<T> value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ReptateInitial<T> value)? initial,
    TResult Function(_RepStateLoading<T> value)? loading,
    TResult Function(_RepStateData<T> value)? data,
    TResult Function(_RepStateError<T> value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _RepStateError<T> implements RepState<T> {
  const factory _RepStateError([String? error]) = _$_RepStateError<T>;

  String? get error;
  @JsonKey(ignore: true)
  _$RepStateErrorCopyWith<T, _RepStateError<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
