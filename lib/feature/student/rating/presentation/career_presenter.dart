import 'package:appmetrica_plugin/appmetrica_plugin.dart';
import 'package:auto_route/auto_route.dart';
import 'package:fkn/domain/profile/user_data.dart';
import 'package:fkn/environment/lifecycle_module.dart';
import 'package:fkn/feature/student/profile/profile_manager.dart';
import 'package:fkn/feature/student/rating/rating_manager.dart';
import 'package:fkn/utils/events_name.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

class RatingScreenPresenter extends LifecycleModule {
  RatingScreenPresenter({
    this.deviceWidth = 360.0,
    required this.router,
    required this.ratingManager,
    required this.profile,
  });

  final PageController pageController = PageController();
  final BehaviorSubject<double?> pageAnimatedController = BehaviorSubject();
  final ScrollController termScrollController = ScrollController();
  final double deviceWidth;

  @override
  void init() {
    super.init();
    pageController.addListener(() {
      pageAnimatedController.value = pageController.page;
    });
    // profile.chosenSemester.listen((value) {
    //   scrollToTerm(value);
    // });
  }


  final StackRouter router;
  final RatingManager ratingManager;

  // Временная мера, пока карьера не в релизе, а надо показывать рейтинг
  final IProfile<UserData> profile;

  void scrollToTerm(int? value) {
    if (value == null) {
      return;
    }
    if (termScrollController.hasClients) {
      final itemCount = profile.userData.valueOrNull?.results?.length ?? 1;
      final maxIntent =
          termScrollController.position.maxScrollExtent + deviceWidth;
      final itemWidth = (maxIntent - 32.0 - 8.0 * (itemCount - 1)) / itemCount;
      double offset = 16.0 +
          (itemWidth * value) +
          (8 * value) -
          (deviceWidth / 2) +
          itemWidth / 2;
      if (offset < 0) {
        offset = 0;
      }
      if (offset > termScrollController.position.maxScrollExtent) {
        offset = termScrollController.position.maxScrollExtent;
      }
      print(offset);
      termScrollController.animateTo(
        offset,
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }
  }

  void slidePage(int index) {
    scrollToTerm(index);
  }



  void changeChosenSemester(int index) {
    pageController.jumpToPage(
      index,
      // duration: const Duration(milliseconds: 300),
      // curve: Curves.easeOutExpo,
    );
    profile.chosenSemester.value = index;
    AppMetrica.reportEvent(EventName.selectTerm);
  }
}
