// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bulk_set_attendance_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BulkSetAttendanceDto _$BulkSetAttendanceDtoFromJson(Map<String, dynamic> json) {
  return _BulkSetAttendanceDto.fromJson(json);
}

/// @nodoc
mixin _$BulkSetAttendanceDto {
  AttendanceDateDto? get dates => throw _privateConstructorUsedError;
  List<AttendanceDto>? get attendances => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BulkSetAttendanceDtoCopyWith<BulkSetAttendanceDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BulkSetAttendanceDtoCopyWith<$Res> {
  factory $BulkSetAttendanceDtoCopyWith(BulkSetAttendanceDto value,
          $Res Function(BulkSetAttendanceDto) then) =
      _$BulkSetAttendanceDtoCopyWithImpl<$Res, BulkSetAttendanceDto>;
  @useResult
  $Res call({AttendanceDateDto? dates, List<AttendanceDto>? attendances});

  $AttendanceDateDtoCopyWith<$Res>? get dates;
}

/// @nodoc
class _$BulkSetAttendanceDtoCopyWithImpl<$Res,
        $Val extends BulkSetAttendanceDto>
    implements $BulkSetAttendanceDtoCopyWith<$Res> {
  _$BulkSetAttendanceDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dates = freezed,
    Object? attendances = freezed,
  }) {
    return _then(_value.copyWith(
      dates: freezed == dates
          ? _value.dates
          : dates // ignore: cast_nullable_to_non_nullable
              as AttendanceDateDto?,
      attendances: freezed == attendances
          ? _value.attendances
          : attendances // ignore: cast_nullable_to_non_nullable
              as List<AttendanceDto>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AttendanceDateDtoCopyWith<$Res>? get dates {
    if (_value.dates == null) {
      return null;
    }

    return $AttendanceDateDtoCopyWith<$Res>(_value.dates!, (value) {
      return _then(_value.copyWith(dates: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BulkSetAttendanceDtoImplCopyWith<$Res>
    implements $BulkSetAttendanceDtoCopyWith<$Res> {
  factory _$$BulkSetAttendanceDtoImplCopyWith(_$BulkSetAttendanceDtoImpl value,
          $Res Function(_$BulkSetAttendanceDtoImpl) then) =
      __$$BulkSetAttendanceDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AttendanceDateDto? dates, List<AttendanceDto>? attendances});

  @override
  $AttendanceDateDtoCopyWith<$Res>? get dates;
}

/// @nodoc
class __$$BulkSetAttendanceDtoImplCopyWithImpl<$Res>
    extends _$BulkSetAttendanceDtoCopyWithImpl<$Res, _$BulkSetAttendanceDtoImpl>
    implements _$$BulkSetAttendanceDtoImplCopyWith<$Res> {
  __$$BulkSetAttendanceDtoImplCopyWithImpl(_$BulkSetAttendanceDtoImpl _value,
      $Res Function(_$BulkSetAttendanceDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dates = freezed,
    Object? attendances = freezed,
  }) {
    return _then(_$BulkSetAttendanceDtoImpl(
      dates: freezed == dates
          ? _value.dates
          : dates // ignore: cast_nullable_to_non_nullable
              as AttendanceDateDto?,
      attendances: freezed == attendances
          ? _value._attendances
          : attendances // ignore: cast_nullable_to_non_nullable
              as List<AttendanceDto>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BulkSetAttendanceDtoImpl implements _BulkSetAttendanceDto {
  const _$BulkSetAttendanceDtoImpl(
      {this.dates, final List<AttendanceDto>? attendances})
      : _attendances = attendances;

  factory _$BulkSetAttendanceDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$BulkSetAttendanceDtoImplFromJson(json);

  @override
  final AttendanceDateDto? dates;
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
    return 'BulkSetAttendanceDto(dates: $dates, attendances: $attendances)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BulkSetAttendanceDtoImpl &&
            (identical(other.dates, dates) || other.dates == dates) &&
            const DeepCollectionEquality()
                .equals(other._attendances, _attendances));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, dates, const DeepCollectionEquality().hash(_attendances));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BulkSetAttendanceDtoImplCopyWith<_$BulkSetAttendanceDtoImpl>
      get copyWith =>
          __$$BulkSetAttendanceDtoImplCopyWithImpl<_$BulkSetAttendanceDtoImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BulkSetAttendanceDtoImplToJson(
      this,
    );
  }
}

abstract class _BulkSetAttendanceDto implements BulkSetAttendanceDto {
  const factory _BulkSetAttendanceDto(
      {final AttendanceDateDto? dates,
      final List<AttendanceDto>? attendances}) = _$BulkSetAttendanceDtoImpl;

  factory _BulkSetAttendanceDto.fromJson(Map<String, dynamic> json) =
      _$BulkSetAttendanceDtoImpl.fromJson;

  @override
  AttendanceDateDto? get dates;
  @override
  List<AttendanceDto>? get attendances;
  @override
  @JsonKey(ignore: true)
  _$$BulkSetAttendanceDtoImplCopyWith<_$BulkSetAttendanceDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
