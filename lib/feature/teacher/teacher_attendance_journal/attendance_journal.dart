import 'package:fkn/domain/teacher/attendance/attendance.dart';
import 'package:fkn/domain/teacher/attendance/attendance_date.dart';
import 'package:fkn/domain/teacher/attendance/attendance_journal.dart';
import 'package:fkn/environment/lifecycle_module.dart';
import 'package:rxdart/rxdart.dart';

import 'data/attendance_journal_repository.dart';

class AttendanceJournalManager extends LifecycleModule {
  AttendanceJournalManager(
    this._attendanceJournalRepository,
  );

  BehaviorSubject<AttendanceJournal> attendanceJournal = BehaviorSubject();

  final AttendanceJournalRepository _attendanceJournalRepository;


  @override
  void dispose() {
    attendanceJournal.close();
  }

  Future<void> getAttendance({
    required List<int> groupIds,
    required int subjectId,
  }) async {
    try {
      attendanceJournal.value =
          await _attendanceJournalRepository.getAttendanceJournal(groupIds: groupIds,  subjectId: subjectId);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> sendBulkAttendance({
    required AttendanceDate date,
    required List<Attendance> attendances,
  }) async {
    try {
      await _attendanceJournalRepository.sendBulkAttendance(date: date, attendances: attendances);
    } catch (e) {
      rethrow;
    }
  }
}
