import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:fkn/domain/profile/user_data.dart';
import 'package:fkn/environment/config/environment.dart';
import 'package:fkn/environment/event_bus/event_bus.dart';
import 'package:fkn/environment/lifecycle_module.dart';
import 'package:fkn/feature/student/profile/profile_manager.dart';
import 'package:fkn/feature/teacher/teacher_profile/teacher_profile_manager.dart';
import 'package:fkn/router/router.dart';
import 'package:fkn/utils/router_extensions.dart';
import 'package:rxdart/rxdart.dart';

class AuthScreenPresenter extends LifecycleModule {
  AuthScreenPresenter({
    required this.environment,
    required this.router,
    required this.eventBus,
    required this.profile,
    required this.teacherProfile,
  });

  final StackRouter router;
  final IEventBus eventBus;
  final IProfile<UserData> profile;
  final TeacherProfileManager teacherProfile;
  final Environment environment;

  final BehaviorSubject<bool> isButtonActive = BehaviorSubject.seeded(true);

  final BehaviorSubject<bool> isError = BehaviorSubject.seeded(false);

  Future<void> loginAsStudent(String username, String password) async {
    // REFACTOR: Требуется создать валидатор и улучшить обработку ошибок в соответствии с требованиями UI/UX
    if (username.isEmpty) {
      router.showErrorSnackBar('Введите Логин');
      isError.value = true;
      return;
    }
    if (password.isEmpty) {
      router.showErrorSnackBar('Введите пароль');
      isError.value = true;
      return;
    }
    isError.value = false;
    try {
      isButtonActive.value = false;
      isError.value = false;
      final response = await profile.loginAsStudent(username, password);
      if (response.authUrl != null) {
        await router.pop();
        await router.replace(
          PoliticWebViewRoute(url: response.authUrl ?? '', isStudent: true),
        );
        return;
      }

      await router.pop();
      await router.replace(StudentHomeRoute());
    } on DioException {
      rethrow;
    } catch (e) {
      isError.value = true;
    }

    isButtonActive.value = true;
  }
}
