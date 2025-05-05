import 'package:fkn/environment/config/environment.dart';
import 'package:fkn/environment/config/environment_provider.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'startup_domains.dart';
import 'startup_widget_config.dart';

export 'startup_theme.dart';

class StartUpWidget extends StatelessWidget {
  const StartUpWidget({
    super.key,
    required this.container,
    required this.environment,
    required this.child,
  });

  final GetIt container;
  final Environment environment;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return StartUpDomains(
      container: container,
      child: EnvironmentProvider(
        environment: environment,
        dio: container.get(),
        child: StartUpWidgetConfig(child: child),
      ),
    );
  }
}
