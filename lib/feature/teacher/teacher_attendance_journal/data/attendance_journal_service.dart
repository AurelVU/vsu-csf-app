import 'package:dio/dio.dart';
import 'package:fkn/feature/teacher/teacher_attendance_journal/data/attendance_journal_url.dart';
import 'package:fkn/feature/teacher/teacher_attendance_journal/data/dto/bulk_set_attendance_dto.dart';
import 'package:retrofit/retrofit.dart';
import 'dto/attendance_journal_dto.dart';
import 'dto/attendance_journal_request_dto.dart';

part 'attendance_journal_service.g.dart';

@RestApi()
abstract class AttendanceJournalService {
  factory AttendanceJournalService(Dio dio, {String baseUrl}) =
      _AttendanceJournalService;

  @POST(AttendanceJournalUrl.attendanceJournal)
  Future<AttendanceJournalDto> getAttendanceJournal({
    @Body() required AttendanceJournalRequestDto request,
  });

  @POST(AttendanceJournalUrl.attendanceBulkSet)
  Future<void> postAttendanceBulkSet({
    @Body() required BulkSetAttendanceDto request,
  });
}
