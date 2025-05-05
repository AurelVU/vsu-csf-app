// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attendance_journal_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AttendanceJournalDto _$AttendanceJournalDtoFromJson(Map<String, dynamic> json) {
  return _AttendanceJournalDto.fromJson(json);
}

/// @nodoc
mixin _$AttendanceJournalDto {
  List<AttendanceStudentDto>? get students =>
      throw _privateConstructorUsedError;
  List<AttendanceDateDto>? get dates => throw _privateConstructorUsedError;
  List<AttendanceDto>? get attendances => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AttendanceJournalDtoCopyWith<AttendanceJournalDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttendanceJournalDtoCopyWith<$Res> {
  factory $AttendanceJournalDtoCopyWith(AttendanceJournalDto value,
          $Res Function(AttendanceJournalDto) then) =
      _$AttendanceJournalDtoCopyWithImpl<$Res, AttendanceJournalDto>;
  @useResult
  $Res call(
      {List<AttendanceStudentDto>? students,
      List<AttendanceDateDto>? dates,
      List<AttendanceDto>? attendances});
}

/// @nodoc
class _$AttendanceJournalDtoCopyWithImpl<$Res,
        $Val extends AttendanceJournalDto>
    implements $AttendanceJournalDtoCopyWith<$Res> {
  _$AttendanceJournalDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? students = freezed,
    Object? dates = freezed,
    Object? attendances = freezed,
  }) {
    return _then(_value.copyWith(
      students: freezed == students
          ? _value.students
          : students // ignore: cast_nullable_to_non_nullable
              as List<AttendanceStudentDto>?,
      dates: freezed == dates
          ? _value.dates
          : dates // ignore: cast_nullable_to_non_nullable
              as List<AttendanceDateDto>?,
      attendances: freezed == attendances
          ? _value.attendances
          : attendances // ignore: cast_nullable_to_non_nullable
              as List<AttendanceDto>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AttendanceJournalDtoImplCopyWith<$Res>
    implements $AttendanceJournalDtoCopyWith<$Res> {
  factory _$$AttendanceJournalDtoImplCopyWith(_$AttendanceJournalDtoImpl value,
          $Res Function(_$AttendanceJournalDtoImpl) then) =
      __$$AttendanceJournalDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<AttendanceStudentDto>? students,
      List<AttendanceDateDto>? dates,
      List<AttendanceDto>? attendances});
}

/// @nodoc
class __$$AttendanceJournalDtoImplCopyWithImpl<$Res>
    extends _$AttendanceJournalDtoCopyWithImpl<$Res, _$AttendanceJournalDtoImpl>
    implements _$$AttendanceJournalDtoImplCopyWith<$Res> {
  __$$AttendanceJournalDtoImplCopyWithImpl(_$AttendanceJournalDtoImpl _value,
      $Res Function(_$AttendanceJournalDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? students = freezed,
    Object? dates = freezed,
    Object? attendances = freezed,
  }) {
    return _then(_$AttendanceJournalDtoImpl(
      students: freezed == students
          ? _value._students
          : students // ignore: cast_nullable_to_non_nullable
              as List<AttendanceStudentDto>?,
      dates: freezed == dates
          ? _value._dates
          : dates // ignore: cast_nullable_to_non_nullable
              as List<AttendanceDateDto>?,
      attendances: freezed == attendances
          ? _value._attendances
          : attendances // ignore: cast_nullable_to_non_nullable
              as List<AttendanceDto>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AttendanceJournalDtoImpl implements _AttendanceJournalDto {
  const _$AttendanceJournalDtoImpl(
      {final List<AttendanceStudentDto>? students,
      final List<AttendanceDateDto>? dates,
      final List<AttendanceDto>? attendances})
      : _students = students,
        _dates = dates,
        _attendances = attendances;

  factory _$AttendanceJournalDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$AttendanceJournalDtoImplFromJson(json);

  final List<AttendanceStudentDto>? _students;
  @override
  List<AttendanceStudentDto>? get students {
    final value = _students;
    if (value == null) return null;
    if (_students is EqualUnmodifiableListView) return _students;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<AttendanceDateDto>? _dates;
  @override
  List<AttendanceDateDto>? get dates {
    final value = _dates;
    if (value == null) return null;
    if (_dates is EqualUnmodifiableListView) return _dates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<AttendanceDto>? _attendances;
  @override
  List<AttendanceDto>? get attendances {
    final value = _attendances;
    if (value == null) return null;
    if (_attendances is EqualUnmodifiableListView) return _attendances;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'AttendanceJournalDto(students: $students, dates: $dates, attendances: $attendances)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AttendanceJournalDtoImpl &&
            const DeepCollectionEquality().equals(other._students, _students) &&
            const DeepCollectionEquality().equals(other._dates, _dates) &&
            const DeepCollectionEquality()
                .equals(other._attendances, _attendances));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_students),
      const DeepCollectionEquality().hash(_dates),
      const DeepCollectionEquality().hash(_attendances));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AttendanceJournalDtoImplCopyWith<_$AttendanceJournalDtoImpl>
      get copyWith =>
          __$$AttendanceJournalDtoImplCopyWithImpl<_$AttendanceJournalDtoImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AttendanceJournalDtoImplToJson(
      this,
    );
  }
}

abstract class _AttendanceJournalDto implements AttendanceJournalDto {
  const factory _AttendanceJournalDto(
      {final List<AttendanceStudentDto>? students,
      final List<AttendanceDateDto>? dates,
      final List<AttendanceDto>? attendances}) = _$AttendanceJournalDtoImpl;

  factory _AttendanceJournalDto.fromJson(Map<String, dynamic> json) =
      _$AttendanceJournalDtoImpl.fromJson;

  @override
  List<AttendanceStudentDto>? get students;
  @override
  List<AttendanceDateDto>? get dates;
  @override
  List<AttendanceDto>? get attendances;
  @override
  @JsonKey(ignore: true)
  _$$AttendanceJournalDtoImplCopyWith<_$AttendanceJournalDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
