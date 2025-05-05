import 'package:fkn/domain/teacher/attendance/attendance.dart';
import 'package:fkn/domain/teacher/attendance/attendance_date.dart';
import 'package:fkn/domain/teacher/attendance/attendance_journal.dart';
import 'package:fkn/feature/teacher/teacher_attendance_journal/data/dto/bulk_set_attendance_dto.dart';

import 'attendance_journal_service.dart';
import 'dto/attendance_journal_request_dto.dart';
import 'mapper/attendance_mapper.dart';

class AttendanceJournalRepository {
  AttendanceJournalRepository(this._service);

  final AttendanceJournalService _service;

  Future<AttendanceJournal> getAttendanceJournal({
    required List<int> groupIds,
    required int subjectId,
  }) async {
    try {
      final request = AttendanceJournalRequestDto(
        groupIds: groupIds,
        subjectId: subjectId,
      );
      final attendance = await _service.getAttendanceJournal(request: request);
      return getAttendanceJournalFromDto(attendance);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> sendBulkAttendance({
    required AttendanceDate date,
    required List<Attendance> attendances,
  }) async {
    try {
      final request = BulkSetAttendanceDto(
        dates: getDtoFromAttendanceDate(date),
        attendances: attendances.map((e) => getDtoFromAttendance(e)).toList(),
      );
      final attendance = await _service.postAttendanceBulkSet(request: request);
    } catch (e) {
      rethrow;
    }
  }
}
