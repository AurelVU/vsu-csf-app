import 'package:fkn/environment/lifecycle_module.dart';
import 'package:fkn/feature/common/politic/data/politic_repository.dart';

class PoliticManager extends LifecycleModule {
  PoliticManager(
    this._politicRepository,
  );

  final PoliticRepository _politicRepository;

  Future<void> acceptPolitic() async {
    _politicRepository.acceptPolitic();
  }
}
