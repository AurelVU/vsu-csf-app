import 'package:auto_route/auto_route.dart';
import 'package:fkn/environment/event_bus/event_bus.dart';
import 'package:fkn/environment/middleware/navigation_middleware.dart';
import 'package:fkn/environment/middleware/snack_middleware.dart';

class EventBusListener {
  final IEventBus eventBus;
  final StackRouter router;

  EventBusListener({
    required this.eventBus,
    required this.router,
  });

  void init() {
    eventBus.addMiddleware(
      NavigationMiddleware(router: router),
    );
    eventBus.addMiddleware(
      SnackMiddleware(router: router),
    );
  }
}
