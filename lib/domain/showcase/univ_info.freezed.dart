// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'univ_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UnivInfo {
  String? get name => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UnivInfoCopyWith<UnivInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnivInfoCopyWith<$Res> {
  factory $UnivInfoCopyWith(UnivInfo value, $Res Function(UnivInfo) then) =
      _$UnivInfoCopyWithImpl<$Res, UnivInfo>;
  @useResult
  $Res call({String? name});
}

/// @nodoc
class _$UnivInfoCopyWithImpl<$Res, $Val extends UnivInfo>
    implements $UnivInfoCopyWith<$Res> {
  _$UnivInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UnivInfoImplCopyWith<$Res>
    implements $UnivInfoCopyWith<$Res> {
  factory _$$UnivInfoImplCopyWith(
          _$UnivInfoImpl value, $Res Function(_$UnivInfoImpl) then) =
      __$$UnivInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? name});
}

/// @nodoc
class __$$UnivInfoImplCopyWithImpl<$Res>
    extends _$UnivInfoCopyWithImpl<$Res, _$UnivInfoImpl>
    implements _$$UnivInfoImplCopyWith<$Res> {
  __$$UnivInfoImplCopyWithImpl(
      _$UnivInfoImpl _value, $Res Function(_$UnivInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
  }) {
    return _then(_$UnivInfoImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$UnivInfoImpl implements _UnivInfo {
  const _$UnivInfoImpl({this.name});

  @override
  final String? name;

  @override
  String toString() {
    return 'UnivInfo(name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnivInfoImpl &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UnivInfoImplCopyWith<_$UnivInfoImpl> get copyWith =>
      __$$UnivInfoImplCopyWithImpl<_$UnivInfoImpl>(this, _$identity);
}

abstract class _UnivInfo implements UnivInfo {
  const factory _UnivInfo({final String? name}) = _$UnivInfoImpl;

  @override
  String? get name;
  @override
  @JsonKey(ignore: true)
  _$$UnivInfoImplCopyWith<_$UnivInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
