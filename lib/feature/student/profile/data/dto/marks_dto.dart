import 'package:freezed_annotation/freezed_annotation.dart';


part 'marks_dto.freezed.dart';
part 'marks_dto.g.dart';


@JsonSerializable(
  includeIfNull: false,
  fieldRename: FieldRename.snake,
  createFactory: false,
)
@freezed
class MarksDto with _$MarksDto {

  const factory MarksDto({
    String? teacher,
    @JsonKey(name: 'subject_name') String? subjectName,
    @JsonKey(name: 'mark_type') String? markType,
    String? att1,
    @JsonKey(name: 'attendance_percent') String? attendancePercent,
    String? att2,
    String? att3,
    String? result,
    String? exam,
  }) = _MarksDto;

  factory MarksDto.fromJson(Map<String, dynamic> json) => _$MarksDtoFromJson(json);
}
