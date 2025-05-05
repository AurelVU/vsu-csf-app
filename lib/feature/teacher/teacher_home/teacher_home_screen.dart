import 'package:auto_route/auto_route.dart';
import 'package:fkn/utils/get_it_extension.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'teacher_home_screen_presenter.dart';
import 'teacher_home_screen_view.dart';

@RoutePage()
class TeacherHomeScreen extends StatelessWidget {
  const TeacherHomeScreen({super.key, this.playAnimation = false});

  final bool playAnimation;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Provider<TeacherHomeScreenPresenter>(
        create: (context) => TeacherHomeScreenPresenter(
          router: context.router,
          eventBus: context.get(),
          consoleManager: context.get(),
          homeScrollController: ScrollController(),
          ratingScrollController: ScrollController(),
          timetableScrollController: DraggableScrollableController(),
          profile: context.get(),
          journalScrollController: ScrollController(),
          environment: context.read(),
        )..init(),
        dispose: (_, presenter) => presenter.dispose(),
        child: TeacherHomeScreenView(playAnimation: playAnimation),
      ),
    );
  }
}
