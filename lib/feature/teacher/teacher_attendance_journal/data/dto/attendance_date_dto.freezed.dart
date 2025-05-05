// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attendance_date_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AttendanceDateDto _$AttendanceDateDtoFromJson(Map<String, dynamic> json) {
  return _AttendanceDateDto.fromJson(json);
}

/// @nodoc
mixin _$AttendanceDateDto {
  String? get date => throw _privateConstructorUsedError;
  @JsonKey(name: 'lesson_number')
  int? get lessonNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'lesson_id')
  int? get lessonId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AttendanceDateDtoCopyWith<AttendanceDateDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttendanceDateDtoCopyWith<$Res> {
  factory $AttendanceDateDtoCopyWith(
          AttendanceDateDto value, $Res Function(AttendanceDateDto) then) =
      _$AttendanceDateDtoCopyWithImpl<$Res, AttendanceDateDto>;
  @useResult
  $Res call(
      {String? date,
      @JsonKey(name: 'lesson_number') int? lessonNumber,
      @JsonKey(name: 'lesson_id') int? lessonId});
}

/// @nodoc
class _$AttendanceDateDtoCopyWithImpl<$Res, $Val extends AttendanceDateDto>
    implements $AttendanceDateDtoCopyWith<$Res> {
  _$AttendanceDateDtoCopyWithImpl(this._value, this._then);

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
abstract class _$$AttendanceDateDtoImplCopyWith<$Res>
    implements $AttendanceDateDtoCopyWith<$Res> {
  factory _$$AttendanceDateDtoImplCopyWith(_$AttendanceDateDtoImpl value,
          $Res Function(_$AttendanceDateDtoImpl) then) =
      __$$AttendanceDateDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? date,
      @JsonKey(name: 'lesson_number') int? lessonNumber,
      @JsonKey(name: 'lesson_id') int? lessonId});
}

/// @nodoc
class __$$AttendanceDateDtoImplCopyWithImpl<$Res>
    extends _$AttendanceDateDtoCopyWithImpl<$Res, _$AttendanceDateDtoImpl>
    implements _$$AttendanceDateDtoImplCopyWith<$Res> {
  __$$AttendanceDateDtoImplCopyWithImpl(_$AttendanceDateDtoImpl _value,
      $Res Function(_$AttendanceDateDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = freezed,
    Object? lessonNumber = freezed,
    Object? lessonId = freezed,
  }) {
    return _then(_$AttendanceDateDtoImpl(
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
@JsonSerializable()
class _$AttendanceDateDtoImpl implements _AttendanceDateDto {
  const _$AttendanceDateDtoImpl(
      {this.date,
      @JsonKey(name: 'lesson_number') this.lessonNumber,
      @JsonKey(name: 'lesson_id') this.lessonId});

  factory _$AttendanceDateDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$AttendanceDateDtoImplFromJson(json);

  @override
  final String? date;
  @override
  @JsonKey(name: 'lesson_number')
  final int? lessonNumber;
  @override
  @JsonKey(name: 'lesson_id')
  final int? lessonId;

  @override
  String toString() {
    return 'AttendanceDateDto(date: $date, lessonNumber: $lessonNumber, lessonId: $lessonId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AttendanceDateDtoImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.lessonNumber, lessonNumber) ||
                other.lessonNumber == lessonNumber) &&
            (identical(other.lessonId, lessonId) ||
                other.lessonId == lessonId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, date, lessonNumber, lessonId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AttendanceDateDtoImplCopyWith<_$AttendanceDateDtoImpl> get copyWith =>
      __$$AttendanceDateDtoImplCopyWithImpl<_$AttendanceDateDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AttendanceDateDtoImplToJson(
      this,
    );
  }
}

abstract class _AttendanceDateDto implements AttendanceDateDto {
  const factory _AttendanceDateDto(
          {final String? date,
          @JsonKey(name: 'lesson_number') final int? lessonNumber,
          @JsonKey(name: 'lesson_id') final int? lessonId}) =
      _$AttendanceDateDtoImpl;

  factory _AttendanceDateDto.fromJson(Map<String, dynamic> json) =
      _$AttendanceDateDtoImpl.fromJson;

  @override
  String? get date;
  @override
  @JsonKey(name: 'lesson_number')
  int? get lessonNumber;
  @override
  @JsonKey(name: 'lesson_id')
  int? get lessonId;
  @override
  @JsonKey(ignore: true)
  _$$AttendanceDateDtoImplCopyWith<_$AttendanceDateDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
