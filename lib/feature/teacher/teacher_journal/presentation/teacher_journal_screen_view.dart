import 'package:fkn/domain/teacher/timetable/teacher_lesson.dart';
import 'package:fkn/feature/teacher/teacher_home/teacher_home_screen_presenter.dart';
import 'package:fkn/feature/teacher/teacher_journal/components/journal_lesson_widget.dart';
import 'package:fkn/feature/teacher/teacher_journal/presentation/teacher_journal_presenter.dart';
import 'package:fkn/startup/app_color.dart';
import 'package:fkn/startup/app_keys.dart';
import 'package:fkn/startup/app_typography.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class TeacherJournalScreenView extends StatelessWidget {
  const TeacherJournalScreenView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final presenter = context.watch<TeacherJournalScreenPresenter>();
    final homePresenter = context.read<TeacherHomeScreenPresenter>();
    final height = MediaQuery.of(context).size.height;
    final safeAreaHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Stack(
          children: [
            Image.asset(
              'assets/image/teacher_timetable.png',
              height: height * 0.20,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Positioned(
              top: safeAreaHeight,
              left: 0,
              right: 0,
              height:  height * 0.10,
              child: Center(
                child: Text(
                  'Журналы',
                  textAlign: TextAlign.center,
                  style: AppTypography.semiBold20.copyWith(
                    fontSize: 24,
                    color: AppColor.white,
                    height: 1.28,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                key: Keys.blockGroups,
                clipBehavior: Clip.hardEdge,
                height: height * 0.825 - safeAreaHeight,
                decoration: const BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                child: StreamBuilder<List<TeacherLesson>>(
                  stream: presenter.journalManager.journal,
                  builder: (context, snapshot) {
                    final data = snapshot.data;
                    if (data == null) {
                      return const Center(
                        child: Text(
                          'Нет доступных журналов',
                          style: AppTypography.bold20,
                        ),
                      );
                    }
                    return ListView(
                      controller: homePresenter.journalScrollController,
                      padding: EdgeInsets.zero,
                      children: [
                        const SizedBox(height: 16),
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(
                        //     vertical: 16.0,
                        //     horizontal: 24.0,
                        //   ),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //     children: [
                        //       const Spacer(),
                        //       Text(
                        //         'ёВыбрать',
                        //         style: AppTypography.normal14.copyWith(
                        //           color: AppColor.newBlue,
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          itemCount: data.length,
                          itemBuilder: (_, index) {
                            final lesson = data[index];
                            return JournalLessonWidget(
                              lesson: lesson,
                              onTap: () {
                                showCupertinoModalPopup(
                                  context: context,
                                  builder: (context) {
                                    return CupertinoActionSheet(
                                      actions: [
                                        CupertinoActionSheetAction(
                                          onPressed: () {
                                            Navigator.pop(context);
                                            presenter
                                                .goToGroupAttendance(lesson);
                                          },
                                          child: const Text('Посещаемость'),
                                        ),
                                        CupertinoActionSheetAction(
                                          onPressed: () {
                                            Navigator.pop(context);
                                            presenter.goToSubjectGrades(lesson);
                                          },
                                          child: const Text('Оценки'),
                                        ),
                                      ],
                                      cancelButton: CupertinoActionSheetAction(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: AppColor.white,
                                            borderRadius:
                                                BorderRadius.circular(13),
                                          ),
                                          child: const Text(
                                            'Отмена',
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(height: 16);
                          },
                        ),
                        const SizedBox(height: 40),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
