import 'package:auto_route/auto_route.dart';
import 'package:fkn/router/router.dart';
import 'package:fkn/router/routes.dart';

AutoRoute studentRouter = AutoRoute(
  path: Routes.home,
  page: StudentHomeRoute.page,
  children: [
    AutoRoute(
      initial: true,
      path: Routes.showcaseTab,
      page: ShowcaseTab.page,
      children: [
        CustomRoute(
          initial: true,
          customRouteBuilder: customBuilder,
          page: ShowcaseRoute.page,
          path: Routes.showcase,
        ),
        AutoRoute(
          page: NewsDetailRoute.page,
          path: Routes.newDetail,
        ),
        AutoRoute(
          page: AllNewRoute.page,
          path: Routes.allNews,
        ),
      ],
    ),
    AutoRoute(
      path: Routes.timeTableTab,
      page: TimeTableTab.page,
      children: [
        AutoRoute(
          initial: true,
          page: TimeTableRoute.page,
          path: Routes.timeTable,
        ),
        AutoRoute(
          page: BookmarkRoute.page,
        ),
        AutoRoute(
          page: TeacherTimetableBookmarkRoute.page,
        ),
      ],
    ),
    AutoRoute(
      path: Routes.profileTab,
      page: ProfileTab.page,
      children: [
        CustomRoute(
          initial: true,
          customRouteBuilder: customBuilder,
          page: ProfileRoute.page,
        ),
      ],
    ),
    AutoRoute(
      path: Routes.careerTab,
      page: CareerTab.page,
      children: [
        AutoRoute(
          initial: true,
          page: CareerRoute.page,
          path: Routes.career,
        ),
      ],
    ),
  ],
);
