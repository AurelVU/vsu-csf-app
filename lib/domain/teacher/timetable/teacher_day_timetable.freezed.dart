// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'teacher_day_timetable.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TeacherDayTimetable {
  DateTime? get dateTimetable => throw _privateConstructorUsedError;
  List<TeacherLesson>? get lessons => throw _privateConstructorUsedError;
  bool? get numerator => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TeacherDayTimetableCopyWith<TeacherDayTimetable> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TeacherDayTimetableCopyWith<$Res> {
  factory $TeacherDayTimetableCopyWith(
          TeacherDayTimetable value, $Res Function(TeacherDayTimetable) then) =
      _$TeacherDayTimetableCopyWithImpl<$Res, TeacherDayTimetable>;
  @useResult
  $Res call(
      {DateTime? dateTimetable, List<TeacherLesson>? lessons, bool? numerator});
}

/// @nodoc
class _$TeacherDayTimetableCopyWithImpl<$Res, $Val extends TeacherDayTimetable>
    implements $TeacherDayTimetableCopyWith<$Res> {
  _$TeacherDayTimetableCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateTimetable = freezed,
    Object? lessons = freezed,
    Object? numerator = freezed,
  }) {
    return _then(_value.copyWith(
      dateTimetable: freezed == dateTimetable
          ? _value.dateTimetable
          : dateTimetable // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lessons: freezed == lessons
          ? _value.lessons
          : lessons // ignore: cast_nullable_to_non_nullable
              as List<TeacherLesson>?,
      numerator: freezed == numerator
          ? _value.numerator
          : numerator // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TeacherDayTimetableImplCopyWith<$Res>
    implements $TeacherDayTimetableCopyWith<$Res> {
  factory _$$TeacherDayTimetableImplCopyWith(_$TeacherDayTimetableImpl value,
          $Res Function(_$TeacherDayTimetableImpl) then) =
      __$$TeacherDayTimetableImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime? dateTimetable, List<TeacherLesson>? lessons, bool? numerator});
}

/// @nodoc
class __$$TeacherDayTimetableImplCopyWithImpl<$Res>
    extends _$TeacherDayTimetableCopyWithImpl<$Res, _$TeacherDayTimetableImpl>
    implements _$$TeacherDayTimetableImplCopyWith<$Res> {
  __$$TeacherDayTimetableImplCopyWithImpl(_$TeacherDayTimetableImpl _value,
      $Res Function(_$TeacherDayTimetableImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateTimetable = freezed,
    Object? lessons = freezed,
    Object? numerator = freezed,
  }) {
    return _then(_$TeacherDayTimetableImpl(
      dateTimetable: freezed == dateTimetable
          ? _value.dateTimetable
          : dateTimetable // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lessons: freezed == lessons
          ? _value._lessons
          : lessons // ignore: cast_nullable_to_non_nullable
              as List<TeacherLesson>?,
      numerator: freezed == numerator
          ? _value.numerator
          : numerator // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$TeacherDayTimetableImpl implements _TeacherDayTimetable {
  _$TeacherDayTimetableImpl(
      {this.dateTimetable, final List<TeacherLesson>? lessons, this.numerator})
      : _lessons = lessons;

  @override
  final DateTime? dateTimetable;
  final List<TeacherLesson>? _lessons;
  @override
  List<TeacherLesson>? get lessons {
    final value = _lessons;
    if (value == null) return null;
    if (_lessons is EqualUnmodifiableListView) return _lessons;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final bool? numerator;

  @override
  String toString() {
    return 'TeacherDayTimetable(dateTimetable: $dateTimetable, lessons: $lessons, numerator: $numerator)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TeacherDayTimetableImpl &&
            (identical(other.dateTimetable, dateTimetable) ||
                other.dateTimetable == dateTimetable) &&
            const DeepCollectionEquality().equals(other._lessons, _lessons) &&
            (identical(other.numerator, numerator) ||
                other.numerator == numerator));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dateTimetable,
      const DeepCollectionEquality().hash(_lessons), numerator);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TeacherDayTimetableImplCopyWith<_$TeacherDayTimetableImpl> get copyWith =>
      __$$TeacherDayTimetableImplCopyWithImpl<_$TeacherDayTimetableImpl>(
          this, _$identity);
}

abstract class _TeacherDayTimetable implements TeacherDayTimetable {
  factory _TeacherDayTimetable(
      {final DateTime? dateTimetable,
      final List<TeacherLesson>? lessons,
      final bool? numerator}) = _$TeacherDayTimetableImpl;

  @override
  DateTime? get dateTimetable;
  @override
  List<TeacherLesson>? get lessons;
  @override
  bool? get numerator;
  @override
  @JsonKey(ignore: true)
  _$$TeacherDayTimetableImplCopyWith<_$TeacherDayTimetableImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
