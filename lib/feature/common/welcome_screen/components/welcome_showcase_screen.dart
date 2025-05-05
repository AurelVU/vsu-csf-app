import 'package:auto_route/auto_route.dart';
import 'package:fkn/feature/common/showcase/showcase_manager.dart';
import 'package:fkn/feature/common/welcome_screen/components/welcome_showcase_presenter.dart';
import 'package:fkn/feature/common/welcome_screen/components/welcome_showcase_screen_view.dart';
import 'package:fkn/utils/get_it_extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage()
class WelcomeShowcaseScreen extends StatelessWidget {
  const WelcomeShowcaseScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider<WelcomeShowcaseScreenPresenter>(
      create: (context) => WelcomeShowcaseScreenPresenter(
        router: context.router,
        showcaseManager: context.get<ShowcaseManager>(),
      )..init(),
      dispose: (context, presenter) => presenter.dispose(),
      child: const WelcomeShowcaseScreenView(),
    );
  }
}
