// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'teacher_timetable_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TeacherTimeTableDto _$TeacherTimeTableDtoFromJson(Map<String, dynamic> json) {
  return _TeacherTimeTableDto.fromJson(json);
}

/// @nodoc
mixin _$TeacherTimeTableDto {
  List<TeacherTimetableDayDto>? get days => throw _privateConstructorUsedError;
  bool? get numerator => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TeacherTimeTableDtoCopyWith<TeacherTimeTableDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TeacherTimeTableDtoCopyWith<$Res> {
  factory $TeacherTimeTableDtoCopyWith(
          TeacherTimeTableDto value, $Res Function(TeacherTimeTableDto) then) =
      _$TeacherTimeTableDtoCopyWithImpl<$Res, TeacherTimeTableDto>;
  @useResult
  $Res call({List<TeacherTimetableDayDto>? days, bool? numerator});
}

/// @nodoc
class _$TeacherTimeTableDtoCopyWithImpl<$Res, $Val extends TeacherTimeTableDto>
    implements $TeacherTimeTableDtoCopyWith<$Res> {
  _$TeacherTimeTableDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? days = freezed,
    Object? numerator = freezed,
  }) {
    return _then(_value.copyWith(
      days: freezed == days
          ? _value.days
          : days // ignore: cast_nullable_to_non_nullable
              as List<TeacherTimetableDayDto>?,
      numerator: freezed == numerator
          ? _value.numerator
          : numerator // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TeacherTimeTableDtoImplCopyWith<$Res>
    implements $TeacherTimeTableDtoCopyWith<$Res> {
  factory _$$TeacherTimeTableDtoImplCopyWith(_$TeacherTimeTableDtoImpl value,
          $Res Function(_$TeacherTimeTableDtoImpl) then) =
      __$$TeacherTimeTableDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<TeacherTimetableDayDto>? days, bool? numerator});
}

/// @nodoc
class __$$TeacherTimeTableDtoImplCopyWithImpl<$Res>
    extends _$TeacherTimeTableDtoCopyWithImpl<$Res, _$TeacherTimeTableDtoImpl>
    implements _$$TeacherTimeTableDtoImplCopyWith<$Res> {
  __$$TeacherTimeTableDtoImplCopyWithImpl(_$TeacherTimeTableDtoImpl _value,
      $Res Function(_$TeacherTimeTableDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? days = freezed,
    Object? numerator = freezed,
  }) {
    return _then(_$TeacherTimeTableDtoImpl(
      days: freezed == days
          ? _value._days
          : days // ignore: cast_nullable_to_non_nullable
              as List<TeacherTimetableDayDto>?,
      numerator: freezed == numerator
          ? _value.numerator
          : numerator // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TeacherTimeTableDtoImpl implements _TeacherTimeTableDto {
  const _$TeacherTimeTableDtoImpl(
      {final List<TeacherTimetableDayDto>? days, this.numerator})
      : _days = days;

  factory _$TeacherTimeTableDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$TeacherTimeTableDtoImplFromJson(json);

  final List<TeacherTimetableDayDto>? _days;
  @override
  List<TeacherTimetableDayDto>? get days {
    final value = _days;
    if (value == null) return null;
    if (_days is EqualUnmodifiableListView) return _days;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final bool? numerator;

  @override
  String toString() {
    return 'TeacherTimeTableDto(days: $days, numerator: $numerator)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TeacherTimeTableDtoImpl &&
            const DeepCollectionEquality().equals(other._days, _days) &&
            (identical(other.numerator, numerator) ||
                other.numerator == numerator));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_days), numerator);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TeacherTimeTableDtoImplCopyWith<_$TeacherTimeTableDtoImpl> get copyWith =>
      __$$TeacherTimeTableDtoImplCopyWithImpl<_$TeacherTimeTableDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TeacherTimeTableDtoImplToJson(
      this,
    );
  }
}

abstract class _TeacherTimeTableDto implements TeacherTimeTableDto {
  const factory _TeacherTimeTableDto(
      {final List<TeacherTimetableDayDto>? days,
      final bool? numerator}) = _$TeacherTimeTableDtoImpl;

  factory _TeacherTimeTableDto.fromJson(Map<String, dynamic> json) =
      _$TeacherTimeTableDtoImpl.fromJson;

  @override
  List<TeacherTimetableDayDto>? get days;
  @override
  bool? get numerator;
  @override
  @JsonKey(ignore: true)
  _$$TeacherTimeTableDtoImplCopyWith<_$TeacherTimeTableDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
