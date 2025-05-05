// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'timetable_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TimeTableDto _$TimeTableDtoFromJson(Map<String, dynamic> json) {
  return _TimeTableDto.fromJson(json);
}

/// @nodoc
mixin _$TimeTableDto {
  List<DayDto>? get days => throw _privateConstructorUsedError;
  bool? get numerator => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TimeTableDtoCopyWith<TimeTableDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimeTableDtoCopyWith<$Res> {
  factory $TimeTableDtoCopyWith(
          TimeTableDto value, $Res Function(TimeTableDto) then) =
      _$TimeTableDtoCopyWithImpl<$Res, TimeTableDto>;
  @useResult
  $Res call({List<DayDto>? days, bool? numerator});
}

/// @nodoc
class _$TimeTableDtoCopyWithImpl<$Res, $Val extends TimeTableDto>
    implements $TimeTableDtoCopyWith<$Res> {
  _$TimeTableDtoCopyWithImpl(this._value, this._then);

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
              as List<DayDto>?,
      numerator: freezed == numerator
          ? _value.numerator
          : numerator // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TimeTableDtoImplCopyWith<$Res>
    implements $TimeTableDtoCopyWith<$Res> {
  factory _$$TimeTableDtoImplCopyWith(
          _$TimeTableDtoImpl value, $Res Function(_$TimeTableDtoImpl) then) =
      __$$TimeTableDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<DayDto>? days, bool? numerator});
}

/// @nodoc
class __$$TimeTableDtoImplCopyWithImpl<$Res>
    extends _$TimeTableDtoCopyWithImpl<$Res, _$TimeTableDtoImpl>
    implements _$$TimeTableDtoImplCopyWith<$Res> {
  __$$TimeTableDtoImplCopyWithImpl(
      _$TimeTableDtoImpl _value, $Res Function(_$TimeTableDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? days = freezed,
    Object? numerator = freezed,
  }) {
    return _then(_$TimeTableDtoImpl(
      days: freezed == days
          ? _value._days
          : days // ignore: cast_nullable_to_non_nullable
              as List<DayDto>?,
      numerator: freezed == numerator
          ? _value.numerator
          : numerator // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TimeTableDtoImpl implements _TimeTableDto {
  const _$TimeTableDtoImpl({final List<DayDto>? days, this.numerator})
      : _days = days;

  factory _$TimeTableDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$TimeTableDtoImplFromJson(json);

  final List<DayDto>? _days;
  @override
  List<DayDto>? get days {
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
    return 'TimeTableDto(days: $days, numerator: $numerator)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimeTableDtoImpl &&
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
  _$$TimeTableDtoImplCopyWith<_$TimeTableDtoImpl> get copyWith =>
      __$$TimeTableDtoImplCopyWithImpl<_$TimeTableDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TimeTableDtoImplToJson(
      this,
    );
  }
}

abstract class _TimeTableDto implements TimeTableDto {
  const factory _TimeTableDto(
      {final List<DayDto>? days, final bool? numerator}) = _$TimeTableDtoImpl;

  factory _TimeTableDto.fromJson(Map<String, dynamic> json) =
      _$TimeTableDtoImpl.fromJson;

  @override
  List<DayDto>? get days;
  @override
  bool? get numerator;
  @override
  @JsonKey(ignore: true)
  _$$TimeTableDtoImplCopyWith<_$TimeTableDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
