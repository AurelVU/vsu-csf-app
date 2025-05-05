import 'package:auto_route/auto_route.dart';
import 'package:fkn/domain/showcase/univ_info.dart';
import 'package:fkn/feature/common/splash/splash_screen.dart';
import 'package:fkn/feature/common/welcome_screen/presentation/welcome_screen_presenter.dart';
import 'package:fkn/router/router.dart';
import 'package:fkn/startup/app_color.dart';
import 'package:fkn/startup/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class WelcomeScreenView extends StatefulWidget {
  const WelcomeScreenView({
    super.key,
    this.playAnimation = false,
  });

  final bool playAnimation;

  @override
  State<WelcomeScreenView> createState() => _WelcomeScreenViewState();
}

class _WelcomeScreenViewState extends State<WelcomeScreenView> {
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
    final presenter = context.watch<WelcomeScreenScreenPresenter>();
    FlutterNativeSplash.remove();
    return PopScope(
      canPop: false,
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/image/welcome_background.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(),
                const SizedBox(height: 52),
                const GreetingDebug(),
                const SizedBox(height: 16),
                Text(
                  'Введите название университета',
                  style: AppTypography.medium18.copyWith(
                    color: AppColor.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                const Spacer(),
                TextField(
                  clipBehavior: Clip.hardEdge,
                  style: AppTypography.normal18,
                  onChanged: (value) {
                    presenter.searchByRegex(regex: value);
                  },
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SvgPicture.asset(
                        'assets/svg/search.svg',
                        height: 24,
                        width: 24,
                      ),
                    ),
                    filled: true,
                    hintStyle: const TextStyle(color: AppColor.grey),
                    hintText: "Поиск",
                    fillColor: AppColor.white,
                  ),
                ),
                const SizedBox(height: 8),
                StreamBuilder<List<UnivInfo>>(
                    stream: presenter.universities,
                    builder: (context, snapshot) {
                      final data = snapshot.data;
                      if (data == null) {
                        return Container();
                      }
                      return Flexible(
                        flex: 3,
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColor.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: RawScrollbar(
                            thickness: 3.0,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 28),
                            thumbVisibility: true,
                            trackVisibility: true,
                            trackBorderColor: Colors.transparent,
                            thumbColor: const Color(0xFfa4a6af),
                            trackColor: AppColor.gray.withOpacity(0.4),
                            radius: const Radius.circular(20),
                            trackRadius: const Radius.circular(20),
                            child: ListView.separated(
                              shrinkWrap: true,
                              padding: const EdgeInsets.all(16),
                              itemBuilder: (context, index) {
                                final univ = data[index];
                                return GestureDetector(
                                  onTap: () {
                                    presenter.router
                                        .push(const WelcomeShowcaseRoute());
                                  },
                                  child: Text(univ.name ?? ''),
                                );
                              },
                              separatorBuilder: (context, index) {
                                return const SizedBox(
                                  height: 24,
                                );
                              },
                              itemCount: data.length,
                            ),
                          ),
                        ),
                      );
                    }),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class GreetingDebug extends StatefulWidget {
  const GreetingDebug({
    super.key,
  });

  @override
  State<GreetingDebug> createState() => _GreetingDebugState();
}

class _GreetingDebugState extends State<GreetingDebug> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        count++;
        if (count == 10) {
          context.router.navigate(const DebugRoute());
        }
      },
      child: Text(
        'Добро пожаловать',
        style: AppTypography.bold28.copyWith(
          color: AppColor.white,
        ),
      ),
    );
  }
}
