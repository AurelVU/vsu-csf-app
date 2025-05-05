import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:fkn/environment/lifecycle_module.dart';
import 'package:fkn/feature/teacher/teacher_profile/teacher_profile_manager.dart';
import 'package:fkn/router/router.dart';
import 'package:fkn/utils/dialog_utils.dart';

class TeacherProfileScreenPresenter extends LifecycleModule {
  TeacherProfileScreenPresenter({
    required this.profileManager,
    required this.router,
  });

  @override
  Future<void> init() async {
    super.init();

    if (profileManager.teacherInfo.valueOrNull?.acceptPolitic == false) {
      router.navigate(const PoliticRoute());
    }

    try {
      await profileManager.updateUserData();
    } on DioException catch (e) {
      if (e.type == DioExceptionType.badResponse) {
        router.replace(AuthRoute());
        profileManager.logout();
      }
    }

    if (profileManager.teacherInfo.valueOrNull?.acceptPolitic == false) {
      router.navigate(const PoliticRoute());
    }
  }

  final StackRouter router;
  final TeacherProfileManager profileManager;

  Future<void> logout() async {
    await showErrorDialog(
      context: router.navigatorKey.currentContext!,
      titleText: 'Выход из аккаунт',
      message: 'Вы уверены, что хотите выйти из аккаунта?',
      successButtonText: 'Выйти',
      cancelButtonText: 'Отменить',
      onCancelTap: () => router.pop(),
      onSuccessTap: () {
        // REFACTOR: Необходимо реализовать более элегантный механизм навигации после выхода из аккаунта
        router.replace(WelcomeRoute());
        profileManager.logout();
      },
    );
  }

  Future<void> deleteProfile() async {
    await showErrorDialog(
      context: router.navigatorKey.currentContext!,
      titleText: 'Удалить аккаунт',
      successButtonText: 'Удалить',
      message:
          'Вы уверены, что хотите удалить аккаунт? Это действие нельзя отменить и вся информация будет удалена.',
      cancelButtonText: 'Отменить',
      onCancelTap: () => router.pop(),
      onSuccessTap: () async {
        await profileManager.deleteProfile();
        router.replace(WelcomeRoute());
      },
    );
  }
}
