import 'package:freezed_annotation/freezed_annotation.dart';

part 'attendance_date_dto.g.dart';

part 'attendance_date_dto.freezed.dart';

@JsonSerializable(
  includeIfNull: false,
  fieldRename: FieldRename.snake,
  createFactory: false,
)
@freezed
class AttendanceDateDto with _$AttendanceDateDto {
  const factory AttendanceDateDto({
    String? date,
    @JsonKey(name: 'lesson_number') int? lessonNumber,
    @JsonKey(name: 'lesson_id') int? lessonId,
  }) = _AttendanceDateDto;

  factory AttendanceDateDto.fromJson(Map<String, dynamic> json) =>
      _$AttendanceDateDtoFromJson(json);
}
