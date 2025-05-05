import 'package:freezed_annotation/freezed_annotation.dart';

part 'attendance_dto.g.dart';

part 'attendance_dto.freezed.dart';

@JsonSerializable(
  includeIfNull: false,
  fieldRename: FieldRename.snake,
  createFactory: false,
)
@freezed
class AttendanceDto with _$AttendanceDto {
  const factory AttendanceDto({
    @JsonKey(name: 'student_id') String? studentId,
    String? date,
    @JsonKey(name: 'lesson_number') int? lessonNumber,
    String? attended,
  }) = _AttendanceDto;

  factory AttendanceDto.fromJson(Map<String, dynamic> json) => _$AttendanceDtoFromJson(json);
}
