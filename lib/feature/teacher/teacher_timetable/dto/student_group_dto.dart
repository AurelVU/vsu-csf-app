import 'package:freezed_annotation/freezed_annotation.dart';

import 'group_leader_dto.dart';

part 'student_group_dto.g.dart';
part 'student_group_dto.freezed.dart';


@Freezed(fromJson: true, toJson: true)
class StudentGroupDto with _$StudentGroupDto {
  @JsonSerializable(
    includeIfNull: false,
    fieldRename: FieldRename.snake,
  )
  const factory StudentGroupDto({
    List<int>? id,
    int? course,
    int? number,
    int? subGroupNumber,
    GroupLeaderDto? curator,
    GroupLeaderDto? groupLeader,
    GroupLeaderDto? groupLeader2,
  }) = _StudentGroupDto;

  factory StudentGroupDto.fromJson(Map<String, dynamic> json) => _$StudentGroupDtoFromJson(json);
}
