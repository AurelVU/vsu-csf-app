import 'package:fkn/domain/teacher/timetable/student_group.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'teacher_lesson.freezed.dart';



@freezed
class TeacherLesson  with _$TeacherLesson {
  factory  TeacherLesson({
    int? id,
    String? classroom,
    String? startTime,
    String? finishTime,
    String? subject,
    String? markType,
    bool? isDistant,
    List<StudentGroup>? studentGroups,
    int? subjectId,

  }) = _TeacherLesson;
}
