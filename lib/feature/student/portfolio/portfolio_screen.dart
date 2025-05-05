import 'package:auto_route/auto_route.dart';
import 'package:fkn/domain/profile/user_data.dart';
import 'package:fkn/feature/student/portfolio/portfolio_presenter.dart';
import 'package:fkn/feature/student/portfolio/portfolio_screen_view.dart';
import 'package:fkn/feature/student/profile/profile_manager.dart';
import 'package:fkn/utils/get_it_extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage()
class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Provider<PortfolioScreenPresenter>(
      create: (context) => PortfolioScreenPresenter(
        router: context.router,
        profile: context.get<IProfile<UserData>>(),
      )..init(),
      dispose: (context, presenter) => presenter.dispose(),
      child: const PortfolioScreenView(),
    );
  }
}
