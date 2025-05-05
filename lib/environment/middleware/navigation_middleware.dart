import 'package:auto_route/auto_route.dart';
import 'package:fkn/domain/event/navigation_event.dart';
import 'package:fkn/environment/event_bus/event.dart';
import 'package:fkn/environment/event_bus/middleware.dart';

class NavigationMiddleware extends IMiddleware {
  NavigationMiddleware({required this.router});

  final StackRouter router;

  @override
  IEvent handleEvent(IEvent event) {
    if (event is NavigationEvent) {
      if (event is BundleNavigationEvent) {
        Future.microtask(() {
          router.navigate(event.route);
        });
      } else if (event is NamedNavigationEvent) {
        Future.microtask(
              () => router.navigateNamed(event.route),
        );
      } else if (event is PopNavigationEvent) {
        Future.microtask(
          router.pop,
        );
      } else if (event is PopUntilAndPushNavigationEvent) {
        Future.microtask(() {
          router.popUntilRoot();
          router.push(event.route);
        });
      }
    }
    return event;
  }
}
