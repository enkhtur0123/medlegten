// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'mile_stone_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MileStoneItem _$MileStoneItemFromJson(Map<String, dynamic> json) {
  return _MileStoneItem.fromJson(json);
}

/// @nodoc
class _$MileStoneItemTearOff {
  const _$MileStoneItemTearOff();

  _MileStoneItem call(String? id, String? name, String? desc, String? ppvNum,
      String? wordNum, String? ordering) {
    return _MileStoneItem(
      id,
      name,
      desc,
      ppvNum,
      wordNum,
      ordering,
    );
  }

  MileStoneItem fromJson(Map<String, Object?> json) {
    return MileStoneItem.fromJson(json);
  }
}

/// @nodoc
const $MileStoneItem = _$MileStoneItemTearOff();

/// @nodoc
mixin _$MileStoneItem {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get desc => throw _privateConstructorUsedError;
  String? get ppvNum => throw _privateConstructorUsedError;
  String? get wordNum => throw _privateConstructorUsedError;
  String? get ordering => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MileStoneItemCopyWith<MileStoneItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MileStoneItemCopyWith<$Res> {
  factory $MileStoneItemCopyWith(
          MileStoneItem value, $Res Function(MileStoneItem) then) =
      _$MileStoneItemCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      String? name,
      String? desc,
      String? ppvNum,
      String? wordNum,
      String? ordering});
}

/// @nodoc
class _$MileStoneItemCopyWithImpl<$Res>
    implements $MileStoneItemCopyWith<$Res> {
  _$MileStoneItemCopyWithImpl(this._value, this._then);

  final MileStoneItem _value;
  // ignore: unused_field
  final $Res Function(MileStoneItem) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? desc = freezed,
    Object? ppvNum = freezed,
    Object? wordNum = freezed,
    Object? ordering = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      desc: desc == freezed
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String?,
      ppvNum: ppvNum == freezed
          ? _value.ppvNum
          : ppvNum // ignore: cast_nullable_to_non_nullable
              as String?,
      wordNum: wordNum == freezed
          ? _value.wordNum
          : wordNum // ignore: cast_nullable_to_non_nullable
              as String?,
      ordering: ordering == freezed
          ? _value.ordering
          : ordering // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$MileStoneItemCopyWith<$Res>
    implements $MileStoneItemCopyWith<$Res> {
  factory _$MileStoneItemCopyWith(
          _MileStoneItem value, $Res Function(_MileStoneItem) then) =
      __$MileStoneItemCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      String? name,
      String? desc,
      String? ppvNum,
      String? wordNum,
      String? ordering});
}

/// @nodoc
class __$MileStoneItemCopyWithImpl<$Res>
    extends _$MileStoneItemCopyWithImpl<$Res>
    implements _$MileStoneItemCopyWith<$Res> {
  __$MileStoneItemCopyWithImpl(
      _MileStoneItem _value, $Res Function(_MileStoneItem) _then)
      : super(_value, (v) => _then(v as _MileStoneItem));

  @override
  _MileStoneItem get _value => super._value as _MileStoneItem;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? desc = freezed,
    Object? ppvNum = freezed,
    Object? wordNum = freezed,
    Object? ordering = freezed,
  }) {
    return _then(_MileStoneItem(
      id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      desc == freezed
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String?,
      ppvNum == freezed
          ? _value.ppvNum
          : ppvNum // ignore: cast_nullable_to_non_nullable
              as String?,
      wordNum == freezed
          ? _value.wordNum
          : wordNum // ignore: cast_nullable_to_non_nullable
              as String?,
      ordering == freezed
          ? _value.ordering
          : ordering // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MileStoneItem implements _MileStoneItem {
  _$_MileStoneItem(
      this.id, this.name, this.desc, this.ppvNum, this.wordNum, this.ordering);

  factory _$_MileStoneItem.fromJson(Map<String, dynamic> json) =>
      _$$_MileStoneItemFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? desc;
  @override
  final String? ppvNum;
  @override
  final String? wordNum;
  @override
  final String? ordering;

  @override
  String toString() {
    return 'MileStoneItem(id: $id, name: $name, desc: $desc, ppvNum: $ppvNum, wordNum: $wordNum, ordering: $ordering)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MileStoneItem &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.desc, desc) &&
            const DeepCollectionEquality().equals(other.ppvNum, ppvNum) &&
            const DeepCollectionEquality().equals(other.wordNum, wordNum) &&
            const DeepCollectionEquality().equals(other.ordering, ordering));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(desc),
      const DeepCollectionEquality().hash(ppvNum),
      const DeepCollectionEquality().hash(wordNum),
      const DeepCollectionEquality().hash(ordering));

  @JsonKey(ignore: true)
  @override
  _$MileStoneItemCopyWith<_MileStoneItem> get copyWith =>
      __$MileStoneItemCopyWithImpl<_MileStoneItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MileStoneItemToJson(this);
  }
}

abstract class _MileStoneItem implements MileStoneItem {
  factory _MileStoneItem(String? id, String? name, String? desc, String? ppvNum,
      String? wordNum, String? ordering) = _$_MileStoneItem;

  factory _MileStoneItem.fromJson(Map<String, dynamic> json) =
      _$_MileStoneItem.fromJson;

  @override
  String? get id;
  @override
  String? get name;
  @override
  String? get desc;
  @override
  String? get ppvNum;
  @override
  String? get wordNum;
  @override
  String? get ordering;
  @override
  @JsonKey(ignore: true)
  _$MileStoneItemCopyWith<_MileStoneItem> get copyWith =>
      throw _privateConstructorUsedError;
}
