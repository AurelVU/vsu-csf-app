import 'package:auto_route/auto_route.dart';
import 'package:fkn/feature/common/welcome_screen/presentation/welcome_screen_presenter.dart';
import 'package:fkn/feature/common/welcome_screen/presentation/welcome_screen_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// welcomeScreen
// @singleton
// static final WelcomeScreenRepository _welcomeScreenRepository =
//     WelcomeScreenRepository(WelcomeScreenService(_dio));
//
// @singleton
// WelcomeScreenRepository get welcomeScreenRepository => _welcomeScreenRepository;
//
// static final WelcomeScreenManager _welcomeScreenManager =
//     WelcomeScreenManager(_welcomeScreenRepository);
//
// @singleton
// WelcomeScreenManager get welcomeScreenManager => _welcomeScreenManager;

// for router
// AutoRoute(
//  page: WelcomeScreenRoute.page,
//  path: Routes.welcomeScreen,
// ),
// in Routes
// static const welcomeScreen = 'WelcomeScreenScreen';

@RoutePage()
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({
    Key? key,
    this.playAnimation = false,
  }) : super(key: key);

  final bool playAnimation;

  @override
  Widget build(BuildContext context) {
    return Provider<WelcomeScreenScreenPresenter>(
      create: (context) => WelcomeScreenScreenPresenter(
        router: context.router,
      )..init(),
      dispose: (context, presenter) => presenter.dispose(),
      child: WelcomeScreenView(
        playAnimation: playAnimation,
      ),
    );
  }
}
