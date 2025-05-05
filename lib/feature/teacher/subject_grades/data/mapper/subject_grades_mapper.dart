import 'package:fkn/domain/teacher/subject_marks/allowed_mark.dart';
import 'package:fkn/domain/teacher/subject_marks/mark.dart';
import 'package:fkn/domain/teacher/subject_marks/student_mark.dart';
import 'package:fkn/domain/teacher/subject_marks/subject_grades.dart';
import 'package:fkn/feature/teacher/subject_grades/data/dto/allowed_mark.dart';
import 'package:fkn/feature/teacher/subject_grades/data/dto/mark_dto.dart';
import 'package:fkn/feature/teacher/subject_grades/data/dto/student_mark_dto.dart';
import 'package:fkn/feature/teacher/subject_grades/data/dto/subject_grades_dto.dart';

SubjectGrades getSubjectGradesFromDto(SubjectGradesDto dto) {
  return SubjectGrades(
    marks: dto.marks?.map(getMarkFromDto).toList(),
    students: dto.students?.map(getStudentMarkFromDto).toList(),
    allowedMarks: dto.allowedMarks?.map(getAllowedMarkFromDto).toList(),
  );
}

Mark getMarkFromDto(MarkDto dto) {
  return Mark(
    studentId: dto.studentId,
    markId: dto.markId,
    value: dto.value,
    canEdit: dto.canEdit,
    color: dto.color,
  );
}

StudentMark getStudentMarkFromDto(StudentMarkDto dto) {
  return StudentMark(
    id: dto.id,
    firstName: dto.firstName,
    middleName: dto.middleName,
    lastName: dto.lastName,
    exclude: dto.exclude,
    avgBall: dto.avgBall,
  );
}

AllowedMark getAllowedMarkFromDto(AllowedMarkDto dto) {
  return AllowedMark(
    title: dto.title,
    subtitle: dto.subtitle,
    markId: dto.markId,
  );
}
