import 'package:auto_route/auto_route.dart';
import 'package:fkn/domain/showcase/univ_info.dart';
import 'package:fkn/environment/lifecycle_module.dart';
import 'package:rxdart/rxdart.dart';

class WelcomeScreenScreenPresenter extends LifecycleModule {
  WelcomeScreenScreenPresenter({
    required this.router,
  });

  final BehaviorSubject<List<UnivInfo>> universities = BehaviorSubject.seeded([
    const UnivInfo(name: 'Воронежский государственный университет'),
  ]);

  final StackRouter router;

  Future<void> searchByRegex({String? regex}) async {
    /// здесь запрос на бек
  }
}
