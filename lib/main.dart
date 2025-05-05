import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:fkn/domain/showcase/next_subject.dart';
import 'package:fkn/domain/timetable/subject.dart';
import 'package:fkn/environment/config/app_config.dart';
import 'package:fkn/environment/config/app_environment.dart';
import 'package:fkn/environment/event_bus/event_bus_listener.dart';
import 'package:fkn/feature/common/home_widget/network.dart';
import 'package:fkn/utils/deeplink_extensions.dart';
import 'package:fkn/utils/get_it_extension.dart';
import 'package:fkn/utils/timetable_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:home_widget/home_widget.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uni_links/uni_links.dart';
import 'package:workmanager/workmanager.dart';
import 'di/di_builder.dart';
import 'di/uuid_configurator.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'environment/config/environment_repository.dart';
import 'router/router.dart';
import 'startup/startup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:collection/collection.dart';

final globalNavigatorKey = GlobalKey<NavigatorState>();

@pragma("vm:entry-point")
void callbackDispatcher() {
  Workmanager().executeTask((taskName, inputData) async {
    print("Native called background task: $taskName");

    final response = await getTimeTableOutEnvironment();
    final currentDate = DateTime.now();
    final todayDate = response.firstWhereOrNull(
      (element) => isDateEqual(element.dateTimetable, currentDate),
    );

    final todaySubjects = todayDate?.subjects;
    final next = getNextSubject(todaySubjects);

    final subject = next?.subject;
    if (subject == null) {
      HomeWidget.saveWidgetData('status', 'Нет пар');
      return Future.value(true);
    }
    HomeWidget.saveWidgetData('status', next?.status ?? '');
    HomeWidget.saveWidgetData('subject', subject.name ?? '');
    HomeWidget.saveWidgetData('time', '${subject.startTime ?? ''} - ${subject.finishTime ?? ''}');
    HomeWidget.saveWidgetData('teacher', subject.teacher ?? '');
    HomeWidget.saveWidgetData('audit', subject.isDistant == true ? 'ДО' : 'к.${subject.classroom}');

    HomeWidget.updateWidget(
      name: 'HomeWidgetProvider',
      androidName: 'HomeWidgetProvider',
      iOSName: 'HomeWidget',
      qualifiedAndroidName: 'ru.fittin.fcs.HomeWidgetProvider',
    );

    return Future.value(true);
  });
}

NextSubject? getNextSubject(List<Subject>? subjects) {
  final currentDate = DateTime.now();
  for (final subject in subjects ?? <Subject>[]) {
    final startTime = DateTime(
      currentDate.year,
      currentDate.month,
      currentDate.day,
      int.parse(subject.startTime?.split(':')[0] ?? '0'),
      int.parse(subject.startTime?.split(':')[1] ?? '0'),
    );
    final finishTime = DateTime(
      currentDate.year,
      currentDate.month,
      currentDate.day,
      int.parse(subject.finishTime?.split(':')[0] ?? '0'),
      int.parse(subject.finishTime?.split(':')[1] ?? '0'),
    );
    if (currentDate.isBefore(startTime)) {
      return NextSubject(subject: subject, status: 'Следующая пара');
    } else if (currentDate.isAfter(finishTime)) {
      continue;
    } else {
      return NextSubject(subject: subject, status: 'Сейчас идет');
    }
  }
  return null;
}

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  HomeWidget.setAppGroupId('group.ru.fittin.csf.HomeWidget');
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  if (!kDebugMode) {
    FlutterError.onError = (errorDetails) {
      FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
    };
    PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };
  }

  await UUIDConfigurator.configUuid();

  final environmentRepository = EnvironmentRepository();
  await environmentRepository.init();
  final environment = AppEnvironment.fromRepository(
    defaultConfig: AppConfig(
      baseUrl: 'https://mobile-fr.main.vsu.ru',
      stageUrl: 'https://vsu-stage.fittin.ru',
      prodUrl: 'https://mobile-fr.main.vsu.ru',
      testUrl: 'https://vsu-stage.fittin.ru',
      proxyUrl: '',
      proxyStageUrl: '',
      proxyProdUrl: '',
      proxyTestUrl: '',
      config: DebugConfig(
        debugShowMaterialGrid: false,
        showPerformanceOverlay: false,
        checkerboardRasterCacheImages: false,
        checkerboardOffscreenLayers: false,
        showSemanticsDebugger: false,
        debugShowCheckedModeBanner: false,
      ),
    ),
    environmentRepository: environmentRepository,
  );
  FlutterSecureStorage storage = const FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
    ),
  );
  final sharedPreferences = await SharedPreferences.getInstance();
  if (sharedPreferences.getBool('first_run') ?? true) {
    await storage.deleteAll();

    sharedPreferences.setBool('first_run', false);
  }
  final appType = await storage.read(key: 'appType');
  print('appType $appType');
  final container = await configureContainer(environment);
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );
  final route = await _buildInitialPath();

  runApp(
    StartUpWidget(
      environment: environment,
      container: container,
      child: App(
        initialDeeplink: route,
        appType: appType ?? '',
      ),
    ),
  );
}

class App extends StatefulWidget {
  const App({
    super.key,
    this.initialDeeplink,
    required this.appType,
  });

  final String? initialDeeplink;
  final String appType;

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final appRouter = AppRouter();

  @override
  void initState() {
    super.initState();
    HomeWidget.setAppGroupId('ru.fittin.fcs');
    _configureDeepLinks();
  }

  @override
  Widget build(BuildContext context) {
    return Provider(
      lazy: false,
      create: (context) => EventBusListener(
        eventBus: context.get(),
        router: appRouter,
      )..init(),
      child: Portal(
        child: MaterialApp.router(
          title: 'ВГУ',
          debugShowCheckedModeBanner: false,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            DefaultCupertinoLocalizations.delegate,
          ],
          theme: StartUpTheme.light().themeData,
          darkTheme: StartUpTheme.dark().themeData,
          supportedLocales: const [
            Locale('ru', 'RU'),
          ],
          routerDelegate: appRouter.delegate(
            navRestorationScopeId: UniqueKey().toString(),
            deepLinkBuilder: (deepLink) {
              if (deepLink.path != '/') {
                return deepLink;
              }

              if (widget.appType == 'student') {
                return DeepLink([StudentHomeRoute(playAnimation: true)]);
              } else if (widget.appType == 'teacher') {
                return DeepLink([TeacherHomeRoute(playAnimation: true)]);
              }
              return DeepLink([WelcomeRoute(playAnimation: true)]);
            },
          ),
          routeInformationParser: appRouter.defaultRouteParser(),
        ),
      ),
    );
  }

  void _configureDeepLinks() {
    final deeplink = widget.initialDeeplink;

    if (deeplink != null) {
      Future.delayed(
        const Duration(seconds: 1),
        () async => await appRouter.navigateNamed(
          deeplink,
        ),
      );
    }

    if (Platform.isIOS) {
      uriLinkStream.listen((event) {
        if (event != null) {
          appRouter.navigateDeeplinkFromBanner(event.toString());
        }
      });
    }
  }
}

Future<String?> _buildInitialPath() async {
  final route = await getInitialUri();

  if (route == null) {
    return null;
  }

  if (route.hasQuery) {
    return '${route.path}?${route.query}';
  }

  return route.path;
}
