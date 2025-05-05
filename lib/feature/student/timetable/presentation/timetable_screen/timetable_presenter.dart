import 'package:appmetrica_plugin/appmetrica_plugin.dart';
import 'package:auto_route/auto_route.dart';
import 'package:fkn/domain/profile/user_data.dart';
import 'package:fkn/environment/lifecycle_module.dart';
import 'package:fkn/feature/student/timetable/presentation/calendar_screen/calendar_screen_view.dart';
import 'package:fkn/feature/student/timetable/timetable_manager.dart';
import 'package:fkn/router/router.dart';
import 'package:fkn/utils/events_name.dart';
import 'package:fkn/utils/timetable_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:rxdart/rxdart.dart';
import 'package:collection/collection.dart';

import '../../../profile/profile_manager.dart';

class TimeTableScreenPresenter extends LifecycleModule {
  TimeTableScreenPresenter({
    this.deviceWidth = 360.0,
    required this.profile,
    required this.router,
    required this.timetableManager,
    required this.vsync,
  });

  final TickerProvider vsync;

  final StackRouter router;
  final TimeTableManager timetableManager;
  final IProfile<UserData> profile;

  final double deviceWidth;
  double? maxScrollIntent;

  double weekCardWidth = 68;

  /// пагинация между днями
  final PageController subjectPageController = PageController();

  /// отечественная разработка
  /// пагинация между типами
  final PageController typePageController = PageController();

  final BehaviorSubject<double?> subjectPageAnimatedController = BehaviorSubject();

  /// late потому что добавляется attachCallback, который скроллит на текущую дату
  late final ScrollController daysScrollController;

  late final AnimationController animationController;

  /// выбранная дата
  /// на основании даты выбирается нужное расписание
  final BehaviorSubject<DateTime?> selectedDateStream = BehaviorSubject.seeded(null);

  /// стрим отвечающий за тип расписания ()
  final BehaviorSubject<bool> isSubjectTimetableStream = BehaviorSubject.seeded(true);

  @override
  void init() async {
    /// 2 паддинга по бокам + максимальное количество карточек + максимальное количество отступов минус ширина экрана
    /// делается так, потому что в моменте может не быть аттача у скролл контроллера и мы не можем узнать его maxIntent
    maxScrollIntent = 32 + weekCardWidth * 12 + 16 * 11 - deviceWidth;

    daysScrollController = ScrollController(
      onAttach: (position) {
        Future.microtask(() => scrollToDay(selectedDateStream.value, true));
      },
    );

    animationController = AnimationController(
      vsync: vsync,
      duration: const Duration(milliseconds: 300),
    );

    final currentDate = DateTime.now();
    selectedDateStream.value = currentDate;


    /// при каждой смене текущего дня, скролится на него
    selectedDateStream.listen((today) {
      scrollToDay(today);
    });

    /// для анимации
    subjectPageController.addListener(() {
      subjectPageAnimatedController.value = subjectPageController.page;
    });



    /// загрузка данных
    await timetableManager.updateSubjectTimetable(currentDate);
    await timetableManager.updateExamsTimetable();

    /// выбор текущего дня и расписания
    selectToday();
  }

  @override
  void dispose() {
    selectedDateStream.close();
  }

  /// выбор текущего дня
  void selectToday({DraggableScrollableController? controller}) {
    changeToSubject(controller: controller);
    final currentDate = DateTime.now();
    selectedDateStream.value = currentDate;

    final timetableData = timetableManager.timeTableStream.value;

    final todayDayIndex = timetableData.indexWhere((element) => isDateEqual(element.dateTimetable, currentDate));
    final todayDay = timetableData[todayDayIndex];

    timetableManager.todayTimetableStream.value = todayDay;

    /// МЕГАКОСТЫЛЬ
    /// понекоторым причинам при jumpToPage не меняет страницу в PageController (хотя на самом деле меняет)
    /// из-за чего не отрабаывает слушатель на subjectPageAnimatedController
    /// подобным костылем приходится возвращать его на место
    subjectPageController.jumpToPage(todayDayIndex);
    subjectPageAnimatedController.value = todayDayIndex.toDouble();
  }

  void slidePage(int index) {
      final nextTimetableDate = timetableManager.timeTableStream.value[index];

      selectedDateStream.value = nextTimetableDate.dateTimetable;
  }

  /// добавлен костыль в виде поля jump, так как toJump не работает корректно
  void scrollToDay(DateTime? day, [bool jump = false]) {
    if (daysScrollController.hasClients  ) {
      final selectedDayIndex = timetableManager.timeTableStream.value.indexWhere(
        (element) => isDateEqual(day, element.dateTimetable),
      );
      print('page $selectedDayIndex');
      daysScrollController.animateTo(
        countOffset(
          deviceWidth: deviceWidth,
          customWidgetWidth: weekCardWidth,
          index: selectedDayIndex,
          maxPosition:  maxScrollIntent ?? double.infinity,
        ),
        duration: Duration(milliseconds: jump == true ? 1 : 300),
        curve: Curves.ease,
      );

      if (jump) {
        subjectPageController.jumpToPage(selectedDayIndex);

      }
    }
  }

  void changeToExam({DraggableScrollableController? controller}) {
    isSubjectTimetableStream.value = false;
    typePageController.jumpToPage(1);
    animationController.forward();
    if (controller != null) {
      controller.animateTo(
        0.7,
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }

    AppMetrica.reportEvent(EventName.changeToExamTimeTable);
  }

  void changeToSubject({DraggableScrollableController? controller}) {
    isSubjectTimetableStream.value = true;
    animationController.reverse();
    typePageController.jumpToPage(0);

    if (controller != null) {
      controller.animateTo(
        0.55,
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }



    AppMetrica.reportEvent(EventName.changeToSubjectTimeTable);
  }

  /// выбор даты по карточке
  /// меняет выбранную дату и страницу
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

  void back() {
    router.pop();
  }

  Future<void> openBookmark() async{
    router.navigate(const BookmarkRoute());
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
      await timetableManager.updateSubjectTimetable(dateFromCalendar);
      final newSelectedDay = timetableManager.timeTableStream.value
          .firstWhereOrNull((element) => isDateEqual(element.dateTimetable, dateFromCalendar));
      final selectedDayIndex = timetableManager.timeTableStream.value.indexWhere(
        (element) => isDateEqual(newSelectedDay?.dateTimetable, element.dateTimetable),
      );
      subjectPageController.jumpToPage(selectedDayIndex);
    }
  }
}
