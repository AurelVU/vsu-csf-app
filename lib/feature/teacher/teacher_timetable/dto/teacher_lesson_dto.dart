import 'package:fkn/feature/teacher/teacher_timetable/dto/student_group_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'teacher_lesson_dto.g.dart';

part 'teacher_lesson_dto.freezed.dart';

@JsonSerializable(
  includeIfNull: false,
  fieldRename: FieldRename.snake,
  createFactory: false,
)
@freezed
class TeacherLessonDto with _$TeacherLessonDto {
  const factory TeacherLessonDto({
    int? id,
    String? classroom,
    @JsonKey(name: 'start_time') String? startTime,
    @JsonKey(name: 'finish_time') String? finishTime,
    String? subject,
    @JsonKey(name: 'is_distant') bool? isDistant,
    @JsonKey(name: 'student_groups') List<StudentGroupDto>? studentGroups,
    @JsonKey(name: 'subject_id') int? subjectId,
    @JsonKey(name: 'mark_type') String? markType,


  }) = _TeacherLessonDto;

  factory TeacherLessonDto.fromJson(Map<String, dynamic> json) => _$TeacherLessonDtoFromJson(json);
}
