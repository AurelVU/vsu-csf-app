// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AllNewRoute.name: (routeData) {
      final args = routeData.argsAs<AllNewRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AllNewScreen(
          key: args.key,
          title: args.title,
          type: args.type,
        ),
      );
    },
    AuthRoute.name: (routeData) {
      final args =
          routeData.argsAs<AuthRouteArgs>(orElse: () => const AuthRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AuthScreen(
          key: args.key,
          playAnimation: args.playAnimation,
        ),
      );
    },
    BookmarkRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const BookmarkScreen(),
      );
    },
    CareerRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CareerScreen(),
      );
    },
    CareerTab.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CareerTabScreen(),
      );
    },
    DebugRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DebugScreen(),
      );
    },
    ForceUpdateRoute.name: (routeData) {
      final args = routeData.argsAs<ForceUpdateRouteArgs>(
          orElse: () => const ForceUpdateRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ForceUpdateScreen(
          key: args.key,
          text: args.text,
        ),
      );
    },
    LoginTeacherRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoginTeacherScreen(),
      );
    },
    NewsDetailRoute.name: (routeData) {
      final args = routeData.argsAs<NewsDetailRouteArgs>(
          orElse: () => const NewsDetailRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: NewsDetailScreen(
          key: args.key,
          index: args.index,
          news: args.news,
          presenter: args.presenter,
          title: args.title,
        ),
      );
    },
    NoNetworkRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NoNetworkScreen(),
      );
    },
    PdfRoute.name: (routeData) {
      final args = routeData.argsAs<PdfRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PdfScreen(
          key: args.key,
          facultyNews: args.facultyNews,
        ),
      );
    },
    PoliticRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PoliticScreen(),
      );
    },
    PoliticWebViewRoute.name: (routeData) {
      final args = routeData.argsAs<PoliticWebViewRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PoliticWebViewScreen(
          key: args.key,
          url: args.url,
          isStudent: args.isStudent,
        ),
      );
    },
    PortfolioRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PortfolioScreen(),
      );
    },
    ProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfileScreen(),
      );
    },
    ProfileTab.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfileTabScreen(),
      );
    },
    RatingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RatingScreen(),
      );
    },
    ShowcaseRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ShowcaseScreen(),
      );
    },
    ShowcaseTab.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ShowcaseTabScreen(),
      );
    },
    SplashRoute.name: (routeData) {
      final args = routeData.argsAs<SplashRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SplashScreen(
          key: args.key,
          onComplete: args.onComplete,
        ),
      );
    },
    StudentHomeRoute.name: (routeData) {
      final args = routeData.argsAs<StudentHomeRouteArgs>(
          orElse: () => const StudentHomeRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: StudentHomeScreen(
          key: args.key,
          playAnimation: args.playAnimation,
        ),
      );
    },
    SubjectGradesRoute.name: (routeData) {
      final args = routeData.argsAs<SubjectGradesRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SubjectGradesScreen(
          key: args.key,
          groupIds: args.groupIds,
          lessonId: args.lessonId,
          lessonName: args.lessonName,
          title: args.title,
          subjectId: args.subjectId,
          markType: args.markType,
        ),
      );
    },
    TeacherAttendanceJournalRoute.name: (routeData) {
      final args = routeData.argsAs<TeacherAttendanceJournalRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: TeacherAttendanceJournalScreen(
          key: args.key,
          groupIds: args.groupIds,
          lessonId: args.lessonId,
          lessonName: args.lessonName,
          title: args.title,
          date: args.date,
          subjectId: args.subjectId,
          markType: args.markType,
        ),
      );
    },
    TeacherHomeRoute.name: (routeData) {
      final args = routeData.argsAs<TeacherHomeRouteArgs>(
          orElse: () => const TeacherHomeRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: TeacherHomeScreen(
          key: args.key,
          playAnimation: args.playAnimation,
        ),
      );
    },
    TeacherJournalRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TeacherJournalScreen(),
      );
    },
    TeacherJournalTab.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TeacherJournalTabScreen(),
      );
    },
    TeacherProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TeacherProfileScreen(),
      );
    },
    TeacherProfileTab.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TeacherProfileTabScreen(),
      );
    },
    TeacherShowcaseRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TeacherShowcaseScreen(),
      );
    },
    TeacherShowcaseTab.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TeacherShowcaseTabScreen(),
      );
    },
    TeacherTimeTableTab.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TeacherTimeTableTabScreen(),
      );
    },
    TeacherTimetableBookmarkRoute.name: (routeData) {
      final args = routeData.argsAs<TeacherTimetableBookmarkRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: TeacherTimetableBookmarkScreen(
          key: args.key,
          teacherId: args.teacherId,
          title: args.title,
        ),
      );
    },
    TeacherTimetableRoute.name: (routeData) {
      final args = routeData.argsAs<TeacherTimetableRouteArgs>(
          orElse: () => const TeacherTimetableRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: TeacherTimetableScreen(
          key: args.key,
          returnToToday: args.returnToToday,
        ),
      );
    },
    TechWorkRoute.name: (routeData) {
      final args = routeData.argsAs<TechWorkRouteArgs>(
          orElse: () => const TechWorkRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: TechWorkScreen(
          key: args.key,
          text: args.text,
        ),
      );
    },
    TimeTableRoute.name: (routeData) {
      final args = routeData.argsAs<TimeTableRouteArgs>(
          orElse: () => const TimeTableRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: TimeTableScreen(
          key: args.key,
          returnToToday: args.returnToToday,
        ),
      );
    },
    TimeTableTab.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TimeTableTabScreen(),
      );
    },
    WelcomeRoute.name: (routeData) {
      final args = routeData.argsAs<WelcomeRouteArgs>(
          orElse: () => const WelcomeRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WelcomeScreen(
          key: args.key,
          playAnimation: args.playAnimation,
        ),
      );
    },
    WelcomeShowcaseRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const WelcomeShowcaseScreen(),
      );
    },
  };
}

/// generated route for
/// [AllNewScreen]
class AllNewRoute extends PageRouteInfo<AllNewRouteArgs> {
  AllNewRoute({
    Key? key,
    required String title,
    required String type,
    List<PageRouteInfo>? children,
  }) : super(
          AllNewRoute.name,
          args: AllNewRouteArgs(
            key: key,
            title: title,
            type: type,
          ),
          initialChildren: children,
        );

  static const String name = 'AllNewRoute';

  static const PageInfo<AllNewRouteArgs> page = PageInfo<AllNewRouteArgs>(name);
}

class AllNewRouteArgs {
  const AllNewRouteArgs({
    this.key,
    required this.title,
    required this.type,
  });

  final Key? key;

  final String title;

  final String type;

  @override
  String toString() {
    return 'AllNewRouteArgs{key: $key, title: $title, type: $type}';
  }
}

/// generated route for
/// [AuthScreen]
class AuthRoute extends PageRouteInfo<AuthRouteArgs> {
  AuthRoute({
    Key? key,
    bool playAnimation = false,
    List<PageRouteInfo>? children,
  }) : super(
          AuthRoute.name,
          args: AuthRouteArgs(
            key: key,
            playAnimation: playAnimation,
          ),
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static const PageInfo<AuthRouteArgs> page = PageInfo<AuthRouteArgs>(name);
}

class AuthRouteArgs {
  const AuthRouteArgs({
    this.key,
    this.playAnimation = false,
  });

  final Key? key;

  final bool playAnimation;

  @override
  String toString() {
    return 'AuthRouteArgs{key: $key, playAnimation: $playAnimation}';
  }
}

/// generated route for
/// [BookmarkScreen]
class BookmarkRoute extends PageRouteInfo<void> {
  const BookmarkRoute({List<PageRouteInfo>? children})
      : super(
          BookmarkRoute.name,
          initialChildren: children,
        );

  static const String name = 'BookmarkRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CareerScreen]
class CareerRoute extends PageRouteInfo<void> {
  const CareerRoute({List<PageRouteInfo>? children})
      : super(
          CareerRoute.name,
          initialChildren: children,
        );

  static const String name = 'CareerRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CareerTabScreen]
class CareerTab extends PageRouteInfo<void> {
  const CareerTab({List<PageRouteInfo>? children})
      : super(
          CareerTab.name,
          initialChildren: children,
        );

  static const String name = 'CareerTab';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [DebugScreen]
class DebugRoute extends PageRouteInfo<void> {
  const DebugRoute({List<PageRouteInfo>? children})
      : super(
          DebugRoute.name,
          initialChildren: children,
        );

  static const String name = 'DebugRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ForceUpdateScreen]
class ForceUpdateRoute extends PageRouteInfo<ForceUpdateRouteArgs> {
  ForceUpdateRoute({
    Key? key,
    String? text,
    List<PageRouteInfo>? children,
  }) : super(
          ForceUpdateRoute.name,
          args: ForceUpdateRouteArgs(
            key: key,
            text: text,
          ),
          initialChildren: children,
        );

  static const String name = 'ForceUpdateRoute';

  static const PageInfo<ForceUpdateRouteArgs> page =
      PageInfo<ForceUpdateRouteArgs>(name);
}

class ForceUpdateRouteArgs {
  const ForceUpdateRouteArgs({
    this.key,
    this.text,
  });

  final Key? key;

  final String? text;

  @override
  String toString() {
    return 'ForceUpdateRouteArgs{key: $key, text: $text}';
  }
}

/// generated route for
/// [LoginTeacherScreen]
class LoginTeacherRoute extends PageRouteInfo<void> {
  const LoginTeacherRoute({List<PageRouteInfo>? children})
      : super(
          LoginTeacherRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginTeacherRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [NewsDetailScreen]
class NewsDetailRoute extends PageRouteInfo<NewsDetailRouteArgs> {
  NewsDetailRoute({
    Key? key,
    String? index,
    FacultyNews? news,
    ShowcaseScreenPresenter? presenter,
    String? title,
    List<PageRouteInfo>? children,
  }) : super(
          NewsDetailRoute.name,
          args: NewsDetailRouteArgs(
            key: key,
            index: index,
            news: news,
            presenter: presenter,
            title: title,
          ),
          initialChildren: children,
        );

  static const String name = 'NewsDetailRoute';

  static const PageInfo<NewsDetailRouteArgs> page =
      PageInfo<NewsDetailRouteArgs>(name);
}

class NewsDetailRouteArgs {
  const NewsDetailRouteArgs({
    this.key,
    this.index,
    this.news,
    this.presenter,
    this.title,
  });

  final Key? key;

  final String? index;

  final FacultyNews? news;

  final ShowcaseScreenPresenter? presenter;

  final String? title;

  @override
  String toString() {
    return 'NewsDetailRouteArgs{key: $key, index: $index, news: $news, presenter: $presenter, title: $title}';
  }
}

/// generated route for
/// [NoNetworkScreen]
class NoNetworkRoute extends PageRouteInfo<void> {
  const NoNetworkRoute({List<PageRouteInfo>? children})
      : super(
          NoNetworkRoute.name,
          initialChildren: children,
        );

  static const String name = 'NoNetworkRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PdfScreen]
class PdfRoute extends PageRouteInfo<PdfRouteArgs> {
  PdfRoute({
    Key? key,
    required FacultyNews facultyNews,
    List<PageRouteInfo>? children,
  }) : super(
          PdfRoute.name,
          args: PdfRouteArgs(
            key: key,
            facultyNews: facultyNews,
          ),
          initialChildren: children,
        );

  static const String name = 'PdfRoute';

  static const PageInfo<PdfRouteArgs> page = PageInfo<PdfRouteArgs>(name);
}

class PdfRouteArgs {
  const PdfRouteArgs({
    this.key,
    required this.facultyNews,
  });

  final Key? key;

  final FacultyNews facultyNews;

  @override
  String toString() {
    return 'PdfRouteArgs{key: $key, facultyNews: $facultyNews}';
  }
}

/// generated route for
/// [PoliticScreen]
class PoliticRoute extends PageRouteInfo<void> {
  const PoliticRoute({List<PageRouteInfo>? children})
      : super(
          PoliticRoute.name,
          initialChildren: children,
        );

  static const String name = 'PoliticRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PoliticWebViewScreen]
class PoliticWebViewRoute extends PageRouteInfo<PoliticWebViewRouteArgs> {
  PoliticWebViewRoute({
    Key? key,
    required String url,
    required bool isStudent,
    List<PageRouteInfo>? children,
  }) : super(
          PoliticWebViewRoute.name,
          args: PoliticWebViewRouteArgs(
            key: key,
            url: url,
            isStudent: isStudent,
          ),
          initialChildren: children,
        );

  static const String name = 'PoliticWebViewRoute';

  static const PageInfo<PoliticWebViewRouteArgs> page =
      PageInfo<PoliticWebViewRouteArgs>(name);
}

class PoliticWebViewRouteArgs {
  const PoliticWebViewRouteArgs({
    this.key,
    required this.url,
    required this.isStudent,
  });

  final Key? key;

  final String url;

  final bool isStudent;

  @override
  String toString() {
    return 'PoliticWebViewRouteArgs{key: $key, url: $url, isStudent: $isStudent}';
  }
}

/// generated route for
/// [PortfolioScreen]
class PortfolioRoute extends PageRouteInfo<void> {
  const PortfolioRoute({List<PageRouteInfo>? children})
      : super(
          PortfolioRoute.name,
          initialChildren: children,
        );

  static const String name = 'PortfolioRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProfileScreen]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProfileTabScreen]
class ProfileTab extends PageRouteInfo<void> {
  const ProfileTab({List<PageRouteInfo>? children})
      : super(
          ProfileTab.name,
          initialChildren: children,
        );

  static const String name = 'ProfileTab';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RatingScreen]
class RatingRoute extends PageRouteInfo<void> {
  const RatingRoute({List<PageRouteInfo>? children})
      : super(
          RatingRoute.name,
          initialChildren: children,
        );

  static const String name = 'RatingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ShowcaseScreen]
class ShowcaseRoute extends PageRouteInfo<void> {
  const ShowcaseRoute({List<PageRouteInfo>? children})
      : super(
          ShowcaseRoute.name,
          initialChildren: children,
        );

  static const String name = 'ShowcaseRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ShowcaseTabScreen]
class ShowcaseTab extends PageRouteInfo<void> {
  const ShowcaseTab({List<PageRouteInfo>? children})
      : super(
          ShowcaseTab.name,
          initialChildren: children,
        );

  static const String name = 'ShowcaseTab';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashScreen]
class SplashRoute extends PageRouteInfo<SplashRouteArgs> {
  SplashRoute({
    Key? key,
    required void Function()? onComplete,
    List<PageRouteInfo>? children,
  }) : super(
          SplashRoute.name,
          args: SplashRouteArgs(
            key: key,
            onComplete: onComplete,
          ),
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<SplashRouteArgs> page = PageInfo<SplashRouteArgs>(name);
}

class SplashRouteArgs {
  const SplashRouteArgs({
    this.key,
    required this.onComplete,
  });

  final Key? key;

  final void Function()? onComplete;

  @override
  String toString() {
    return 'SplashRouteArgs{key: $key, onComplete: $onComplete}';
  }
}

/// generated route for
/// [StudentHomeScreen]
class StudentHomeRoute extends PageRouteInfo<StudentHomeRouteArgs> {
  StudentHomeRoute({
    Key? key,
    bool playAnimation = false,
    List<PageRouteInfo>? children,
  }) : super(
          StudentHomeRoute.name,
          args: StudentHomeRouteArgs(
            key: key,
            playAnimation: playAnimation,
          ),
          initialChildren: children,
        );

  static const String name = 'StudentHomeRoute';

  static const PageInfo<StudentHomeRouteArgs> page =
      PageInfo<StudentHomeRouteArgs>(name);
}

class StudentHomeRouteArgs {
  const StudentHomeRouteArgs({
    this.key,
    this.playAnimation = false,
  });

  final Key? key;

  final bool playAnimation;

  @override
  String toString() {
    return 'StudentHomeRouteArgs{key: $key, playAnimation: $playAnimation}';
  }
}

/// generated route for
/// [SubjectGradesScreen]
class SubjectGradesRoute extends PageRouteInfo<SubjectGradesRouteArgs> {
  SubjectGradesRoute({
    Key? key,
    required List<int> groupIds,
    required int lessonId,
    required String lessonName,
    required String title,
    required int subjectId,
    required String markType,
    List<PageRouteInfo>? children,
  }) : super(
          SubjectGradesRoute.name,
          args: SubjectGradesRouteArgs(
            key: key,
            groupIds: groupIds,
            lessonId: lessonId,
            lessonName: lessonName,
            title: title,
            subjectId: subjectId,
            markType: markType,
          ),
          initialChildren: children,
        );

  static const String name = 'SubjectGradesRoute';

  static const PageInfo<SubjectGradesRouteArgs> page =
      PageInfo<SubjectGradesRouteArgs>(name);
}

class SubjectGradesRouteArgs {
  const SubjectGradesRouteArgs({
    this.key,
    required this.groupIds,
    required this.lessonId,
    required this.lessonName,
    required this.title,
    required this.subjectId,
    required this.markType,
  });

  final Key? key;

  final List<int> groupIds;

  final int lessonId;

  final String lessonName;

  final String title;

  final int subjectId;

  final String markType;

  @override
  String toString() {
    return 'SubjectGradesRouteArgs{key: $key, groupIds: $groupIds, lessonId: $lessonId, lessonName: $lessonName, title: $title, subjectId: $subjectId, markType: $markType}';
  }
}

/// generated route for
/// [TeacherAttendanceJournalScreen]
class TeacherAttendanceJournalRoute
    extends PageRouteInfo<TeacherAttendanceJournalRouteArgs> {
  TeacherAttendanceJournalRoute({
    Key? key,
    required List<int> groupIds,
    required int lessonId,
    required String lessonName,
    required String title,
    String? date,
    int? subjectId,
    String? markType,
    List<PageRouteInfo>? children,
  }) : super(
          TeacherAttendanceJournalRoute.name,
          args: TeacherAttendanceJournalRouteArgs(
            key: key,
            groupIds: groupIds,
            lessonId: lessonId,
            lessonName: lessonName,
            title: title,
            date: date,
            subjectId: subjectId,
            markType: markType,
          ),
          initialChildren: children,
        );

  static const String name = 'TeacherAttendanceJournalRoute';

  static const PageInfo<TeacherAttendanceJournalRouteArgs> page =
      PageInfo<TeacherAttendanceJournalRouteArgs>(name);
}

class TeacherAttendanceJournalRouteArgs {
  const TeacherAttendanceJournalRouteArgs({
    this.key,
    required this.groupIds,
    required this.lessonId,
    required this.lessonName,
    required this.title,
    this.date,
    this.subjectId,
    this.markType,
  });

  final Key? key;

  final List<int> groupIds;

  final int lessonId;

  final String lessonName;

  final String title;

  final String? date;

  final int? subjectId;

  final String? markType;

  @override
  String toString() {
    return 'TeacherAttendanceJournalRouteArgs{key: $key, groupIds: $groupIds, lessonId: $lessonId, lessonName: $lessonName, title: $title, date: $date, subjectId: $subjectId, markType: $markType}';
  }
}

/// generated route for
/// [TeacherHomeScreen]
class TeacherHomeRoute extends PageRouteInfo<TeacherHomeRouteArgs> {
  TeacherHomeRoute({
    Key? key,
    bool playAnimation = false,
    List<PageRouteInfo>? children,
  }) : super(
          TeacherHomeRoute.name,
          args: TeacherHomeRouteArgs(
            key: key,
            playAnimation: playAnimation,
          ),
          initialChildren: children,
        );

  static const String name = 'TeacherHomeRoute';

  static const PageInfo<TeacherHomeRouteArgs> page =
      PageInfo<TeacherHomeRouteArgs>(name);
}

class TeacherHomeRouteArgs {
  const TeacherHomeRouteArgs({
    this.key,
    this.playAnimation = false,
  });

  final Key? key;

  final bool playAnimation;

  @override
  String toString() {
    return 'TeacherHomeRouteArgs{key: $key, playAnimation: $playAnimation}';
  }
}

/// generated route for
/// [TeacherJournalScreen]
class TeacherJournalRoute extends PageRouteInfo<void> {
  const TeacherJournalRoute({List<PageRouteInfo>? children})
      : super(
          TeacherJournalRoute.name,
          initialChildren: children,
        );

  static const String name = 'TeacherJournalRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TeacherJournalTabScreen]
class TeacherJournalTab extends PageRouteInfo<void> {
  const TeacherJournalTab({List<PageRouteInfo>? children})
      : super(
          TeacherJournalTab.name,
          initialChildren: children,
        );

  static const String name = 'TeacherJournalTab';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TeacherProfileScreen]
class TeacherProfileRoute extends PageRouteInfo<void> {
  const TeacherProfileRoute({List<PageRouteInfo>? children})
      : super(
          TeacherProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'TeacherProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TeacherProfileTabScreen]
class TeacherProfileTab extends PageRouteInfo<void> {
  const TeacherProfileTab({List<PageRouteInfo>? children})
      : super(
          TeacherProfileTab.name,
          initialChildren: children,
        );

  static const String name = 'TeacherProfileTab';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TeacherShowcaseScreen]
class TeacherShowcaseRoute extends PageRouteInfo<void> {
  const TeacherShowcaseRoute({List<PageRouteInfo>? children})
      : super(
          TeacherShowcaseRoute.name,
          initialChildren: children,
        );

  static const String name = 'TeacherShowcaseRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TeacherShowcaseTabScreen]
class TeacherShowcaseTab extends PageRouteInfo<void> {
  const TeacherShowcaseTab({List<PageRouteInfo>? children})
      : super(
          TeacherShowcaseTab.name,
          initialChildren: children,
        );

  static const String name = 'TeacherShowcaseTab';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TeacherTimeTableTabScreen]
class TeacherTimeTableTab extends PageRouteInfo<void> {
  const TeacherTimeTableTab({List<PageRouteInfo>? children})
      : super(
          TeacherTimeTableTab.name,
          initialChildren: children,
        );

  static const String name = 'TeacherTimeTableTab';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TeacherTimetableBookmarkScreen]
class TeacherTimetableBookmarkRoute
    extends PageRouteInfo<TeacherTimetableBookmarkRouteArgs> {
  TeacherTimetableBookmarkRoute({
    Key? key,
    required int teacherId,
    required String title,
    List<PageRouteInfo>? children,
  }) : super(
          TeacherTimetableBookmarkRoute.name,
          args: TeacherTimetableBookmarkRouteArgs(
            key: key,
            teacherId: teacherId,
            title: title,
          ),
          initialChildren: children,
        );

  static const String name = 'TeacherTimetableBookmarkRoute';

  static const PageInfo<TeacherTimetableBookmarkRouteArgs> page =
      PageInfo<TeacherTimetableBookmarkRouteArgs>(name);
}

class TeacherTimetableBookmarkRouteArgs {
  const TeacherTimetableBookmarkRouteArgs({
    this.key,
    required this.teacherId,
    required this.title,
  });

  final Key? key;

  final int teacherId;

  final String title;

  @override
  String toString() {
    return 'TeacherTimetableBookmarkRouteArgs{key: $key, teacherId: $teacherId, title: $title}';
  }
}

/// generated route for
/// [TeacherTimetableScreen]
class TeacherTimetableRoute extends PageRouteInfo<TeacherTimetableRouteArgs> {
  TeacherTimetableRoute({
    Key? key,
    bool? returnToToday,
    List<PageRouteInfo>? children,
  }) : super(
          TeacherTimetableRoute.name,
          args: TeacherTimetableRouteArgs(
            key: key,
            returnToToday: returnToToday,
          ),
          initialChildren: children,
        );

  static const String name = 'TeacherTimetableRoute';

  static const PageInfo<TeacherTimetableRouteArgs> page =
      PageInfo<TeacherTimetableRouteArgs>(name);
}

class TeacherTimetableRouteArgs {
  const TeacherTimetableRouteArgs({
    this.key,
    this.returnToToday,
  });

  final Key? key;

  final bool? returnToToday;

  @override
  String toString() {
    return 'TeacherTimetableRouteArgs{key: $key, returnToToday: $returnToToday}';
  }
}

/// generated route for
/// [TechWorkScreen]
class TechWorkRoute extends PageRouteInfo<TechWorkRouteArgs> {
  TechWorkRoute({
    Key? key,
    String? text,
    List<PageRouteInfo>? children,
  }) : super(
          TechWorkRoute.name,
          args: TechWorkRouteArgs(
            key: key,
            text: text,
          ),
          initialChildren: children,
        );

  static const String name = 'TechWorkRoute';

  static const PageInfo<TechWorkRouteArgs> page =
      PageInfo<TechWorkRouteArgs>(name);
}

class TechWorkRouteArgs {
  const TechWorkRouteArgs({
    this.key,
    this.text,
  });

  final Key? key;

  final String? text;

  @override
  String toString() {
    return 'TechWorkRouteArgs{key: $key, text: $text}';
  }
}

/// generated route for
/// [TimeTableScreen]
class TimeTableRoute extends PageRouteInfo<TimeTableRouteArgs> {
  TimeTableRoute({
    Key? key,
    bool? returnToToday,
    List<PageRouteInfo>? children,
  }) : super(
          TimeTableRoute.name,
          args: TimeTableRouteArgs(
            key: key,
            returnToToday: returnToToday,
          ),
          initialChildren: children,
        );

  static const String name = 'TimeTableRoute';

  static const PageInfo<TimeTableRouteArgs> page =
      PageInfo<TimeTableRouteArgs>(name);
}

class TimeTableRouteArgs {
  const TimeTableRouteArgs({
    this.key,
    this.returnToToday,
  });

  final Key? key;

  final bool? returnToToday;

  @override
  String toString() {
    return 'TimeTableRouteArgs{key: $key, returnToToday: $returnToToday}';
  }
}

/// generated route for
/// [TimeTableTabScreen]
class TimeTableTab extends PageRouteInfo<void> {
  const TimeTableTab({List<PageRouteInfo>? children})
      : super(
          TimeTableTab.name,
          initialChildren: children,
        );

  static const String name = 'TimeTableTab';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [WelcomeScreen]
class WelcomeRoute extends PageRouteInfo<WelcomeRouteArgs> {
  WelcomeRoute({
    Key? key,
    bool playAnimation = false,
    List<PageRouteInfo>? children,
  }) : super(
          WelcomeRoute.name,
          args: WelcomeRouteArgs(
            key: key,
            playAnimation: playAnimation,
          ),
          initialChildren: children,
        );

  static const String name = 'WelcomeRoute';

  static const PageInfo<WelcomeRouteArgs> page =
      PageInfo<WelcomeRouteArgs>(name);
}

class WelcomeRouteArgs {
  const WelcomeRouteArgs({
    this.key,
    this.playAnimation = false,
  });

  final Key? key;

  final bool playAnimation;

  @override
  String toString() {
    return 'WelcomeRouteArgs{key: $key, playAnimation: $playAnimation}';
  }
}

/// generated route for
/// [WelcomeShowcaseScreen]
class WelcomeShowcaseRoute extends PageRouteInfo<void> {
  const WelcomeShowcaseRoute({List<PageRouteInfo>? children})
      : super(
          WelcomeShowcaseRoute.name,
          initialChildren: children,
        );

  static const String name = 'WelcomeShowcaseRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
