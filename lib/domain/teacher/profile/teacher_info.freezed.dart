// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'teacher_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TeacherInfo {
  String? get firstName => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;
  String? get middlename => throw _privateConstructorUsedError;
  String? get rank => throw _privateConstructorUsedError;
  String? get departmentName => throw _privateConstructorUsedError;
  String? get faculty => throw _privateConstructorUsedError;
  bool? get acceptPolitic => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TeacherInfoCopyWith<TeacherInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TeacherInfoCopyWith<$Res> {
  factory $TeacherInfoCopyWith(
          TeacherInfo value, $Res Function(TeacherInfo) then) =
      _$TeacherInfoCopyWithImpl<$Res, TeacherInfo>;
  @useResult
  $Res call(
      {String? firstName,
      String? lastName,
      String? middlename,
      String? rank,
      String? departmentName,
      String? faculty,
      bool? acceptPolitic});
}

/// @nodoc
class _$TeacherInfoCopyWithImpl<$Res, $Val extends TeacherInfo>
    implements $TeacherInfoCopyWith<$Res> {
  _$TeacherInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? middlename = freezed,
    Object? rank = freezed,
    Object? departmentName = freezed,
    Object? faculty = freezed,
    Object? acceptPolitic = freezed,
  }) {
    return _then(_value.copyWith(
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      middlename: freezed == middlename
          ? _value.middlename
          : middlename // ignore: cast_nullable_to_non_nullable
              as String?,
      rank: freezed == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as String?,
      departmentName: freezed == departmentName
          ? _value.departmentName
          : departmentName // ignore: cast_nullable_to_non_nullable
              as String?,
      faculty: freezed == faculty
          ? _value.faculty
          : faculty // ignore: cast_nullable_to_non_nullable
              as String?,
      acceptPolitic: freezed == acceptPolitic
          ? _value.acceptPolitic
          : acceptPolitic // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TeacherInfoImplCopyWith<$Res>
    implements $TeacherInfoCopyWith<$Res> {
  factory _$$TeacherInfoImplCopyWith(
          _$TeacherInfoImpl value, $Res Function(_$TeacherInfoImpl) then) =
      __$$TeacherInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? firstName,
      String? lastName,
      String? middlename,
      String? rank,
      String? departmentName,
      String? faculty,
      bool? acceptPolitic});
}

/// @nodoc
class __$$TeacherInfoImplCopyWithImpl<$Res>
    extends _$TeacherInfoCopyWithImpl<$Res, _$TeacherInfoImpl>
    implements _$$TeacherInfoImplCopyWith<$Res> {
  __$$TeacherInfoImplCopyWithImpl(
      _$TeacherInfoImpl _value, $Res Function(_$TeacherInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? middlename = freezed,
    Object? rank = freezed,
    Object? departmentName = freezed,
    Object? faculty = freezed,
    Object? acceptPolitic = freezed,
  }) {
    return _then(_$TeacherInfoImpl(
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      middlename: freezed == middlename
          ? _value.middlename
          : middlename // ignore: cast_nullable_to_non_nullable
              as String?,
      rank: freezed == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as String?,
      departmentName: freezed == departmentName
          ? _value.departmentName
          : departmentName // ignore: cast_nullable_to_non_nullable
              as String?,
      faculty: freezed == faculty
          ? _value.faculty
          : faculty // ignore: cast_nullable_to_non_nullable
              as String?,
      acceptPolitic: freezed == acceptPolitic
          ? _value.acceptPolitic
          : acceptPolitic // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$TeacherInfoImpl implements _TeacherInfo {
  _$TeacherInfoImpl(
      {this.firstName,
      this.lastName,
      this.middlename,
      this.rank,
      this.departmentName,
      this.faculty,
      this.acceptPolitic});

  @override
  final String? firstName;
  @override
  final String? lastName;
  @override
  final String? middlename;
  @override
  final String? rank;
  @override
  final String? departmentName;
  @override
  final String? faculty;
  @override
  final bool? acceptPolitic;

  @override
  String toString() {
    return 'TeacherInfo(firstName: $firstName, lastName: $lastName, middlename: $middlename, rank: $rank, departmentName: $departmentName, faculty: $faculty, acceptPolitic: $acceptPolitic)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TeacherInfoImpl &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.middlename, middlename) ||
                other.middlename == middlename) &&
            (identical(other.rank, rank) || other.rank == rank) &&
            (identical(other.departmentName, departmentName) ||
                other.departmentName == departmentName) &&
            (identical(other.faculty, faculty) || other.faculty == faculty) &&
            (identical(other.acceptPolitic, acceptPolitic) ||
                other.acceptPolitic == acceptPolitic));
  }

  @override
  int get hashCode => Object.hash(runtimeType, firstName, lastName, middlename,
      rank, departmentName, faculty, acceptPolitic);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TeacherInfoImplCopyWith<_$TeacherInfoImpl> get copyWith =>
      __$$TeacherInfoImplCopyWithImpl<_$TeacherInfoImpl>(this, _$identity);
}

abstract class _TeacherInfo implements TeacherInfo {
  factory _TeacherInfo(
      {final String? firstName,
      final String? lastName,
      final String? middlename,
      final String? rank,
      final String? departmentName,
      final String? faculty,
      final bool? acceptPolitic}) = _$TeacherInfoImpl;

  @override
  String? get firstName;
  @override
  String? get lastName;
  @override
  String? get middlename;
  @override
  String? get rank;
  @override
  String? get departmentName;
  @override
  String? get faculty;
  @override
  bool? get acceptPolitic;
  @override
  @JsonKey(ignore: true)
  _$$TeacherInfoImplCopyWith<_$TeacherInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
