import 'package:appmetrica_plugin/appmetrica_plugin.dart';
import 'package:auto_route/auto_route.dart';
import 'package:fkn/domain/profile/user_data.dart';
import 'package:fkn/domain/showcase/faculty_news.dart';
import 'package:fkn/environment/lifecycle_module.dart';
import 'package:fkn/feature/common/showcase/showcase_manager.dart';
import 'package:fkn/feature/student/profile/profile_manager.dart';
import 'package:fkn/feature/student/timetable/timetable_manager.dart';
import 'package:fkn/router/router.dart';
import 'package:fkn/utils/events_name.dart';
import 'package:url_launcher/url_launcher.dart';

class ShowcaseScreenPresenter extends LifecycleModule {
  ShowcaseScreenPresenter({
    required this.timeTableManager,
    required this.router,
    required this.showcaseManager,
    required this.profile,
  });

  final StackRouter router;
  final ShowcaseManager showcaseManager;
  final TimeTableManager timeTableManager;
  final IProfile<UserData> profile;


  @override
  void init() {
    super.init();
    showcaseManager.updateUniversityPreview();
    showcaseManager.updateDepartmentPreview();
  }


  void routeToPortfolio() {
    router.navigate(const PortfolioRoute());
    AppMetrica.reportEvent(EventName.routeToProfileFromShowcase);
  }




  void showAllNews(String type, String title ) {
    router.navigate(
      AllNewRoute(
        title: title,
        type: type,
      ),
    );
  }

  void goToNew(FacultyNews? facultyNew) {
    AppMetrica.reportEvent(EventName.openNewsDetailPage);
    router.navigate(
      NewsDetailRoute(news: facultyNew),
    );
  }



  void routeToRating() {
    // fix when add careerScreen
    router.navigate(const CareerTab());
    AppMetrica.reportEvent(EventName.routeToRatingFromShowcase);
  }

  void routeToTimeTable() {
    router.navigate(
        TimeTableTab(children: [TimeTableRoute(returnToToday: true)]));
    AppMetrica.reportEvent(EventName.routeToTimeTableFromShowcase);
  }

  void routeToContact() {
    launchUrl(Uri.parse('https://t.me/FittinVSU'));
  }
}
