import 'package:appmetrica_plugin/appmetrica_plugin.dart';
import 'package:auto_route/auto_route.dart';
import 'package:fkn/domain/profile/user_data.dart';
import 'package:fkn/environment/config/environment.dart';
import 'package:fkn/environment/event_bus/event_bus.dart';
import 'package:fkn/environment/lifecycle_module.dart';
import 'package:fkn/feature/common/console/console_manager.dart';
import 'package:fkn/feature/student/profile/profile_manager.dart';
import 'package:fkn/router/router.dart';
import 'package:fkn/router/routes.dart';
import 'package:fkn/utils/events_name.dart';
import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';
import 'package:pub_semver/pub_semver.dart';

class HomeScreenPresenter extends LifecycleModule {
  HomeScreenPresenter({
    required this.router,
    required this.environment,
    required this.homeScrollController,
    required this.ratingScrollController,
    required this.timetableScrollController,
    required this.consoleManager,
    required this.eventBus,
    required this.profile,
  });

  final StackRouter router;
  final IEventBus eventBus;
  final IProfile<UserData> profile;
  final ConsoleManager consoleManager;

  /// набор всех контроллеров, которые управляются из навбара
  final ScrollController homeScrollController;
  final ScrollController ratingScrollController;

  final DraggableScrollableController timetableScrollController;

  final Environment environment;

  @override
  void init() async {
    _checkIfHaveForceUpdate();
  }

  @override
  void dispose() {}

  void _updateTab(int index, TabsRouter tabsRouter) {
    if (tabsRouter.activeIndex != index) {
      tabsRouter.setActiveIndex(index);
      return;
    }

    final childRouter = tabsRouter.childControllers[index];

    if (childRouter is StackRouter) {
      childRouter.popUntilRoot();
    }
  }

  /// у навбара появилось слишком много логики, поэтому появился этот метод-декоратор
  void decoratedUpdateTab({
    required int index,
    required TabsRouter tabsRouter,
    String? path,
  }) {
    _setNavBarAnalytics(index);
    if (index == tabsRouter.activeIndex) {
      if (!_scrollToTop(index, path)) {
        _updateTab(index, tabsRouter);
      }
    } else {
      _updateTab(index, tabsRouter);
    }
  }

  // возвращает true, если был скролл наверх
  // false если скролла на данном экране нет или нельзя скроллить вверх по табе
  bool _scrollToTop(int index, String? path) {
    switch (path) {
      case '${Routes.home}/${Routes.showcaseTab}/${Routes.showcase}':
        homeScrollController.animateTo(
            homeScrollController.position.minScrollExtent,
            duration: const Duration(milliseconds: 300),
            curve: Curves.ease);
        return true;
      case '${Routes.home}/${Routes.timeTableTab}/${Routes.timeTable}':
        timetableScrollController.animateTo(
            homeScrollController.position.minScrollExtent,
            duration: const Duration(milliseconds: 300),
            curve: Curves.ease);
        return true;
      case '${Routes.home}/${Routes.careerTab}/${Routes.career}':
        ratingScrollController.animateTo(
            homeScrollController.position.minScrollExtent,
            duration: const Duration(milliseconds: 300),
            curve: Curves.ease);
        return true;
    }
    return false;
  }

  Future<void> _setNavBarAnalytics(int index) async {
    if (index == 0) {
      AppMetrica.reportEvent(EventName.openShowcaseTab);
    } else if (index == 1) {
      AppMetrica.reportEvent(EventName.openTimetableTab);
    } else if (index == 2) {
      AppMetrica.reportEvent(EventName.openRatingTab);
    } else if (index == 3) {
      AppMetrica.reportEvent(EventName.openProfileTab);
    }
  }

  Future<void> _checkIfHaveForceUpdate() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    final version = packageInfo.version.trim();
    final globalParameters = await consoleManager.getParameters();
    for (var element in globalParameters) {
      if (element.name == 'TechnicalWork' && element.enable == true) {
        router.push(
          TechWorkRoute(),
        );
        return;
      }
      if (element.name == 'MobileVersion' &&
          Version.parse(element.value ?? '1.0.0') > Version.parse(version)) {
        router.replace(
          ForceUpdateRoute(),
        );
      }

    }
  }
}
