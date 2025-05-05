import 'package:auto_route/auto_route.dart';
import 'package:fkn/feature/student/timetable/presentation/timetable_screen/timetable_presenter.dart';
import 'package:fkn/feature/student/timetable/presentation/timetable_screen/timetable_screen_view.dart';
import 'package:fkn/feature/student/timetable/timetable_manager.dart';
import 'package:fkn/utils/get_it_extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage()
class TimeTableScreen extends StatefulWidget {
  const TimeTableScreen({
    Key? key,
    this.returnToToday,
  }) : super(key: key);

  /// при вызове скрина с этим параметром, возвращает на текущий день
  final bool? returnToToday;

  @override
  State<TimeTableScreen> createState() => _TimeTableScreenState();
}

class _TimeTableScreenState extends State<TimeTableScreen> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Provider<TimeTableScreenPresenter>(
      create: (context) => TimeTableScreenPresenter(
        router: context.router,
        timetableManager: context.get<TimeTableManager>(),
        profile: context.get(),
        deviceWidth: width,
        vsync: this,
      )..init(),
      dispose: (context, presenter) => presenter.dispose(),
      child: TimeTableScreenView(returnToToday: widget.returnToToday),
    );
  }
}
