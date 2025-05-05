
import 'package:fkn/feature/student/timetable/dto/lesson_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'day_dto.g.dart';

part 'day_dto.freezed.dart';

@JsonSerializable(
  includeIfNull: false,
  fieldRename: FieldRename.snake,
  createFactory: false,
)
@freezed
class DayDto with _$DayDto {
  const factory DayDto({
    @DatetimeJsonConverter() DateTime? date,
    List<LessonDto>? lessons,
    bool? numerator,
  }) = _DayDto;

  factory DayDto.fromJson(Map<String, dynamic> json) => _$DayDtoFromJson(json);
}

class DatetimeJsonConverter extends JsonConverter<DateTime, String> {
  const DatetimeJsonConverter();

  @override
  DateTime fromJson(String json) => DateTime.parse(json).toLocal();

  @override
  String toJson(DateTime object) => object.toUtc().toIso8601String();
}
