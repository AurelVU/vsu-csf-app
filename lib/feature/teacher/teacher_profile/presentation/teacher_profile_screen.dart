import 'package:auto_route/auto_route.dart';
import 'package:fkn/feature/teacher/teacher_profile/presentation/teacher_profile_presenter.dart';
import 'package:fkn/feature/teacher/teacher_profile/presentation/teacher_profile_screen_view.dart';
import 'package:fkn/utils/get_it_extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage()
class TeacherProfileScreen extends StatelessWidget {
  const TeacherProfileScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider<TeacherProfileScreenPresenter>(
      create: (context) => TeacherProfileScreenPresenter(
        router: context.router,
        profileManager: context.get(),
      )..init(),
      dispose: (context, presenter) => presenter.dispose(),
      child: const TeacherProfileScreenView(),
    );
  }
}
