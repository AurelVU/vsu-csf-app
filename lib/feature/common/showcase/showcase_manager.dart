import 'package:fkn/domain/showcase/faculty_news.dart';
import 'package:fkn/environment/event_bus/event_bus.dart';
import 'package:fkn/environment/lifecycle_module.dart';
import 'package:fkn/feature/common/showcase/data/showcase_repository.dart';
import 'package:rxdart/rxdart.dart';

class ShowcaseManager extends LifecycleModule {
  ShowcaseManager(
    this._showcaseRepository,
    this._eventBus,
  );

  final IEventBus _eventBus;
  final ShowcaseRepository _showcaseRepository;

  final BehaviorSubject<List<FacultyNews>?> departmentNewsPreviewStream =
      BehaviorSubject.seeded(null);

  final BehaviorSubject<List<FacultyNews>?> universityNewsPreviewStream =
      BehaviorSubject.seeded(null);

  final BehaviorSubject<List<FacultyNews>?> careerNewsPreviewStream =
      BehaviorSubject.seeded(null);


  @override
  void init() {}

  Future<void> updateDepartmentPreview() async {
    final response = await _showcaseRepository.getNews(
      limit: 10,
      group: 'cs_vsu',
    );
    departmentNewsPreviewStream.value = response.results;
  }

  Future<void> updateUniversityPreview() async {
    final response = await _showcaseRepository.getNews(
      limit: 10,
      group: 'vsumain',
    );
    universityNewsPreviewStream.value = response.results;
  }

  Future<void> updateCareerPreview() async {
    final response = await _showcaseRepository.getNews(
      limit: 10,
      group: 'admin_panel',
    );
    careerNewsPreviewStream.value = response.results;
  }
}
