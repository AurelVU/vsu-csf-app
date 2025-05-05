import 'package:auto_route/auto_route.dart';
import 'package:fkn/feature/common/politic/presentation/politic_presenter.dart';
import 'package:fkn/feature/common/politic/presentation/politic_screen_view.dart';
import 'package:fkn/utils/get_it_extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


@RoutePage()
class PoliticScreen extends StatelessWidget {
  const PoliticScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider<PoliticScreenPresenter>(
      create: (context) => PoliticScreenPresenter(
        router: context.router,
        manager: context.get(),
        profile: context.get(),
      )..init(),
      dispose: (context, presenter) => presenter.dispose(),
      child: const PoliticScreenView(),
    );
  }
}
