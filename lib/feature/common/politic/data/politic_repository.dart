import 'package:fkn/feature/common/politic/data/politic_service.dart';

class PoliticRepository {
  PoliticRepository(this._service);

  final PoliticService _service;

  Future<void> acceptPolitic() async {
    _service.acceptPolitic();
  }
}

