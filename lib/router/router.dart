import 'package:auto_route/auto_route.dart';
import 'package:fkn/domain/showcase/faculty_news.dart';
import 'package:fkn/feature/common/auth/auth_screen.dart';
import 'package:fkn/feature/common/auth/login_teacher/presentation/login_teacher_screen.dart';
import 'package:fkn/feature/common/config/debug_screen/debug_screen.dart';
import 'package:fkn/feature/common/console/force_update_screen.dart';
import 'package:fkn/feature/common/console/network/no_network_screen.dart';
import 'package:fkn/feature/common/console/tech_work_screen.dart';
import 'package:fkn/feature/common/politic/presentation/politic_screen.dart';
import 'package:fkn/feature/common/news/all_news_screen.dart';
import 'package:fkn/feature/common/showcase/presentation/showcase_presenter.dart';
import 'package:fkn/feature/common/showcase/presentation/showcase_screen.dart';
import 'package:fkn/feature/common/splash/splash_screen.dart';
import 'package:fkn/feature/common/welcome_screen/components/welcome_showcase_screen.dart';
import 'package:fkn/feature/common/welcome_screen/presentation/welcome_screen_screen.dart';
import 'package:fkn/feature/student/bookmark/presentation/bookmark_screen.dart';
import 'package:fkn/feature/student/home/home_screen.dart';
import 'package:fkn/feature/student/portfolio/portfolio_screen.dart';
import 'package:fkn/feature/student/profile/presentation/profile_screen.dart';
import 'package:fkn/feature/student/rating/presentation/career_screen.dart';
import 'package:fkn/feature/student/rating/student_rating/presentation/common_rating_screen.dart';
import 'package:fkn/feature/student/teacher_timetable/presentation/teacher_timetable_bookmark_screen.dart';
import 'package:fkn/feature/student/timetable/presentation/timetable_screen/timetable_screen.dart';
import 'package:fkn/feature/teacher/teacher_home/teacher_home_screen.dart';
import 'package:fkn/feature/teacher/teacher_journal/presentation/teacher_journal_screen.dart';
import 'package:fkn/feature/teacher/teacher_profile/presentation/teacher_profile_screen.dart';
import 'package:fkn/feature/teacher/teacher_showcase/presentation/teacher_showcase_screen.dart';
import 'package:fkn/feature/teacher/teacher_timetable/presentation/teacher_timetable_screen.dart';
import 'package:fkn/feature/teacher/teacher_attendance_journal/presentation/teacher_attendance_journal_screen.dart';
import 'package:fkn/feature/teacher/subject_grades/presentation/subject_grades_screen.dart';
import 'package:fkn/router/routes.dart';
import 'package:fkn/router/student_router.dart';
import 'package:fkn/router/teacher_router.dart';
import 'package:fkn/uikit/showcase/news_detail_screen.dart';
import 'package:fkn/uikit/showcase/pdf_screen.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../feature/common/web_view/politics_web_view_screen.dart';

part 'router.gr.dart';

MaterialPageRoute<T> customBuilder<T>(
  BuildContext context,
  Widget child,
  AutoRoutePage<T> page,
) {
  return MaterialWithModalsPageRoute<T>(
    settings: page,
    fullscreenDialog: true,
    builder: (_) => child,
  );
}

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => <AutoRoute>[
        AutoRoute(
          page: PortfolioRoute.page,
          path: Routes.portfolio,
        ),
        AutoRoute(
          path: '/${DebugRoute.name}',
          page: DebugRoute.page,
        ),
        AutoRoute(
          page: ForceUpdateRoute.page,
        ),
        AutoRoute(
          page: AllNewRoute.page,
        ),
        AutoRoute(
          page: NewsDetailRoute.page,
        ),
        AutoRoute(
          page: TechWorkRoute.page,
        ),
        AutoRoute(
          page: SplashRoute.page,
        ),
        AutoRoute(
          page: NoNetworkRoute.page,
          path: Routes.noNetwork,
        ),
        AutoRoute(
          page: PoliticRoute.page,
          path: Routes.politic,
        ),
        AutoRoute(
          page: WelcomeRoute.page,
        ),
        AutoRoute(
          page: WelcomeShowcaseRoute.page,
        ),
        studentRouter,
        teacherRouter,
        AutoRoute(
          page: PoliticWebViewRoute.page,
          path: '/${PoliticWebViewRoute.name}',
        ),
        AutoRoute(
          page: RatingRoute.page,
          path: '/${RatingRoute.name}',
        ),
        AutoRoute(
          page: AuthRoute.page,
          path: '/',
          initial: true,
        ),
      ];
}

@RoutePage(name: 'ShowcaseTab')
class ShowcaseTabScreen extends AutoRouter {
  const ShowcaseTabScreen({super.key});
}

@RoutePage(name: 'TimeTableTab')
class TimeTableTabScreen extends AutoRouter {
  const TimeTableTabScreen({super.key});
}

@RoutePage(name: 'CareerTab')
class CareerTabScreen extends AutoRouter {
  const CareerTabScreen({super.key});
}

@RoutePage(name: 'ProfileTab')
class ProfileTabScreen extends AutoRouter {
  const ProfileTabScreen({super.key});
}
