import 'package:fkn/environment/lifecycle_module.dart';
import 'package:fkn/feature/common/console/console_service.dart';
import 'package:fkn/feature/common/console/dto/console_parameter.dart';
import 'package:rxdart/rxdart.dart';

class ConsoleManager extends LifecycleModule {
  final ConsoleService _consoleService;

  final BehaviorSubject<List<ConsoleParameter>?> consoleParametersStream =
      BehaviorSubject.seeded(null);

  ConsoleManager(this._consoleService);


  Future<void> updateParameter() async {
    consoleParametersStream.value = await _consoleService.getConsoleParameter();
  }

  Future<List<ConsoleParameter>> getParameters() async {
    return _consoleService.getConsoleParameter();
  }
}
