import 'package:freezed_annotation/freezed_annotation.dart';

part 'mark_dto.g.dart';

part 'mark_dto.freezed.dart';

@JsonSerializable(
  includeIfNull: false,
  fieldRename: FieldRename.snake,
  createFactory: false,
)
@freezed
class MarkDto with _$MarkDto {
  const factory MarkDto({
    @JsonKey(name: 'student_id') String? studentId,
    @JsonKey(name: 'mark_id') String? markId,
    String? value,
    String? color,
    @JsonKey(name: 'can_edit') bool? canEdit,
  }) = _MarkDto;

  factory MarkDto.fromJson(Map<String, dynamic> json) => _$MarkDtoFromJson(json);
}
