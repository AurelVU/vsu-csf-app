import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:fkn/feature/common/splash/splash_screen.dart';
import 'package:fkn/router/router.dart';
import 'package:fkn/startup/app_color.dart';
import 'package:fkn/utils/bottom_navigation_bar_icon_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'teacher_home_screen_presenter.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class TeacherHomeScreenView extends StatefulWidget {
  const TeacherHomeScreenView({super.key, this.playAnimation = false});

  final bool playAnimation;

  @override
  State<TeacherHomeScreenView> createState() => _TeacherHomeScreenViewState();
}

class _TeacherHomeScreenViewState extends State<TeacherHomeScreenView> {
  OverlayEntry? overlayEntry;

  void createHighlightOverlay() {
    removeHighlightOverlay();

    assert(overlayEntry == null);

    overlayEntry = OverlayEntry(
      builder: (_) => SplashScreen(
        onComplete: removeHighlightOverlay,
      ),
    );

    Overlay.of(context, debugRequiredFor: widget).insert(overlayEntry!);
  }

  void removeHighlightOverlay() {
    overlayEntry?.remove();
    overlayEntry = null;
  }

  @override
  void initState() {
    super.initState();
    if (widget.playAnimation) {
      Future.microtask(createHighlightOverlay);
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final presenter = context.read<TeacherHomeScreenPresenter>();
    FlutterNativeSplash.remove();
    return AutoTabsRouter(
      lazyLoad: false,
      routes: const [
        TeacherShowcaseTab(),
        TeacherTimeTableTab(),
        TeacherJournalTab(),
        TeacherProfileTab(),
      ],
      transitionBuilder: (context, child, animation) {
        return child;
      },
      builder: (context, child) {
        final mediaQuery = MediaQuery.of(context);
        final bottomNavHeight = 50.0 + MediaQuery.of(context).padding.bottom >
                MediaQuery.of(context).viewInsets.bottom
            ? 50.0 + MediaQuery.of(context).viewPadding.bottom
            : 0.0;

        final tabsRouter = context.tabsRouter;
        return Column(
          children: [
            Expanded(
              child: MediaQuery(
                data: mediaQuery.copyWith(
                  padding: mediaQuery.viewPadding.copyWith(bottom: 0),
                  viewInsets: mediaQuery.viewInsets.copyWith(
                    bottom:
                        max(mediaQuery.viewInsets.bottom - bottomNavHeight, 0),
                  ),
                ),
                child: child,
              ),
            ),
            StreamBuilder(
                stream: presenter.environment.configStream,
                initialData: presenter.environment.config,
                builder: (context, snapshot) {
                  final version = snapshot.data?.baseUrl ?? '';
                  final versionStage = version.contains('stage');
                  if (versionStage) {
                    return Banner(
                      message: 'STAGE',
                      location: BannerLocation.bottomEnd,
                      color: AppColor.newBlue,
                      child: NavBar(
                        bottomNavHeight: bottomNavHeight,
                        tabsRouter: tabsRouter,
                        presenter: presenter,
                      ),
                    );
                  }
                  return NavBar(
                    bottomNavHeight: bottomNavHeight,
                    tabsRouter: tabsRouter,
                    presenter: presenter,
                  );
                }),
          ],
        );
      },
    );
  }
}

class NavBar extends StatelessWidget {
  const NavBar({
    super.key,
    required this.bottomNavHeight,
    required this.tabsRouter,
    required this.presenter,
  });

  final double bottomNavHeight;
  final TabsRouter tabsRouter;
  final TeacherHomeScreenPresenter presenter;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: bottomNavHeight,
      child: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color(0x0A000000),
              spreadRadius: 0,
              blurRadius: 18,
              offset: Offset(0, -3),
            ),
          ],
        ),
        child: CupertinoTabBar(
          backgroundColor:  Colors.white,
          currentIndex: tabsRouter.activeIndex,
          border: const Border(
            top: BorderSide.none,
          ),
          onTap: (index) {
            /// некоторая логика меняет навигацию взависимости от страницы,
            /// поэтому часть логики основа на текущем пути
            final path = AutoRouter.of(context).currentPath;
            presenter.decoratedUpdateTab(
              index: index,
              tabsRouter: tabsRouter,
              path: path,
            );
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(BottomNavigationBarIcon.showcase),
            ),
            BottomNavigationBarItem(
              icon: Icon(BottomNavigationBarIcon.timetable),
            ),
            BottomNavigationBarItem(
              icon: Icon(BottomNavigationBarIcon.career),
            ),
            BottomNavigationBarItem(
              icon: Icon(BottomNavigationBarIcon.profile),
            ),
          ],
        ),
      ),
    );
  }
}
