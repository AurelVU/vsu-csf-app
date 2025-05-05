
import 'package:freezed_annotation/freezed_annotation.dart';

part 'text_detail_dto.g.dart';
part 'text_detail_dto.freezed.dart';


@JsonSerializable(
  includeIfNull: false,
  fieldRename: FieldRename.snake,
  createFactory: false,
)
@freezed
class TextDetailDto with _$TextDetailDto {
  const factory TextDetailDto({
   String? link,
   String? text,
   String? type,

  }) = _TextDetailDto;

  factory TextDetailDto.fromJson(Map<String, dynamic> json) => _$TextDetailDtoFromJson(json);
}
