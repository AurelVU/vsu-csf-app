import 'package:auto_route/auto_route.dart';
import 'package:fkn/feature/teacher/subject_grades/presentation/subject_grades_screen_presenter.dart';
import 'package:fkn/feature/teacher/subject_grades/presentation/subject_grades_screen_view.dart';
import 'package:fkn/utils/get_it_extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage()
class SubjectGradesScreen extends StatelessWidget {
  const SubjectGradesScreen({
    Key? key,
    required this.groupIds,
    required this.lessonId,
    required this.lessonName,
    required this.title,
    required this.subjectId,
    required this.markType,
  }) : super(key: key);

  final List<int> groupIds;
  final int lessonId;
  final int subjectId;
  final String lessonName;
  final String title;
  final String markType;

  @override
  Widget build(BuildContext context) {
    return Provider<SubjectGradesScreenPresenter>(
      create: (context) => SubjectGradesScreenPresenter(
        subjectGradesManager: context.get(),
        lessonId: lessonId,
        groupIds: groupIds,
        router: context.router,
        subjectId: subjectId,
      )..init(),
      dispose: (context, presenter) => presenter.dispose(),
      child: SubjectGradesScreenView(
        lessonName: lessonName,
        title: title,
        markType: markType,
      ),
    );
  }
}
