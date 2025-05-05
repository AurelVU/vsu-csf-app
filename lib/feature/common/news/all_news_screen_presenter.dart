import 'package:appmetrica_plugin/appmetrica_plugin.dart';
import 'package:auto_route/auto_route.dart';
import 'package:fkn/domain/showcase/faculty_news.dart';
import 'package:fkn/environment/lifecycle_module.dart';
import 'package:fkn/feature/common/news/all_news_manager.dart';
import 'package:fkn/router/router.dart';
import 'package:fkn/utils/events_name.dart';
import 'package:flutter/material.dart';

class AllNewsScreenPresenter extends LifecycleModule {
  AllNewsScreenPresenter({
    required this.router,
    required this.type,
    required this.allNewsManager,
  });

  final StackRouter router;
  final AllNewsManager allNewsManager;
  final String type;

  bool _isLoading = false;
  final ScrollController universityNewsController = ScrollController();
  int universityPage = 1;

  @override
  void init() {
    super.init();
    universityNewsController.addListener(_updateUniversityNews);
    allNewsManager.loadUniversityNews(
      group: type,
      page: universityPage,
    );
  }

  @override
  void dispose() {
    universityNewsController.removeListener(_updateUniversityNews);
    super.dispose();
  }

  void goTop() {
    universityNewsController.animateTo(
        universityNewsController.position.minScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease);
  }

  void _updateUniversityNews() async {
    if (universityNewsController.offset >=
            universityNewsController.position.maxScrollExtent / 3 &&
        !_isLoading) {
      _isLoading = true;
      universityPage++;
      await allNewsManager.loadUniversityNews(
        page: universityPage,
        group: type,
      );

      _isLoading = false;
    }
  }

  void goToNewDetail(FacultyNews? facultyNew) {
    AppMetrica.reportEvent(EventName.openNewsDetailPage);
    router.navigate(
      NewsDetailRoute(news: facultyNew),
    );
  }
}
