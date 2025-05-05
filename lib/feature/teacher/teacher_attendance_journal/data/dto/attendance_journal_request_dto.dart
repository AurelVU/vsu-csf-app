import 'dart:async';

import 'package:fkn/utils/regexes.dart';
import 'package:json_annotation/json_annotation.dart';

part 'attendance_journal_request_dto.g.dart';

@JsonSerializable(
  includeIfNull: false,
  fieldRename: FieldRename.snake,
  createFactory: false,
)
class AttendanceJournalRequestDto {
  AttendanceJournalRequestDto({
    required this.groupIds,
    @JsonKey(name: 'subject_id') required this.subjectId,
  });

  final List<int> groupIds;
  final int subjectId;

  Json toJson() => _$AttendanceJournalRequestDtoToJson(this);
}

FutureOr<Json> serializeAttendanceJournalRequestDto(AttendanceJournalRequestDto object) =>
    object.toJson();
