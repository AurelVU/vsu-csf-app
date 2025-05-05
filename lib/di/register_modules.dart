import 'dart:io';

import 'package:appmetrica_plugin/appmetrica_plugin.dart';
import 'package:dio/dio.dart';
import 'package:fkn/config/app_secrets.dart';
import 'package:fkn/domain/profile/user_data.dart';
import 'package:fkn/environment/config/environment.dart';
import 'package:fkn/environment/event_bus/event_bus.dart';
import 'package:fkn/environment/interceptor/jwt_interceptor.dart';
import 'package:fkn/environment/interceptor/timeout_interceptor.dart';
import 'package:fkn/environment/interceptor/uuid_interceptor.dart';
import 'package:fkn/feature/common/console/console_manager.dart';
import 'package:fkn/feature/common/console/console_service.dart';
import 'package:fkn/feature/common/news/all_news_manager.dart';
import 'package:fkn/feature/common/politic/data/politic_repository.dart';
import 'package:fkn/feature/common/politic/data/politic_service.dart';
import 'package:fkn/feature/common/politic/politic_manager.dart';
import 'package:fkn/feature/common/push/one_signal_listener.dart';
import 'package:fkn/feature/common/showcase/data/showcase_repository.dart';
import 'package:fkn/feature/common/showcase/data/showcase_service.dart';
import 'package:fkn/feature/common/showcase/showcase_manager.dart';
import 'package:fkn/feature/student/bookmark/bookmark_manager.dart';
import 'package:fkn/feature/student/bookmark/data/bookmark_repository.dart';
import 'package:fkn/feature/student/bookmark/data/bookmark_service.dart';
import 'package:fkn/feature/student/profile/data/profile_repository.dart';
import 'package:fkn/feature/student/profile/data/service/profile_service.dart';
import 'package:fkn/feature/student/profile/profile_manager.dart';
import 'package:fkn/feature/student/rating/data/career_repository.dart';
import 'package:fkn/feature/student/rating/data/career_service.dart';
import 'package:fkn/feature/student/rating/rating_manager.dart';
import 'package:fkn/feature/student/teacher_timetable/data/teacher_timetable_repository.dart';
import 'package:fkn/feature/student/teacher_timetable/teacher_timetable_bookmark_manager.dart';
import 'package:fkn/feature/student/timetable/data/timetable_repository.dart';
import 'package:fkn/feature/student/timetable/data/timetable_service.dart';
import 'package:fkn/feature/student/timetable/timetable_manager.dart';
import 'package:fkn/feature/teacher/subject_grades/data/subject_grades_repository.dart';
import 'package:fkn/feature/teacher/subject_grades/data/subject_grades_service.dart';
import 'package:fkn/feature/teacher/subject_grades/subject_grades_manager.dart';
import 'package:fkn/feature/teacher/teacher_attendance_journal/attendance_journal.dart';
import 'package:fkn/feature/teacher/teacher_attendance_journal/data/attendance_journal_repository.dart';
import 'package:fkn/feature/teacher/teacher_attendance_journal/data/attendance_journal_service.dart';
import 'package:fkn/feature/teacher/teacher_journal/data/teacher_journal_repository.dart';
import 'package:fkn/feature/teacher/teacher_journal/data/teacher_journal_service.dart';
import 'package:fkn/feature/teacher/teacher_journal/teacher_journal_manager.dart';
import 'package:fkn/feature/teacher/teacher_profile/data/teacher_profile_repository.dart';
import 'package:fkn/feature/teacher/teacher_profile/data/teacher_profile_service.dart';
import 'package:fkn/feature/teacher/teacher_profile/teacher_profile_manager.dart';
import 'package:fkn/feature/teacher/teacher_timetable/data/teacher_timetable_repository.dart';
import 'package:fkn/feature/teacher/teacher_timetable/data/teacher_timetable_service.dart';
import 'package:fkn/feature/teacher/teacher_timetable/teacher_timetable_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart' hide Environment;
import 'package:permission_handler/permission_handler.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../environment/interceptor/mobile_app_vsu_interceptor.dart';
import '../feature/student/teacher_timetable/data/teacher_timetable_bookmark_service.dart';
import 'configure_dependencies.dart';
import 'dio_configurator.dart';

// Import package

class BasicInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Authorization'] = 'Basic YXBwOmZpdHRpbmFwcA==';
    super.onRequest(options, handler);
  }
}

Future<void> initServices(Environment environment) async {
  var appTrackingTransparencyStatus =
      await Permission.appTrackingTransparency.status;
  // радикальное решение проблемы отсутствия запроса
  while (Platform.isIOS &&
      appTrackingTransparencyStatus == PermissionStatus.denied) {
    appTrackingTransparencyStatus =
        await Permission.appTrackingTransparency.request();
    if (appTrackingTransparencyStatus == PermissionStatus.denied) {
      await Future.delayed(const Duration(milliseconds: 500));
    }
  }
  // радикальное решение проблемы отсутствия запроса 2
  var geolocationStatus = await Permission.locationWhenInUse.status;
  if (Platform.isIOS) {
    while (geolocationStatus == PermissionStatus.denied) {
      geolocationStatus = await Permission.locationWhenInUse.request();
      if (geolocationStatus == PermissionStatus.denied) {
        await Future.delayed(const Duration(milliseconds: 500));
      }
    }
  } else {
    if (geolocationStatus == PermissionStatus.denied) {
      await Permission.locationWhenInUse.request();
    }
  }

  final profile = getIt.get<IProfile<UserData>>();
  final dio = getIt.get<Dio>();
  initDio(environment: environment, dio: dio, additionalInterceptors: []);
  dio.interceptors.add(UUIDInterceptor());
  dio.interceptors.add(MobileAppVSUInterceptor());

  /// кидайте в меня камни
  /// мне надоел спам в терминале, который можно посмотреть в инспекторе
  if (kDebugMode) {
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        request: true,
        responseBody: true,
        compact: true,
      ),
    );
  }

  final jwtInterceptor = JWTInterceptor(
    dio: dio,
    profile: profile,
    freeTokenUrl: '/auth/token/free',
    refreshUrl: '/auth/token/refresh',
  );

  dio.interceptors.add(jwtInterceptor);
  await jwtInterceptor.initTokens();

  dio.interceptors.add(
    TimeoutInterceptor(getIt.get<IEventBus>(), dio),
  );

  await AppMetrica.activate(const AppMetricaConfig(appMetricaApiKey));

  (profile as Profile<UserData>).init();
  await profile.init();
  await getIt.get<TeacherProfileManager>().init();
  getIt.get<IEventBus>().init();

  getIt.get<RatingManager>().init();
  getIt.get<TimeTableManager>().init();
  getIt.get<TeacherTimetableManager>().init();
  getIt.get<ConsoleManager>().init();

  await OneSignalListener.init(profile);
}

@module
abstract class RegisterModules {
  static final Dio _dio = Dio();
  static final EventBus _eventBus = EventBus();

  @singleton
  IEventBus eventBus() => _eventBus;

  @singleton
  Dio dio() => _dio;

  // console API
  @singleton
  ConsoleService consoleService(Dio dio) => ConsoleService(dio);

  @singleton
  ConsoleManager consoleManager(ConsoleService service) =>
      ConsoleManager(service);

  @singleton
  ProfileService profileService(Dio dio) => ProfileService(dio);

  // profile
  @singleton
  ProfileRepository profileRepository(ProfileService service) =>
      ProfileRepository(service);

  @singleton
  IProfile<UserData> profile(
          ProfileRepository repository, IEventBus eventBus) =>
      Profile<UserData>(repository, eventBus);

  @singleton
  PoliticService politicService(Dio dio) => PoliticService(dio);

  // politic
  @singleton
  PoliticRepository politicRepository(PoliticService service) =>
      PoliticRepository(service);

  @singleton
  PoliticManager politicManager(PoliticRepository repository) =>
      PoliticManager(repository);

  @singleton
  TeacherProfileService teacherProfileService(Dio dio) =>
      TeacherProfileService(dio);

  // teacherProfile
  @singleton
  TeacherProfileRepository teacherProfileRepository(
          TeacherProfileService service) =>
      TeacherProfileRepository(service);

  @singleton
  TeacherProfileManager teacherProfileManager(
    TeacherProfileRepository repository,
    IEventBus eventBus,
  ) =>
      TeacherProfileManager(
        repository,
        eventBus,
      );

  @singleton
  TeacherTimetableService teacherTimetableService(Dio dio) =>
      TeacherTimetableService(dio);

  // teacherTimetable
  @singleton
  TeacherTimetableRepository teacherTimetableRepository(
          TeacherTimetableService service) =>
      TeacherTimetableRepository(service);

  @singleton
  TeacherTimetableManager teacherTimetableManager(
          TeacherTimetableRepository repository) =>
      TeacherTimetableManager(repository);

  @singleton
  TeacherJournalService teacherJournalService(Dio dio) =>
      TeacherJournalService(dio);

  // teacherJournal
  @singleton
  TeacherJournalRepository teacherJournalRepository(
          TeacherJournalService service) =>
      TeacherJournalRepository(service);

  @singleton
  TeacherJournalManager teacherJournalManager(
          TeacherJournalRepository repository) =>
      TeacherJournalManager(repository);

  @singleton
  TimeTableService timeTableService(Dio dio) => TimeTableService(dio);

  // timetable
  @singleton
  TimeTableRepository timeTableRepository(TimeTableService service) =>
      TimeTableRepository(service);

  @singleton
  TimeTableManager timeTableManager(
          TimeTableRepository repository, IEventBus eventBus) =>
      TimeTableManager(repository, eventBus);

  // showcase
  @singleton
  ShowcaseService showcaseService(Dio dio) => ShowcaseService(dio);

  @singleton
  ShowcaseRepository showcaseRepository(ShowcaseService service) =>
      ShowcaseRepository(service);

  @factoryMethod
  ShowcaseManager showcaseManager(
          ShowcaseRepository repository, IEventBus eventBus) =>
      ShowcaseManager(repository, eventBus)..init();

  @factoryMethod
  AllNewsManager allNewsManager(
          ShowcaseRepository repository, IEventBus eventBus) =>
      AllNewsManager(repository, eventBus)..init();

  @singleton
  CareerService careerService(Dio dio) => CareerService(dio);

  // career
  @singleton
  CareerRepository careerRepository(CareerService service) =>
      CareerRepository(service);

  @singleton
  RatingManager ratingManager(CareerRepository repo, IEventBus eventBus) =>
      RatingManager(repo, eventBus);

  // attendance
  @factoryMethod
  AttendanceJournalManager attendanceManager(Dio dio) =>
      AttendanceJournalManager(
          AttendanceJournalRepository(AttendanceJournalService(dio)));

  @factoryMethod
  SubjectGradesManager gradesManager(Dio dio) =>
      SubjectGradesManager(SubjectGradesRepository(SubjectGradesService(dio)));

  // bookmark
  @singleton
  BookmarkService bookmarkService(Dio dio) => BookmarkService(dio);

  @singleton
  BookmarkRepository bookmarkRepository(BookmarkService service) =>
      BookmarkRepository(service);

  @factoryMethod
  BookmarkManager bookmarkManager(BookmarkRepository repository) =>
      BookmarkManager(repository);

  // teacherTimetable bookmark
  @singleton
  TeacherTimetableBookmarkService teacherTimetableBookmarkService(Dio dio) =>
      TeacherTimetableBookmarkService(dio);

  @singleton
  TeacherTimetableBookmarkRepository teacherTimetableBookmarkRepository(
          TeacherTimetableBookmarkService service) =>
      TeacherTimetableBookmarkRepository(service);

  @factoryMethod
  TeacherTimetableBookmarkManager teacherTimetableBookmarkManager(
          TeacherTimetableBookmarkRepository repository) =>
      TeacherTimetableBookmarkManager(repository);
}
