// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'group_leader.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GroupLeader {
  String? get email => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get firstName => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;
  String? get middleName => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GroupLeaderCopyWith<GroupLeader> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroupLeaderCopyWith<$Res> {
  factory $GroupLeaderCopyWith(
          GroupLeader value, $Res Function(GroupLeader) then) =
      _$GroupLeaderCopyWithImpl<$Res, GroupLeader>;
  @useResult
  $Res call(
      {String? email,
      String? phone,
      String? firstName,
      String? lastName,
      String? middleName});
}

/// @nodoc
class _$GroupLeaderCopyWithImpl<$Res, $Val extends GroupLeader>
    implements $GroupLeaderCopyWith<$Res> {
  _$GroupLeaderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = freezed,
    Object? phone = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? middleName = freezed,
  }) {
    return _then(_value.copyWith(
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      middleName: freezed == middleName
          ? _value.middleName
          : middleName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GroupLeaderImplCopyWith<$Res>
    implements $GroupLeaderCopyWith<$Res> {
  factory _$$GroupLeaderImplCopyWith(
          _$GroupLeaderImpl value, $Res Function(_$GroupLeaderImpl) then) =
      __$$GroupLeaderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? email,
      String? phone,
      String? firstName,
      String? lastName,
      String? middleName});
}

/// @nodoc
class __$$GroupLeaderImplCopyWithImpl<$Res>
    extends _$GroupLeaderCopyWithImpl<$Res, _$GroupLeaderImpl>
    implements _$$GroupLeaderImplCopyWith<$Res> {
  __$$GroupLeaderImplCopyWithImpl(
      _$GroupLeaderImpl _value, $Res Function(_$GroupLeaderImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = freezed,
    Object? phone = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? middleName = freezed,
  }) {
    return _then(_$GroupLeaderImpl(
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      middleName: freezed == middleName
          ? _value.middleName
          : middleName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$GroupLeaderImpl implements _GroupLeader {
  _$GroupLeaderImpl(
      {this.email, this.phone, this.firstName, this.lastName, this.middleName});

  @override
  final String? email;
  @override
  final String? phone;
  @override
  final String? firstName;
  @override
  final String? lastName;
  @override
  final String? middleName;

  @override
  String toString() {
    return 'GroupLeader(email: $email, phone: $phone, firstName: $firstName, lastName: $lastName, middleName: $middleName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GroupLeaderImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.middleName, middleName) ||
                other.middleName == middleName));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, email, phone, firstName, lastName, middleName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GroupLeaderImplCopyWith<_$GroupLeaderImpl> get copyWith =>
      __$$GroupLeaderImplCopyWithImpl<_$GroupLeaderImpl>(this, _$identity);
}

abstract class _GroupLeader implements GroupLeader {
  factory _GroupLeader(
      {final String? email,
      final String? phone,
      final String? firstName,
      final String? lastName,
      final String? middleName}) = _$GroupLeaderImpl;

  @override
  String? get email;
  @override
  String? get phone;
  @override
  String? get firstName;
  @override
  String? get lastName;
  @override
  String? get middleName;
  @override
  @JsonKey(ignore: true)
  _$$GroupLeaderImplCopyWith<_$GroupLeaderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
