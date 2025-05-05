import 'package:fkn/domain/timetable/group_timetable.dart';
import 'package:fkn/feature/student/timetable/presentation/components/custom_circle.dart';
import 'package:fkn/feature/student/timetable/presentation/components/exam_info_card.dart';
import 'package:fkn/feature/student/timetable/presentation/timetable_screen/timetable_presenter.dart';
import 'package:fkn/startup/app_color.dart';
import 'package:fkn/startup/app_typography.dart';
import 'package:flutter/material.dart';

class ExamsPage extends StatelessWidget {
  const ExamsPage({
    super.key,
    required this.presenter,
    this.days,
  });

  final TimeTableScreenPresenter presenter;
  final List<DayTimetable>? days;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: presenter.timetableManager.examTimeTableStream,
        builder: (context, snapshot) {
          final subjects = snapshot.data ?? [];
          final height = MediaQuery.of(context).size.height;

          /// минимальная высота боттом шита, середина и минус высота типа
          /// недели
          final listHeight = height * 0.55 / 2 - 52;
          return ListView(
            padding: EdgeInsets.zero,

            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16.0,
                  horizontal: 24.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    StreamBuilder(
                        stream: presenter.profile.userData,
                        builder: (context, snapshot) {
                          final user = snapshot.data;
                          return Text(
                            'Группа ${user?.group}.${user?.subGroup ?? ''}',
                            style: AppTypography.medium16,
                          );
                        }),
                  ],
                ),
              ),
               SizedBox(height: listHeight),
              if (subjects.isEmpty)
                const Center(
                  child: Text(
                    'Нет экзаменов',
                    style: AppTypography.bold20,
                  ),
                ),
              if (subjects.isNotEmpty == true)
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  padding: const EdgeInsets.only(right: 16),
                  itemBuilder: (_, index) {
                    // костыль для завершающего кружочка
                    if (index == subjects.length) {
                      return const Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: CustomCircle(color: AppColor.newBlue),
                        ),
                      );
                    }
                    return ExamInfoCard(
                      dayTimetable: subjects[index],
                    );
                  },
                  itemCount: subjects.length + 1,
                ),
            ],
          );
        });
  }
}
