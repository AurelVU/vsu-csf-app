import 'package:auto_route/auto_route.dart';
import 'package:fkn/feature/teacher/teacher_timetable/presentation/teacher_timetable_presenter.dart';
import 'package:fkn/feature/teacher/teacher_timetable/presentation/teacher_timetable_screen_view.dart';
import 'package:fkn/utils/get_it_extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage()
class TeacherTimetableScreen extends StatelessWidget {
  const TeacherTimetableScreen({
    Key? key,
    this.returnToToday,
  }) : super(key: key);

  final bool? returnToToday;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final scaleFactor = MediaQuery.textScaleFactorOf(context);
    return Provider<TeacherTimetableScreenPresenter>(
      create: (context) => TeacherTimetableScreenPresenter(
        router: context.router,
        timetableManager: context.get(),
        scaleFactor: scaleFactor,
        profile: context.get(),
        deviceWidth: width,
      )..init(),
      dispose: (context, presenter) => presenter.dispose(),
      child: TeacherTimetableScreenView(
        returnToToday: returnToToday,
      ),
    );
  }
}
