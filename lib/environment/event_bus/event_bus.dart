import 'dart:async';

import 'package:fkn/environment/event_bus/event.dart';
import 'package:fkn/environment/event_bus/middleware.dart';
import 'package:fkn/environment/lifecycle_module.dart';
import 'package:rxdart/rxdart.dart';

abstract class IEventBus implements LifecycleModule {
  BehaviorSubject<IEvent> get eventStream;

  List<IMiddleware> middlewares = [];

  void addMiddleware(IMiddleware middleware);

  void addEvent(IEvent event);
}

class EventBus implements IEventBus {
    StreamSubscription? _eventSubscription;

  @override
  BehaviorSubject<IEvent> eventStream = BehaviorSubject();

  @override
  List<IMiddleware> middlewares = <IMiddleware>[];

  @override
  void addEvent(IEvent event) {
    eventStream.add(event);
  }

  @override
  void addMiddleware(IMiddleware middleware) {
    middlewares.add(middleware);
  }

  @override
  void dispose() {
    _eventSubscription?.cancel();
    eventStream.close();
  }

  @override
  void init() {
    _eventSubscription = eventStream.listen((value) {
      middlewares.fold(value, (previousValue, middleware) => middleware.handleEvent(previousValue));
    });
  }
}
