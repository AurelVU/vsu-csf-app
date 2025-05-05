// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attendance_student.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AttendanceStudent _$AttendanceStudentFromJson(Map<String, dynamic> json) {
  return _AttendanceStudent.fromJson(json);
}

/// @nodoc
mixin _$AttendanceStudent {
  String? get id => throw _privateConstructorUsedError;
  String? get firstName => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;
  String? get middleName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AttendanceStudentCopyWith<AttendanceStudent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttendanceStudentCopyWith<$Res> {
  factory $AttendanceStudentCopyWith(
          AttendanceStudent value, $Res Function(AttendanceStudent) then) =
      _$AttendanceStudentCopyWithImpl<$Res, AttendanceStudent>;
  @useResult
  $Res call(
      {String? id, String? firstName, String? lastName, String? middleName});
}

/// @nodoc
class _$AttendanceStudentCopyWithImpl<$Res, $Val extends AttendanceStudent>
    implements $AttendanceStudentCopyWith<$Res> {
  _$AttendanceStudentCopyWithImpl(this._value, this._then);

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
abstract class _$$AttendanceStudentImplCopyWith<$Res>
    implements $AttendanceStudentCopyWith<$Res> {
  factory _$$AttendanceStudentImplCopyWith(_$AttendanceStudentImpl value,
          $Res Function(_$AttendanceStudentImpl) then) =
      __$$AttendanceStudentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id, String? firstName, String? lastName, String? middleName});
}

/// @nodoc
class __$$AttendanceStudentImplCopyWithImpl<$Res>
    extends _$AttendanceStudentCopyWithImpl<$Res, _$AttendanceStudentImpl>
    implements _$$AttendanceStudentImplCopyWith<$Res> {
  __$$AttendanceStudentImplCopyWithImpl(_$AttendanceStudentImpl _value,
      $Res Function(_$AttendanceStudentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? middleName = freezed,
  }) {
    return _then(_$AttendanceStudentImpl(
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

@JsonSerializable(includeIfNull: false, fieldRename: FieldRename.snake)
class _$AttendanceStudentImpl implements _AttendanceStudent {
  _$AttendanceStudentImpl(
      {this.id, this.firstName, this.lastName, this.middleName});

  factory _$AttendanceStudentImpl.fromJson(Map<String, dynamic> json) =>
      _$$AttendanceStudentImplFromJson(json);

  @override
  final String? id;
  @override
  final String? firstName;
  @override
  final String? lastName;
  @override
  final String? middleName;

  @override
  String toString() {
    return 'AttendanceStudent(id: $id, firstName: $firstName, lastName: $lastName, middleName: $middleName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AttendanceStudentImpl &&
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
  _$$AttendanceStudentImplCopyWith<_$AttendanceStudentImpl> get copyWith =>
      __$$AttendanceStudentImplCopyWithImpl<_$AttendanceStudentImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AttendanceStudentImplToJson(
      this,
    );
  }
}

abstract class _AttendanceStudent implements AttendanceStudent {
  factory _AttendanceStudent(
      {final String? id,
      final String? firstName,
      final String? lastName,
      final String? middleName}) = _$AttendanceStudentImpl;

  factory _AttendanceStudent.fromJson(Map<String, dynamic> json) =
      _$AttendanceStudentImpl.fromJson;

  @override
  String? get id;
  @override
  String? get firstName;
  @override
  String? get lastName;
  @override
  String? get middleName;
  @override
  @JsonKey(ignore: true)
  _$$AttendanceStudentImplCopyWith<_$AttendanceStudentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
