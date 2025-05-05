import 'package:auto_route/auto_route.dart';
import 'package:fkn/feature/common/auth/login_student_widget.dart';
import 'package:fkn/feature/common/auth/login_teacher/presentation/login_teacher_screen.dart';
import 'package:fkn/feature/common/splash/splash_screen.dart';
import 'package:fkn/router/router.dart';
import 'package:fkn/startup/app_color.dart';
import 'package:fkn/startup/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

import 'auth_screen_presenter.dart';

class AuthScreenView extends StatefulWidget {
  const AuthScreenView({super.key, this.playAnimation = false});

  final bool playAnimation;

  @override
  State<AuthScreenView> createState() => _AuthScreenViewState();
}

class _AuthScreenViewState extends State<AuthScreenView> {
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
    final presenter = context.watch<AuthScreenPresenter>();
    final colorScheme = Theme.of(context).colorScheme;
    FlutterNativeSplash.remove();
    return StreamBuilder(
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
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/auth_screen_fon.png'),
                    fit: BoxFit.fill,
                  ),
                ),
                child: AuthContent(
                  presenter: presenter,
                  colorScheme: colorScheme,
                ),
              ),
            );
          }
          return Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/auth_screen_fon.png'),
                fit: BoxFit.fill,
              ),
            ),
            child: AuthContent(
              presenter: presenter,
              colorScheme: colorScheme,
            ),
          );
        });
  }
}

class AuthContent extends StatelessWidget {
  const AuthContent({
    super.key,
    required this.presenter,
    required this.colorScheme,
  });

  final AuthScreenPresenter presenter;
  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        centerTitle: true,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        leading: GestureDetector(
          onTap: () => context.router.pop(),
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColor.backButton,
            size: 20,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(flex: 2),
            const SizedBox(
              height: 28,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(
                'Авторизуйтесь, чтобы войти в аккаунт',
                style: AppTypography.medium20.copyWith(
                  height: 1.2,
                  fontStyle: FontStyle.normal,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const Spacer(flex: 2),
            ElevatedButton(
              onPressed: () {
                showCupertinoModalBottomSheet(
                  context: context,
                  useRootNavigator: true,
                  expand: true,
                  builder: (context) {
                    return Material(
                      child: LoginStudentWidget(
                        presenter: presenter,
                      ),
                    );
                  },
                );
              },
              style: ElevatedButton.styleFrom(
                fixedSize: null,
                backgroundColor: colorScheme.primary,
                foregroundColor: colorScheme.secondary,
              ),
              child: const Center(
                  child: Text(
                'Войти как студент',
                textAlign: TextAlign.center,
              )),
            ),
            const SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {
                showCupertinoModalBottomSheet(
                  context: context,
                  useRootNavigator: true,
                  expand: true,
                  builder: (context) {
                    return const Material(
                      child: LoginTeacherScreen(),
                    );
                  },
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: colorScheme.secondary,
                foregroundColor: colorScheme.primary,
                side: BorderSide(
                  width: 1.0,
                  color: colorScheme.primary,
                ),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
              ),
              child: const Center(
                child: Text(
                  'Войти как преподаватель',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const Spacer(flex: 5),
          ],
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
      child: const Text(
        'ДОБРО ПОЖАЛОВАТЬ',
        style: AppTypography.bold23,
        textAlign: TextAlign.center,
      ),
    );
  }
}
