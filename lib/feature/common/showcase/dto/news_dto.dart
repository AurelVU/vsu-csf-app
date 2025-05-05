
import 'package:fkn/feature/common/showcase/dto/text_detail_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'news_dto.g.dart';

part 'news_dto.freezed.dart';

@JsonSerializable(
  includeIfNull: false,
  fieldRename: FieldRename.snake,
  createFactory: false,
)
@freezed
class NewsDto with _$NewsDto {
  const factory NewsDto({
    List<TextDetailDto>? text,
    String? title,
    DateTime? date,
    List<String>? pictures,
    String? link,
    String? type,

  }) = _NewsDto;

  factory NewsDto.fromJson(Map<String, dynamic> json) => _$NewsDtoFromJson(json);
}
