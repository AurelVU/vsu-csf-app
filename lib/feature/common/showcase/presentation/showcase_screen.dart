import 'package:auto_route/auto_route.dart';
import 'package:fkn/feature/common/showcase/presentation/showcase_presenter.dart';
import 'package:fkn/feature/common/showcase/presentation/showcase_screen_view.dart';
import 'package:fkn/feature/common/showcase/showcase_manager.dart';
import 'package:fkn/utils/get_it_extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage()
class ShowcaseScreen extends StatelessWidget {
  const ShowcaseScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider<ShowcaseScreenPresenter>(
      create: (context) => ShowcaseScreenPresenter(
        router: context.router,
        showcaseManager: context.get<ShowcaseManager>(),
        timeTableManager: context.get(),
        profile: context.get(),
      )..init(),
      dispose: (context, presenter) => presenter.dispose(),
      child: const ShowcaseScreenView(),
    );
  }
}
