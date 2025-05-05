// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exam_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ExamDto _$ExamDtoFromJson(Map<String, dynamic> json) {
  return _ExamDto.fromJson(json);
}

/// @nodoc
mixin _$ExamDto {
  DateTime? get date => throw _privateConstructorUsedError;
  String? get teacher => throw _privateConstructorUsedError;
  String? get subject => throw _privateConstructorUsedError;
  String? get classroom => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ExamDtoCopyWith<ExamDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExamDtoCopyWith<$Res> {
  factory $ExamDtoCopyWith(ExamDto value, $Res Function(ExamDto) then) =
      _$ExamDtoCopyWithImpl<$Res, ExamDto>;
  @useResult
  $Res call(
      {DateTime? date, String? teacher, String? subject, String? classroom});
}

/// @nodoc
class _$ExamDtoCopyWithImpl<$Res, $Val extends ExamDto>
    implements $ExamDtoCopyWith<$Res> {
  _$ExamDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = freezed,
    Object? teacher = freezed,
    Object? subject = freezed,
    Object? classroom = freezed,
  }) {
    return _then(_value.copyWith(
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      teacher: freezed == teacher
          ? _value.teacher
          : teacher // ignore: cast_nullable_to_non_nullable
              as String?,
      subject: freezed == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as String?,
      classroom: freezed == classroom
          ? _value.classroom
          : classroom // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExamDtoImplCopyWith<$Res> implements $ExamDtoCopyWith<$Res> {
  factory _$$ExamDtoImplCopyWith(
          _$ExamDtoImpl value, $Res Function(_$ExamDtoImpl) then) =
      __$$ExamDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime? date, String? teacher, String? subject, String? classroom});
}

/// @nodoc
class __$$ExamDtoImplCopyWithImpl<$Res>
    extends _$ExamDtoCopyWithImpl<$Res, _$ExamDtoImpl>
    implements _$$ExamDtoImplCopyWith<$Res> {
  __$$ExamDtoImplCopyWithImpl(
      _$ExamDtoImpl _value, $Res Function(_$ExamDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = freezed,
    Object? teacher = freezed,
    Object? subject = freezed,
    Object? classroom = freezed,
  }) {
    return _then(_$ExamDtoImpl(
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      teacher: freezed == teacher
          ? _value.teacher
          : teacher // ignore: cast_nullable_to_non_nullable
              as String?,
      subject: freezed == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as String?,
      classroom: freezed == classroom
          ? _value.classroom
          : classroom // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExamDtoImpl implements _ExamDto {
  const _$ExamDtoImpl({this.date, this.teacher, this.subject, this.classroom});

  factory _$ExamDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExamDtoImplFromJson(json);

  @override
  final DateTime? date;
  @override
  final String? teacher;
  @override
  final String? subject;
  @override
  final String? classroom;

  @override
  String toString() {
    return 'ExamDto(date: $date, teacher: $teacher, subject: $subject, classroom: $classroom)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExamDtoImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.teacher, teacher) || other.teacher == teacher) &&
            (identical(other.subject, subject) || other.subject == subject) &&
            (identical(other.classroom, classroom) ||
                other.classroom == classroom));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, date, teacher, subject, classroom);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ExamDtoImplCopyWith<_$ExamDtoImpl> get copyWith =>
      __$$ExamDtoImplCopyWithImpl<_$ExamDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExamDtoImplToJson(
      this,
    );
  }
}

abstract class _ExamDto implements ExamDto {
  const factory _ExamDto(
      {final DateTime? date,
      final String? teacher,
      final String? subject,
      final String? classroom}) = _$ExamDtoImpl;

  factory _ExamDto.fromJson(Map<String, dynamic> json) = _$ExamDtoImpl.fromJson;

  @override
  DateTime? get date;
  @override
  String? get teacher;
  @override
  String? get subject;
  @override
  String? get classroom;
  @override
  @JsonKey(ignore: true)
  _$$ExamDtoImplCopyWith<_$ExamDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
