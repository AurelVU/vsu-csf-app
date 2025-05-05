import 'package:fkn/feature/student/timetable/dto/day_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'timetable_dto.g.dart';

part 'timetable_dto.freezed.dart';

@JsonSerializable(
  includeIfNull: false,
  fieldRename: FieldRename.snake,
  createFactory: false,
)
@freezed
class TimeTableDto with _$TimeTableDto {
  const factory TimeTableDto({
    List<DayDto>? days,
    bool? numerator,
  }) = _TimeTableDto;

  factory TimeTableDto.fromJson(Map<String, dynamic> json) => _$TimeTableDtoFromJson(json);
}
