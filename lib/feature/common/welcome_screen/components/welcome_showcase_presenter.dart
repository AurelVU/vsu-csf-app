import 'package:appmetrica_plugin/appmetrica_plugin.dart';
import 'package:auto_route/auto_route.dart';
import 'package:fkn/environment/lifecycle_module.dart';
import 'package:fkn/feature/common/showcase/showcase_manager.dart';
import 'package:fkn/router/router.dart';
import 'package:fkn/utils/events_name.dart';
import 'package:url_launcher/url_launcher.dart';

class WelcomeShowcaseScreenPresenter extends LifecycleModule {
  WelcomeShowcaseScreenPresenter({
    required this.router,
    required this.showcaseManager,
  });

  final StackRouter router;
  final ShowcaseManager showcaseManager;

  @override
  void init() {
    super.init();
    showcaseManager.updateUniversityPreview();
    showcaseManager.updateDepartmentPreview();
    showcaseManager.updateCareerPreview();
  }


  void routeToPortfolio() {
    router.navigate(const PortfolioRoute());
    AppMetrica.reportEvent(EventName.routeToProfileFromShowcase);
  }

  void showAllNews(String type, String title) {
    router.navigate(
      AllNewRoute(
        title: title,
        type: type,
      ),
    );
  }

  void routeToContact() {
    launchUrl(Uri.parse('https://t.me/FittinVSU'));
  }
}
