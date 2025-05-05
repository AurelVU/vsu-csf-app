import 'dart:async';

import 'package:fkn/utils/regexes.dart';
import 'package:json_annotation/json_annotation.dart';

part 'subject_grades_request_dto.g.dart';

@JsonSerializable(
  includeIfNull: false,
  fieldRename: FieldRename.snake,
  createFactory: false,
)
class SubjectGradesRequestDto {
  SubjectGradesRequestDto({
    required this.groupIds,
    required this.subjectId,
  });

  final List<int> groupIds;
  final int subjectId;

  Json toJson() => _$SubjectGradesRequestDtoToJson(this);
}

FutureOr<Json> serializeSubjectGradesRequestDto(SubjectGradesRequestDto object) =>
    object.toJson();
