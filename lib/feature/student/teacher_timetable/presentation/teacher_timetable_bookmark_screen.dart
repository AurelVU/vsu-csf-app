import 'package:auto_route/auto_route.dart';
import 'package:fkn/feature/student/teacher_timetable/presentation/teacher_timetable_bookmark_presenter.dart';
import 'package:fkn/feature/student/teacher_timetable/presentation/teacher_timetable_bookmark_screen_view.dart';
import 'package:fkn/utils/get_it_extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



@RoutePage()
class TeacherTimetableBookmarkScreen extends StatelessWidget {
  const TeacherTimetableBookmarkScreen({
    Key? key,
    required this.teacherId,
    required this.title,
  }) : super(key: key);

  final int teacherId;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Provider<TeacherTimetableBookmarkScreenPresenter>(
      create: (context) => TeacherTimetableBookmarkScreenPresenter(
        router: context.router,
        teacherId: teacherId,
        teacherTimetableBookmarkManager: context.get(),

      )..init(),
      dispose: (context, presenter) => presenter.dispose(),
      child: TeacherTimetableBookmarkScreenView(
        title: title,
      ),
    );
  }
}
