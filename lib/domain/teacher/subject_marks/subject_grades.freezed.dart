// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subject_grades.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SubjectGrades {
  List<Mark>? get marks => throw _privateConstructorUsedError;
  List<StudentMark>? get students => throw _privateConstructorUsedError;
  List<AllowedMark>? get allowedMarks => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SubjectGradesCopyWith<SubjectGrades> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubjectGradesCopyWith<$Res> {
  factory $SubjectGradesCopyWith(
          SubjectGrades value, $Res Function(SubjectGrades) then) =
      _$SubjectGradesCopyWithImpl<$Res, SubjectGrades>;
  @useResult
  $Res call(
      {List<Mark>? marks,
      List<StudentMark>? students,
      List<AllowedMark>? allowedMarks});
}

/// @nodoc
class _$SubjectGradesCopyWithImpl<$Res, $Val extends SubjectGrades>
    implements $SubjectGradesCopyWith<$Res> {
  _$SubjectGradesCopyWithImpl(this._value, this._then);

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
              as List<Mark>?,
      students: freezed == students
          ? _value.students
          : students // ignore: cast_nullable_to_non_nullable
              as List<StudentMark>?,
      allowedMarks: freezed == allowedMarks
          ? _value.allowedMarks
          : allowedMarks // ignore: cast_nullable_to_non_nullable
              as List<AllowedMark>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SubjectGradesImplCopyWith<$Res>
    implements $SubjectGradesCopyWith<$Res> {
  factory _$$SubjectGradesImplCopyWith(
          _$SubjectGradesImpl value, $Res Function(_$SubjectGradesImpl) then) =
      __$$SubjectGradesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Mark>? marks,
      List<StudentMark>? students,
      List<AllowedMark>? allowedMarks});
}

/// @nodoc
class __$$SubjectGradesImplCopyWithImpl<$Res>
    extends _$SubjectGradesCopyWithImpl<$Res, _$SubjectGradesImpl>
    implements _$$SubjectGradesImplCopyWith<$Res> {
  __$$SubjectGradesImplCopyWithImpl(
      _$SubjectGradesImpl _value, $Res Function(_$SubjectGradesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? marks = freezed,
    Object? students = freezed,
    Object? allowedMarks = freezed,
  }) {
    return _then(_$SubjectGradesImpl(
      marks: freezed == marks
          ? _value._marks
          : marks // ignore: cast_nullable_to_non_nullable
              as List<Mark>?,
      students: freezed == students
          ? _value._students
          : students // ignore: cast_nullable_to_non_nullable
              as List<StudentMark>?,
      allowedMarks: freezed == allowedMarks
          ? _value._allowedMarks
          : allowedMarks // ignore: cast_nullable_to_non_nullable
              as List<AllowedMark>?,
    ));
  }
}

/// @nodoc

class _$SubjectGradesImpl implements _SubjectGrades {
  _$SubjectGradesImpl(
      {final List<Mark>? marks,
      final List<StudentMark>? students,
      final List<AllowedMark>? allowedMarks})
      : _marks = marks,
        _students = students,
        _allowedMarks = allowedMarks;

  final List<Mark>? _marks;
  @override
  List<Mark>? get marks {
    final value = _marks;
    if (value == null) return null;
    if (_marks is EqualUnmodifiableListView) return _marks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<StudentMark>? _students;
  @override
  List<StudentMark>? get students {
    final value = _students;
    if (value == null) return null;
    if (_students is EqualUnmodifiableListView) return _students;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<AllowedMark>? _allowedMarks;
  @override
  List<AllowedMark>? get allowedMarks {
    final value = _allowedMarks;
    if (value == null) return null;
    if (_allowedMarks is EqualUnmodifiableListView) return _allowedMarks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'SubjectGrades(marks: $marks, students: $students, allowedMarks: $allowedMarks)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubjectGradesImpl &&
            const DeepCollectionEquality().equals(other._marks, _marks) &&
            const DeepCollectionEquality().equals(other._students, _students) &&
            const DeepCollectionEquality()
                .equals(other._allowedMarks, _allowedMarks));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_marks),
      const DeepCollectionEquality().hash(_students),
      const DeepCollectionEquality().hash(_allowedMarks));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SubjectGradesImplCopyWith<_$SubjectGradesImpl> get copyWith =>
      __$$SubjectGradesImplCopyWithImpl<_$SubjectGradesImpl>(this, _$identity);
}

abstract class _SubjectGrades implements SubjectGrades {
  factory _SubjectGrades(
      {final List<Mark>? marks,
      final List<StudentMark>? students,
      final List<AllowedMark>? allowedMarks}) = _$SubjectGradesImpl;

  @override
  List<Mark>? get marks;
  @override
  List<StudentMark>? get students;
  @override
  List<AllowedMark>? get allowedMarks;
  @override
  @JsonKey(ignore: true)
  _$$SubjectGradesImplCopyWith<_$SubjectGradesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
