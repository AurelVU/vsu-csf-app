// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'group_leader_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GroupLeaderDto _$GroupLeaderDtoFromJson(Map<String, dynamic> json) {
  return _GroupLeaderDto.fromJson(json);
}

/// @nodoc
mixin _$GroupLeaderDto {
  String? get email => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  @JsonKey(name: 'first_name')
  String? get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_name')
  String? get lastName => throw _privateConstructorUsedError;
  @JsonKey(name: 'middlename')
  String? get middleName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GroupLeaderDtoCopyWith<GroupLeaderDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroupLeaderDtoCopyWith<$Res> {
  factory $GroupLeaderDtoCopyWith(
          GroupLeaderDto value, $Res Function(GroupLeaderDto) then) =
      _$GroupLeaderDtoCopyWithImpl<$Res, GroupLeaderDto>;
  @useResult
  $Res call(
      {String? email,
      String? phone,
      @JsonKey(name: 'first_name') String? firstName,
      @JsonKey(name: 'last_name') String? lastName,
      @JsonKey(name: 'middlename') String? middleName});
}

/// @nodoc
class _$GroupLeaderDtoCopyWithImpl<$Res, $Val extends GroupLeaderDto>
    implements $GroupLeaderDtoCopyWith<$Res> {
  _$GroupLeaderDtoCopyWithImpl(this._value, this._then);

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
abstract class _$$GroupLeaderDtoImplCopyWith<$Res>
    implements $GroupLeaderDtoCopyWith<$Res> {
  factory _$$GroupLeaderDtoImplCopyWith(_$GroupLeaderDtoImpl value,
          $Res Function(_$GroupLeaderDtoImpl) then) =
      __$$GroupLeaderDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? email,
      String? phone,
      @JsonKey(name: 'first_name') String? firstName,
      @JsonKey(name: 'last_name') String? lastName,
      @JsonKey(name: 'middlename') String? middleName});
}

/// @nodoc
class __$$GroupLeaderDtoImplCopyWithImpl<$Res>
    extends _$GroupLeaderDtoCopyWithImpl<$Res, _$GroupLeaderDtoImpl>
    implements _$$GroupLeaderDtoImplCopyWith<$Res> {
  __$$GroupLeaderDtoImplCopyWithImpl(
      _$GroupLeaderDtoImpl _value, $Res Function(_$GroupLeaderDtoImpl) _then)
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
    return _then(_$GroupLeaderDtoImpl(
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
@JsonSerializable()
class _$GroupLeaderDtoImpl implements _GroupLeaderDto {
  const _$GroupLeaderDtoImpl(
      {this.email,
      this.phone,
      @JsonKey(name: 'first_name') this.firstName,
      @JsonKey(name: 'last_name') this.lastName,
      @JsonKey(name: 'middlename') this.middleName});

  factory _$GroupLeaderDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$GroupLeaderDtoImplFromJson(json);

  @override
  final String? email;
  @override
  final String? phone;
  @override
  @JsonKey(name: 'first_name')
  final String? firstName;
  @override
  @JsonKey(name: 'last_name')
  final String? lastName;
  @override
  @JsonKey(name: 'middlename')
  final String? middleName;

  @override
  String toString() {
    return 'GroupLeaderDto(email: $email, phone: $phone, firstName: $firstName, lastName: $lastName, middleName: $middleName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GroupLeaderDtoImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.middleName, middleName) ||
                other.middleName == middleName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, email, phone, firstName, lastName, middleName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GroupLeaderDtoImplCopyWith<_$GroupLeaderDtoImpl> get copyWith =>
      __$$GroupLeaderDtoImplCopyWithImpl<_$GroupLeaderDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GroupLeaderDtoImplToJson(
      this,
    );
  }
}

abstract class _GroupLeaderDto implements GroupLeaderDto {
  const factory _GroupLeaderDto(
          {final String? email,
          final String? phone,
          @JsonKey(name: 'first_name') final String? firstName,
          @JsonKey(name: 'last_name') final String? lastName,
          @JsonKey(name: 'middlename') final String? middleName}) =
      _$GroupLeaderDtoImpl;

  factory _GroupLeaderDto.fromJson(Map<String, dynamic> json) =
      _$GroupLeaderDtoImpl.fromJson;

  @override
  String? get email;
  @override
  String? get phone;
  @override
  @JsonKey(name: 'first_name')
  String? get firstName;
  @override
  @JsonKey(name: 'last_name')
  String? get lastName;
  @override
  @JsonKey(name: 'middlename')
  String? get middleName;
  @override
  @JsonKey(ignore: true)
  _$$GroupLeaderDtoImplCopyWith<_$GroupLeaderDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
