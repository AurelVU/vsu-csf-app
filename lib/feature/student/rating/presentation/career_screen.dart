import 'package:auto_route/auto_route.dart';
import 'package:fkn/feature/student/rating/rating_manager.dart';
import 'package:fkn/feature/student/rating/presentation/career_presenter.dart';
import 'package:fkn/feature/student/rating/presentation/career_screen_view.dart';
import 'package:fkn/utils/get_it_extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage()
class CareerScreen extends StatelessWidget {
  const CareerScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Provider<RatingScreenPresenter>(
      create: (context) => RatingScreenPresenter(
        router: context.router,
        ratingManager: context.get<RatingManager>(),
        profile: context.get(),
        deviceWidth: width,
      )..init(),
      dispose: (context, presenter) => presenter.dispose(),
      child: const CareerScreenView(),
    );
  }
}
