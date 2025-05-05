import 'package:fkn/domain/timetable/group_timetable.dart';
import 'package:fkn/feature/student/timetable/presentation/components/custom_vertical_stepper.dart';
import 'package:fkn/startup/app_color.dart';
import 'package:fkn/startup/app_keys.dart';
import 'package:fkn/startup/app_typography.dart';
import 'package:fkn/utils/timetable_utils.dart';
import 'package:flutter/material.dart';

class ExamInfoCard extends StatelessWidget {
  const ExamInfoCard({
    super.key,
    required this.dayTimetable,
  });

  final DayTimetable dayTimetable;

  @override
  Widget build(BuildContext context) {
    const color = AppColor.blue;
    final isNow = isDateEqual(DateTime.now(), dayTimetable.dateTimetable);

    /// сделано из расчета, что бизнес-логика рассчитана так, что в один день может прийти только
    /// один экзамен. И пусть умоется кровью тот бекендер, кто пришлет в один день несколько экзаменов
    final subject = dayTimetable.subjects?.first;
    final date = dayTimetable.dateTimetable;
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: CustomVerticalStep(
              color: AppColor.lightBlue,
              isComingNow: isNow,
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                if (date != null)
                  Text(
                    getDateForExam(date),
                  ),
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Container(
                    key: Keys.exams,
                    decoration: BoxDecoration(
                      color: isNow ? color : AppColor.appBar,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(15.0),
                      ),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                subject?.name ?? '',
                                textAlign: TextAlign.left,
                                style: AppTypography.medium14.copyWith(
                                  color: isNow ? AppColor.white : AppColor.black,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              '${subject?.startTime?.trim()}\n${subject?.finishTime?.trim() ?? ''}',
                              style: AppTypography.normal14.copyWith(
                                color: isNow ? AppColor.white : AppColor.black,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                subject?.teacher ?? '',
                                style: AppTypography.normal14.copyWith(
                                  color: isNow ? AppColor.white : AppColor.black,
                                ),
                              ),
                            ),
                            Text(
                              'к.${subject?.classroom ?? ''}',
                              style: AppTypography.normal14.copyWith(
                                color: isNow ? AppColor.white : AppColor.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}