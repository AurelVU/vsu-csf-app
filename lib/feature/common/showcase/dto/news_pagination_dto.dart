import 'package:freezed_annotation/freezed_annotation.dart';

import 'news_dto.dart';

part 'news_pagination_dto.freezed.dart';
part 'news_pagination_dto.g.dart';

// REFACTOR: При необходимости обобщить класс, используя дженерики
@freezed
@JsonSerializable(
  includeIfNull: false,
  fieldRename: FieldRename.snake,
  createFactory: false,
)
class NewsPaginationDto with _$NewsPaginationDto {
  factory NewsPaginationDto({
    int? count,
    List<NewsDto>? results,
    String? description,
    String? next,
    String? previous,
  }) = _NewsPaginationDto;

  factory NewsPaginationDto.fromJson(Map<String, dynamic> json) =>
      _$NewsPaginationDtoFromJson(json);
}
