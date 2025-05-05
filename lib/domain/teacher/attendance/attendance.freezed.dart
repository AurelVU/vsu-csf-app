// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attendance.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Attendance _$AttendanceFromJson(Map<String, dynamic> json) {
  return _Attendance.fromJson(json);
}

/// @nodoc
mixin _$Attendance {
  String? get studentId => throw _privateConstructorUsedError;
  String? get date => throw _privateConstructorUsedError;
  int? get lessonNumber => throw _privateConstructorUsedError;
  String? get attended => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AttendanceCopyWith<Attendance> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttendanceCopyWith<$Res> {
  factory $AttendanceCopyWith(
          Attendance value, $Res Function(Attendance) then) =
      _$AttendanceCopyWithImpl<$Res, Attendance>;
  @useResult
  $Res call(
      {String? studentId, String? date, int? lessonNumber, String? attended});
}

/// @nodoc
class _$AttendanceCopyWithImpl<$Res, $Val extends Attendance>
    implements $AttendanceCopyWith<$Res> {
  _$AttendanceCopyWithImpl(this._value, this._then);

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
abstract class _$$AttendanceImplCopyWith<$Res>
    implements $AttendanceCopyWith<$Res> {
  factory _$$AttendanceImplCopyWith(
          _$AttendanceImpl value, $Res Function(_$AttendanceImpl) then) =
      __$$AttendanceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? studentId, String? date, int? lessonNumber, String? attended});
}

/// @nodoc
class __$$AttendanceImplCopyWithImpl<$Res>
    extends _$AttendanceCopyWithImpl<$Res, _$AttendanceImpl>
    implements _$$AttendanceImplCopyWith<$Res> {
  __$$AttendanceImplCopyWithImpl(
      _$AttendanceImpl _value, $Res Function(_$AttendanceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? studentId = freezed,
    Object? date = freezed,
    Object? lessonNumber = freezed,
    Object? attended = freezed,
  }) {
    return _then(_$AttendanceImpl(
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

@JsonSerializable(includeIfNull: false, fieldRename: FieldRename.snake)
class _$AttendanceImpl implements _Attendance {
  _$AttendanceImpl(
      {this.studentId, this.date, this.lessonNumber, this.attended});

  factory _$AttendanceImpl.fromJson(Map<String, dynamic> json) =>
      _$$AttendanceImplFromJson(json);

  @override
  final String? studentId;
  @override
  final String? date;
  @override
  final int? lessonNumber;
  @override
  final String? attended;

  @override
  String toString() {
    return 'Attendance(studentId: $studentId, date: $date, lessonNumber: $lessonNumber, attended: $attended)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AttendanceImpl &&
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
  _$$AttendanceImplCopyWith<_$AttendanceImpl> get copyWith =>
      __$$AttendanceImplCopyWithImpl<_$AttendanceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AttendanceImplToJson(
      this,
    );
  }
}

abstract class _Attendance implements Attendance {
  factory _Attendance(
      {final String? studentId,
      final String? date,
      final int? lessonNumber,
      final String? attended}) = _$AttendanceImpl;

  factory _Attendance.fromJson(Map<String, dynamic> json) =
      _$AttendanceImpl.fromJson;

  @override
  String? get studentId;
  @override
  String? get date;
  @override
  int? get lessonNumber;
  @override
  String? get attended;
  @override
  @JsonKey(ignore: true)
  _$$AttendanceImplCopyWith<_$AttendanceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
