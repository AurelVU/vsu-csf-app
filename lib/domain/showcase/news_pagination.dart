import 'package:fkn/domain/showcase/faculty_news.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'news_pagination.freezed.dart';

// REFACTOR: При необходимости обобщить класс, используя дженерики
@freezed
class NewsPagination with _$NewsPagination {
  factory NewsPagination({
    int? count,
    List<FacultyNews>? results,
    int? next,
    int? previous,
  }) = _NewsPagination;
}
