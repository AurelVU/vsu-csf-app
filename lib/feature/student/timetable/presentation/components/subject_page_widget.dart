import 'package:fkn/domain/profile/user_data.dart';
import 'package:fkn/domain/timetable/group_timetable.dart';
import 'package:fkn/feature/student/timetable/presentation/components/custom_circle.dart';
import 'package:fkn/feature/student/timetable/presentation/components/subject_info_card.dart';
import 'package:fkn/feature/student/timetable/presentation/timetable_screen/timetable_presenter.dart';
import 'package:fkn/startup/app_color.dart';
import 'package:fkn/startup/app_typography.dart';
import 'package:fkn/utils/timetable_utils.dart';
import 'package:flutter/material.dart';

class SubjectPage extends StatelessWidget {
  const SubjectPage({
    super.key,
    required this.presenter,
    this.days,
    required this.scrollController,
    this.user,
  });

  final TimeTableScreenPresenter presenter;
  final List<DayTimetable>? days;
  final ScrollController scrollController;
  final UserData? user;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: days?.length ?? 1,
      controller: presenter.subjectPageController,
      onPageChanged: (value) {
        presenter.slidePage(value);
      },
      itemBuilder: (BuildContext context, int index) {
        final day = days?[index];
        final subjects = day?.subjects;
        final todayDate = DateTime.now();

        final isToday = isDateEqual(day?.dateTimetable, todayDate);
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
                  WeekTypeWidget(user: user, day: day),
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
          padding: EdgeInsets.zero,
          physics: const ClampingScrollPhysics(),
          controller: scrollController,
          children: [
            WeekTypeWidget(user: user, day: day),
            const SizedBox(height: 10),
            if (subjects.isNotEmpty == true)
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.only(right: 16),
                itemBuilder: (_, index) {
                  // костыль для завершающего кружочка
                  if (index == subjects.length) {
                    return const Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: CustomCircle(color: AppColor.subjectColor),
                      ),
                    );
                  }
                  return SubjectInfoCard(
                    subject: subjects[index],
                    color: AppColor.subjectColor,
                    isExam: false,
                    enableAttandanceMark: isToday,
                  );
                },
                // костыль для завершающего кружочка
                itemCount: (subjects.length ?? -1) + 1,
              ),
          ],
        );
      },
    );
  }
}

class WeekTypeWidget extends StatelessWidget {
  const WeekTypeWidget({
    super.key,
    required this.user,
    required this.day,
  });

  final UserData? user;
  final DayTimetable? day;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 16.0,
        horizontal: 24.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Группа ${user?.group ?? ''}.${user?.subGroup ?? ''}',
            style: AppTypography.medium16,
          ),
          Text(
            day?.numerator == null
                ? ''
                : day?.numerator == true
                    ? 'Числитель'
                    : 'Знаменатель',
            style: AppTypography.normal14.copyWith(
              color: AppColor.newBlue,
            ),
          ),
        ],
      ),
    );
  }
}
