// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:fkn/di/register_modules.dart' as _i41;
import 'package:fkn/domain/profile/user_data.dart' as _i21;
import 'package:fkn/environment/event_bus/event_bus.dart' as _i3;
import 'package:fkn/feature/common/console/console_manager.dart' as _i31;
import 'package:fkn/feature/common/console/console_service.dart' as _i5;
import 'package:fkn/feature/common/news/all_news_manager.dart' as _i25;
import 'package:fkn/feature/common/politic/data/politic_repository.dart'
    as _i19;
import 'package:fkn/feature/common/politic/data/politic_service.dart' as _i7;
import 'package:fkn/feature/common/politic/politic_manager.dart' as _i26;
import 'package:fkn/feature/common/showcase/data/showcase_repository.dart'
    as _i23;
import 'package:fkn/feature/common/showcase/data/showcase_service.dart' as _i12;
import 'package:fkn/feature/common/showcase/showcase_manager.dart' as _i24;
import 'package:fkn/feature/student/bookmark/bookmark_manager.dart' as _i37;
import 'package:fkn/feature/student/bookmark/data/bookmark_repository.dart'
    as _i35;
import 'package:fkn/feature/student/bookmark/data/bookmark_service.dart'
    as _i14;
import 'package:fkn/feature/student/profile/data/profile_repository.dart'
    as _i18;
import 'package:fkn/feature/student/profile/data/service/profile_service.dart'
    as _i6;
import 'package:fkn/feature/student/profile/profile_manager.dart' as _i20;
import 'package:fkn/feature/student/rating/data/career_repository.dart' as _i33;
import 'package:fkn/feature/student/rating/data/career_service.dart' as _i13;
import 'package:fkn/feature/student/rating/rating_manager.dart' as _i36;
import 'package:fkn/feature/student/teacher_timetable/data/teacher_timetable_bookmark_service.dart'
    as _i15;
import 'package:fkn/feature/student/teacher_timetable/data/teacher_timetable_repository.dart'
    as _i27;
import 'package:fkn/feature/student/teacher_timetable/teacher_timetable_bookmark_manager.dart'
    as _i40;
import 'package:fkn/feature/student/timetable/data/timetable_repository.dart'
    as _i28;
import 'package:fkn/feature/student/timetable/data/timetable_service.dart'
    as _i11;
import 'package:fkn/feature/student/timetable/timetable_manager.dart' as _i29;
import 'package:fkn/feature/teacher/subject_grades/subject_grades_manager.dart'
    as _i17;
import 'package:fkn/feature/teacher/teacher_attendance_journal/attendance_journal.dart'
    as _i16;
import 'package:fkn/feature/teacher/teacher_journal/data/teacher_journal_repository.dart'
    as _i32;
import 'package:fkn/feature/teacher/teacher_journal/data/teacher_journal_service.dart'
    as _i10;
import 'package:fkn/feature/teacher/teacher_journal/teacher_journal_manager.dart'
    as _i39;
import 'package:fkn/feature/teacher/teacher_profile/data/teacher_profile_repository.dart'
    as _i30;
import 'package:fkn/feature/teacher/teacher_profile/data/teacher_profile_service.dart'
    as _i8;
import 'package:fkn/feature/teacher/teacher_profile/teacher_profile_manager.dart'
    as _i34;
import 'package:fkn/feature/teacher/teacher_timetable/data/teacher_timetable_repository.dart'
    as _i22;
import 'package:fkn/feature/teacher/teacher_timetable/data/teacher_timetable_service.dart'
    as _i9;
import 'package:fkn/feature/teacher/teacher_timetable/teacher_timetable_manager.dart'
    as _i38;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModules = _$RegisterModules();
    gh.singleton<_i3.IEventBus>(() => registerModules.eventBus());
    gh.singleton<_i4.Dio>(() => registerModules.dio());
    gh.singleton<_i5.ConsoleService>(
        () => registerModules.consoleService(gh<_i4.Dio>()));
    gh.singleton<_i6.ProfileService>(
        () => registerModules.profileService(gh<_i4.Dio>()));
    gh.singleton<_i7.PoliticService>(
        () => registerModules.politicService(gh<_i4.Dio>()));
    gh.singleton<_i8.TeacherProfileService>(
        () => registerModules.teacherProfileService(gh<_i4.Dio>()));
    gh.singleton<_i9.TeacherTimetableService>(
        () => registerModules.teacherTimetableService(gh<_i4.Dio>()));
    gh.singleton<_i10.TeacherJournalService>(
        () => registerModules.teacherJournalService(gh<_i4.Dio>()));
    gh.singleton<_i11.TimeTableService>(
        () => registerModules.timeTableService(gh<_i4.Dio>()));
    gh.singleton<_i12.ShowcaseService>(
        () => registerModules.showcaseService(gh<_i4.Dio>()));
    gh.singleton<_i13.CareerService>(
        () => registerModules.careerService(gh<_i4.Dio>()));
    gh.singleton<_i14.BookmarkService>(
        () => registerModules.bookmarkService(gh<_i4.Dio>()));
    gh.singleton<_i15.TeacherTimetableBookmarkService>(
        () => registerModules.teacherTimetableBookmarkService(gh<_i4.Dio>()));
    gh.factory<_i16.AttendanceJournalManager>(
        () => registerModules.attendanceManager(gh<_i4.Dio>()));
    gh.factory<_i17.SubjectGradesManager>(
        () => registerModules.gradesManager(gh<_i4.Dio>()));
    gh.singleton<_i18.ProfileRepository>(
        () => registerModules.profileRepository(gh<_i6.ProfileService>()));
    gh.singleton<_i19.PoliticRepository>(
        () => registerModules.politicRepository(gh<_i7.PoliticService>()));
    gh.singleton<_i20.IProfile<_i21.UserData>>(() => registerModules.profile(
          gh<_i18.ProfileRepository>(),
          gh<_i3.IEventBus>(),
        ));
    gh.singleton<_i22.TeacherTimetableRepository>(() => registerModules
        .teacherTimetableRepository(gh<_i9.TeacherTimetableService>()));
    gh.singleton<_i23.ShowcaseRepository>(
        () => registerModules.showcaseRepository(gh<_i12.ShowcaseService>()));
    gh.factory<_i24.ShowcaseManager>(() => registerModules.showcaseManager(
          gh<_i23.ShowcaseRepository>(),
          gh<_i3.IEventBus>(),
        ));
    gh.factory<_i25.AllNewsManager>(() => registerModules.allNewsManager(
          gh<_i23.ShowcaseRepository>(),
          gh<_i3.IEventBus>(),
        ));
    gh.singleton<_i26.PoliticManager>(
        () => registerModules.politicManager(gh<_i19.PoliticRepository>()));
    gh.singleton<_i27.TeacherTimetableBookmarkRepository>(() =>
        registerModules.teacherTimetableBookmarkRepository(
            gh<_i15.TeacherTimetableBookmarkService>()));
    gh.singleton<_i28.TimeTableRepository>(
        () => registerModules.timeTableRepository(gh<_i11.TimeTableService>()));
    gh.singleton<_i29.TimeTableManager>(() => registerModules.timeTableManager(
          gh<_i28.TimeTableRepository>(),
          gh<_i3.IEventBus>(),
        ));
    gh.singleton<_i30.TeacherProfileRepository>(() => registerModules
        .teacherProfileRepository(gh<_i8.TeacherProfileService>()));
    gh.singleton<_i31.ConsoleManager>(
        () => registerModules.consoleManager(gh<_i5.ConsoleService>()));
    gh.singleton<_i32.TeacherJournalRepository>(() => registerModules
        .teacherJournalRepository(gh<_i10.TeacherJournalService>()));
    gh.singleton<_i33.CareerRepository>(
        () => registerModules.careerRepository(gh<_i13.CareerService>()));
    gh.singleton<_i34.TeacherProfileManager>(
        () => registerModules.teacherProfileManager(
              gh<_i30.TeacherProfileRepository>(),
              gh<_i3.IEventBus>(),
            ));
    gh.singleton<_i35.BookmarkRepository>(
        () => registerModules.bookmarkRepository(gh<_i14.BookmarkService>()));
    gh.singleton<_i36.RatingManager>(() => registerModules.ratingManager(
          gh<_i33.CareerRepository>(),
          gh<_i3.IEventBus>(),
        ));
    gh.factory<_i37.BookmarkManager>(
        () => registerModules.bookmarkManager(gh<_i35.BookmarkRepository>()));
    gh.singleton<_i38.TeacherTimetableManager>(() => registerModules
        .teacherTimetableManager(gh<_i22.TeacherTimetableRepository>()));
    gh.singleton<_i39.TeacherJournalManager>(() => registerModules
        .teacherJournalManager(gh<_i32.TeacherJournalRepository>()));
    gh.factory<_i40.TeacherTimetableBookmarkManager>(() =>
        registerModules.teacherTimetableBookmarkManager(
            gh<_i27.TeacherTimetableBookmarkRepository>()));
    return this;
  }
}

class _$RegisterModules extends _i41.RegisterModules {}
