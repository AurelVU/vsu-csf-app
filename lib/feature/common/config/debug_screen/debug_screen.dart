import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'debug_screen_presenter.dart';
import 'debug_screen_view.dart';

@RoutePage()
class DebugScreen extends StatelessWidget {
  const DebugScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider<DebugScreenPresenter>(
      create: (context) => DebugScreenPresenter(
        router: context.router,
        environment: context.read(),
      )..init(),
      dispose: (context, presenter) => presenter.dispose(),
      child: const DebugScreenView(),
    );
  }
}
