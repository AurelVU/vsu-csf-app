import 'package:fkn/environment/lifecycle_module.dart';
import 'package:fkn/feature/common/welcome_screen/data/welcome_screen_repository.dart';


class WelcomeScreenManager extends LifecycleModule {
  WelcomeScreenManager(
    this._welcomeScreenRepository,
  );


  final WelcomeScreenRepository _welcomeScreenRepository;


}

