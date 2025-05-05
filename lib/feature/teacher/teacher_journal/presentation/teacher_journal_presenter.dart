import 'package:auto_route/auto_route.dart';
import 'package:fkn/domain/teacher/timetable/teacher_lesson.dart';
import 'package:fkn/environment/lifecycle_module.dart';
import 'package:fkn/feature/teacher/teacher_journal/teacher_journal_manager.dart';
import 'package:fkn/router/router.dart';
import 'package:fkn/utils/attendence_utils.dart';

class TeacherJournalScreenPresenter extends LifecycleModule {
  TeacherJournalScreenPresenter({
    required this.journalManager,
    required this.router,
  });

  final StackRouter router;
  final TeacherJournalManager journalManager;

  @override
  void init() {
    _getTeacherJournal();
    super.init();
  }

  Future<void> _getTeacherJournal() async {
    try {
      await journalManager.updateJournal();
    } catch (e) {
      rethrow;
    }
  }

  void goToGroupAttendance(TeacherLesson teacherLesson) {
    final groups = teacherLesson.studentGroups?.first.id ?? [];
    router.push(
      TeacherAttendanceJournalRoute(
        groupIds: groups,
        lessonId: teacherLesson.id!,
        lessonName: teacherLesson.subject ?? '',
        title: getAttendanceTitle(teacherLesson),
        subjectId: teacherLesson.subjectId ?? -1,
        markType: teacherLesson.markType,
      ),
    );
  }

  void goToSubjectGrades(TeacherLesson teacherLesson) {
    final groups = teacherLesson.studentGroups?.first.id ?? [];
    router.push(
      SubjectGradesRoute(
        groupIds: groups,
        lessonId: teacherLesson.id!,
        subjectId: teacherLesson.subjectId ?? -1,
        lessonName: teacherLesson.subject ?? '',
        title: getAttendanceTitle(teacherLesson),
        markType: teacherLesson.markType ?? '',
      ),
    );
  }
}
