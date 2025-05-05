// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'day_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DayDto _$DayDtoFromJson(Map<String, dynamic> json) {
  return _DayDto.fromJson(json);
}

/// @nodoc
mixin _$DayDto {
  @DatetimeJsonConverter()
  DateTime? get date => throw _privateConstructorUsedError;
  List<LessonDto>? get lessons => throw _privateConstructorUsedError;
  bool? get numerator => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DayDtoCopyWith<DayDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DayDtoCopyWith<$Res> {
  factory $DayDtoCopyWith(DayDto value, $Res Function(DayDto) then) =
      _$DayDtoCopyWithImpl<$Res, DayDto>;
  @useResult
  $Res call(
      {@DatetimeJsonConverter() DateTime? date,
      List<LessonDto>? lessons,
      bool? numerator});
}

/// @nodoc
class _$DayDtoCopyWithImpl<$Res, $Val extends DayDto>
    implements $DayDtoCopyWith<$Res> {
  _$DayDtoCopyWithImpl(this._value, this._then);

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
              as List<LessonDto>?,
      numerator: freezed == numerator
          ? _value.numerator
          : numerator // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DayDtoImplCopyWith<$Res> implements $DayDtoCopyWith<$Res> {
  factory _$$DayDtoImplCopyWith(
          _$DayDtoImpl value, $Res Function(_$DayDtoImpl) then) =
      __$$DayDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@DatetimeJsonConverter() DateTime? date,
      List<LessonDto>? lessons,
      bool? numerator});
}

/// @nodoc
class __$$DayDtoImplCopyWithImpl<$Res>
    extends _$DayDtoCopyWithImpl<$Res, _$DayDtoImpl>
    implements _$$DayDtoImplCopyWith<$Res> {
  __$$DayDtoImplCopyWithImpl(
      _$DayDtoImpl _value, $Res Function(_$DayDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = freezed,
    Object? lessons = freezed,
    Object? numerator = freezed,
  }) {
    return _then(_$DayDtoImpl(
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lessons: freezed == lessons
          ? _value._lessons
          : lessons // ignore: cast_nullable_to_non_nullable
              as List<LessonDto>?,
      numerator: freezed == numerator
          ? _value.numerator
          : numerator // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DayDtoImpl implements _DayDto {
  const _$DayDtoImpl(
      {@DatetimeJsonConverter() this.date,
      final List<LessonDto>? lessons,
      this.numerator})
      : _lessons = lessons;

  factory _$DayDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$DayDtoImplFromJson(json);

  @override
  @DatetimeJsonConverter()
  final DateTime? date;
  final List<LessonDto>? _lessons;
  @override
  List<LessonDto>? get lessons {
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
    return 'DayDto(date: $date, lessons: $lessons, numerator: $numerator)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DayDtoImpl &&
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
  _$$DayDtoImplCopyWith<_$DayDtoImpl> get copyWith =>
      __$$DayDtoImplCopyWithImpl<_$DayDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DayDtoImplToJson(
      this,
    );
  }
}

abstract class _DayDto implements DayDto {
  const factory _DayDto(
      {@DatetimeJsonConverter() final DateTime? date,
      final List<LessonDto>? lessons,
      final bool? numerator}) = _$DayDtoImpl;

  factory _DayDto.fromJson(Map<String, dynamic> json) = _$DayDtoImpl.fromJson;

  @override
  @DatetimeJsonConverter()
  DateTime? get date;
  @override
  List<LessonDto>? get lessons;
  @override
  bool? get numerator;
  @override
  @JsonKey(ignore: true)
  _$$DayDtoImplCopyWith<_$DayDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
