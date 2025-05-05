import 'package:auto_route/auto_route.dart';
import 'package:fkn/feature/common/auth/login_teacher/presentation/login_teacher_presenter.dart';
import 'package:fkn/feature/common/auth/login_teacher/presentation/login_teacher_screen_view.dart';
import 'package:fkn/utils/get_it_extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
@RoutePage()
class LoginTeacherScreen extends StatelessWidget {
  const LoginTeacherScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider<LoginTeacherScreenPresenter>(
      create: (context) => LoginTeacherScreenPresenter(
        router: context.router,
        profileManager: context.get(),
      )..init(),
      dispose: (context, presenter) => presenter.dispose(),
      child: const LoginTeacherScreenView(),
    );
  }
}
