// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'teacher_lesson_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TeacherLessonDto _$TeacherLessonDtoFromJson(Map<String, dynamic> json) {
  return _TeacherLessonDto.fromJson(json);
}

/// @nodoc
mixin _$TeacherLessonDto {
  int? get id => throw _privateConstructorUsedError;
  String? get classroom => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_time')
  String? get startTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'finish_time')
  String? get finishTime => throw _privateConstructorUsedError;
  String? get subject => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_distant')
  bool? get isDistant => throw _privateConstructorUsedError;
  @JsonKey(name: 'student_groups')
  List<StudentGroupDto>? get studentGroups =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'subject_id')
  int? get subjectId => throw _privateConstructorUsedError;
  @JsonKey(name: 'mark_type')
  String? get markType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TeacherLessonDtoCopyWith<TeacherLessonDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TeacherLessonDtoCopyWith<$Res> {
  factory $TeacherLessonDtoCopyWith(
          TeacherLessonDto value, $Res Function(TeacherLessonDto) then) =
      _$TeacherLessonDtoCopyWithImpl<$Res, TeacherLessonDto>;
  @useResult
  $Res call(
      {int? id,
      String? classroom,
      @JsonKey(name: 'start_time') String? startTime,
      @JsonKey(name: 'finish_time') String? finishTime,
      String? subject,
      @JsonKey(name: 'is_distant') bool? isDistant,
      @JsonKey(name: 'student_groups') List<StudentGroupDto>? studentGroups,
      @JsonKey(name: 'subject_id') int? subjectId,
      @JsonKey(name: 'mark_type') String? markType});
}

/// @nodoc
class _$TeacherLessonDtoCopyWithImpl<$Res, $Val extends TeacherLessonDto>
    implements $TeacherLessonDtoCopyWith<$Res> {
  _$TeacherLessonDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? classroom = freezed,
    Object? startTime = freezed,
    Object? finishTime = freezed,
    Object? subject = freezed,
    Object? isDistant = freezed,
    Object? studentGroups = freezed,
    Object? subjectId = freezed,
    Object? markType = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
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
      studentGroups: freezed == studentGroups
          ? _value.studentGroups
          : studentGroups // ignore: cast_nullable_to_non_nullable
              as List<StudentGroupDto>?,
      subjectId: freezed == subjectId
          ? _value.subjectId
          : subjectId // ignore: cast_nullable_to_non_nullable
              as int?,
      markType: freezed == markType
          ? _value.markType
          : markType // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TeacherLessonDtoImplCopyWith<$Res>
    implements $TeacherLessonDtoCopyWith<$Res> {
  factory _$$TeacherLessonDtoImplCopyWith(_$TeacherLessonDtoImpl value,
          $Res Function(_$TeacherLessonDtoImpl) then) =
      __$$TeacherLessonDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? classroom,
      @JsonKey(name: 'start_time') String? startTime,
      @JsonKey(name: 'finish_time') String? finishTime,
      String? subject,
      @JsonKey(name: 'is_distant') bool? isDistant,
      @JsonKey(name: 'student_groups') List<StudentGroupDto>? studentGroups,
      @JsonKey(name: 'subject_id') int? subjectId,
      @JsonKey(name: 'mark_type') String? markType});
}

/// @nodoc
class __$$TeacherLessonDtoImplCopyWithImpl<$Res>
    extends _$TeacherLessonDtoCopyWithImpl<$Res, _$TeacherLessonDtoImpl>
    implements _$$TeacherLessonDtoImplCopyWith<$Res> {
  __$$TeacherLessonDtoImplCopyWithImpl(_$TeacherLessonDtoImpl _value,
      $Res Function(_$TeacherLessonDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? classroom = freezed,
    Object? startTime = freezed,
    Object? finishTime = freezed,
    Object? subject = freezed,
    Object? isDistant = freezed,
    Object? studentGroups = freezed,
    Object? subjectId = freezed,
    Object? markType = freezed,
  }) {
    return _then(_$TeacherLessonDtoImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
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
      studentGroups: freezed == studentGroups
          ? _value._studentGroups
          : studentGroups // ignore: cast_nullable_to_non_nullable
              as List<StudentGroupDto>?,
      subjectId: freezed == subjectId
          ? _value.subjectId
          : subjectId // ignore: cast_nullable_to_non_nullable
              as int?,
      markType: freezed == markType
          ? _value.markType
          : markType // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TeacherLessonDtoImpl implements _TeacherLessonDto {
  const _$TeacherLessonDtoImpl(
      {this.id,
      this.classroom,
      @JsonKey(name: 'start_time') this.startTime,
      @JsonKey(name: 'finish_time') this.finishTime,
      this.subject,
      @JsonKey(name: 'is_distant') this.isDistant,
      @JsonKey(name: 'student_groups')
      final List<StudentGroupDto>? studentGroups,
      @JsonKey(name: 'subject_id') this.subjectId,
      @JsonKey(name: 'mark_type') this.markType})
      : _studentGroups = studentGroups;

  factory _$TeacherLessonDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$TeacherLessonDtoImplFromJson(json);

  @override
  final int? id;
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
  final List<StudentGroupDto>? _studentGroups;
  @override
  @JsonKey(name: 'student_groups')
  List<StudentGroupDto>? get studentGroups {
    final value = _studentGroups;
    if (value == null) return null;
    if (_studentGroups is EqualUnmodifiableListView) return _studentGroups;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'subject_id')
  final int? subjectId;
  @override
  @JsonKey(name: 'mark_type')
  final String? markType;

  @override
  String toString() {
    return 'TeacherLessonDto(id: $id, classroom: $classroom, startTime: $startTime, finishTime: $finishTime, subject: $subject, isDistant: $isDistant, studentGroups: $studentGroups, subjectId: $subjectId, markType: $markType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TeacherLessonDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.classroom, classroom) ||
                other.classroom == classroom) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.finishTime, finishTime) ||
                other.finishTime == finishTime) &&
            (identical(other.subject, subject) || other.subject == subject) &&
            (identical(other.isDistant, isDistant) ||
                other.isDistant == isDistant) &&
            const DeepCollectionEquality()
                .equals(other._studentGroups, _studentGroups) &&
            (identical(other.subjectId, subjectId) ||
                other.subjectId == subjectId) &&
            (identical(other.markType, markType) ||
                other.markType == markType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      classroom,
      startTime,
      finishTime,
      subject,
      isDistant,
      const DeepCollectionEquality().hash(_studentGroups),
      subjectId,
      markType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TeacherLessonDtoImplCopyWith<_$TeacherLessonDtoImpl> get copyWith =>
      __$$TeacherLessonDtoImplCopyWithImpl<_$TeacherLessonDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TeacherLessonDtoImplToJson(
      this,
    );
  }
}

abstract class _TeacherLessonDto implements TeacherLessonDto {
  const factory _TeacherLessonDto(
          {final int? id,
          final String? classroom,
          @JsonKey(name: 'start_time') final String? startTime,
          @JsonKey(name: 'finish_time') final String? finishTime,
          final String? subject,
          @JsonKey(name: 'is_distant') final bool? isDistant,
          @JsonKey(name: 'student_groups')
          final List<StudentGroupDto>? studentGroups,
          @JsonKey(name: 'subject_id') final int? subjectId,
          @JsonKey(name: 'mark_type') final String? markType}) =
      _$TeacherLessonDtoImpl;

  factory _TeacherLessonDto.fromJson(Map<String, dynamic> json) =
      _$TeacherLessonDtoImpl.fromJson;

  @override
  int? get id;
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
  @JsonKey(name: 'student_groups')
  List<StudentGroupDto>? get studentGroups;
  @override
  @JsonKey(name: 'subject_id')
  int? get subjectId;
  @override
  @JsonKey(name: 'mark_type')
  String? get markType;
  @override
  @JsonKey(ignore: true)
  _$$TeacherLessonDtoImplCopyWith<_$TeacherLessonDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
