import 'package:fkn/domain/showcase/faculty_news.dart';
import 'package:fkn/environment/event_bus/event_bus.dart';
import 'package:fkn/environment/lifecycle_module.dart';
import 'package:fkn/feature/common/showcase/data/showcase_repository.dart';
import 'package:rxdart/rxdart.dart';

class AllNewsManager extends LifecycleModule {
  AllNewsManager(
    this._showcaseRepository,
    this._eventBus,
  );

  final IEventBus _eventBus;
  final ShowcaseRepository _showcaseRepository;

  final BehaviorSubject<List<FacultyNews>?> newsStream =
      BehaviorSubject.seeded(null);

  @override
  void init() {

  }

  Future<void> loadUniversityNews({int page = 1, required String group}) async {
    final response =
        await _showcaseRepository.getNews(page: page, limit: 20, group: group);
    newsStream.value = [
      ...(newsStream.value ?? []),
      ...(response.results ?? [])
    ];
  }

}
