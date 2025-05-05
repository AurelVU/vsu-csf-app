import 'package:auto_route/auto_route.dart';
import 'package:fkn/feature/common/auth/auth_screen_presenter.dart';
import 'package:fkn/feature/common/auth/auth_screen_view.dart';
import 'package:fkn/utils/get_it_extension.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

@RoutePage()
class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key, this.playAnimation = false}) : super(key: key);

  final bool playAnimation;

  @override
  Widget build(BuildContext context) {
    return Provider<AuthScreenPresenter>(
      create: (context) => AuthScreenPresenter(
        router: context.router,
        eventBus: context.get(),
        profile: context.get(),
        environment: context.read(),
        teacherProfile: context.get(),
      )..init(),
      dispose: (_, presenter) => presenter.dispose(),
      child: AuthScreenView(playAnimation: playAnimation),
    );
  }
}
