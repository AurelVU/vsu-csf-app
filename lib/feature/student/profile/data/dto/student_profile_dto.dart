
import 'package:fkn/feature/student/profile/data/dto/terms_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'student_profile_dto.g.dart';

part 'student_profile_dto.freezed.dart';

@JsonSerializable(
  includeIfNull: false,
  fieldRename: FieldRename.snake,
  createFactory: false,
)
@freezed
class StudentProfileDto with _$StudentProfileDto {
  const factory StudentProfileDto({
    @JsonKey(name: 'sub_group') int? subGroup,
    int? group,
    int? course,
    @JsonKey(name: 'full_name') String? fullName,
    @JsonKey(name: 'accept_politic') bool? acceptPolitic,
    @JsonKey(name: 'student_card') String? studentCard,
    List<TermsDto>? terms,
  }) = _StudentProfileDto;

  factory StudentProfileDto.fromJson(Map<String, dynamic> json) =>
      _$StudentProfileDtoFromJson(json);
}
