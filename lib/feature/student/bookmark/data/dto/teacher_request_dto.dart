import 'package:freezed_annotation/freezed_annotation.dart';

part 'teacher_request_dto.g.dart';

part 'teacher_request_dto.freezed.dart';

@JsonSerializable(
  includeIfNull: false,
  fieldRename: FieldRename.snake,
  createFactory: false,
)
@freezed
class TeacherRequestDto with _$TeacherRequestDto {
  const factory TeacherRequestDto({
    @JsonKey(name: 'teacher_id') int? teacherId,
  }) = _TeacherRequestDto;

  factory TeacherRequestDto.fromJson(Map<String, dynamic> json) => _$TeacherRequestDtoFromJson(json);
}
