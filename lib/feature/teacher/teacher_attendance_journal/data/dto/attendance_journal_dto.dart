import 'package:freezed_annotation/freezed_annotation.dart';

import 'attendance_date_dto.dart';
import 'attendance_dto.dart';
import 'attendance_student_dto.dart';

part 'attendance_journal_dto.g.dart';

part 'attendance_journal_dto.freezed.dart';

@JsonSerializable(
  includeIfNull: false,
  fieldRename: FieldRename.snake,
  createFactory: false,
)
@freezed
class AttendanceJournalDto with _$AttendanceJournalDto {
  const factory AttendanceJournalDto({
    List<AttendanceStudentDto>? students,
    List<AttendanceDateDto>? dates,
    List<AttendanceDto>? attendances,
  }) = _AttendanceJournalDto;

  factory AttendanceJournalDto.fromJson(Map<String, dynamic> json) => _$AttendanceJournalDtoFromJson(json);
}
