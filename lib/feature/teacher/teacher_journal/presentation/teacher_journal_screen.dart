import 'package:auto_route/auto_route.dart';
import 'package:fkn/feature/teacher/teacher_journal/presentation/teacher_journal_presenter.dart';
import 'package:fkn/feature/teacher/teacher_journal/presentation/teacher_journal_screen_view.dart';
import 'package:fkn/utils/get_it_extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


@RoutePage()
class TeacherJournalScreen extends StatelessWidget {
  const TeacherJournalScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider<TeacherJournalScreenPresenter>(
      create: (context) => TeacherJournalScreenPresenter(
        router: context.router,
        journalManager: context.get(),
      )..init(),
      dispose: (context, presenter) => presenter.dispose(),
      child: const TeacherJournalScreenView(),
    );
  }
}
