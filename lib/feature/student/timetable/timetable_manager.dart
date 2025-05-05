import 'dart:async';

import 'package:fkn/domain/showcase/next_subject.dart';
import 'package:fkn/domain/timetable/group_timetable.dart';
import 'package:fkn/environment/event_bus/event_bus.dart';
import 'package:fkn/environment/lifecycle_module.dart';
import 'package:fkn/feature/student/timetable/data/timetable_repository.dart';

import 'package:rxdart/rxdart.dart';
import 'package:intl/intl.dart' as intl;

class TimeTableManager extends LifecycleModule {
  TimeTableManager(
    this._timetableRepository,
    this._eventBus,
  );

  final IEventBus _eventBus;
  final TimeTableRepository _timetableRepository;

  /// хранит в себе список всех подгруженных дней
  final BehaviorSubject<List<DayTimetable>> timeTableStream = BehaviorSubject.seeded([]);

  /// хранит в себе список всех экзаменов
  final BehaviorSubject<List<DayTimetable>> examTimeTableStream = BehaviorSubject.seeded([]);

  /// стрим о состоянии расписания на текущий день
  /// нужен для получении информации о следующей паре на текущий день, чтобы не зависеть от текущего подгруженного списка
  final BehaviorSubject<DayTimetable?> todayTimetableStream = BehaviorSubject.seeded(null);

  /// информация о следующем предмете
  final BehaviorSubject<NextSubject?> nextSubjectStream = BehaviorSubject.seeded(null);

  @override
  void init() {
    todayTimetableStream.listen((value) {
      updateNextSubject();
    });
    Timer.periodic(const Duration(minutes: 1), (time) => updateNextSubject());
  }

  void updateNextSubject() {
    nextSubjectStream.value = getNextSubject();
  }

  Future<void> updateSubjectTimetable(DateTime dateTime) async {
    timeTableStream.value =
        await _timetableRepository.getWeekTimetableByDate(date: intl.DateFormat('yyyy-MM-dd').format(dateTime));
  }

  Future<void> updateExamsTimetable() async {
    examTimeTableStream.value =  await _timetableRepository.getExamTimetable();
  }

  NextSubject getNextSubject() {
    final currentDate = DateTime.now();

    final pickedDay = todayTimetableStream.valueOrNull;

    final subjects = pickedDay?.subjects;
    if (subjects == null) {
      return NextSubject();
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
        return NextSubject(subject: subject, status: 'Следующая пара');
      } else if (currentDate.isAfter(finishTime)) {
        continue;
      } else {
        return NextSubject(subject: subject, status: 'Сейчас идет');
      }
    }
    return NextSubject();
  }
}
