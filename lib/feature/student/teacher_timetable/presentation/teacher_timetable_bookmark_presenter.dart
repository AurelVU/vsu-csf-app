import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:fkn/environment/lifecycle_module.dart';
import 'package:fkn/feature/student/teacher_timetable/teacher_timetable_bookmark_manager.dart';
import 'package:fkn/feature/student/timetable/presentation/calendar_screen/calendar_screen_view.dart';
import 'package:fkn/utils/timetable_utils.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:rxdart/rxdart.dart';

class TeacherTimetableBookmarkScreenPresenter extends LifecycleModule {
  TeacherTimetableBookmarkScreenPresenter({
    required this.teacherTimetableBookmarkManager,
    required this.router,
    required this.teacherId,
  });

  final int teacherId;
  final TeacherTimetableBookmarkManager teacherTimetableBookmarkManager;
  final StackRouter router;
  final ScrollController scrollController = ScrollController();

  double lessonHeight = 0;
  double dateHeight = 0;
  double weekTypeHeight = 0;

  final BehaviorSubject<DateTime> scrollToDateStream = BehaviorSubject.seeded(DateTime.now());

  @override
  Future<void> init() async {
    super.init();
    final date = DateTime.now();
    await teacherTimetableBookmarkManager.updateTimetable(date: date, teacherId: teacherId);

    /// Х.РЮ МОМЕНТ
    await Future.delayed(const Duration(milliseconds: 150));
    scrollToDateStream.listen((value) {
      scrollToDay(value);
    });
  }

  Future<void> scrollToDay(DateTime dateTime) async {
    print('was scrolled');
    print(lessonHeight);
    print(dateHeight);
    print(weekTypeHeight);
    final lessonList = teacherTimetableBookmarkManager.teacherTimetableStream.value ?? [];
    final index = lessonList.indexWhere(
          (element) {
            return isDateEqual(element.dateTimetable, dateTime);
          },
        ) ;
    if (lessonList[index].lessons?.isEmpty == true){
      return;
    }
    int lessonCount = 0;
    int gapCount = 0;
    int dateCount = 0;
    double twoWeekHeight = index > 5 ? weekTypeHeight * 2.0 : weekTypeHeight;
    for (int i = 0; i < index; i++) {
      int dayLessonCount = lessonList[i].lessons?.length ?? 0;
      if (dayLessonCount != 0){
        dateCount++;
      }
      lessonCount += dayLessonCount;
      gapCount += max(dayLessonCount - 1, 0);
    }
    final offset = lessonCount * lessonHeight + gapCount * 8 + dateCount * dateHeight + twoWeekHeight + 12;
    if (scrollController.hasClients) {
      scrollController.animateTo(
        offset,
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }
  }

  @override
  void dispose() {
    teacherTimetableBookmarkManager.dispose();
  }

  Future<void> openCalendar(BuildContext context) async {
    final dateFromCalendar = await showCupertinoModalBottomSheet<DateTime>(
      useRootNavigator: true,
      context: context,
      builder: (context) => CalendarScreenView(
        currDatetime: DateTime.now(),
      ),
    );
    if (dateFromCalendar != null) {
      await teacherTimetableBookmarkManager.updateTimetable(date: dateFromCalendar, teacherId: teacherId);
      scrollToDay(dateFromCalendar);
    }
  }
}
