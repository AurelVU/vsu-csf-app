// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lesson_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LessonDto _$LessonDtoFromJson(Map<String, dynamic> json) {
  return _LessonDto.fromJson(json);
}

/// @nodoc
mixin _$LessonDto {
  String? get teacher => throw _privateConstructorUsedError;
  String? get classroom => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_time')
  String? get startTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'finish_time')
  String? get finishTime => throw _privateConstructorUsedError;
  String? get subject => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_distant')
  bool? get isDistant => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LessonDtoCopyWith<LessonDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LessonDtoCopyWith<$Res> {
  factory $LessonDtoCopyWith(LessonDto value, $Res Function(LessonDto) then) =
      _$LessonDtoCopyWithImpl<$Res, LessonDto>;
  @useResult
  $Res call(
      {String? teacher,
      String? classroom,
      @JsonKey(name: 'start_time') String? startTime,
      @JsonKey(name: 'finish_time') String? finishTime,
      String? subject,
      @JsonKey(name: 'is_distant') bool? isDistant,
      int? id});
}

/// @nodoc
class _$LessonDtoCopyWithImpl<$Res, $Val extends LessonDto>
    implements $LessonDtoCopyWith<$Res> {
  _$LessonDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? teacher = freezed,
    Object? classroom = freezed,
    Object? startTime = freezed,
    Object? finishTime = freezed,
    Object? subject = freezed,
    Object? isDistant = freezed,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      teacher: freezed == teacher
          ? _value.teacher
          : teacher // ignore: cast_nullable_to_non_nullable
              as String?,
      classroom: freezed == classroom
          ? _value.classroom
          : classroom // ignore: cast_nullable_to_non_nullable
              as String?,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String?,
      finishTime: freezed == finishTime
          ? _value.finishTime
          : finishTime // ignore: cast_nullable_to_non_nullable
              as String?,
      subject: freezed == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as String?,
      isDistant: freezed == isDistant
          ? _value.isDistant
          : isDistant // ignore: cast_nullable_to_non_nullable
              as bool?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LessonDtoImplCopyWith<$Res>
    implements $LessonDtoCopyWith<$Res> {
  factory _$$LessonDtoImplCopyWith(
          _$LessonDtoImpl value, $Res Function(_$LessonDtoImpl) then) =
      __$$LessonDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? teacher,
      String? classroom,
      @JsonKey(name: 'start_time') String? startTime,
      @JsonKey(name: 'finish_time') String? finishTime,
      String? subject,
      @JsonKey(name: 'is_distant') bool? isDistant,
      int? id});
}

/// @nodoc
class __$$LessonDtoImplCopyWithImpl<$Res>
    extends _$LessonDtoCopyWithImpl<$Res, _$LessonDtoImpl>
    implements _$$LessonDtoImplCopyWith<$Res> {
  __$$LessonDtoImplCopyWithImpl(
      _$LessonDtoImpl _value, $Res Function(_$LessonDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? teacher = freezed,
    Object? classroom = freezed,
    Object? startTime = freezed,
    Object? finishTime = freezed,
    Object? subject = freezed,
    Object? isDistant = freezed,
    Object? id = freezed,
  }) {
    return _then(_$LessonDtoImpl(
      teacher: freezed == teacher
          ? _value.teacher
          : teacher // ignore: cast_nullable_to_non_nullable
              as String?,
      classroom: freezed == classroom
          ? _value.classroom
          : classroom // ignore: cast_nullable_to_non_nullable
              as String?,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String?,
      finishTime: freezed == finishTime
          ? _value.finishTime
          : finishTime // ignore: cast_nullable_to_non_nullable
              as String?,
      subject: freezed == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as String?,
      isDistant: freezed == isDistant
          ? _value.isDistant
          : isDistant // ignore: cast_nullable_to_non_nullable
              as bool?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LessonDtoImpl implements _LessonDto {
  const _$LessonDtoImpl(
      {this.teacher,
      this.classroom,
      @JsonKey(name: 'start_time') this.startTime,
      @JsonKey(name: 'finish_time') this.finishTime,
      this.subject,
      @JsonKey(name: 'is_distant') this.isDistant,
      this.id});

  factory _$LessonDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$LessonDtoImplFromJson(json);

  @override
  final String? teacher;
  @override
  final String? classroom;
  @override
  @JsonKey(name: 'start_time')
  final String? startTime;
  @override
  @JsonKey(name: 'finish_time')
  final String? finishTime;
  @override
  final String? subject;
  @override
  @JsonKey(name: 'is_distant')
  final bool? isDistant;
  @override
  final int? id;

  @override
  String toString() {
    return 'LessonDto(teacher: $teacher, classroom: $classroom, startTime: $startTime, finishTime: $finishTime, subject: $subject, isDistant: $isDistant, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LessonDtoImpl &&
            (identical(other.teacher, teacher) || other.teacher == teacher) &&
            (identical(other.classroom, classroom) ||
                other.classroom == classroom) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.finishTime, finishTime) ||
                other.finishTime == finishTime) &&
            (identical(other.subject, subject) || other.subject == subject) &&
            (identical(other.isDistant, isDistant) ||
                other.isDistant == isDistant) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, teacher, classroom, startTime,
      finishTime, subject, isDistant, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LessonDtoImplCopyWith<_$LessonDtoImpl> get copyWith =>
      __$$LessonDtoImplCopyWithImpl<_$LessonDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LessonDtoImplToJson(
      this,
    );
  }
}

abstract class _LessonDto implements LessonDto {
  const factory _LessonDto(
      {final String? teacher,
      final String? classroom,
      @JsonKey(name: 'start_time') final String? startTime,
      @JsonKey(name: 'finish_time') final String? finishTime,
      final String? subject,
      @JsonKey(name: 'is_distant') final bool? isDistant,
      final int? id}) = _$LessonDtoImpl;

  factory _LessonDto.fromJson(Map<String, dynamic> json) =
      _$LessonDtoImpl.fromJson;

  @override
  String? get teacher;
  @override
  String? get classroom;
  @override
  @JsonKey(name: 'start_time')
  String? get startTime;
  @override
  @JsonKey(name: 'finish_time')
  String? get finishTime;
  @override
  String? get subject;
  @override
  @JsonKey(name: 'is_distant')
  bool? get isDistant;
  @override
  int? get id;
  @override
  @JsonKey(ignore: true)
  _$$LessonDtoImplCopyWith<_$LessonDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
