import 'package:fkn/domain/teacher/attendance/attendance.dart';
import 'package:fkn/domain/teacher/attendance/attendance_date.dart';
import 'package:fkn/domain/teacher/attendance/attendance_journal.dart';
import 'package:fkn/domain/teacher/attendance/attendance_student.dart';
import 'package:fkn/feature/teacher/teacher_attendance_journal/data/dto/attendance_date_dto.dart';
import 'package:fkn/feature/teacher/teacher_attendance_journal/data/dto/attendance_dto.dart';
import 'package:fkn/feature/teacher/teacher_attendance_journal/data/dto/attendance_journal_dto.dart';
import 'package:fkn/feature/teacher/teacher_attendance_journal/data/dto/attendance_student_dto.dart';

AttendanceJournal getAttendanceJournalFromDto(AttendanceJournalDto dto) {
  return AttendanceJournal(
    students: dto.students?.map(getAttendanceStudentFromDto).toList(),
    dates: dto.dates?.map(getAttendanceDateFromDto).toList(),
    attendances: dto.attendances?.map(getAttendanceFromDto).toList(),
  );
}

AttendanceStudent getAttendanceStudentFromDto(AttendanceStudentDto dto) {
  return AttendanceStudent(
    id: dto.id,
    firstName: dto.firstName,
    middleName: dto.middleName,
    lastName: dto.lastName,
  );
}

AttendanceDate getAttendanceDateFromDto(AttendanceDateDto dto) {
  return AttendanceDate(
    date: dto.date,
    lessonNumber: dto.lessonNumber,
    lessonId: dto.lessonId,
  );
}

Attendance getAttendanceFromDto(AttendanceDto dto) {
  return Attendance(
    studentId: dto.studentId,
    date: dto.date,
    lessonNumber: dto.lessonNumber,
    attended: dto.attended,
  );
}

AttendanceDto getDtoFromAttendance(Attendance attendance) {
  return AttendanceDto(
    studentId: attendance.studentId,
    date: attendance.date,
    lessonNumber: attendance.lessonNumber,
    attended: attendance.attended,
  );
}

AttendanceDateDto getDtoFromAttendanceDate(AttendanceDate date) {
  return AttendanceDateDto(
    date: date.date,
    lessonId: date.lessonId,
    lessonNumber: date.lessonNumber,
  );
}
