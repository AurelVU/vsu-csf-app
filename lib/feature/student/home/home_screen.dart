import 'package:auto_route/auto_route.dart';
import 'package:fkn/utils/get_it_extension.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'home_screen_presenter.dart';
import 'home_screen_view.dart';

@RoutePage()
class StudentHomeScreen extends StatelessWidget {
  const StudentHomeScreen({super.key, this.playAnimation = false});

  final bool playAnimation;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Provider<HomeScreenPresenter>(
        create: (context) => HomeScreenPresenter(
          router: context.router,
          eventBus: context.get(),
          profile: context.get(),
          consoleManager: context.get(),
          homeScrollController: ScrollController(),
          ratingScrollController: ScrollController(),
          timetableScrollController: DraggableScrollableController(),
          environment: context.read(),
        )..init(),
        dispose: (_, presenter) => presenter.dispose(),
        child: StudentHomeScreenView(playAnimation: playAnimation),
      ),
    );
  }
}
