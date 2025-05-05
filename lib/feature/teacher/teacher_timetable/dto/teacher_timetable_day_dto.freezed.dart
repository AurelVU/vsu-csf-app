// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'teacher_timetable_day_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TeacherTimetableDayDto _$TeacherTimetableDayDtoFromJson(
    Map<String, dynamic> json) {
  return _TeacherTimetableDayDto.fromJson(json);
}

/// @nodoc
mixin _$TeacherTimetableDayDto {
  @DatetimeJsonConverter()
  DateTime? get date => throw _privateConstructorUsedError;
  List<TeacherLessonDto>? get lessons => throw _privateConstructorUsedError;
  bool? get numerator => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TeacherTimetableDayDtoCopyWith<TeacherTimetableDayDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TeacherTimetableDayDtoCopyWith<$Res> {
  factory $TeacherTimetableDayDtoCopyWith(TeacherTimetableDayDto value,
          $Res Function(TeacherTimetableDayDto) then) =
      _$TeacherTimetableDayDtoCopyWithImpl<$Res, TeacherTimetableDayDto>;
  @useResult
  $Res call(
      {@DatetimeJsonConverter() DateTime? date,
      List<TeacherLessonDto>? lessons,
      bool? numerator});
}

/// @nodoc
class _$TeacherTimetableDayDtoCopyWithImpl<$Res,
        $Val extends TeacherTimetableDayDto>
    implements $TeacherTimetableDayDtoCopyWith<$Res> {
  _$TeacherTimetableDayDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = freezed,
    Object? lessons = freezed,
    Object? numerator = freezed,
  }) {
    return _then(_value.copyWith(
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lessons: freezed == lessons
          ? _value.lessons
          : lessons // ignore: cast_nullable_to_non_nullable
              as List<TeacherLessonDto>?,
      numerator: freezed == numerator
          ? _value.numerator
          : numerator // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TeacherTimetableDayDtoImplCopyWith<$Res>
    implements $TeacherTimetableDayDtoCopyWith<$Res> {
  factory _$$TeacherTimetableDayDtoImplCopyWith(
          _$TeacherTimetableDayDtoImpl value,
          $Res Function(_$TeacherTimetableDayDtoImpl) then) =
      __$$TeacherTimetableDayDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@DatetimeJsonConverter() DateTime? date,
      List<TeacherLessonDto>? lessons,
      bool? numerator});
}

/// @nodoc
class __$$TeacherTimetableDayDtoImplCopyWithImpl<$Res>
    extends _$TeacherTimetableDayDtoCopyWithImpl<$Res,
        _$TeacherTimetableDayDtoImpl>
    implements _$$TeacherTimetableDayDtoImplCopyWith<$Res> {
  __$$TeacherTimetableDayDtoImplCopyWithImpl(
      _$TeacherTimetableDayDtoImpl _value,
      $Res Function(_$TeacherTimetableDayDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = freezed,
    Object? lessons = freezed,
    Object? numerator = freezed,
  }) {
    return _then(_$TeacherTimetableDayDtoImpl(
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lessons: freezed == lessons
          ? _value._lessons
          : lessons // ignore: cast_nullable_to_non_nullable
              as List<TeacherLessonDto>?,
      numerator: freezed == numerator
          ? _value.numerator
          : numerator // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TeacherTimetableDayDtoImpl implements _TeacherTimetableDayDto {
  const _$TeacherTimetableDayDtoImpl(
      {@DatetimeJsonConverter() this.date,
      final List<TeacherLessonDto>? lessons,
      this.numerator})
      : _lessons = lessons;

  factory _$TeacherTimetableDayDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$TeacherTimetableDayDtoImplFromJson(json);

  @override
  @DatetimeJsonConverter()
  final DateTime? date;
  final List<TeacherLessonDto>? _lessons;
  @override
  List<TeacherLessonDto>? get lessons {
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
    return 'TeacherTimetableDayDto(date: $date, lessons: $lessons, numerator: $numerator)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TeacherTimetableDayDtoImpl &&
            (identical(other.date, date) || other.date == date) &&
            const DeepCollectionEquality().equals(other._lessons, _lessons) &&
            (identical(other.numerator, numerator) ||
                other.numerator == numerator));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, date,
      const DeepCollectionEquality().hash(_lessons), numerator);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TeacherTimetableDayDtoImplCopyWith<_$TeacherTimetableDayDtoImpl>
      get copyWith => __$$TeacherTimetableDayDtoImplCopyWithImpl<
          _$TeacherTimetableDayDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TeacherTimetableDayDtoImplToJson(
      this,
    );
  }
}

abstract class _TeacherTimetableDayDto implements TeacherTimetableDayDto {
  const factory _TeacherTimetableDayDto(
      {@DatetimeJsonConverter() final DateTime? date,
      final List<TeacherLessonDto>? lessons,
      final bool? numerator}) = _$TeacherTimetableDayDtoImpl;

  factory _TeacherTimetableDayDto.fromJson(Map<String, dynamic> json) =
      _$TeacherTimetableDayDtoImpl.fromJson;

  @override
  @DatetimeJsonConverter()
  DateTime? get date;
  @override
  List<TeacherLessonDto>? get lessons;
  @override
  bool? get numerator;
  @override
  @JsonKey(ignore: true)
  _$$TeacherTimetableDayDtoImplCopyWith<_$TeacherTimetableDayDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
