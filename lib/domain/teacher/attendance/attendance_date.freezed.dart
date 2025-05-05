// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attendance_date.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AttendanceDate {
  String? get date => throw _privateConstructorUsedError;
  int? get lessonNumber => throw _privateConstructorUsedError;
  int? get lessonId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AttendanceDateCopyWith<AttendanceDate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttendanceDateCopyWith<$Res> {
  factory $AttendanceDateCopyWith(
          AttendanceDate value, $Res Function(AttendanceDate) then) =
      _$AttendanceDateCopyWithImpl<$Res, AttendanceDate>;
  @useResult
  $Res call({String? date, int? lessonNumber, int? lessonId});
}

/// @nodoc
class _$AttendanceDateCopyWithImpl<$Res, $Val extends AttendanceDate>
    implements $AttendanceDateCopyWith<$Res> {
  _$AttendanceDateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = freezed,
    Object? lessonNumber = freezed,
    Object? lessonId = freezed,
  }) {
    return _then(_value.copyWith(
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      lessonNumber: freezed == lessonNumber
          ? _value.lessonNumber
          : lessonNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      lessonId: freezed == lessonId
          ? _value.lessonId
          : lessonId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AttendanceDateImplCopyWith<$Res>
    implements $AttendanceDateCopyWith<$Res> {
  factory _$$AttendanceDateImplCopyWith(_$AttendanceDateImpl value,
          $Res Function(_$AttendanceDateImpl) then) =
      __$$AttendanceDateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? date, int? lessonNumber, int? lessonId});
}

/// @nodoc
class __$$AttendanceDateImplCopyWithImpl<$Res>
    extends _$AttendanceDateCopyWithImpl<$Res, _$AttendanceDateImpl>
    implements _$$AttendanceDateImplCopyWith<$Res> {
  __$$AttendanceDateImplCopyWithImpl(
      _$AttendanceDateImpl _value, $Res Function(_$AttendanceDateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = freezed,
    Object? lessonNumber = freezed,
    Object? lessonId = freezed,
  }) {
    return _then(_$AttendanceDateImpl(
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      lessonNumber: freezed == lessonNumber
          ? _value.lessonNumber
          : lessonNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      lessonId: freezed == lessonId
          ? _value.lessonId
          : lessonId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$AttendanceDateImpl implements _AttendanceDate {
  _$AttendanceDateImpl({this.date, this.lessonNumber, this.lessonId});

  @override
  final String? date;
  @override
  final int? lessonNumber;
  @override
  final int? lessonId;

  @override
  String toString() {
    return 'AttendanceDate(date: $date, lessonNumber: $lessonNumber, lessonId: $lessonId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AttendanceDateImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.lessonNumber, lessonNumber) ||
                other.lessonNumber == lessonNumber) &&
            (identical(other.lessonId, lessonId) ||
                other.lessonId == lessonId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, date, lessonNumber, lessonId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AttendanceDateImplCopyWith<_$AttendanceDateImpl> get copyWith =>
      __$$AttendanceDateImplCopyWithImpl<_$AttendanceDateImpl>(
          this, _$identity);
}

abstract class _AttendanceDate implements AttendanceDate {
  factory _AttendanceDate(
      {final String? date,
      final int? lessonNumber,
      final int? lessonId}) = _$AttendanceDateImpl;

  @override
  String? get date;
  @override
  int? get lessonNumber;
  @override
  int? get lessonId;
  @override
  @JsonKey(ignore: true)
  _$$AttendanceDateImplCopyWith<_$AttendanceDateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
