import 'package:fkn/domain/showcase/faculty_news.dart';
import 'package:fkn/domain/showcase/news_pagination.dart';
import 'package:fkn/domain/showcase/text_detail.dart';
import 'package:fkn/feature/common/showcase/data/showcase_service.dart';
import 'package:fkn/feature/common/showcase/dto/news_pagination_dto.dart';
import 'package:intl/intl.dart';

class ShowcaseRepository {
  ShowcaseRepository(this._service);

  final ShowcaseService _service;

  // возможна пагинация
  Future<NewsPagination> getNews(
      {int page = 1, int limit = 20, required String group}) async {
    final response = await _service.getNewsByGroup(
        page: page, pageSize: limit, group: group);
    return mapDtoToObject(response);
  }

  NewsPagination mapDtoToObject(NewsPaginationDto dto) {
    int? nextPage;
    int? prevPage;
    try {
      if (dto.next != null) {
        nextPage =
            int.parse(Uri.parse(dto.next!).queryParameters['page'] ?? '');
      }
      if (dto.previous != null) {
        prevPage =
            int.parse(Uri.parse(dto.previous!).queryParameters['page'] ?? '');
      }
    } catch (e) {}
    return NewsPagination(
        count: dto.count,
        next: nextPage,
        previous: prevPage,
        results: dto.results
                ?.map(
                  (e) => FacultyNews(
                    date: e.date == null
                        ? ''
                        : DateFormat("dd MMMM yyyy", 'ru').format(e.date!),
                    title: e.title,
                    picture: e.pictures,
                    text: e.text?.map(
                          (e) {
                            return TextDetail(
                                text: e.text, link: e.link, type: e.type);
                          },
                        ).toList() ??
                        [],
                    type: e.type,
                    link: e.link,
                  ),
                )
                .toList() ??
            []);
  }
}
