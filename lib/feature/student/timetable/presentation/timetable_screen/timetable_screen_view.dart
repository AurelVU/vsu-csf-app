import 'package:fkn/feature/student/home/home_screen_presenter.dart';
import 'package:fkn/feature/student/timetable/presentation/components/timetable_group_screen_view.dart';
import 'package:fkn/feature/student/timetable/presentation/timetable_screen/timetable_presenter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TimeTableScreenView extends StatelessWidget {
  const TimeTableScreenView({
    super.key,
    this.returnToToday,
  });

  final bool? returnToToday;

  @override
  Widget build(BuildContext context) {
    if (returnToToday == true){
      final presenter = context.read<TimeTableScreenPresenter>();
      final homePresenter = context.read<HomeScreenPresenter>();
      presenter.selectToday(controller: homePresenter.timetableScrollController);
    }
    return const TimetableGroupScreenView();
  }
}
