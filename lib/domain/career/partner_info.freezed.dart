// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'partner_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PartnerInfo {
  String? get picture => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PartnerInfoCopyWith<PartnerInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PartnerInfoCopyWith<$Res> {
  factory $PartnerInfoCopyWith(
          PartnerInfo value, $Res Function(PartnerInfo) then) =
      _$PartnerInfoCopyWithImpl<$Res, PartnerInfo>;
  @useResult
  $Res call({String? picture, String? description});
}

/// @nodoc
class _$PartnerInfoCopyWithImpl<$Res, $Val extends PartnerInfo>
    implements $PartnerInfoCopyWith<$Res> {
  _$PartnerInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? picture = freezed,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      picture: freezed == picture
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PartnerInfoImplCopyWith<$Res>
    implements $PartnerInfoCopyWith<$Res> {
  factory _$$PartnerInfoImplCopyWith(
          _$PartnerInfoImpl value, $Res Function(_$PartnerInfoImpl) then) =
      __$$PartnerInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? picture, String? description});
}

/// @nodoc
class __$$PartnerInfoImplCopyWithImpl<$Res>
    extends _$PartnerInfoCopyWithImpl<$Res, _$PartnerInfoImpl>
    implements _$$PartnerInfoImplCopyWith<$Res> {
  __$$PartnerInfoImplCopyWithImpl(
      _$PartnerInfoImpl _value, $Res Function(_$PartnerInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? picture = freezed,
    Object? description = freezed,
  }) {
    return _then(_$PartnerInfoImpl(
      picture: freezed == picture
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$PartnerInfoImpl implements _PartnerInfo {
  _$PartnerInfoImpl({this.picture, this.description});

  @override
  final String? picture;
  @override
  final String? description;

  @override
  String toString() {
    return 'PartnerInfo(picture: $picture, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PartnerInfoImpl &&
            (identical(other.picture, picture) || other.picture == picture) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @override
  int get hashCode => Object.hash(runtimeType, picture, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PartnerInfoImplCopyWith<_$PartnerInfoImpl> get copyWith =>
      __$$PartnerInfoImplCopyWithImpl<_$PartnerInfoImpl>(this, _$identity);
}

abstract class _PartnerInfo implements PartnerInfo {
  factory _PartnerInfo({final String? picture, final String? description}) =
      _$PartnerInfoImpl;

  @override
  String? get picture;
  @override
  String? get description;
  @override
  @JsonKey(ignore: true)
  _$$PartnerInfoImplCopyWith<_$PartnerInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
