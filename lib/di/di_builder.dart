
import 'package:fkn/environment/config/environment.dart';
import 'package:get_it/get_it.dart';

import 'configure_dependencies.dart';
import 'register_modules.dart';

Future<GetIt> configureContainer(Environment environment) async {
  configureDependencies();
  final container = getIt;
  await initServices(environment);
  return container;
}
