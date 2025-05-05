import 'package:freezed_annotation/freezed_annotation.dart';

part 'allowed_mark.g.dart';

part 'allowed_mark.freezed.dart';

@JsonSerializable(
  includeIfNull: false,
  fieldRename: FieldRename.snake,
  createFactory: false,
)
@freezed
class AllowedMarkDto with _$AllowedMarkDto {
  const factory AllowedMarkDto({
    String? title,
    String? subtitle,
    @JsonKey(name: 'mark_id') String? markId,
  }) = _AllowedMarkDto;

  factory AllowedMarkDto.fromJson(Map<String, dynamic> json) => _$AllowedMarkDtoFromJson(json);
}
