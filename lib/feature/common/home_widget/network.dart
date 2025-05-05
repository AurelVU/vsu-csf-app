import 'package:dio/dio.dart';
import 'package:fkn/di/dio_configurator.dart';
import 'package:fkn/di/uuid_configurator.dart';
import 'package:fkn/domain/profile/user_data.dart';
import 'package:fkn/domain/timetable/group_timetable.dart';
import 'package:fkn/environment/event_bus/event_bus.dart';
import 'package:fkn/environment/interceptor/jwt_interceptor.dart';
import 'package:fkn/feature/student/profile/data/profile_repository.dart';
import 'package:fkn/feature/student/profile/data/service/profile_service.dart';
import 'package:fkn/feature/student/profile/profile_manager.dart';
import 'package:fkn/feature/student/timetable/data/timetable_repository.dart';
import 'package:fkn/feature/student/timetable/data/timetable_service.dart';

import 'package:intl/intl.dart' as intl;

Future<List<DayTimetable>> getTimeTableOutEnvironment() async {
  final customDio = Dio();
  await UUIDConfigurator.configUuid();
  initDio(dio: customDio);
  customDio.options.baseUrl = 'https://mobile-fr.main.vsu.ru';

  final ProfileRepository profileRepository = ProfileRepository(ProfileService(customDio));

  final eventBus = EventBus();

  final Profile<UserData> profile = Profile<UserData>(profileRepository, eventBus);

  final jwtInterceptor = JWTInterceptor(
    dio: customDio,
    profile: profile,
    freeTokenUrl: '/auth/token/free',
    refreshUrl: '/auth/token/refresh',
  );
  await jwtInterceptor.initTokens();
  customDio.interceptors.add(
    jwtInterceptor,

  );

  final service = TimeTableService(customDio);
  final repository = TimeTableRepository(service);
  final response = await repository.getWeekTimetableByDate(date: intl.DateFormat('yyyy-MM-dd').format(DateTime.now()));
  customDio.close();
  eventBus.dispose();
  profile.dispose();
  return response;
}
