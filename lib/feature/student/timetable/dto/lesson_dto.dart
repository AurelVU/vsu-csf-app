
import 'package:freezed_annotation/freezed_annotation.dart';

part 'lesson_dto.g.dart';

part 'lesson_dto.freezed.dart';

@JsonSerializable(
  includeIfNull: false,
  fieldRename: FieldRename.snake,
  createFactory: false,
)
@freezed
class LessonDto with _$LessonDto {
  const factory LessonDto({
    String? teacher,
    String? classroom,
    @JsonKey(name: 'start_time') String? startTime,
    @JsonKey(name: 'finish_time') String? finishTime,
    String? subject,
    @JsonKey(name: 'is_distant') bool? isDistant,
    int? id,
  }) = _LessonDto;

  factory LessonDto.fromJson(Map<String, dynamic> json) => _$LessonDtoFromJson(json);
}
