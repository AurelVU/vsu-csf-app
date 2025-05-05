import 'package:fkn/domain/teacher/timetable/teacher_lesson.dart';
import 'package:fkn/environment/lifecycle_module.dart';
import 'package:fkn/feature/teacher/teacher_journal/data/teacher_journal_repository.dart';
import 'package:rxdart/rxdart.dart';

class TeacherJournalManager extends LifecycleModule {
  TeacherJournalManager(
    this._teacherJournalRepository,
  );

  // построенно на модели из расписания, пока нет бека
  // скорее всего логичнее будет сделать другую модельку
  BehaviorSubject<List<TeacherLesson>> journal = BehaviorSubject();

  final TeacherJournalRepository _teacherJournalRepository;

  Future<void> updateJournal() async {
    try {
     final attendanceJournal  = await _teacherJournalRepository.getTeacherJournal();
    journal.value = attendanceJournal;
    } catch (e) {
      rethrow;
    }
  }
}
