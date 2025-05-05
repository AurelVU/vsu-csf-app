import 'package:auto_route/auto_route.dart';
import 'package:fkn/feature/student/rating/student_rating/presentation/common_rating_presenter.dart';
import 'package:fkn/feature/student/rating/student_rating/presentation/common_rating_screen_view.dart';
import 'package:fkn/utils/get_it_extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// for router
// AutoRoute(
//  page: RatingRoute.page,
//  path: Routes.rating,
// ),
// in Routes
// static const rating = 'RatingScreen';

@RoutePage()
class RatingScreen extends StatefulWidget {
  const RatingScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<RatingScreen> createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Provider<CommonRatingScreenPresenter>(
      create: (context) => CommonRatingScreenPresenter(
        router: context.router,
        profile: context.get(),
        vsync: this,
        ratingManager: context.get(),
        deviceWidth: width,
      )..init(),
      dispose: (context, presenter) => presenter.dispose(),
      child: const CommonRatingScreenView(),
    );
  }
}
