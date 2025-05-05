
import 'package:fkn/domain/teacher/timetable/teacher_day_timetable.dart';
import 'package:fkn/feature/teacher/teacher_home/teacher_home_screen_presenter.dart';
import 'package:fkn/feature/teacher/teacher_timetable/components/teacher_week_type_widget.dart';
import 'package:fkn/feature/teacher/teacher_timetable/presentation/teacher_timetable_presenter.dart';
import 'package:fkn/startup/app_color.dart';
import 'package:fkn/startup/app_typography.dart';
import 'package:fkn/uikit/teacher_lesson_widget.dart';
import 'package:fkn/uikit/timetable/scrolling_days.dart';
import 'package:fkn/utils/timetable_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class TeacherTimetableScreenView extends StatelessWidget {
  const TeacherTimetableScreenView({
    super.key,
    this.returnToToday,
  });

  final bool? returnToToday;

  @override
  Widget build(BuildContext context) {
    final presenter = context.watch<TeacherTimetableScreenPresenter>();
    final homePresenter = context.read<TeacherHomeScreenPresenter>();
    final height = MediaQuery.of(context).size.height * 0.45;
    const itemBgColor = AppColor.blurredPurple;
    const itemTextColor = AppColor.white;
    const selectedItemBgColor = AppColor.white;
    const selectedItemTextColor = AppColor.subjectColor;
    const showCalendarButton = true;
    if (returnToToday == true) {
      presenter.selectToday();
    }
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Stack(
          children: [
            Image.asset(
              'assets/image/teacher_timetable.png',
              height: height,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: height,
              width: double.infinity,
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        if (showCalendarButton)
                          Expanded(
                            child: ConstrainedBox(
                              constraints: const BoxConstraints(
                                minWidth: 0,
                                maxWidth: 50,
                              ),
                            ),
                          ),
                        const Spacer(),
                        Text(
                          'Расписание',
                          textAlign: TextAlign.left,
                          style: AppTypography.semiBold20.copyWith(
                            fontSize: 24,
                            color: AppColor.white,
                            height: 1.28,
                          ),
                        ),
                        const Spacer(),
                        if (showCalendarButton)
                          InkWell(
                            onTap: () => presenter.openCalendar(context),
                            child: Stack(
                              children: [
                                Container(
                                  width: 50.0,
                                  height: 50.0,
                                  decoration: const BoxDecoration(
                                    color: AppColor.blurredPurple,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: SvgPicture.asset('assets/svg/calendar.svg'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  StreamBuilder<DateTime?>(
                      stream: presenter.selectedDateStream,
                      builder: (context, selectedDay) {
                        return StreamBuilder<List<TeacherDayTimetable>>(
                            stream: presenter.timetableManager.timeTableStream,
                            builder: (context, daysSnapshot) {
                              return ScrollingDays(

                                onTap: presenter.selectDate,
                                itemBgColor: itemBgColor,
                                itemTextColor: itemTextColor,
                                selectedItemBgColor: selectedItemBgColor,
                                selectedItemTextColor: selectedItemTextColor,
                                controller: presenter.daysScrollController,
                                pageAnimatedController: presenter.subjectPageAnimatedController,
                                // потенциально опасно, но нам нужны not nullable dates
                                dates: daysSnapshot.data?.map((e) => e.dateTimetable!).toList() ?? <DateTime>[],
                                selectedDate: selectedDay.data,
                              );
                            });
                      }),
                  const Spacer(),
                ],
              ),
            ),
            DraggableScrollableSheet(
              initialChildSize: 0.55,
              minChildSize: 0.55,
              maxChildSize: 0.8,
              controller: homePresenter.timetableScrollController,
              builder: (BuildContext context, ScrollController scrollController) {
                return Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                  ),
                  child: Portal(
                    child: StreamBuilder<List<TeacherDayTimetable>>(
                      stream: presenter.timetableManager.timeTableStream,
                      builder: (context, snapshot) {
                        return TeacherSubjectPage(
                          presenter: presenter,
                          scrollController: scrollController,
                          days: snapshot.data,
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class TeacherSubjectPage extends StatelessWidget {
  const TeacherSubjectPage({
    super.key,
    required this.presenter,
    this.days,
    required this.scrollController,
  });

  final TeacherTimetableScreenPresenter presenter;
  final List<TeacherDayTimetable>? days;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: days?.length ?? 1,
      controller: presenter.subjectPageController,
      onPageChanged: (value) {
        presenter.slidePage(value);
      },
      itemBuilder: (BuildContext context, int index) {

        if (days == null) {

          return const Center(
            child: Text(
              'Нет занятий',
              style: AppTypography.bold20,
            ),
          );
        }
        final day = days?[index];
        final subjects = day?.lessons;
        final isNow = isDateEqual(day?.dateTimetable, DateTime.now());
        if (days == null || subjects == null || subjects.isEmpty) {
          final height = MediaQuery.of(context).size.height;

          /// минимальная высота боттом шита, середина и минус высота типа
          /// недели
          final listHeight = height * 0.55 / 2 - 52;
          return ListView(
            padding: EdgeInsets.zero,
            physics: const ClampingScrollPhysics(),
            controller: scrollController,
            children: [
              Column(
                children: [
                  TeacherWeekTypeWidget(day: day),
                  SizedBox(
                    height: listHeight,
                  ),
                  const Center(
                    child: Text(
                      'Нет занятий',
                      style: AppTypography.bold20,
                    ),
                  ),
                ],
              ),
            ],
          );
        }
        return ListView(
          padding: const EdgeInsets.only(bottom: 16),
          physics: const ClampingScrollPhysics(),
          controller: scrollController,
          children: [
            TeacherWeekTypeWidget(day: day),
            const SizedBox(height: 10),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: subjects.length ?? 0,
              itemBuilder: (_, index) {
                final lesson = subjects[index];
                final date = day?.dateTimetable;
                return TeacherLessonWidget(
                  lesson: lesson,
                  onButtonTap: () => presenter.goToGroupAttendance(
                    lesson,
                    createStringDate(day?.dateTimetable),
                  ),
                  showAttendance: isNow,
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 16);
              },
            ),
          ],
        );
      },
    );
  }
}
