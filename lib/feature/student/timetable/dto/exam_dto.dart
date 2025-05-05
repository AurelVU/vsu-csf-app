
import 'package:freezed_annotation/freezed_annotation.dart';

part 'exam_dto.g.dart';

part 'exam_dto.freezed.dart';

@JsonSerializable(
  includeIfNull: false,
  fieldRename: FieldRename.snake,
  createFactory: false,
)
@freezed
class ExamDto with _$ExamDto {
  const factory ExamDto({
    DateTime? date,
    String? teacher,
    String? subject,
    String? classroom,
  }) = _ExamDto;

  factory ExamDto.fromJson(Map<String, dynamic> json) => _$ExamDtoFromJson(json);
}
