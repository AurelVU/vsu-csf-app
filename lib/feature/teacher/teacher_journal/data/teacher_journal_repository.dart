import 'package:fkn/domain/teacher/timetable/teacher_lesson.dart';
import 'package:fkn/feature/teacher/teacher_journal/data/teacher_journal_service.dart';
import 'package:fkn/feature/teacher/teacher_journal/mapper/teacher_journal_mapper.dart';

class TeacherJournalRepository {
  TeacherJournalRepository(this._service);

  final TeacherJournalService _service;

  Future<List<TeacherLesson>> getTeacherJournal() async {
    try {
      final journal = await _service.getTeacherJournal();
      final attendanceJournal = journal.map(getTeacherLessonFromDto).toList();
      return attendanceJournal;
    } catch (e) {
      rethrow;
    }
  }
}
