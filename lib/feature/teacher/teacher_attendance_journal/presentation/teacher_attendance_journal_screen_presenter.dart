import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:fkn/domain/teacher/attendance/attendance.dart';
import 'package:fkn/domain/teacher/attendance/attendance_date.dart';
import 'package:fkn/domain/teacher/attendance/attendance_student.dart';
import 'package:fkn/environment/lifecycle_module.dart';
import 'package:fkn/feature/teacher/teacher_attendance_journal/attendance_journal.dart';
import 'package:fkn/feature/teacher/teacher_attendance_journal/components/attendance_modal_popup.dart';
import 'package:fkn/startup/app_color.dart';
import 'package:fkn/startup/app_typography.dart';
import 'package:fkn/utils/dialog_utils.dart';
import 'package:fkn/utils/timetable_utils.dart' as utils;
import 'package:fkn/utils/timetable_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';
import 'package:rxdart/rxdart.dart';

class TeacherAttendanceJournalScreenPresenter extends LifecycleModule {
  TeacherAttendanceJournalScreenPresenter({
    required this.lessonId,
    this.subjectId,
    required this.vsync,
    required this.attendanceJournalManager,
    required this.router,
    required this.width,
    required this.height,
    required this.groupIds,
    this.scaleFactor = 1,
    this.date,
  });

  /// нужны для корректной работы прокрутки
  final double width;
  final double height;

  final StackRouter router;
  final AttendanceJournalManager attendanceJournalManager;
  final List<int> groupIds;
  final int? subjectId;
  final int lessonId;
  final String? date;

  double nameHeight = 56;
  double markHeight = 50;

  /// используется дря расчета в скролле
  double scaleFactor;
  double cardWidth = 68;

  final LinkedScrollControllerGroup groupController =
      LinkedScrollControllerGroup();

  /// выбранная дата
  final BehaviorSubject<AttendanceDate?> selectedDateStream =
      BehaviorSubject.seeded(null);

  final ScrollController verticalScrollController = ScrollController();
  final ScrollController horizontalScrollController = ScrollController();
  final BehaviorSubject<double> nameOffset = BehaviorSubject.seeded(0);

  /// стрим для текущих отметок
  /// если он не пустой, показывается кнопка сохранить
  /// потом весь список этих запросов отправляется на бек по каждой дате
  final BehaviorSubject<Map<AttendanceDate, List<Attendance>>>
      changedAttendanceStream = BehaviorSubject.seeded({});

  AnimationController? lottieController;

  final TickerProvider vsync;

  @override
  Future<void> init() async {
    await _getTeacherAttendanceJournal();
    initScroll();

    /// сделано для красоты и эстетики, типо маленькая задержка перед скроллом
    Future.delayed(
      const Duration(milliseconds: 150),
      () => initScroll(),
    );

    /// полный обман, 100 скроллконтроллеров просто не успевают заинититься, и им нужно время

    lottieController = AnimationController(vsync: vsync);
    super.init();
  }

  @override
  void dispose() {
    selectedDateStream.close();
    lottieController?.dispose();
    super.dispose();
  }

  void initScroll() {
    changeToSelected(date);
  }

  Future<void> stopAttendanceAdvertising() async {
    await _getTeacherAttendanceJournal();
    // router.pop();
  }

  void changeToSelected(String? date) {
    date ??= createStringDate(DateTime.now());
    final dates = attendanceJournalManager.attendanceJournal.value.dates ?? [];
    final attendanceDate =
        dates.firstWhereOrNull((element) => element.date == date);
    if (attendanceDate != null) {
      selectedDate(attendanceDate);
    }
  }

  Future<void> _getTeacherAttendanceJournal() async {
    try {
      await attendanceJournalManager.getAttendance(
        groupIds: groupIds,
        subjectId: subjectId ?? -1,
      );
    } catch (e) {
      rethrow;
    }
  }

  String getDate(AttendanceDate attendanceDate) {
    final date = attendanceDate.date ?? '';
    if (date.isEmpty) {
      return date;
    }
    final dateFormat = DateTime.parse(date).day.toString();
    return dateFormat;
  }

  String getWeekday(AttendanceDate attendanceDate) {
    final date = attendanceDate.date ?? '';
    if (date.isEmpty) {
      return date;
    }
    final weekday = DateTime.parse(date).weekday.getDayByWeekNumber();
    return weekday;
  }

  String getMonth(AttendanceDate attendanceDate) {
    final date = attendanceDate.date ?? '';
    if (date.isEmpty) {
      return date;
    }
    final month = DateFormat.MMMM('ru').format(DateTime.parse(date));
    return month.substring(0, 3);
  }

  List<Attendance> getStudentAttendance(String studentId) {
    if (studentId.isEmpty) {
      return [];
    }

    final journal = attendanceJournalManager.attendanceJournal.value;
    final dates = journal.dates?.where((j) => j.date != null).toList() ?? [];

    if (dates.isEmpty) {
      return [];
    }

    final attendances = journal.attendances ?? [];
    if (attendances.isEmpty) {
      final marks = getEmptyAttendance(dates, studentId);
      return marks.toList();
    }
    final marks = <Attendance>[];

    for (AttendanceDate date in dates) {
      final attendance = attendances
          .where((a) =>
              a.date == date.date &&
              a.studentId == studentId &&
              a.lessonNumber == date.lessonNumber)
          .firstOrNull;
      if (attendance != null) {
        marks.add(attendance);
      } else {
        marks.add(
          Attendance(
            studentId: studentId,
            date: date.date,
            lessonNumber: date.lessonNumber,
          ),
        );
      }
    }
    return marks.toList();
  }

  List<Attendance> getEmptyAttendance(
      List<AttendanceDate> dates, String studentId) {
    final marks = <Attendance>[];
    for (AttendanceDate date in dates) {
      marks.add(
        Attendance(
          studentId: studentId,
          date: date.date,
          lessonNumber: date.lessonNumber,
        ),
      );
    }
    return marks;
  }

  void selectedDate(AttendanceDate date) {
    if (date.date == null || date.lessonNumber == null) {
      return;
    }

    final indexOfDate = attendanceJournalManager.attendanceJournal.value.dates
        ?.indexWhere((element) =>
            element.date == date.date &&
            element.lessonNumber == date.lessonNumber);

    scrollByHorizontal(indexOfDate ?? 0);
    selectedDateStream.value = date;
  }

  void scrollByHorizontal(int index) {
    cardWidth = max(32.6 * scaleFactor + 16, 68.0);
    final offset = countOffset(
      index: index,
      deviceWidth: width,
      customWidgetWidth: cardWidth,
      maxPosition: cardWidth *
              (attendanceJournalManager.attendanceJournal.value.dates?.length
                      .toDouble() ??
                  0.0) -
          width,
      customPaddingWidth: 0,
    );
    groupController.animateTo(
      offset,
      curve: Curves.ease,
      duration: const Duration(milliseconds: 300),
    );
  }

  Future<void> scrollByVertical(int index) async {
    /// 56 - фамилия
    /// 50 - отметка
    const cardHeight = 106.0;
    final length = attendanceJournalManager
            .attendanceJournal.valueOrNull?.students?.length ??
        0;
    final offset = cardHeight * index + 106;
    verticalScrollController.animateTo(
      offset,
      curve: Curves.ease,
      duration: const Duration(milliseconds: 500),
    );
  }

  bool isSelectedDate(Attendance date) {
    final selectedDate = selectedDateStream.value;
    if (selectedDate == null ||
        date.date == null ||
        date.lessonNumber == null) {
      return false;
    }
    return selectedDate.date == date.date &&
        selectedDate.lessonNumber == date.lessonNumber;
  }

  bool isSelectedDateLesson(AttendanceDate date) {
    final selectedDate = selectedDateStream.value;
    if (selectedDate == null ||
        date.date == null ||
        date.lessonNumber == null) {
      return false;
    }
    return selectedDate.date == date.date &&
        selectedDate.lessonNumber == date.lessonNumber;
  }

  void goToBack() {
    router.pop();
  }

  /// сначала посещаемость ищем в changedAttendanceStream (стрим для данных
  /// отправки на бек)
  /// добавляем или перезаписываем
  /// также ищем в attendanceJournalManager.attendanceJournal.attendances
  /// (стрим для представления)
  /// также добавляем или перезаписываем у него
  /// AttendanceDate находится по date из attendanceJournalManager.attendanceJournal.dates
  /// опционально можем добавляться индекс студента в листе для прокрутки
  /// возвращаемое значение показывает, будет ли следующий студент
  bool markStudentAttendance({
    required String type,
    required Attendance attendance,
    int? studentIndex,
  }) {
    bool isNext = true;
    if (studentIndex != null) {
      scrollByVertical(studentIndex);
      // проверка на наличие следующего студента
      final students = attendanceJournalManager
          .attendanceJournal.stream.valueOrNull?.students;
      final student = students?.elementAtOrNull(studentIndex + 1);
      if (student == null) {
        isNext = false;
      }

      // проверка, что такой посещаемости нет или она пустая
      final attendances = attendanceJournalManager
          .attendanceJournal.stream.valueOrNull?.attendances;
      final nextAttendance = attendances?.firstWhereOrNull((element) =>
          element.date == attendance.date &&
          element.lessonNumber == attendance.lessonNumber &&
          student?.id == element.studentId);
      if (nextAttendance != null &&
          nextAttendance.attended?.isNotEmpty == true) {
        isNext = false;
      }
    }

    final newAttendance = Attendance(
      attended: type,
      date: attendance.date,
      lessonNumber: attendance.lessonNumber,
      studentId: attendance.studentId,
    );

    final markDateAttendance = attendanceJournalManager
        .attendanceJournal.value.dates
        ?.firstWhereOrNull((element) =>
            element.date == attendance.date &&
            element.lessonNumber == attendance.lessonNumber);
    if (markDateAttendance == null) {
      return false;
    }

    // for changedAttendanceStream
    final indexOfAttendanceInChanged = changedAttendanceStream
        .value[markDateAttendance]
        ?.indexWhere((element) {
      return element.studentId == attendance.studentId &&
          element.lessonNumber == attendance.lessonNumber &&
          element.date == attendance.date;
    });
    var newMap = changedAttendanceStream.value;
    var newList = changedAttendanceStream.value[markDateAttendance] ?? [];
    if (indexOfAttendanceInChanged != -1 &&
        indexOfAttendanceInChanged != null) {
      newList[indexOfAttendanceInChanged] = newAttendance;
    } else {
      newList.add(newAttendance);
    }
    newMap.putIfAbsent(markDateAttendance, () => newList ?? []);
    changedAttendanceStream.value = newMap;

    var newJournalAttendanceList = [
      ...attendanceJournalManager.attendanceJournal.value.attendances ??
          <Attendance>[]
    ];
    var newJournal = attendanceJournalManager.attendanceJournal.value;
    final indexOfAttendanceInJournal =
        newJournalAttendanceList.indexWhere((element) {
      return element.studentId == attendance.studentId &&
          element.lessonNumber == attendance.lessonNumber &&
          element.date == attendance.date;
    });

    if (indexOfAttendanceInJournal != -1) {
      newJournalAttendanceList[indexOfAttendanceInJournal] = newAttendance;
    } else {
      newJournalAttendanceList.add(newAttendance);
    }
    newJournal = newJournal.copyWith(attendances: newJournalAttendanceList);
    attendanceJournalManager.attendanceJournal.value = newJournal;
    return isNext;
  }

  /// Отправляет все запросы changedAttendanceStream по датам
  /// Очищает changedAttendanceStream после отправки
  void saveAttendance() {
    for (final entry in changedAttendanceStream.valueOrNull?.entries ??
        <MapEntry<AttendanceDate, List<Attendance>>>[]) {
      attendanceJournalManager.sendBulkAttendance(
          date: entry.key, attendances: entry.value);
    }
    changedAttendanceStream.value = {};
  }

  /// Обрабатывает отметку посещаемости для выбранного студента
  /// Проверяет валидность даты и отображает соответствующий диалог
  Future<void> markAttendance({
    required BuildContext context,
    required AttendanceStudent student,
    String? date,
    int? lessonNumber,
  }) async {
    /// найти индекс студента, чтобы знать откуда начинать
    /// найти текущий предмет по дате
    final attendanceDate = attendanceJournalManager
        .attendanceJournal.value.dates
        ?.firstWhereOrNull(
      (element) => element.date == date && element.lessonNumber == lessonNumber,
    );
    if (attendanceDate == null) {
      return;
    }

    DateFormat format = DateFormat("yyyy-MM-dd");
    final currDate = DateTime.now();
    final lessonDate = format.parse(date!);
    if (currDate.isBefore(lessonDate)) {
      await showErrorDialog(
        context: router.navigatorKey.currentContext!,
        titleTextStyle: AppTypography.medium18,
        titleText: 'Упс...',
        message: 'Вы не можете отметить посещаемость на будущую дату',
        successButtonText: 'Хорошо',
        onSuccessTap: () {},
      );
      return;
    }

    selectedDate(attendanceDate);

    final studentList =
        attendanceJournalManager.attendanceJournal.value.students;
    final startStudentIndex =
        studentList?.indexWhere((element) => element.id == student.id);

    showCupertinoModalPopup<bool>(
      context: context,
      builder: (context) {
        return AttendanceModalPopup(
          startIndex: startStudentIndex ?? -1,
          date: attendanceDate,
          students: studentList,
          markStudentCallback: markStudentAttendance,
        );
      },
    );
  }

  Future<bool?> showAttendanceModalPopup({
    required BuildContext context,
    required AttendanceStudent student,
    required Attendance mark,
  }) async {
    final fullName =
        utils.createFullName(student.firstName, '', student.lastName);
    final ifMark = await showCupertinoModalPopup<bool>(
      context: context,
      builder: (context) {
        return CupertinoActionSheet(
          actions: [
            CupertinoActionSheetAction(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                fullName,
                style: AppTypography.bold20.copyWith(
                  color: AppColor.black,
                ),
              ),
            ),
            CupertinoActionSheetAction(
              onPressed: () {
                markStudentAttendance(
                  type: 'П',
                  attendance: mark,
                );
                Navigator.pop(context, true);
              },
              child: Text(
                'Присутствует',
                style: AppTypography.normal20.copyWith(
                  color: AppColor.lightBlue,
                ),
              ),
            ),
            CupertinoActionSheetAction(
              onPressed: () {
                markStudentAttendance(
                  type: 'У',
                  attendance: mark,
                );
                Navigator.pop(context, true);
              },
              child: Text(
                'Уважительная причина',
                style: AppTypography.normal20.copyWith(
                  color: AppColor.lightBlue,
                ),
              ),
            ),
            CupertinoActionSheetAction(
              onPressed: () {
                markStudentAttendance(
                  type: 'Н',
                  attendance: mark,
                );
                Navigator.pop(context, true);
              },
              child: Text(
                'Отсутствует',
                style: AppTypography.normal20.copyWith(
                  color: AppColor.absent,
                ),
              ),
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Container(
              decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.circular(13),
              ),
              child: Text(
                'Отмена',
                style: AppTypography.semiBold20.copyWith(
                  color: AppColor.lightBlue,
                ),
              ),
            ),
          ),
        );
      },
    );
    return ifMark;
  }
}
