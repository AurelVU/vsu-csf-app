import 'package:freezed_annotation/freezed_annotation.dart';

part 'attendance_student_dto.g.dart';

part 'attendance_student_dto.freezed.dart';

@JsonSerializable(
  includeIfNull: false,
  fieldRename: FieldRename.snake,
  createFactory: false,
)
@freezed
class AttendanceStudentDto with _$AttendanceStudentDto {
  const factory AttendanceStudentDto({
    String? id,
    @JsonKey(name: 'first_name') String? firstName,
    @JsonKey(name: 'last_name') String? lastName,
    @JsonKey(name: 'middlename') String? middleName,

  }) = _AttendanceStudentDto;

  factory AttendanceStudentDto.fromJson(Map<String, dynamic> json) => _$AttendanceStudentDtoFromJson(json);
}
