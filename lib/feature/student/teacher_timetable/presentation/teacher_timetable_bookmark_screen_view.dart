import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:fkn/domain/teacher/timetable/student_group.dart';
import 'package:fkn/domain/teacher/timetable/teacher_day_timetable.dart';
import 'package:fkn/domain/teacher/timetable/teacher_lesson.dart';
import 'package:fkn/feature/student/teacher_timetable/presentation/teacher_timetable_bookmark_presenter.dart';
import 'package:fkn/feature/student/timetable/presentation/components/custom_circle.dart';
import 'package:fkn/feature/student/timetable/presentation/components/nested_custom_circle.dart';

import 'package:fkn/startup/app_color.dart';
import 'package:fkn/startup/app_typography.dart';
import 'package:fkn/uikit/timetable/info_widget.dart';
import 'package:fkn/utils/timetable_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:measure_size/measure_size.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:collection/collection.dart';

import '../../../../startup/app_keys.dart';

/// здесь творится маленький ад
class TeacherTimetableBookmarkScreenView extends StatelessWidget {
  const TeacherTimetableBookmarkScreenView({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final presenter = context.watch<TeacherTimetableBookmarkScreenPresenter>();
    final heightForTitle = height * 0.20 - MediaQuery.of(context).padding.top;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/image/schedule/exams.png',
            width: double.infinity,
            height: height * 0.20 + 25,
            fit: BoxFit.cover,
          ),
          SafeArea(
            child: SizedBox(
              height: heightForTitle,
              child: Center(
                child: Row(
                  children: [
                    const SizedBox(width: 16),
                    IconButton(
                      onPressed: () {
                        context.router.maybePop();
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: AppColor.white,
                        size: 20,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      title,
                      textAlign: TextAlign.center,
                      style: AppTypography.semiBold20.copyWith(
                        fontSize: 24,
                        color: AppColor.white,
                        height: 1.28,
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () => presenter.openCalendar(context),
                      child: Stack(
                        children: [
                          Container(
                            width: 50.0,
                            height: 50.0,
                            decoration: const BoxDecoration(
                              color: AppColor.blue,
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
                    const SizedBox(width: 16),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              clipBehavior: Clip.hardEdge,
              height: height * 0.75,
              decoration: const BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: Portal(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: StreamBuilder(
                    stream: presenter.teacherTimetableBookmarkManager.teacherTimetableStream,
                    builder: (context, snapshot) {
                      final timetable = snapshot.data;
                      if (timetable == null) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      /// здесь происходит разбитие расписания по неделям
                      int firstNonEmptyDayInFirstWeek;
                      int firstNonEmptyDayInSecondWeek;
                      try {
                        firstNonEmptyDayInFirstWeek =
                            timetable.sublist(0, min(6, timetable.length)).indexWhere((element) {
                          return (element.lessons ?? []).isNotEmpty;
                        });
                      } catch (e) {
                        firstNonEmptyDayInFirstWeek = -1;
                      }
                      try {
                        firstNonEmptyDayInSecondWeek = timetable.sublist(6).indexWhere((element) {
                          return (element.lessons ?? []).isNotEmpty;
                        });
                      } catch (e) {
                        firstNonEmptyDayInSecondWeek = -1;
                      }

                      if (firstNonEmptyDayInFirstWeek == -1 && firstNonEmptyDayInSecondWeek == -1) {
                        return const Center(
                          child: Text(
                            'Пар нет',
                            style: AppTypography.medium18,
                          ),
                        );
                      }
                      return CustomScrollView(
                        controller: presenter.scrollController,
                        slivers: [
                          const SliverToBoxAdapter(
                            child: SizedBox(
                              height: 24,
                            ),
                          ),
                          SliverToBoxAdapter(
                            child: MeasureSize(
                              onChange: (Size size) {
                                final presenter = context.read<TeacherTimetableBookmarkScreenPresenter>();
                                presenter.weekTypeHeight = size.height;
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0,
                                  vertical: 8.0,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Spacer(),
                                    Text(
                                      timetable[0].numerator == null
                                          ? ''
                                          : timetable[0].numerator == true
                                              ? 'Числитель'
                                              : 'Знаменатель',
                                      style: AppTypography.normal14.copyWith(
                                        color: AppColor.newBlue,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SliverTeacherLessonList(
                            timetable: timetable.sublist(0, min(6, timetable.length)),
                            firstNonEmptyDay: firstNonEmptyDayInFirstWeek,
                          ),
                          if (firstNonEmptyDayInFirstWeek != -1)
                            const SliverToBoxAdapter(
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: CustomCircle(color: AppColor.lightBlue),
                              ),
                            ),
                          SliverToBoxAdapter(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16.0,
                                vertical: 8.0,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Spacer(),
                                  Text(
                                    timetable.elementAtOrNull(6)?.numerator == null
                                        ? ''
                                        : timetable.elementAtOrNull(6)?.numerator == true
                                            ? 'Числитель'
                                            : 'Знаменатель',
                                    style: AppTypography.normal14.copyWith(
                                      color: AppColor.newBlue,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          if (timetable.length > 6)
                            SliverTeacherLessonList(
                              timetable: timetable.sublist(6),
                              firstNonEmptyDay: firstNonEmptyDayInSecondWeek,
                            ),
                          if (firstNonEmptyDayInSecondWeek != -1)
                            const SliverToBoxAdapter(
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: CustomCircle(color: AppColor.lightBlue),
                              ),
                            ),
                          const SliverToBoxAdapter(
                            child: SizedBox(
                              height: 16,
                            ),
                          )
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SliverTeacherLessonList extends StatelessWidget {
  const SliverTeacherLessonList({
    super.key,
    required this.timetable,
    required this.firstNonEmptyDay,
    this.offset = 0,
  });

  final List<TeacherDayTimetable>? timetable;
  final int firstNonEmptyDay;
  final int offset;

  @override
  Widget build(BuildContext context) {
    if (firstNonEmptyDay == -1) {
      return const SliverToBoxAdapter(
        child: Center(
          child: Text(
            'На этой неделе пар нет',
            style: AppTypography.medium16,
          ),
        ),
      );
    }

    return SliverList.builder(
      itemBuilder: (BuildContext context, int index) {
        final day = timetable?[index];
        final isNow = isDateEqual(DateTime.now(), day?.dateTimetable);
        final lessons = day?.lessons ?? [];
        if (lessons.isEmpty) {
          return Container();
        }
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MeasureSize(
              onChange: (Size size) {
                final presenter = context.read<TeacherTimetableBookmarkScreenPresenter>();
                presenter.dateHeight = size.height;
              },
              child: Row(
                children: [
                  Column(
                    children: [
                      if (index != firstNonEmptyDay)
                        const SizedBox(
                          height: 9,
                          child: VerticalDivider(
                            width: 1,
                            thickness: 1,
                            endIndent: 3,
                            color: AppColor.lightBlue,
                          ),
                        ),
                      isNow
                          ? const NestedCustomCircle(color: AppColor.lightBlue)
                          : const CustomCircle(color: AppColor.lightBlue),
                      const SizedBox(
                        height: 8,
                        child: VerticalDivider(
                          width: 1,
                          thickness: 1,
                          indent: 3,
                          color: AppColor.lightBlue,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Text(
                    getDateForExam(day?.dateTimetable),
                  ),
                ],
              ),
            ),
            ListView.separated(
              itemBuilder: (context, index) {
                if (index == 0) {
                  final presenter = context.read<TeacherTimetableBookmarkScreenPresenter>();
                  return MeasureSize(
                    onChange: (Size size) {
                      presenter.lessonHeight = size.height;
                    },
                    child: JournalLessonWidgetWithDivider(lesson: lessons[index]),
                  );
                }
                return JournalLessonWidgetWithDivider(lesson: lessons[index]);
              },
              separatorBuilder: (context, index) {
                return const Row(
                  children: [
                    SizedBox(width: 7.5),
                    SizedBox(
                      height: 8,
                      child: VerticalDivider(
                        width: 1,
                        thickness: 1,
                        color: AppColor.lightBlue,
                      ),
                    ),
                  ],
                );
              },
              itemCount: lessons.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
            ),
          ],
        );
      },
      itemCount: timetable?.length,
    );
  }
}

class JournalLessonWidgetWithDivider extends StatefulWidget {
  const JournalLessonWidgetWithDivider({
    super.key,
    required this.lesson,
    this.onTap,
  });

  final TeacherLesson lesson;
  final VoidCallback? onTap;

  @override
  State<JournalLessonWidgetWithDivider> createState() => _JournalLessonWidgetWithDividerState();
}

class _JournalLessonWidgetWithDividerState extends State<JournalLessonWidgetWithDivider> {
  final BehaviorSubject<bool> isOverlayShow = BehaviorSubject.seeded(false);

  @override
  void dispose() {
    isOverlayShow.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String groupsString = '';
    for (final group in widget.lesson.studentGroups ?? <StudentGroup>[]) {
      final subGroup = group.subGroupNumber == null ? '' : '.${group.subGroupNumber}';
      groupsString += 'Группа ${group.number}$subGroup, ';
    }
    groupsString = groupsString.substring(0, max(groupsString.length - 2, 0));
    return IntrinsicHeight(
      child: Row(
        children: [
          /// НЕ ТРОГАТЬ
          const SizedBox(
            width: 7.5,
          ),
          const VerticalDivider(
            width: 1,
            thickness: 1,
            color: AppColor.lightBlue,
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: GestureDetector(
              onTap: widget.onTap,
              child: Container(
                key: Keys.jouLesWidTimeT,
                decoration: BoxDecoration(
                  color: AppColor.appBar,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(right: 16.0, left: 16, bottom: 16, top: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 5,
                            child: Row(
                              children: [
                                Flexible(
                                  child: Text(
                                    groupsString,
                                    maxLines: 1,
                                    style: AppTypography.semiBold14.copyWith(
                                      overflow: TextOverflow.ellipsis,
                                      color: AppColor.teacherTimetable,
                                    ),
                                  ),
                                ),
                                InfoWidget(
                                  isOverlayShow: isOverlayShow,
                                  groupsString: groupsString,
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                          Container(
                            decoration: BoxDecoration(
                              color: getColorByCourse(widget.lesson.studentGroups?.firstOrNull?.course),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 3.0),
                              child: Text(
                                'Курс ${widget.lesson.studentGroups?.firstOrNull?.course ?? ''}',
                                style: AppTypography.semiBold14.copyWith(
                                  color: AppColor.white,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(widget.lesson.subject ?? ''),
                          ),
                          Column(
                            children: [
                              Text(widget.lesson.startTime?.trim().padLeft(5, '0') ?? ''),
                              Text(widget.lesson.finishTime?.trim().padLeft(5, '0') ?? ''),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Spacer(),
                          Text(widget.lesson.isDistant == false ? 'к.${widget.lesson.classroom ?? ''}' : 'ДО'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
