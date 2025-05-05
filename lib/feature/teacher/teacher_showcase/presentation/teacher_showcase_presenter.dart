import 'package:appmetrica_plugin/appmetrica_plugin.dart';
import 'package:auto_route/auto_route.dart';
import 'package:fkn/domain/teacher/timetable/teacher_lesson.dart';
import 'package:fkn/environment/lifecycle_module.dart';
import 'package:fkn/feature/common/showcase/showcase_manager.dart';
import 'package:fkn/feature/teacher/teacher_profile/teacher_profile_manager.dart';
import 'package:fkn/feature/teacher/teacher_timetable/teacher_timetable_manager.dart';
import 'package:fkn/router/router.dart';
import 'package:fkn/utils/attendence_utils.dart';
import 'package:fkn/utils/events_name.dart';
import 'package:url_launcher/url_launcher.dart';

class TeacherShowcaseScreenPresenter extends LifecycleModule {
  TeacherShowcaseScreenPresenter({
    required this.teacherTimeTableManager,
    required this.router,
    required this.profileManager,
    required this.showcaseManager,
  });

  final TeacherTimetableManager teacherTimeTableManager;
  final StackRouter router;
  final TeacherProfileManager profileManager;
  final ShowcaseManager showcaseManager;

  @override
  void init() {
    super.init();
    showcaseManager.updateUniversityPreview();
    showcaseManager.updateDepartmentPreview();
  }


  void routeToProfile() {
    router.navigate(const TeacherProfileTab());
  }

  void routeToContact() {
    launchUrl(Uri.parse('https://t.me/FittinVSU'));
  }


  void showAllNews(String type, String title ) {
    router.navigate(
      AllNewRoute(
        title: title,
        type: type,
      ),
    );
  }


  void routeToTimeTable() {
    router.navigate(TeacherTimeTableTab(
        children: [TeacherTimetableRoute(returnToToday: true)]));
    AppMetrica.reportEvent(EventName.routeToTimeTableFromShowcase);
  }

  void goToGroupAttendance(TeacherLesson teacherLesson) {
    final groups = teacherLesson.studentGroups
            ?.where((group) => group.id != null && group.id!.isNotEmpty)
            .map((e) => e.id!)
            .expand((group) => group)
            .toList() ??
        [];
    if (groups.isNotEmpty) {
      router.push(
        TeacherAttendanceJournalRoute(
          groupIds: groups,
          lessonId: teacherLesson.id!,
          lessonName: teacherLesson.subject ?? '',
          title: getAttendanceTitle(teacherLesson),
          subjectId: teacherLesson.subjectId ?? -1,
        ),
      );
    }
  }
}
