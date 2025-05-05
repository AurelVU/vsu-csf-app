import 'package:fkn/domain/teacher/timetable/teacher_day_timetable.dart';
import 'package:fkn/startup/app_color.dart';
import 'package:fkn/startup/app_typography.dart';
import 'package:flutter/material.dart';

class TeacherWeekTypeWidget extends StatelessWidget {
  const TeacherWeekTypeWidget({
    super.key,
    required this.day,
  });

  final TeacherDayTimetable? day;

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
          const Spacer(),
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
