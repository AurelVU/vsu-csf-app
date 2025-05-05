import 'package:fkn/domain/timetable/group_timetable.dart';
import 'package:fkn/domain/timetable/subject.dart';
import 'package:fkn/feature/student/timetable/data/timetable_service.dart';

class TimeTableRepository {
  TimeTableRepository(this._service);

  final TimeTableService _service;

  Future<List<DayTimetable>> getWeekTimetableByDate({required String date}) async {
    final timeTable = await _service.getTimetableTimetable(date: date);
    return timeTable.days
            ?.map(
              (e) => DayTimetable(
                dateTimetable: e.date,
                numerator: e.numerator,
                subjects: e.lessons
                        ?.map(
                          (e) => Subject(
                            name: e.subject,
                            startTime: e.startTime,
                            finishTime: e.finishTime,
                            teacher: e.teacher,
                            classroom: e.classroom,
                            isDistant: e.isDistant,
                            id: e.id,
                          ),
                        )
                        .toList() ??
                    [],
              ),
            )
            .toList() ??
        [];
  }

  Future<List<DayTimetable>> getExamTimetable() async {
    final exams = await _service.getExamTimeTable();
    return exams
        .map(
          (e) => DayTimetable(dateTimetable: e.date, subjects: [
            Subject(
              teacher: e.teacher,
              classroom: e.classroom,
              startTime: '${e.date?.hour.toString().padLeft(2, '0')}:${e.date?.minute.toString().padLeft(2, '0')}',
              name: e.subject,
            )
          ]),
        )
        .toList();
  }
}
