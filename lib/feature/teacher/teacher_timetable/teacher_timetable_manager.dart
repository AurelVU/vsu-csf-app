import 'dart:async';

import 'package:fkn/domain/teacher/timetable/teacher_day_timetable.dart';
import 'package:fkn/domain/teacher/timetable/teacher_lesson.dart';
import 'package:fkn/environment/lifecycle_module.dart';
import 'package:fkn/feature/teacher/teacher_timetable/data/teacher_timetable_repository.dart';
import 'package:rxdart/rxdart.dart';
import 'package:intl/intl.dart' as intl;

class TeacherTimetableManager extends LifecycleModule {
  TeacherTimetableManager(
    this._teacherTimetableRepository,
  );

  final TeacherTimetableRepository _teacherTimetableRepository;

  /// хранит в себе список всех подгруженных дней
  final BehaviorSubject<List<TeacherDayTimetable>> timeTableStream =
      BehaviorSubject.seeded([]);

  /// стрим о состоянии расписания на текущий день
  /// нужен для получении информации о следующей паре на текущий день, чтобы не зависеть от текущего подгруженного списка
  final BehaviorSubject<TeacherDayTimetable?> todayTimetableStream =
      BehaviorSubject.seeded(null);

  /// информация о следующем или текущем предмете
  final BehaviorSubject<TeacherLesson?> nextSubjectStream =
      BehaviorSubject.seeded(null);

  @override
  void init() {
    todayTimetableStream.listen((value) {
      updateNextSubject();
    });
    Timer.periodic(const Duration(minutes: 1), (time) => updateNextSubject());
  }

  Future<void> updateTeacherTimeTable(DateTime dateTime) async {
    timeTableStream.value = await _teacherTimetableRepository.getTimeTable(
        date: intl.DateFormat('yyyy-MM-dd').format(dateTime));
  }

  void updateNextSubject() {
    nextSubjectStream.value = getNextSubject();
  }

  // сия отечественная разработка проходит по предметам, определеяет в каком промежутке мы и возвращает нужный нам предмет
  // если нужен статус, надо обернуть в класс-декоратор
  TeacherLesson? getNextSubject() {
    final currentDate = DateTime.now();

    final pickedDay = todayTimetableStream.valueOrNull;

    final subjects = pickedDay?.lessons;
    if (subjects == null) {
      return null;
    }
    for (final subject in subjects) {
      final startTime = DateTime(
        currentDate.year,
        currentDate.month,
        currentDate.day,
        int.parse(subject.startTime?.split(':')[0] ?? '0'),
        int.parse(subject.startTime?.split(':')[1] ?? '0'),
      );
      final finishTime = DateTime(
        currentDate.year,
        currentDate.month,
        currentDate.day,
        int.parse(subject.finishTime?.split(':')[0] ?? '0'),
        int.parse(subject.finishTime?.split(':')[1] ?? '0'),
      );
      if (currentDate.isBefore(startTime)) {
        return subject;
      } else if (currentDate.isAfter(finishTime)) {
        continue;
      } else {
        return subject;
      }
    }
    return null;
  }
}
