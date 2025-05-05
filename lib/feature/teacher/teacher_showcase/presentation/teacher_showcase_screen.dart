import 'package:auto_route/auto_route.dart';
import 'package:fkn/feature/teacher/teacher_showcase/presentation/teacher_showcase_screen_view.dart';
import 'package:fkn/utils/get_it_extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'teacher_showcase_presenter.dart';

@RoutePage()
class TeacherShowcaseScreen extends StatelessWidget {
  const TeacherShowcaseScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider<TeacherShowcaseScreenPresenter>(
      create: (context) => TeacherShowcaseScreenPresenter(
        router: context.router,
        profileManager: context.get(),
        showcaseManager: context.get(),
        teacherTimeTableManager: context.get(),
      )..init(),
      dispose: (context, presenter) => presenter.dispose(),
      child: const TeacherShowcaseScreenView(),
    );
  }
}
