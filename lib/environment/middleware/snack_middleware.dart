import 'package:auto_route/auto_route.dart';
import 'package:fkn/domain/event/snack_event.dart';
import 'package:fkn/environment/event_bus/event.dart';
import 'package:fkn/environment/event_bus/middleware.dart';
import 'package:fkn/utils/router_extensions.dart';


class SnackMiddleware extends IMiddleware {
  SnackMiddleware({required this.router});

  final StackRouter router;

  @override
  IEvent handleEvent(IEvent event) {
    if (event is SnackBarEvent) {
      Future.microtask(() => router.showInfoSnackBar(event.message));
    }
    return event;
  }


}
