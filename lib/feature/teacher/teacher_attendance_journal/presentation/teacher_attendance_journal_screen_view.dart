import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:fkn/domain/teacher/attendance/attendance.dart';
import 'package:fkn/domain/teacher/attendance/attendance_date.dart';
import 'package:fkn/domain/teacher/attendance/attendance_student.dart';
import 'package:fkn/feature/teacher/teacher_attendance_journal/presentation/teacher_attendance_journal_screen_presenter.dart';
import 'package:fkn/startup/app_color.dart';
import 'package:fkn/startup/app_keys.dart';
import 'package:fkn/startup/app_typography.dart';
import 'package:fkn/utils/attendence_utils.dart';
import 'package:fkn/utils/timetable_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:collection/collection.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class TeacherAttendanceJournalScreenView extends StatefulWidget {
  const TeacherAttendanceJournalScreenView({
    super.key,
    required this.lessonName,
    required this.title,
    required this.markType,
  });

  final String lessonName;
  final String title;
  final String markType;

  @override
  State<TeacherAttendanceJournalScreenView> createState() => _TeacherAttendanceJournalScreenViewState();
}

class _TeacherAttendanceJournalScreenViewState extends State<TeacherAttendanceJournalScreenView> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final presenter = context.read<TeacherAttendanceJournalScreenPresenter>();

    final safeAreaHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Stack(
          children: [
            Image.asset(
              'assets/image/teacher_timetable.png',
              height: height * 0.25,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Positioned(
              top: safeAreaHeight,
              left: 16,
              height: height * 0.15,
              right: 16,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: GestureDetector(
                          onTap: presenter.goToBack,
                          child: const Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: AppColor.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: Center(
                        child: FittedBox(
                          child: Text(
                            widget.title,
                            textAlign: TextAlign.center,
                            style: AppTypography.semiBold20.copyWith(
                              fontSize: 24,
                              color: AppColor.white,
                              height: 1.28,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                key: Keys.attendanceJournal,
                height: height * 0.75,
                decoration: const BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                child: StreamBuilder(
                    stream: presenter.attendanceJournalManager.attendanceJournal,
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      final dates = snapshot.data?.dates ?? [];
                      final students = snapshot.data?.students ?? [];
                      return Stack(
                        children: [
                          Column(
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                child: Text(
                                  widget.lessonName,
                                  style: AppTypography.medium16.copyWith(color: AppColor.black),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 16),
                                  child: Text(
                                    widget.markType,
                                    style: AppTypography.normal14,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              if (dates.isNotEmpty)
                                _AttendanceDates(
                                  groupController: presenter.groupController,
                                  dates: dates,
                                ),
                              if (students.isNotEmpty)
                                Expanded(
                                  child: _AttendanceStudent(
                                    students: students,
                                  ),
                                ),
                            ],
                          ),
                          StreamBuilder(
                            stream: presenter.changedAttendanceStream,
                            builder: (context, snapshot) {
                              if (snapshot.data?.isNotEmpty == true) {
                                return Positioned(
                                  bottom: 0,
                                  right: 16,
                                  left: 16,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      presenter.saveAttendance();
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Theme.of(context).colorScheme.secondary,
                                      foregroundColor: Theme.of(context).colorScheme.primary,
                                      side: BorderSide(
                                        width: 1.0,
                                        color: Theme.of(context).colorScheme.primary,
                                      ),
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(15),
                                        ),
                                      ),
                                    ),
                                    child: const Text('Сохранить'),
                                  ),
                                );
                              }
                              return Container();
                            },
                          ),
                        ],
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showAdvertising(BuildContext context, TeacherAttendanceJournalScreenPresenter presenter) async {
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        surfaceTintColor: Colors.transparent,
        title: const Text(
          'Включен режим отметки',
          style: AppTypography.semiBold18,
        ),
        content: Lottie.asset(
          'assets/attendance.json',
          repeat: true,
          controller: presenter.lottieController,
          onLoaded: (composition) {
            presenter.lottieController
              ?..duration = Duration(milliseconds: composition.duration.inMilliseconds ~/ 2)
              ..repeat();
          },
        ),
        actions: [
          TextButton(
            onPressed: () async {
              context.router.pop();
            },
            child: Text(
              'Свернуть',
              style: AppTypography.semiBold16.copyWith(
                color: AppColor.black,
              ),
            ),
          ),
          TextButton(
            onPressed: () async {
              presenter.stopAttendanceAdvertising();
              context.router.pop();
            },
            child: Text(
              'Отключить',
              style: AppTypography.semiBold16.copyWith(
                color: AppColor.newBlue,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showNotSearched(BuildContext context) async {
    await showDialog(
        context: context,
        builder: (context) => AlertDialog(
              surfaceTintColor: Colors.transparent,
              title: const Text('Режим отметки недоступен'),
              // content: ,
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Закрыть')),
              ],
            ));
  }
}

class _AttendanceMark extends StatefulWidget {
  const _AttendanceMark({
    required this.marks,
    required this.student,
    required this.groupController,
  });

  final List<Attendance> marks;
  final AttendanceStudent student;
  final LinkedScrollControllerGroup groupController;

  @override
  State<_AttendanceMark> createState() => _AttendanceMarkState();
}

class _AttendanceMarkState extends State<_AttendanceMark> {
  late ScrollController _controller;

  @override
  void initState() {
    _controller = widget.groupController.addAndGet();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final presenter = context.read<TeacherAttendanceJournalScreenPresenter>();
    final marks = widget.marks;
    final student = widget.student;
    return SizedBox(
      height: 50,
      child: ListView.builder(
        key: Keys.attMarks,
        // controller: _controller,
        itemCount: marks.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final mark = marks[index];
          return StreamBuilder(
            stream: presenter.selectedDateStream,
            builder: (context, selectedDate) {
              final selected = presenter.isSelectedDate(mark);
              return GestureDetector(
                onTap: () {
                  presenter.markAttendance(
                    context: context,
                    student: student,
                    date: mark.date,
                    lessonNumber: mark.lessonNumber,
                  );
                },
                child: Container(
                  key: Keys.attMark,
                  width: max(32.6 * MediaQuery.textScaleFactorOf(context) + 16, 68),
                  color: getColorByAttendance(selected, index),
                  child: Center(
                    child: Text(
                      mark.attended ?? '',
                      style: AppTypography.medium18.copyWith(
                        color: getMarkColorByAttendance(mark.attended ?? ''),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class _AttendanceDates extends StatefulWidget {
  const _AttendanceDates({
    required this.dates,
    required this.groupController,
  });

  final List<AttendanceDate> dates;
  final LinkedScrollControllerGroup groupController;

  @override
  State<_AttendanceDates> createState() => _AttendanceDatesState();
}

class _AttendanceDatesState extends State<_AttendanceDates> {
  late ScrollController _controller;

  @override
  void initState() {
    _controller = widget.groupController.addAndGet();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final presenter = context.read<TeacherAttendanceJournalScreenPresenter>();

    final dates = widget.dates;

    return SingleChildScrollView(
      key: Keys.attDates,
      controller: _controller,
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ...dates.mapIndexed((index, date) {
            final formatDate = presenter.getDate(date);
            final weekday = presenter.getWeekday(date);
            final month = presenter.getMonth(date);
            final scaleFactor = MediaQuery.of(context).textScaleFactor;
            return StreamBuilder(
                stream: presenter.selectedDateStream,
                builder: (context, selectedDate) {
                  final selected = presenter.isSelectedDateLesson(date);
                  return GestureDetector(
                    onTap: () => presenter.selectedDate(date),
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(
                        minHeight: 90,
                        maxHeight: 180,
                      ),
                      child: Container(
                        /// максимальная длина строки + паддинг
                        width: max(32.6 * scaleFactor + 16, 68),
                        key: Keys.attDate,
                        decoration: BoxDecoration(
                          color: selected ? AppColor.subjectColor : AppColor.inactive,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                month,
                                style: AppTypography.normal14.copyWith(
                                  color: selected ? AppColor.white : AppColor.black,
                                ),
                              ),
                              Text(
                                formatDate,
                                style: AppTypography.semiBold28.copyWith(
                                  color: selected ? AppColor.white : AppColor.black,
                                ),
                              ),
                              Text(
                                weekday,
                                style: AppTypography.normal14.copyWith(
                                  color: selected ? AppColor.white : AppColor.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                });
          }).toList(),
        ],
      ),
    );
  }
}

class _AttendanceStudent extends StatefulWidget {
  const _AttendanceStudent({
    required this.students,
  });

  final List<AttendanceStudent> students;

  @override
  State<_AttendanceStudent> createState() => _AttendanceStudentState();
}

class _AttendanceStudentState extends State<_AttendanceStudent> {
  late ScrollController _controller;

  @override
  void initState() {
    final presenter = context.read<TeacherAttendanceJournalScreenPresenter>();
    _controller = presenter.groupController.addAndGet();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final presenter = context.read<TeacherAttendanceJournalScreenPresenter>();

    return ListView(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.vertical,
        controller: presenter.verticalScrollController,
        children: [
          NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              final maxExtent =
                  (presenter.attendanceJournalManager.attendanceJournal.value.dates?.length ?? 0) * presenter.cardWidth;
              print(maxExtent);
              presenter.nameOffset.value = min(notification.metrics.pixels, maxExtent);
              print(notification.metrics.pixels);
              return true;
            },
            child: SingleChildScrollView(
              controller: _controller,
              scrollDirection: Axis.horizontal,
              child: Column(
                children: [
                  ...widget.students
                      .map(
                        (student) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            StreamBuilder<double>(
                              stream: presenter.nameOffset,
                              builder: (context, snapshot) {
                                return StudentNameWidget(
                                  student: student,
                                  offset: max(snapshot.data ?? 0, 0),
                                );
                              },
                            ),
                            const Divider(
                              height: 1,
                              color: AppColor.gray,
                            ),
                            _AttendanceMark(
                              marks: presenter.getStudentAttendance(student.id ?? ''),
                              groupController: presenter.groupController,
                              student: student,
                            ),
                          ],
                        ),
                      )
                      .toList(),

                  /// такой большой, чтобы красиво отрабатывал скролл при отмечании
                  const SizedBox(
                    height: 350,
                  )
                ],
              ),
            ),
          ),
        ]);
  }
}

class StudentNameWidget extends StatelessWidget {
  const StudentNameWidget({
    super.key,
    required this.student,
    this.offset = 0,
  });

  final AttendanceStudent student;
  final double offset;

  @override
  Widget build(BuildContext context) {
    final presenter = context.read<TeacherAttendanceJournalScreenPresenter>();
    return Padding(
      padding: EdgeInsets.only(
          left: min(
            16.0 + offset,
            (presenter.attendanceJournalManager.attendanceJournal.value.dates?.length ?? 0.0) * presenter.cardWidth -
                presenter.width + 16,
          ),
          top: 16,
          bottom: 16),
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width - 16,
        child: Text(
          createFullName(student.firstName, '', student.lastName),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppTypography.medium18.copyWith(
            color: AppColor.black,
          ),
        ),
      ),
    );
  }
}
