import 'dart:ui';
import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:fkn/di/di_builder.dart';
import 'package:fkn/di/uuid_configurator.dart';
import 'package:fkn/environment/config/app_config.dart';
import 'package:fkn/environment/config/app_environment.dart';
import 'package:fkn/environment/config/environment_repository.dart';
import 'package:fkn/firebase_options.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:integration_test/integration_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uni_links/uni_links.dart';


class Init {
  late GetIt container;
  late AppEnvironment environment;
  String? route;
  String? appType;

  Future<void> init() async {
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    final i = await SharedPreferences.getInstance();
    i.clear();
    await const FlutterSecureStorage().deleteAll();
    PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };

    await UUIDConfigurator.configUuid();
    final environmentRepository = EnvironmentRepository();
    await environmentRepository.init();
    environment = AppEnvironment.fromRepository(
      defaultConfig: AppConfig(
        baseUrl: 'https://vsu-stage.fittin.ru',
        stageUrl: 'https://mobile-fr.main.vsu.ru',
        prodUrl: '',
        testUrl: '',
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
    container = await configureContainer(environment);
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
    );
    route = await buildInitialPath();
    appType =
    environmentRepository.readStringFromSharedPreference('appType');
  }

  Future<String?> buildInitialPath() async {
    final route = await getInitialUri();
    if (route == null) return null;
    if (route.hasQuery) return '${route.path}?${route.query}';
    return route.path;
  }

  void Function(FlutterErrorDetails) onErrorIgnoreOverFlowErrors(
      Function(FlutterErrorDetails details) defaultOnError,
      ) {
    void errorHandler(FlutterErrorDetails details, {bool forceReport = false}) {
      var exception = details.exception;
      ((exception is ArgumentError &&
          exception.message!.startsWith("No host specified in URI")) ||
          (exception is DioException &&
              exception.response!.statusCode == 500)) //||exception != null)
          ? print('Overflow error.')
          : defaultOnError(details);
    }
    return errorHandler;
  }
}
