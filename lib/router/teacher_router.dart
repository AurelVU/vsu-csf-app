import 'package:auto_route/auto_route.dart';
import 'package:fkn/router/router.dart';
import 'package:fkn/router/routes.dart';

@RoutePage(name: 'TeacherShowcaseTab')
class TeacherShowcaseTabScreen extends AutoRouter {
  const TeacherShowcaseTabScreen({super.key});
}

@RoutePage(name: 'TeacherTimeTableTab')
class TeacherTimeTableTabScreen extends AutoRouter {
  const TeacherTimeTableTabScreen({super.key});
}

@RoutePage(name: 'TeacherJournalTab')
class TeacherJournalTabScreen extends AutoRouter {
  const TeacherJournalTabScreen({super.key});
}

@RoutePage(name: 'TeacherProfileTab')
class TeacherProfileTabScreen extends AutoRouter {
  const TeacherProfileTabScreen({super.key});
}

AutoRoute teacherRouter = AutoRoute(
  path: TeacherRoutes.home,
  page: TeacherHomeRoute.page,
  children: [
    AutoRoute(
      initial: true,
      path: TeacherRoutes.teacherShowcaseProfileTab,
      page: TeacherShowcaseTab.page,
      children: [
        CustomRoute(
          initial: true,
          customRouteBuilder: customBuilder,
          page: TeacherShowcaseRoute.page,
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
        AutoRoute(
          page: TeacherAttendanceJournalRoute.page,
          path: TeacherRoutes.attendance,
        ),
      ],
    ),
    AutoRoute(
      path: TeacherRoutes.teacherTimetableProfileTab,
      page: TeacherTimeTableTab.page,
      children: [
        AutoRoute(
          initial: true,
          page: TeacherTimetableRoute.page,
          path: Routes.timeTable,
        ),
        AutoRoute(
          page: TeacherAttendanceJournalRoute.page,
          path: TeacherRoutes.attendance,
        ),
      ],
    ),
    AutoRoute(
      path: TeacherRoutes.teacherProfileTab,
      page: TeacherProfileTab.page,
      children: [
        CustomRoute(
          initial: true,
          customRouteBuilder: customBuilder,
          page: TeacherProfileRoute.page,
        ),
      ],
    ),
    AutoRoute(
      path: TeacherRoutes.teacherJournalProfileTab,
      page: TeacherJournalTab.page,
      children: [
        AutoRoute(
          initial: true,
          page: TeacherJournalRoute.page,
          path: Routes.career,
        ),
        AutoRoute(
          page: TeacherAttendanceJournalRoute.page,
          path: TeacherRoutes.attendance,
        ),
        AutoRoute(
          page: SubjectGradesRoute.page,
          path: TeacherRoutes.subjectGrades,
        ),
      ],
    ),
  ],
);
