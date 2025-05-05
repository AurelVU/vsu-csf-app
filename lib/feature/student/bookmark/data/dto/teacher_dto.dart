import 'package:freezed_annotation/freezed_annotation.dart';

part 'teacher_dto.g.dart';

part 'teacher_dto.freezed.dart';

@JsonSerializable(
  includeIfNull: false,
  fieldRename: FieldRename.snake,
  createFactory: false,
)
@freezed
class TeacherDto with _$TeacherDto {
  const factory TeacherDto({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'is_selected') bool? isSelected,
     String? middlename,
    @JsonKey(name: 'first_name') String? firstName,
    @JsonKey(name: 'last_name') String? lastName,
  }) = _TeacherDto;

  factory TeacherDto.fromJson(Map<String, dynamic> json) => _$TeacherDtoFromJson(json);
}
