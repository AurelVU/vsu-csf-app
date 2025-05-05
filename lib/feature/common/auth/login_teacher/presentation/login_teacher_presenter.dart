import 'package:auto_route/auto_route.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:fkn/environment/lifecycle_module.dart';
import 'package:fkn/feature/teacher/teacher_profile/teacher_profile_manager.dart';
import 'package:fkn/router/router.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class LoginTeacherScreenPresenter extends LifecycleModule {
  LoginTeacherScreenPresenter({
    required this.profileManager,
    required this.router,
  });

  final TeacherProfileManager profileManager;
  final StackRouter router;

  final TextEditingController mailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController codeController = TextEditingController();
  final BehaviorSubject<bool> isMailStream = BehaviorSubject.seeded(true);

  final BehaviorSubject<bool> isError = BehaviorSubject.seeded(false);

  /// состояния для показа загрузки кнопки
  final BehaviorSubject<bool> isButtonActive = BehaviorSubject.seeded(true);

  /// сейчас страница с подтверждением кода или нет
  /// нужна для анимации
  /// выглядит как костыль
  final BehaviorSubject<bool> confirmCodePage = BehaviorSubject.seeded(false);

  void changeType() {
    confirmCodePage.value = false;
    isError.value = false;
    isMailStream.value = !isMailStream.value;
  }

  Future<void> getCode() async {
    if ((isMailStream.value && mailController.text.isEmpty) ||
        (!isMailStream.value && phoneController.text.isEmpty)) {
      isError.value = true;
      return;
    }
    try {
      if (isMailStream.value) {
        isButtonActive.value = false;
        await profileManager.loginAsTeacherByEmail(mailController.text);
        isButtonActive.value = true;
        confirmCodePage.value = true;
      }
    } catch (e) {
      isError.value = true;

      /// временное решение
      /// Гош, один контроллер isButtonActive это очень сильно
      /// как валидацию с ним будешь делать?)
      /// Вадим, хорош, только там вьюхи разные и валидация на них
      EasyDebounce.debounce(
        'teacher-getCode-debouncer',
        const Duration(milliseconds: 1500),
        () => isButtonActive.add(true),
      );
    }
  }

  Future<void> sendCode() async {
    if (codeController.text.isEmpty) {
      isError.value = true;
      return;
    }
    try {
      if (isMailStream.value) {
        isButtonActive.value = false;

        final response = await profileManager.confirmCode(
            mailController.text, codeController.text);
        if (response.authUrl != null) {
          await router.pop();
          await router.replace(
            PoliticWebViewRoute(url: response.authUrl ?? '', isStudent: false),
          );
          return;
        }
        await router.replace(
          TeacherHomeRoute(),
        );


      }
    } catch (e) {
      isError.value = true;
      EasyDebounce.debounce(
        'teacher-sendCode-debouncer',
        const Duration(milliseconds: 1500),
        () => isButtonActive.add(true),
      );
    }
    isButtonActive.value = true;
  }
}
