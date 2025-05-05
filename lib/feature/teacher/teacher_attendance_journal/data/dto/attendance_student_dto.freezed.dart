// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attendance_student_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AttendanceStudentDto _$AttendanceStudentDtoFromJson(Map<String, dynamic> json) {
  return _AttendanceStudentDto.fromJson(json);
}

/// @nodoc
mixin _$AttendanceStudentDto {
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'first_name')
  String? get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_name')
  String? get lastName => throw _privateConstructorUsedError;
  @JsonKey(name: 'middlename')
  String? get middleName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AttendanceStudentDtoCopyWith<AttendanceStudentDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttendanceStudentDtoCopyWith<$Res> {
  factory $AttendanceStudentDtoCopyWith(AttendanceStudentDto value,
          $Res Function(AttendanceStudentDto) then) =
      _$AttendanceStudentDtoCopyWithImpl<$Res, AttendanceStudentDto>;
  @useResult
  $Res call(
      {String? id,
      @JsonKey(name: 'first_name') String? firstName,
      @JsonKey(name: 'last_name') String? lastName,
      @JsonKey(name: 'middlename') String? middleName});
}

/// @nodoc
class _$AttendanceStudentDtoCopyWithImpl<$Res,
        $Val extends AttendanceStudentDto>
    implements $AttendanceStudentDtoCopyWith<$Res> {
  _$AttendanceStudentDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? middleName = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
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
abstract class _$$AttendanceStudentDtoImplCopyWith<$Res>
    implements $AttendanceStudentDtoCopyWith<$Res> {
  factory _$$AttendanceStudentDtoImplCopyWith(_$AttendanceStudentDtoImpl value,
          $Res Function(_$AttendanceStudentDtoImpl) then) =
      __$$AttendanceStudentDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      @JsonKey(name: 'first_name') String? firstName,
      @JsonKey(name: 'last_name') String? lastName,
      @JsonKey(name: 'middlename') String? middleName});
}

/// @nodoc
class __$$AttendanceStudentDtoImplCopyWithImpl<$Res>
    extends _$AttendanceStudentDtoCopyWithImpl<$Res, _$AttendanceStudentDtoImpl>
    implements _$$AttendanceStudentDtoImplCopyWith<$Res> {
  __$$AttendanceStudentDtoImplCopyWithImpl(_$AttendanceStudentDtoImpl _value,
      $Res Function(_$AttendanceStudentDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? middleName = freezed,
  }) {
    return _then(_$AttendanceStudentDtoImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
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
class _$AttendanceStudentDtoImpl implements _AttendanceStudentDto {
  const _$AttendanceStudentDtoImpl(
      {this.id,
      @JsonKey(name: 'first_name') this.firstName,
      @JsonKey(name: 'last_name') this.lastName,
      @JsonKey(name: 'middlename') this.middleName});

  factory _$AttendanceStudentDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$AttendanceStudentDtoImplFromJson(json);

  @override
  final String? id;
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
    return 'AttendanceStudentDto(id: $id, firstName: $firstName, lastName: $lastName, middleName: $middleName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AttendanceStudentDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
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
      Object.hash(runtimeType, id, firstName, lastName, middleName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AttendanceStudentDtoImplCopyWith<_$AttendanceStudentDtoImpl>
      get copyWith =>
          __$$AttendanceStudentDtoImplCopyWithImpl<_$AttendanceStudentDtoImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AttendanceStudentDtoImplToJson(
      this,
    );
  }
}

abstract class _AttendanceStudentDto implements AttendanceStudentDto {
  const factory _AttendanceStudentDto(
          {final String? id,
          @JsonKey(name: 'first_name') final String? firstName,
          @JsonKey(name: 'last_name') final String? lastName,
          @JsonKey(name: 'middlename') final String? middleName}) =
      _$AttendanceStudentDtoImpl;

  factory _AttendanceStudentDto.fromJson(Map<String, dynamic> json) =
      _$AttendanceStudentDtoImpl.fromJson;

  @override
  String? get id;
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
  _$$AttendanceStudentDtoImplCopyWith<_$AttendanceStudentDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
