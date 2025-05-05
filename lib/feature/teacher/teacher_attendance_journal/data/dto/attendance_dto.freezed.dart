// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attendance_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AttendanceDto _$AttendanceDtoFromJson(Map<String, dynamic> json) {
  return _AttendanceDto.fromJson(json);
}

/// @nodoc
mixin _$AttendanceDto {
  @JsonKey(name: 'student_id')
  String? get studentId => throw _privateConstructorUsedError;
  String? get date => throw _privateConstructorUsedError;
  @JsonKey(name: 'lesson_number')
  int? get lessonNumber => throw _privateConstructorUsedError;
  String? get attended => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AttendanceDtoCopyWith<AttendanceDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttendanceDtoCopyWith<$Res> {
  factory $AttendanceDtoCopyWith(
          AttendanceDto value, $Res Function(AttendanceDto) then) =
      _$AttendanceDtoCopyWithImpl<$Res, AttendanceDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'student_id') String? studentId,
      String? date,
      @JsonKey(name: 'lesson_number') int? lessonNumber,
      String? attended});
}

/// @nodoc
class _$AttendanceDtoCopyWithImpl<$Res, $Val extends AttendanceDto>
    implements $AttendanceDtoCopyWith<$Res> {
  _$AttendanceDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? studentId = freezed,
    Object? date = freezed,
    Object? lessonNumber = freezed,
    Object? attended = freezed,
  }) {
    return _then(_value.copyWith(
      studentId: freezed == studentId
          ? _value.studentId
          : studentId // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      lessonNumber: freezed == lessonNumber
          ? _value.lessonNumber
          : lessonNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      attended: freezed == attended
          ? _value.attended
          : attended // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AttendanceDtoImplCopyWith<$Res>
    implements $AttendanceDtoCopyWith<$Res> {
  factory _$$AttendanceDtoImplCopyWith(
          _$AttendanceDtoImpl value, $Res Function(_$AttendanceDtoImpl) then) =
      __$$AttendanceDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'student_id') String? studentId,
      String? date,
      @JsonKey(name: 'lesson_number') int? lessonNumber,
      String? attended});
}

/// @nodoc
class __$$AttendanceDtoImplCopyWithImpl<$Res>
    extends _$AttendanceDtoCopyWithImpl<$Res, _$AttendanceDtoImpl>
    implements _$$AttendanceDtoImplCopyWith<$Res> {
  __$$AttendanceDtoImplCopyWithImpl(
      _$AttendanceDtoImpl _value, $Res Function(_$AttendanceDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? studentId = freezed,
    Object? date = freezed,
    Object? lessonNumber = freezed,
    Object? attended = freezed,
  }) {
    return _then(_$AttendanceDtoImpl(
      studentId: freezed == studentId
          ? _value.studentId
          : studentId // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      lessonNumber: freezed == lessonNumber
          ? _value.lessonNumber
          : lessonNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      attended: freezed == attended
          ? _value.attended
          : attended // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AttendanceDtoImpl implements _AttendanceDto {
  const _$AttendanceDtoImpl(
      {@JsonKey(name: 'student_id') this.studentId,
      this.date,
      @JsonKey(name: 'lesson_number') this.lessonNumber,
      this.attended});

  factory _$AttendanceDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$AttendanceDtoImplFromJson(json);

  @override
  @JsonKey(name: 'student_id')
  final String? studentId;
  @override
  final String? date;
  @override
  @JsonKey(name: 'lesson_number')
  final int? lessonNumber;
  @override
  final String? attended;

  @override
  String toString() {
    return 'AttendanceDto(studentId: $studentId, date: $date, lessonNumber: $lessonNumber, attended: $attended)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AttendanceDtoImpl &&
            (identical(other.studentId, studentId) ||
                other.studentId == studentId) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.lessonNumber, lessonNumber) ||
                other.lessonNumber == lessonNumber) &&
            (identical(other.attended, attended) ||
                other.attended == attended));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, studentId, date, lessonNumber, attended);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AttendanceDtoImplCopyWith<_$AttendanceDtoImpl> get copyWith =>
      __$$AttendanceDtoImplCopyWithImpl<_$AttendanceDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AttendanceDtoImplToJson(
      this,
    );
  }
}

abstract class _AttendanceDto implements AttendanceDto {
  const factory _AttendanceDto(
      {@JsonKey(name: 'student_id') final String? studentId,
      final String? date,
      @JsonKey(name: 'lesson_number') final int? lessonNumber,
      final String? attended}) = _$AttendanceDtoImpl;

  factory _AttendanceDto.fromJson(Map<String, dynamic> json) =
      _$AttendanceDtoImpl.fromJson;

  @override
  @JsonKey(name: 'student_id')
  String? get studentId;
  @override
  String? get date;
  @override
  @JsonKey(name: 'lesson_number')
  int? get lessonNumber;
  @override
  String? get attended;
  @override
  @JsonKey(ignore: true)
  _$$AttendanceDtoImplCopyWith<_$AttendanceDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
