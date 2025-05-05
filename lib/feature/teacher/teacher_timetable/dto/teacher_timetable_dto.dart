import 'package:fkn/feature/teacher/teacher_timetable/dto/teacher_timetable_day_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'teacher_timetable_dto.g.dart';

part 'teacher_timetable_dto.freezed.dart';

@JsonSerializable(
  includeIfNull: false,
  fieldRename: FieldRename.snake,
  createFactory: false,
)
@freezed
class TeacherTimeTableDto with _$TeacherTimeTableDto {
  const factory TeacherTimeTableDto({
    List<TeacherTimetableDayDto>? days,
    bool? numerator,
  }) = _TeacherTimeTableDto;

  factory TeacherTimeTableDto.fromJson(Map<String, dynamic> json) => _$TeacherTimeTableDtoFromJson(json);
}
