import 'package:freezed_annotation/freezed_annotation.dart';

import 'attendance.dart';
import 'attendance_date.dart';
import 'attendance_student.dart';

part 'attendance_journal.freezed.dart';

@freezed
class AttendanceJournal with _$AttendanceJournal {
  factory AttendanceJournal({
    List<AttendanceStudent>? students,
    List<AttendanceDate>? dates,
    List<Attendance>? attendances,
  }) = _AttendanceJournal;
}
