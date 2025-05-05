import 'package:fkn/domain/profile/user_data.dart';
import 'package:fkn/domain/timetable/group_timetable.dart';
import 'package:fkn/feature/student/home/home_screen_presenter.dart';
import 'package:fkn/feature/student/timetable/presentation/components/exam_page_widget.dart';
import 'package:fkn/feature/student/timetable/presentation/components/subject_page_widget.dart';
import 'package:fkn/feature/student/timetable/presentation/timetable_screen/timetable_presenter.dart';
import 'package:fkn/startup/app_color.dart';
import 'package:fkn/startup/app_keys.dart';
import 'package:fkn/startup/app_typography.dart';
import 'package:fkn/uikit/timetable/animated_timetable_type_switcher.dart';
import 'package:fkn/uikit/timetable/scrolling_days.dart';
import 'package:fkn/utils/keep_alive.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

// REFACTOR: Разделить компонент на модульные части для улучшения поддерживаемости
class TimetableGroupScreenView extends StatelessWidget {
  const TimetableGroupScreenView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final presenter = context.read<TimeTableScreenPresenter>();
    final homePresenter = context.read<HomeScreenPresenter>();
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: StreamBuilder<bool>(
          stream: presenter.isSubjectTimetableStream,
          builder: (context, isSubject) {
            final itemBgColor = isSubject.data == true
                ? AppColor.blurredPurple
                : AppColor.blurredBlue;
            const itemTextColor = AppColor.white;
            const selectedItemBgColor = AppColor.white;
            final selectedItemTextColor = isSubject.data == true
                ? AppColor.subjectColor
                : AppColor.lightBlue;
            final showCalendarButton = isSubject.data == true;
            final height = MediaQuery.of(context).size.height * 0.45 -
                MediaQuery.of(context).padding.top +
                50;
            return Stack(
              children: [
                // нужны для устранения миганий при смене картинки, иначе подгрузка неленивая
                Opacity(
                  opacity: isSubject.data == true ? 1 : 0,
                  child: Image.asset(
                    'assets/image/schedule/subjects.png',
                    height: height,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Opacity(
                  opacity: isSubject.data == false ? 1 : 0,
                  child: Image.asset(
                    'assets/image/schedule/exams.png',
                    height: height,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: height,
                  width: double.infinity,
                  child: SafeArea(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(height: 16),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              if (!showCalendarButton)
                                const SizedBox(
                                  width: 50,
                                  height: 50,
                                ),
                              if (showCalendarButton)
                                InkWell(
                                  onTap: () {
                                    presenter.openBookmark();
                                  },
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
                                          child: SvgPicture.asset(
                                              'assets/svg/bookmarks.svg'),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              const Spacer(),
                              SizedBox(
                                height: 50,
                                child: Center(
                                  child: Text(
                                    'Расписание',
                                    textAlign: TextAlign.left,
                                    style: AppTypography.semiBold20.copyWith(
                                      fontSize: 24,
                                      color: AppColor.white,
                                      height: 1.28,
                                    ),
                                  ),
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
                                          child: SvgPicture.asset(
                                              'assets/svg/calendar.svg'),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              if (!showCalendarButton)
                                const SizedBox(
                                  width: 50,
                                  height: 50,
                                )
                            ],
                          ),
                        ),
                        const SizedBox(height: 32),
                        AnimatedTimetableSwitcher(
                          animationController: presenter.animationController,
                          onFirstTap: () {
                            presenter.changeToSubject(
                              controller:
                                  homePresenter.timetableScrollController,
                            );
                          },
                          onSecondTap: () {
                            presenter.changeToExam(
                              controller:
                                  homePresenter.timetableScrollController,
                            );
                          },
                        ),
                        if (isSubject.data == true) const Spacer(),
                        if (isSubject.data == true)
                          StreamBuilder<DateTime?>(
                            stream: presenter.selectedDateStream,
                            builder: (context, selectedDay) {
                              return StreamBuilder<List<DayTimetable>>(
                                stream:
                                    presenter.timetableManager.timeTableStream,
                                builder: (context, daysSnapshot) {
                                  return ScrollingDays(
                                    onCardCreate: (size) {
                                      presenter.weekCardWidth = size.width;
                                    },
                                    onTap: presenter.selectDate,
                                    itemBgColor: itemBgColor,
                                    itemTextColor: itemTextColor,
                                    selectedItemBgColor: selectedItemBgColor,
                                    selectedItemTextColor:
                                        selectedItemTextColor,
                                    controller: presenter.daysScrollController,
                                    pageAnimatedController:
                                        presenter.subjectPageAnimatedController,
                                    // потенциально опасно, но нам нужны not nullable dates
                                    dates: daysSnapshot.data
                                            ?.map((e) => e.dateTimetable!)
                                            .toList() ??
                                        <DateTime>[],
                                    selectedDate: selectedDay.data,
                                  );
                                },
                              );
                            },
                          ),
                        if (isSubject.data == true) const Spacer(),
                      ],
                    ),
                  ),
                ),
                DraggableScrollableSheet(
                  initialChildSize: 0.55,
                  minChildSize: 0.55,
                  maxChildSize: 0.85,
                  controller: homePresenter.timetableScrollController,
                  builder: (BuildContext context,
                      ScrollController scrollController) {
                    return Container(
                      decoration: const BoxDecoration(
                        color: AppColor.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                        ),
                      ),
                      clipBehavior: Clip.hardEdge,
                      key: Keys.schedule,
                      child: StreamBuilder<UserData?>(
                        stream: presenter.profile.userData,
                        builder: (context, userSnapshot) {
                          return PageView(
                            controller: presenter.typePageController,
                            physics: const NeverScrollableScrollPhysics(),
                            children: [
                              KeepAlivePage(
                                child: StreamBuilder<List<DayTimetable>>(
                                  stream: presenter
                                      .timetableManager.timeTableStream,
                                  builder: (context, snapshot) {
                                    return SubjectPage(
                                      presenter: presenter,
                                      scrollController: scrollController,
                                      user: userSnapshot.data,
                                      days: snapshot.data,
                                    );
                                  },
                                ),
                              ),
                              KeepAlivePage(
                                child: StreamBuilder<List<DayTimetable>>(
                                  stream: presenter
                                      .timetableManager.examTimeTableStream,
                                  builder: (context, snapshot) {
                                    return ExamsPage(
                                      days: snapshot.data,
                                      presenter: presenter,
                                    );
                                  },
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    );
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
