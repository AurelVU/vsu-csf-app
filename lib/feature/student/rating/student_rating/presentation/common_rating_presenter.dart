import 'package:auto_route/auto_route.dart';
import 'package:fkn/domain/profile/user_data.dart';
import 'package:fkn/environment/lifecycle_module.dart';
import 'package:fkn/feature/student/profile/profile_manager.dart';
import 'package:fkn/feature/student/rating/rating_manager.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';

class CommonRatingScreenPresenter extends LifecycleModule {
  CommonRatingScreenPresenter( {
    required this.ratingManager,
    required this.deviceWidth,
    required this.profile,
    required this.vsync,
    required this.router,
  });

  final StackRouter router;
  final TickerProvider vsync;
  final IProfile<UserData> profile;
  late AnimationController controller;
  final RatingManager ratingManager;
  final double deviceWidth;

  final PageController pageController = PageController();
  final ScrollController termScrollController = ScrollController();
  final BehaviorSubject<double?> pageAnimatedController = BehaviorSubject();

  @override
  Future<void> init() async {
    super.init();
    pageController.addListener(() {
      pageAnimatedController.value = pageController.page;
    });
    controller = AnimationController(
      vsync: vsync,
      duration: const Duration(milliseconds: 800),
    );

    await updateByNumber(0);
    controller.animateTo(1.0, curve: Curves.fastOutSlowIn);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future<void> updateByNumber(int number) async {
    slidePage(number);
    final semesterResult =
        profile.userData.valueOrNull?.results?.elementAtOrNull(number);
    if (semesterResult == null) {
      return;
    }
    final rating = ratingManager.ratingStream.value.values
        .toList()
        .elementAtOrNull(number);
    if (rating == null &&
        semesterResult.number != null &&
        semesterResult.year != null) {
      ratingManager.updateSemesterNumber(
        semester: semesterResult.number!,
        year: semesterResult.year!,
      );
    }
  }


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
  }
}
