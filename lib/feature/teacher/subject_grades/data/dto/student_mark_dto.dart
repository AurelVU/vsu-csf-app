import 'package:freezed_annotation/freezed_annotation.dart';

part 'student_mark_dto.g.dart';

part 'student_mark_dto.freezed.dart';

@JsonSerializable(
  includeIfNull: false,
  fieldRename: FieldRename.snake,
  createFactory: false,
)
@freezed
class StudentMarkDto with _$StudentMarkDto {
  const factory StudentMarkDto({
    String? id,
    @JsonKey(name: 'first_name') String? firstName,
    @JsonKey(name: 'last_name') String? lastName,
    @JsonKey(name: 'middlename') String? middleName,
    int? exclude,
    @JsonKey(name: 'avg_ball') int? avgBall,
  }) = _StudentMarkDto;

  factory StudentMarkDto.fromJson(Map<String, dynamic> json) => _$StudentMarkDtoFromJson(json);
}
