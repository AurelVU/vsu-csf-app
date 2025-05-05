import 'package:fkn/domain/teacher/timetable/teacher_day_timetable.dart';
import 'package:fkn/environment/lifecycle_module.dart';
import 'package:fkn/feature/student/teacher_timetable/data/teacher_timetable_repository.dart';
import 'package:rxdart/rxdart.dart';

class TeacherTimetableBookmarkManager extends LifecycleModule {
  TeacherTimetableBookmarkManager(
    this._teacherTimetableRepository,
  );

  final TeacherTimetableBookmarkRepository _teacherTimetableRepository;

  BehaviorSubject<List<TeacherDayTimetable>?> teacherTimetableStream = BehaviorSubject();

  Future<void> updateTimetable({required DateTime date, required int teacherId}) async {
    final response = await _teacherTimetableRepository.getTeacherTimetable(date: date, teacherId: teacherId);
    teacherTimetableStream.value = response;
  }

  @override
  void dispose() {
    teacherTimetableStream.close();
    super.dispose();
  }
}
