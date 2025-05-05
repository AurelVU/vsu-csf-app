import 'package:auto_route/auto_route.dart';
import 'package:fkn/feature/teacher/teacher_attendance_journal/presentation/teacher_attendance_journal_screen_presenter.dart';
import 'package:fkn/feature/teacher/teacher_attendance_journal/presentation/teacher_attendance_journal_screen_view.dart';
import 'package:fkn/utils/get_it_extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage()
class TeacherAttendanceJournalScreen extends StatefulWidget {
  const TeacherAttendanceJournalScreen({
    Key? key,
    required this.groupIds,
    required this.lessonId,
    required this.lessonName,
    required this.title,
    this.date,
    this.subjectId,
    this.markType,
  }) : super(key: key);

  final List<int> groupIds;
  final int lessonId;
  final int? subjectId;
  final String lessonName;
  final String title;
  final String? date;
  final String? markType;

  @override
  State<TeacherAttendanceJournalScreen> createState() => _TeacherAttendanceJournalScreenState();
}

class _TeacherAttendanceJournalScreenState extends State<TeacherAttendanceJournalScreen> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    final scaleFactor = MediaQuery.textScaleFactorOf(context);
    return Provider<TeacherAttendanceJournalScreenPresenter>(
      create: (context) => TeacherAttendanceJournalScreenPresenter(
        attendanceJournalManager: context.get(),
        lessonId: widget.lessonId,
        groupIds: widget.groupIds,
        router: context.router,
        scaleFactor: scaleFactor,
        date: widget.date,
        width: width,
        height: height,
        vsync: this,
        subjectId: widget.subjectId,
      )..init(),
      dispose: (context, presenter) => presenter.dispose(),
      child: TeacherAttendanceJournalScreenView(
        lessonName: widget.lessonName,
        title: widget.title,
        markType: widget.markType ?? '',
      ),
    );
  }
}
