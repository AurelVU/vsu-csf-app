import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:fkn/domain/profile/user_data.dart';
import 'package:fkn/environment/lifecycle_module.dart';
import 'package:fkn/feature/student/profile/profile_manager.dart';
import 'package:fkn/router/router.dart';
import 'package:fkn/utils/dialog_utils.dart';
import 'package:fkn/utils/router_extensions.dart';
import 'package:rxdart/rxdart.dart';

class ProfileScreenPresenter extends LifecycleModule {
  ProfileScreenPresenter({
    required this.router,
    required this.profile,
  });

  final StackRouter router;
  final IProfile<UserData> profile;

  bool get userIsLoggedIn => profile.userData.valueOrNull != null;

  UserData? get userInfo => profile.userData.valueOrNull;

  /// Состояние кнопки авторизации
  /// Показывает состояние загрузки кнопки авторизации
  final BehaviorSubject<bool> isButtonLoadingStream =
      BehaviorSubject.seeded(false);

  @override
  Future<void> init() async {
    super.init();

    if (profile.userData.valueOrNull?.acceptPolitics == false) {
      router.navigate(const PoliticRoute());
    }

    await profile.updateUserData();

    if (profile.userData.valueOrNull?.acceptPolitics == false) {
      router.navigate(const PoliticRoute());
    }
    // if (profile.userData.valueOrNull?.acceptPolitics == false) {
    //   router.navigate(const PoliticRoute());
    // }
  }

  Future<void> logout() async {
    await showErrorDialog(
      context: router.navigatorKey.currentContext!,
      titleText: 'ВЫХОД ИЗ АККАУНТА',
      message: 'Вы уверены, что хотите выйти из аккаунта?',
      successButtonText: 'ВЫЙТИ',
      cancelButtonText: 'ОТМЕНИТЬ',
      onCancelTap: () => router.pop(),
      onSuccessTap: () {
        // REFACTOR: Необходимо реализовать более элегантный механизм навигации после выхода из аккаунта
        router.replace(WelcomeRoute());
        profile.logout();
      },
    );
  }

  Future<void> deleteProfile() async {
    await showErrorDialog(
      context: router.navigatorKey.currentContext!,
      titleText: 'УДАЛИТЬ АККАУНТ',
      successButtonText: 'УДАЛИТЬ',
      message:
          'Вы уверены, что хотите удалить аккаунт? Это действие нельзя отменить и вся информация будет удалена.',
      cancelButtonText: 'ОТМЕНИТЬ',
      onCancelTap: () => router.pop(),
      onSuccessTap: () {
        router.replace(WelcomeRoute());
        profile.deleteProfile();
      },
    );
  }

  // создать презентер для authScreen и вынести туда
  Future<void> loginAsStudent(String username, String password) async {
    // REFACTOR: Требуется создать валидатор и улучшить обработку ошибок в соответствии с требованиями UI/UX
    if (username.isEmpty) {
      router.showErrorSnackBar('Введите Логин');
      return;
    }
    if (password.isEmpty) {
      router.showErrorSnackBar('Введите пароль');
      return;
    }
    try {
      await profile.loginAsStudent(username, password);
      // profile.updateUserData();
      router.pop();
    } catch (e) {
      router.showErrorSnackBar('Такой пользователь не найден :(');
    }
  }
}
