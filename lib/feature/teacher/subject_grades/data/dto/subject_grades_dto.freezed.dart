// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subject_grades_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SubjectGradesDto _$SubjectGradesDtoFromJson(Map<String, dynamic> json) {
  return _SubjectGradesDto.fromJson(json);
}

/// @nodoc
mixin _$SubjectGradesDto {
  List<MarkDto>? get marks => throw _privateConstructorUsedError;
  List<StudentMarkDto>? get students => throw _privateConstructorUsedError;
  @JsonKey(name: 'allowed_marks')
  List<AllowedMarkDto>? get allowedMarks => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SubjectGradesDtoCopyWith<SubjectGradesDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubjectGradesDtoCopyWith<$Res> {
  factory $SubjectGradesDtoCopyWith(
          SubjectGradesDto value, $Res Function(SubjectGradesDto) then) =
      _$SubjectGradesDtoCopyWithImpl<$Res, SubjectGradesDto>;
  @useResult
  $Res call(
      {List<MarkDto>? marks,
      List<StudentMarkDto>? students,
      @JsonKey(name: 'allowed_marks') List<AllowedMarkDto>? allowedMarks});
}

/// @nodoc
class _$SubjectGradesDtoCopyWithImpl<$Res, $Val extends SubjectGradesDto>
    implements $SubjectGradesDtoCopyWith<$Res> {
  _$SubjectGradesDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? marks = freezed,
    Object? students = freezed,
    Object? allowedMarks = freezed,
  }) {
    return _then(_value.copyWith(
      marks: freezed == marks
          ? _value.marks
          : marks // ignore: cast_nullable_to_non_nullable
              as List<MarkDto>?,
      students: freezed == students
          ? _value.students
          : students // ignore: cast_nullable_to_non_nullable
              as List<StudentMarkDto>?,
      allowedMarks: freezed == allowedMarks
          ? _value.allowedMarks
          : allowedMarks // ignore: cast_nullable_to_non_nullable
              as List<AllowedMarkDto>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SubjectGradesDtoImplCopyWith<$Res>
    implements $SubjectGradesDtoCopyWith<$Res> {
  factory _$$SubjectGradesDtoImplCopyWith(_$SubjectGradesDtoImpl value,
          $Res Function(_$SubjectGradesDtoImpl) then) =
      __$$SubjectGradesDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<MarkDto>? marks,
      List<StudentMarkDto>? students,
      @JsonKey(name: 'allowed_marks') List<AllowedMarkDto>? allowedMarks});
}

/// @nodoc
class __$$SubjectGradesDtoImplCopyWithImpl<$Res>
    extends _$SubjectGradesDtoCopyWithImpl<$Res, _$SubjectGradesDtoImpl>
    implements _$$SubjectGradesDtoImplCopyWith<$Res> {
  __$$SubjectGradesDtoImplCopyWithImpl(_$SubjectGradesDtoImpl _value,
      $Res Function(_$SubjectGradesDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? marks = freezed,
    Object? students = freezed,
    Object? allowedMarks = freezed,
  }) {
    return _then(_$SubjectGradesDtoImpl(
      marks: freezed == marks
          ? _value._marks
          : marks // ignore: cast_nullable_to_non_nullable
              as List<MarkDto>?,
      students: freezed == students
          ? _value._students
          : students // ignore: cast_nullable_to_non_nullable
              as List<StudentMarkDto>?,
      allowedMarks: freezed == allowedMarks
          ? _value._allowedMarks
          : allowedMarks // ignore: cast_nullable_to_non_nullable
              as List<AllowedMarkDto>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SubjectGradesDtoImpl implements _SubjectGradesDto {
  const _$SubjectGradesDtoImpl(
      {final List<MarkDto>? marks,
      final List<StudentMarkDto>? students,
      @JsonKey(name: 'allowed_marks') final List<AllowedMarkDto>? allowedMarks})
      : _marks = marks,
        _students = students,
        _allowedMarks = allowedMarks;

  factory _$SubjectGradesDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubjectGradesDtoImplFromJson(json);

  final List<MarkDto>? _marks;
  @override
  List<MarkDto>? get marks {
    final value = _marks;
    if (value == null) return null;
    if (_marks is EqualUnmodifiableListView) return _marks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<StudentMarkDto>? _students;
  @override
  List<StudentMarkDto>? get students {
    final value = _students;
    if (value == null) return null;
    if (_students is EqualUnmodifiableListView) return _students;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<AllowedMarkDto>? _allowedMarks;
  @override
  @JsonKey(name: 'allowed_marks')
  List<AllowedMarkDto>? get allowedMarks {
    final value = _allowedMarks;
    if (value == null) return null;
    if (_allowedMarks is EqualUnmodifiableListView) return _allowedMarks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'SubjectGradesDto(marks: $marks, students: $students, allowedMarks: $allowedMarks)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubjectGradesDtoImpl &&
            const DeepCollectionEquality().equals(other._marks, _marks) &&
            const DeepCollectionEquality().equals(other._students, _students) &&
            const DeepCollectionEquality()
                .equals(other._allowedMarks, _allowedMarks));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_marks),
      const DeepCollectionEquality().hash(_students),
      const DeepCollectionEquality().hash(_allowedMarks));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SubjectGradesDtoImplCopyWith<_$SubjectGradesDtoImpl> get copyWith =>
      __$$SubjectGradesDtoImplCopyWithImpl<_$SubjectGradesDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SubjectGradesDtoImplToJson(
      this,
    );
  }
}

abstract class _SubjectGradesDto implements SubjectGradesDto {
  const factory _SubjectGradesDto(
      {final List<MarkDto>? marks,
      final List<StudentMarkDto>? students,
      @JsonKey(name: 'allowed_marks')
      final List<AllowedMarkDto>? allowedMarks}) = _$SubjectGradesDtoImpl;

  factory _SubjectGradesDto.fromJson(Map<String, dynamic> json) =
      _$SubjectGradesDtoImpl.fromJson;

  @override
  List<MarkDto>? get marks;
  @override
  List<StudentMarkDto>? get students;
  @override
  @JsonKey(name: 'allowed_marks')
  List<AllowedMarkDto>? get allowedMarks;
  @override
  @JsonKey(ignore: true)
  _$$SubjectGradesDtoImplCopyWith<_$SubjectGradesDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
