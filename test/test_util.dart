import 'package:auto_route/auto_route.dart';
import 'package:fkn/domain/profile/user_data.dart';
import 'package:fkn/environment/event_bus/event_bus.dart';
import 'package:fkn/feature/common/console/console_manager.dart';
import 'package:fkn/feature/common/showcase/showcase_manager.dart';
import 'package:fkn/feature/student/profile/profile_manager.dart';
import 'package:fkn/feature/student/timetable/timetable_manager.dart';
import 'package:flutter/material.dart' hide Banner;
import 'package:get_it/get_it.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';

const String kTemporaryPath = 'temporaryPath';
const String kApplicationSupportPath = 'applicationSupportPath';
const String kDownloadsPath = 'downloadsPath';
const String kLibraryPath = 'libraryPath';
const String kApplicationDocumentsPath = 'applicationDocumentsPath';
const String kExternalCachePath = 'externalCachePath';
const String kExternalStoragePath = 'externalStoragePath';

Widget wrapWidget(
  BuildContext context,
  Widget child, {
  bool useMediaQuery = true,
}) {
  Widget body = MultiProvider(
    providers: [
      Provider(create: (_) => GetIt.instance),
    ],
    child: StackRouterScope(
      controller: MockStackRouter(),
      stateHash: 0,
      child: Theme(
        data: ThemeData(
          extensions: const [],
        ),
        child: child,
      ),
    ),
  );
  if (useMediaQuery) {
    return SizedBox(width: MediaQuery.of(context).size.width, child: body);
  } else {
    return body;
  }
}

Future<void> preload() async {
  await loadAppFonts();
  PathProviderPlatform.instance = FakePathProviderPlatform();

  GetIt.instance.registerSingleton<ShowcaseManager>(MockShowcaseManager());
  GetIt.instance.registerSingleton<TimeTableManager>(MockTimeTableManager());
  GetIt.instance.registerSingleton<IProfile<UserData>>(MockProfile());
}

class FakePathProviderPlatform extends Fake
    with MockPlatformInterfaceMixin
    implements PathProviderPlatform {
  @override
  Future<String?> getTemporaryPath() async {
    return kTemporaryPath;
  }

  @override
  Future<String?> getApplicationSupportPath() async {
    return kApplicationSupportPath;
  }

  @override
  Future<String?> getLibraryPath() async {
    return kLibraryPath;
  }

  @override
  Future<String?> getApplicationDocumentsPath() async {
    return kApplicationDocumentsPath;
  }

  @override
  Future<String?> getExternalStoragePath() async {
    return kExternalStoragePath;
  }

  @override
  Future<List<String>?> getExternalCachePaths() async {
    return <String>[kExternalCachePath];
  }

  @override
  Future<List<String>?> getExternalStoragePaths({
    StorageDirectory? type,
  }) async {
    return <String>[kExternalStoragePath];
  }

  @override
  Future<String?> getDownloadsPath() async {
    return kDownloadsPath;
  }
}

class AllNullFakePathProviderPlatform extends Fake
    with MockPlatformInterfaceMixin
    implements PathProviderPlatform {
  @override
  Future<String?> getTemporaryPath() async {
    return null;
  }

  @override
  Future<String?> getApplicationSupportPath() async {
    return null;
  }

  @override
  Future<String?> getLibraryPath() async {
    return null;
  }

  @override
  Future<String?> getApplicationDocumentsPath() async {
    return null;
  }

  @override
  Future<String?> getExternalStoragePath() async {
    return null;
  }

  @override
  Future<List<String>?> getExternalCachePaths() async {
    return null;
  }

  @override
  Future<List<String>?> getExternalStoragePaths({
    StorageDirectory? type,
  }) async {
    return null;
  }

  @override
  Future<String?> getDownloadsPath() async {
    return null;
  }
}

class MockStackRouter extends Mock implements StackRouter {}

class MockShowcaseManager extends Mock implements ShowcaseManager {}

class MockTimeTableManager extends Mock implements TimeTableManager {}

class MockProfile extends Mock implements IProfile<UserData> {}

class MockConsoleManager extends Mock implements ConsoleManager {}

class MockEventBus extends Mock implements IEventBus {}
