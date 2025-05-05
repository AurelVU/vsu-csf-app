import 'package:fkn/feature/teacher/subject_grades/data/dto/allowed_mark.dart';
import 'package:fkn/feature/teacher/subject_grades/data/dto/student_mark_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'mark_dto.dart';

part 'subject_grades_dto.g.dart';

part 'subject_grades_dto.freezed.dart';

@JsonSerializable(
  includeIfNull: false,
  fieldRename: FieldRename.snake,
  createFactory: false,
)
@freezed
class SubjectGradesDto with _$SubjectGradesDto {
  const factory SubjectGradesDto({
    List<MarkDto>? marks,
    List<StudentMarkDto>? students,
    @JsonKey(name: 'allowed_marks') List<AllowedMarkDto>? allowedMarks,
  }) = _SubjectGradesDto;

  factory SubjectGradesDto.fromJson(Map<String, dynamic> json) =>
      _$SubjectGradesDtoFromJson(json);
}
