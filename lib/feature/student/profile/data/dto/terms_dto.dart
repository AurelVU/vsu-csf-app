
import 'package:fkn/feature/student/profile/data/dto/marks_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'terms_dto.g.dart';

part 'terms_dto.freezed.dart';

@JsonSerializable(
  includeIfNull: false,
  fieldRename: FieldRename.snake,
  createFactory: false,
)
@freezed
class TermsDto with _$TermsDto {
  const factory TermsDto({
    int? numbers,
    String? year,
    List<MarksDto>? marks,
  }) = _TermsDto;

  factory TermsDto.fromJson(Map<String, dynamic> json) => _$TermsDtoFromJson(json);
}
