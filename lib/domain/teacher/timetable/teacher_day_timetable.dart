import 'package:fkn/domain/teacher/timetable/teacher_lesson.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'teacher_day_timetable.freezed.dart';



@freezed
class TeacherDayTimetable  with _$TeacherDayTimetable {
  factory  TeacherDayTimetable({
    DateTime? dateTimetable,
    List<TeacherLesson>? lessons,
    bool? numerator,
  }) = _TeacherDayTimetable;
}
