import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fkn/environment/event_bus/event_bus.dart';
import 'package:fkn/environment/lifecycle_module.dart';

class NoNetworkPresenter extends LifecycleModule {
  NoNetworkPresenter({
    required this.router,
    required this.eventBus,
  });

  final StackRouter router;
  final IEventBus eventBus;

  StreamSubscription<ConnectivityResult>? subscription;

  @override
  void init() {
    super.init();
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      Connectivity().checkConnectivity().then((connectivityStatus) {
        if (connectivityStatus == ConnectivityResult.mobile ||
            connectivityStatus == ConnectivityResult.wifi) {
          router.maybePop();
        }
      });
    });
  }

  @override
  void dispose() {
    subscription?.cancel();
    super.dispose();
  }

  void reconnect() {
    Connectivity().checkConnectivity().then((value) => tryReconnect(value));
  }

  void tryReconnect(ConnectivityResult connectivityResult) {
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      router.maybePop();
    }
  }
}
