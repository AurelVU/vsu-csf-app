import 'package:freezed_annotation/freezed_annotation.dart';

import 'attendance_date_dto.dart';
import 'attendance_dto.dart';

part 'bulk_set_attendance_dto.g.dart';

part 'bulk_set_attendance_dto.freezed.dart';

@JsonSerializable(
  includeIfNull: false,
  fieldRename: FieldRename.snake,
  createFactory: false,
)
@freezed
class BulkSetAttendanceDto with _$BulkSetAttendanceDto {
  const factory BulkSetAttendanceDto({
    AttendanceDateDto? dates,
    List<AttendanceDto>? attendances,
  }) = _BulkSetAttendanceDto;

  factory BulkSetAttendanceDto.fromJson(Map<String, dynamic> json) => _$BulkSetAttendanceDtoFromJson(json);
}
