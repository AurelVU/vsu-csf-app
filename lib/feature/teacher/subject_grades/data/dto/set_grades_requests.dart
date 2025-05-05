import 'dart:async';

import 'package:fkn/feature/teacher/subject_grades/data/dto/set_mark.dart';
import 'package:fkn/utils/regexes.dart';
import 'package:json_annotation/json_annotation.dart';

part 'set_grades_requests.g.dart';

@JsonSerializable(
  includeIfNull: false,
  fieldRename: FieldRename.snake,
  createFactory: false,
)
class SetGradesRequest {
  SetGradesRequest({
    required this.groupIds,
    required this.lessonId,
    required this.marks,
  });

  final List<int> groupIds;
  final int lessonId;
  final List<SetMark> marks;

  Json toJson() => _$SetGradesRequestToJson(this);
}

FutureOr<Json> serializeSetGradesRequest(SetGradesRequest object) =>
    object.toJson();
