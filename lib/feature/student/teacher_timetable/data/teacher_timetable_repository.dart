import 'package:fkn/domain/teacher/timetable/teacher_day_timetable.dart';

import 'package:fkn/feature/student/teacher_timetable/data/teacher_timetable_bookmark_service.dart';
import 'package:fkn/feature/teacher/teacher_journal/mapper/teacher_journal_mapper.dart';
import 'package:fkn/utils/timetable_utils.dart';

class TeacherTimetableBookmarkRepository {
  TeacherTimetableBookmarkRepository(this._service);

  final TeacherTimetableBookmarkService _service;

  Future<List<TeacherDayTimetable>> getTeacherTimetable({
    required DateTime date,
    required int teacherId,
  }) async {
    final response = await _service.getTeacherTimetable(date: createStringFromDate(date), teacherId: teacherId);
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
