import 'dart:math';

import 'package:appmetrica_plugin/appmetrica_plugin.dart';
import 'package:auto_route/auto_route.dart';
import 'package:fkn/domain/teacher/timetable/teacher_lesson.dart';
import 'package:fkn/environment/lifecycle_module.dart';
import 'package:fkn/feature/student/timetable/presentation/calendar_screen/calendar_screen_view.dart';
import 'package:fkn/feature/teacher/teacher_profile/teacher_profile_manager.dart';
import 'package:fkn/feature/teacher/teacher_timetable/teacher_timetable_manager.dart';
import 'package:fkn/router/router.dart';
import 'package:fkn/utils/attendence_utils.dart';
import 'package:fkn/utils/events_name.dart';
import 'package:fkn/utils/timetable_utils.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:rxdart/rxdart.dart';
import 'package:collection/collection.dart';

class TeacherTimetableScreenPresenter extends LifecycleModule {
  TeacherTimetableScreenPresenter({
    required this.router,
    required this.timetableManager,
    required this.profile,
    this.deviceWidth = 360,
    this.scaleFactor = 1,
  });

  final TeacherTimetableManager timetableManager;
  final TeacherProfileManager profile;
  final StackRouter router;

  double? maxScrollIntent;
  double scaleFactor;

  /// выбранный день
  final BehaviorSubject<DateTime?> selectedDateStream = BehaviorSubject.seeded(null);

  /// late потому что добавляется attachCallback, который скроллит на текущую дату
  late final ScrollController daysScrollController;

  final PageController subjectPageController = PageController();

  final double deviceWidth;

  double weekCardWidth = 68;

  final BehaviorSubject<double?> subjectPageAnimatedController = BehaviorSubject();

  @override
  void init() async {
    weekCardWidth = max(32.6 * scaleFactor + 32, 68);
    maxScrollIntent = 32 + weekCardWidth * 12 + 16 * 11 - deviceWidth;

    daysScrollController = ScrollController(
      onAttach: (position) {
        Future.microtask(() => scrollToDay(selectedDateStream.value, true));
      },
    );

    final currentDate = DateTime.now();
    selectedDateStream.value = currentDate;

    /// при каждой смене текущего дня, скролится на него
    selectedDateStream.listen((today) {
      scrollToDay(today);
    });

    subjectPageController.addListener(() {
      subjectPageAnimatedController.value = subjectPageController.page;
    });

    await timetableManager.updateTeacherTimeTable(currentDate);

    selectToday();
  }

  @override
  void dispose() {
    daysScrollController.dispose();
  }

  /// выбор текущего дня
  void selectToday() {
    final currentDate = DateTime.now();
    selectedDateStream.value = currentDate;

    final timetableData = timetableManager.timeTableStream.value;

    final todayDayIndex = timetableData.indexWhere((element) => isDateEqual(element.dateTimetable, currentDate));
    final todayDay = timetableData[todayDayIndex];

    timetableManager.todayTimetableStream.value = todayDay;

    /// МЕГАКОСТЫЛЬ
    /// по некоторым причинам при jumpToPage не меняет страницу в PageController (хотя на самом деле меняет)
    /// из-за чего не отрабаывает слушатель на subjectPageAnimatedController
    /// подобным костылем приходится возвращать его на место
    subjectPageController.jumpToPage(todayDayIndex);
    subjectPageAnimatedController.value = todayDayIndex.toDouble();
  }

  void slidePage(int index) {
    final nextTimetableDate = timetableManager.timeTableStream.value[index];
    selectedDateStream.value = nextTimetableDate.dateTimetable;
  }

  /// добавлен костыль в виде поля jump и 1 миллисекунды, так как toJump не
  /// работает корректно
  void scrollToDay(DateTime? day, [bool jump = false]) {
    if (daysScrollController.hasClients) {
      final selectedDayIndex = timetableManager.timeTableStream.value.indexWhere(
        (element) => isDateEqual(day, element.dateTimetable),
      );

      /// падинг + ширина карточки * количество дней + ширина отступов между карточками * их кол-во
      maxScrollIntent = 32 + weekCardWidth * 12 + 16 * 11 - deviceWidth;

      daysScrollController.animateTo(
        countOffset(
          deviceWidth: deviceWidth,
          customWidgetWidth: weekCardWidth,
          index: selectedDayIndex,
          maxPosition: maxScrollIntent ?? double.infinity,
        ),
        duration: Duration(milliseconds: jump == true ? 1 : 300),
        curve: Curves.ease,
      );

      if (jump) {
        subjectPageController.jumpToPage(selectedDayIndex);
      }
    }
  }

  Future<void> selectDate(DateTime dateTime) async {
    selectedDateStream.value = dateTime;

    final selectedDayIndex = timetableManager.timeTableStream.value.indexWhere(
      (element) => isDateEqual(dateTime, element.dateTimetable),
    );
    subjectPageController.jumpToPage(
      selectedDayIndex,
    );
    AppMetrica.reportEvent(EventName.selectSubjectDay);
  }

  Future<void> openCalendar(BuildContext context) async {
    final selectedDate = selectedDateStream.valueOrNull;
    if (selectedDate == null) {
      return;
    }
    AppMetrica.reportEvent(EventName.openCalendar);
    final dateFromCalendar = await showCupertinoModalBottomSheet<DateTime>(
      useRootNavigator: true,
      context: context,
      builder: (context) => CalendarScreenView(
        currDatetime: selectedDate,
      ),
    );
    if (dateFromCalendar == null) {
      return;
    }
    AppMetrica.reportEvent(EventName.changeDateByCalendar);
    final pickedDay = timetableManager.timeTableStream.valueOrNull
        ?.firstWhereOrNull((element) => isDateEqual(element.dateTimetable, dateFromCalendar));
    if (pickedDay != null) {
      selectedDateStream.value = dateFromCalendar;

      final selectedDayIndex = timetableManager.timeTableStream.value.indexWhere(
        (element) => isDateEqual(pickedDay.dateTimetable, element.dateTimetable),
      );
      subjectPageController.jumpToPage(selectedDayIndex);
    } else {
      selectedDateStream.value = dateFromCalendar;

      await timetableManager.updateTeacherTimeTable(dateFromCalendar);

      final newSelectedDay = timetableManager.timeTableStream.value
          .firstWhereOrNull((element) => isDateEqual(element.dateTimetable, dateFromCalendar));

      final selectedDayIndex = timetableManager.timeTableStream.value.indexWhere(
        (element) => isDateEqual(newSelectedDay?.dateTimetable, element.dateTimetable),
      );
      subjectPageController.jumpToPage(selectedDayIndex);
    }
  }

  void goToGroupAttendance(TeacherLesson teacherLesson, [String? date]) {
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
          date: date,
          lessonName: teacherLesson.subject ?? '',
          title: getAttendanceTitle(teacherLesson),
          subjectId: teacherLesson.subjectId ?? -1,
        ),
      );
    }
  }
}
