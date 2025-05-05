import 'package:fkn/domain/teacher/subject_marks/student_mark.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'allowed_mark.dart';
import 'mark.dart';

part 'subject_grades.freezed.dart';

@freezed
class SubjectGrades with _$SubjectGrades {
  factory SubjectGrades({
    List<Mark>? marks,
    List<StudentMark>? students,
    List<AllowedMark>? allowedMarks,
  }) = _SubjectGrades;
}