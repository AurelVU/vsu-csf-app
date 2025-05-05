import 'package:auto_route/auto_route.dart';
import 'package:fkn/environment/config/environment.dart';
import 'package:fkn/environment/lifecycle_module.dart';
import 'package:fkn/feature/common/config/debug_screen/url_value.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../environment/config/app_config.dart';

class DebugScreenPresenter extends LifecycleModule {
  DebugScreenPresenter({
    required this.router,
    required this.environment,
  });

  final Environment environment;
  final StackRouter router;

  final TextEditingController urlCustomController = TextEditingController();
  final TextEditingController proxyCustomController = TextEditingController();
  final BehaviorSubject<AppConfig> configController = BehaviorSubject();
  final BehaviorSubject<UrlValue> urlController = BehaviorSubject();
  final BehaviorSubject<UrlValue> proxyController = BehaviorSubject();

  @override
  void init() {
    super.init();
    configController.add(environment.config);
    final urlState = _mapUrlValue(
      selected: environment.config.baseUrl,
      prod: environment.config.prodUrl,
      stage: environment.config.stageUrl,
      test: environment.config.testUrl,
    );
    urlController.add(urlState);
    if (urlState == UrlValue.custom) {
      urlCustomController.text = environment.config.baseUrl;
    }

    final proxyState = _mapUrlValue(
      selected: environment.config.proxyUrl,
      prod: environment.config.proxyProdUrl,
      stage: environment.config.proxyStageUrl,
      test: environment.config.proxyTestUrl,
    );
    if (proxyState == UrlValue.custom) {
      proxyCustomController.text = environment.config.proxyUrl;
    }
    proxyController.add(urlState);
  }

  UrlValue _mapUrlValue({
    required String selected,
    required String prod,
    required String stage,
    required String test,
  }) {
    if (selected == prod) {
      return UrlValue.prod;
    }
    if (selected == stage) {
      return UrlValue.stage;
    }
    if (selected == test) {
      return UrlValue.test;
    }

    return UrlValue.custom;
  }

  @override
  void dispose() {
    urlController.close();
    proxyController.close();
    configController.close();
    urlCustomController.dispose();
    proxyCustomController.dispose();
    super.dispose();
  }

  void backToShowCase() {
    router.pop();
  }

  void changeUrl(UrlValue? value) {
    urlController.add(value ?? UrlValue.prod);
  }

  void changeProxy(UrlValue? value) {
    proxyController.add(value ?? UrlValue.prod);
  }

  void switchDebugShowCheckedModeBanner(bool value) {
    final config = configController.valueOrNull ?? environment.config;
    final debugConfig = config.config;

    configController.add(config.copyWith(
        config: debugConfig.copyWith(
      debugShowCheckedModeBanner: value,
    )));
  }

  void switchShowSemanticsDebugger(bool value) {
    final config = configController.valueOrNull ?? environment.config;
    final debugConfig = config.config;

    configController.add(config.copyWith(
        config: debugConfig.copyWith(
      showSemanticsDebugger: value,
    )));
  }

  void switchCheckerboardRasterCacheImages(bool value) {
    final config = configController.valueOrNull ?? environment.config;
    final debugConfig = config.config;

    configController.add(config.copyWith(
        config: debugConfig.copyWith(
      checkerboardRasterCacheImages: value,
    )));
  }

  void switchCheckerboardOffscreenLayers(bool value) {
    final config = configController.valueOrNull ?? environment.config;
    final debugConfig = config.config;

    configController.add(config.copyWith(
        config: debugConfig.copyWith(
      checkerboardOffscreenLayers: value,
    )));
  }

  void switchShowPerformanceOverlay(bool value) {
    final config = configController.valueOrNull ?? environment.config;
    final debugConfig = config.config;

    configController.add(config.copyWith(
        config: debugConfig.copyWith(
      showPerformanceOverlay: value,
    )));
  }

  void switchDebugShowMaterialGrid(bool value) {
    final config = configController.valueOrNull ?? environment.config;
    final debugConfig = config.config;

    configController.add(config.copyWith(
        config: debugConfig.copyWith(
      debugShowMaterialGrid: value,
    )));
  }

  Future<void> save() async {
    final config = configController.valueOrNull ?? environment.config;
    environment.saveConfig(
      config.copyWith(
        baseUrl: _mapBaseUrl(),
        proxyUrl: _mapProxyUrl(),
      ),
    );
    router.pop();
  }

  String _mapProxyUrl() {
    final config = configController.valueOrNull ?? environment.config;
    final s = proxyController.valueOrNull ?? UrlValue.prod;

    switch (s) {
      case UrlValue.prod:
        return config.proxyProdUrl;
      case UrlValue.stage:
        return config.proxyStageUrl;
      case UrlValue.test:
        return config.proxyTestUrl;
      case UrlValue.custom:
        return proxyCustomController.text;
    }
  }

  String _mapBaseUrl() {
    final config = configController.valueOrNull ?? environment.config;
    final s = urlController.valueOrNull ?? UrlValue.prod;

    switch (s) {
      case UrlValue.prod:
        return config.prodUrl;
      case UrlValue.stage:
        return config.stageUrl;
      case UrlValue.test:
        return config.testUrl;
      case UrlValue.custom:
        return urlCustomController.text;
    }
  }
}
