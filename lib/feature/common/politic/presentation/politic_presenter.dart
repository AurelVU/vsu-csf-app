import 'package:auto_route/auto_route.dart';
import 'package:fkn/domain/profile/user_data.dart';
import 'package:fkn/environment/lifecycle_module.dart';
import 'package:fkn/feature/common/politic/politic_manager.dart';
import 'package:fkn/feature/student/profile/profile_manager.dart';
import 'package:fkn/utils/router_extensions.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../router/router.dart';

class PoliticScreenPresenter extends LifecycleModule {
  PoliticScreenPresenter({
    required this.manager,
    required this.router,
    required this.profile,
  });

  final PoliticManager manager;
  final StackRouter router;
  final IProfile<UserData> profile;

  final BehaviorSubject<bool> isPoliticAccept = BehaviorSubject.seeded(false);

  Future<void> acceptPolitic() async {
    await manager.acceptPolitic();
    router.popForced();
    profile.userData.value = profile.userData.value?.copyWith(
      acceptPolitics: true,
    );
  }

  Future<void> goBack() async {
    profile.logout();

    router.showErrorSnackBar('Вход в профиль недоступен из-за отсутствия согласия на поручение');
    router.replace(AuthRoute());
  }

  void changePoliticAgreement() {
    isPoliticAccept.value = !isPoliticAccept.value;
  }
}
