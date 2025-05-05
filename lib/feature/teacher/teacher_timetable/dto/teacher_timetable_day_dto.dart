import 'package:fkn/feature/student/timetable/dto/day_dto.dart';
import 'package:fkn/feature/teacher/teacher_timetable/dto/teacher_lesson_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'teacher_timetable_day_dto.g.dart';

part 'teacher_timetable_day_dto.freezed.dart';

@JsonSerializable(
  includeIfNull: false,
  fieldRename: FieldRename.snake,
  createFactory: false,
)
@freezed
class TeacherTimetableDayDto with _$TeacherTimetableDayDto {
  const factory TeacherTimetableDayDto({
    @DatetimeJsonConverter() DateTime? date,
    List<TeacherLessonDto>? lessons,
    bool? numerator,
  }) = _TeacherTimetableDayDto;

  factory TeacherTimetableDayDto.fromJson(Map<String, dynamic> json) => _$TeacherTimetableDayDtoFromJson(json);
}
