import 'package:auto_route/auto_route.dart';
import 'package:fkn/environment/lifecycle_module.dart';
import 'package:fkn/feature/student/profile/profile_manager.dart';

import '../../../domain/profile/user_data.dart';

class PortfolioScreenPresenter extends LifecycleModule {
  PortfolioScreenPresenter({
    required this.router,
    required this.profile,
  });

  final StackRouter router;
  final IProfile<UserData> profile;

}
