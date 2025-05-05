import 'package:fkn/domain/teacher/timetable/teacher_day_timetable.dart';
import 'package:fkn/feature/teacher/teacher_journal/mapper/teacher_journal_mapper.dart';
import 'package:fkn/feature/teacher/teacher_timetable/data/teacher_timetable_service.dart';

class TeacherTimetableRepository {
  TeacherTimetableRepository(this._service);

  final TeacherTimetableService _service;

  // разнести бы это по мапперам
  Future<List<TeacherDayTimetable>> getTimeTable({required String date}) async {
    final response = await _service.getTeacherTimetable(date: date);
    return response.days
            ?.map(
              (e) => TeacherDayTimetable(
                dateTimetable: e.date,
                numerator: e.numerator,
                lessons: e.lessons
                        ?.map(
                          (lesson) => getTeacherLessonFromDto(
                            lesson,
                          ),
                        )
                        .toList() ??
                    [],
              ),
            )
            .toList() ??
        [];
  }
}
