import 'package:fkn/domain/career/partner_info.dart';
import 'package:fkn/domain/profile/list_rating.dart';
import 'package:fkn/environment/event_bus/event_bus.dart';
import 'package:fkn/environment/lifecycle_module.dart';
import 'package:fkn/feature/student/rating/data/career_repository.dart';
import 'package:rxdart/rxdart.dart';

class RatingManager extends LifecycleModule {
  RatingManager(
    this._careerRepository,
    this._eventBus,
  );

  final IEventBus _eventBus;
  final CareerRepository _careerRepository;

  final BehaviorSubject<List<PartnerInfo>> partnerStream = BehaviorSubject();

  // мапа <Номер семестра, Рейтинг за этот семестр>
  final BehaviorSubject<Map<int, List<ListRating>>> ratingStream =
      BehaviorSubject.seeded({});

  Future<void> updatePartnerInfo() async {
    partnerStream.value = await _careerRepository.getPartners();
  }

  Future<void> updateSemesterNumber({
    required int semester,
    required String year,
  }) async {
    final rating = await _careerRepository.getRatingByYearAndSemester(
        semester: semester, year: year);
    final map = ratingStream.value;
    if (rating != null) {
      map.putIfAbsent(semester, () => rating);
    }
    ratingStream.value = map;
  }
}
