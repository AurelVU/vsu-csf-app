import 'package:auto_route/auto_route.dart';
import 'package:fkn/domain/bookmark/teacher.dart';
import 'package:fkn/feature/student/bookmark/presentation/bookmark_presenter.dart';
import 'package:fkn/startup/app_color.dart';
import 'package:fkn/startup/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class BookmarkScreenView extends StatelessWidget {
  const BookmarkScreenView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final presenter = context.watch<BookmarkScreenPresenter>();
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        leading: IconButton(
          onPressed: () {
            context.router.maybePop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColor.gray,
            size: 16,
          ),
        ),
        centerTitle: true,
        title: const Text(
          'Список преподавателей',
          style: AppTypography.medium18,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                  fillColor: AppColor.appBar.withOpacity(0.6),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SvgPicture.asset(
                      'assets/svg/search.svg',
                      height: 24,
                      width: 24,
                    ),
                  ),
                  hintText: 'Поиск',
                  contentPadding: EdgeInsets.zero,
                  hintStyle: AppTypography.normal18.copyWith(
                    color: AppColor.grey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  )),
              onChanged: (value) {
                presenter.search(value);
              },
            ),
            const SizedBox(height: 16),
            Expanded(
              child: StreamBuilder<List<Teacher>?>(
                  stream: presenter.bookmarkManager.teacherListStream,
                  builder: (context, snapshot) {
                    final data = snapshot.data;
                    if (data == null) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    return StreamBuilder(
                        stream: presenter.bookmarkManager.bookmarkedSetStream,
                        builder: (context, bookmarkedSnapshot) {
                          return ListView.separated(
                            itemBuilder: (context, index) {
                              final teacher = data[index];
                              final teacherName =
                                  '${teacher.lastName} ${teacher.firstName?.substring(0, 1)}. ${teacher.middlename?.substring(0, 1)}.';
                              final isBookmarked = snapshot.data?.contains(teacher.copyWith(isSelected: true));
                              return InkWell(
                                onTap: () {
                                  presenter.openTeacherTimetable(
                                    teacherId: teacher.id ?? -1,
                                    title: teacherName,
                                  );
                                },
                                child: Row(
                                  children: [
                                    // ЛЮТЫЙ КОСТЫЛЬ
                                    InkWell(
                                      onTap: () {
                                        if (isBookmarked == true) {
                                          presenter.unbookmarkTeacher(teacherId: teacher.id ?? -1);
                                        } else {
                                          presenter.bookmarkTeacher(teacherId: teacher.id ?? -1);
                                        }
                                      },
                                      child: SizedBox(
                                        height: 32,
                                        width: 32,
                                        child: Center(
                                          child: SvgPicture.asset(isBookmarked == true
                                              ? 'assets/svg/selected.svg'
                                              : 'assets/svg/unselected.svg'),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    Text(
                                      teacherName,
                                      style: AppTypography.normal14,
                                    ),
                                  ],
                                ),
                              );
                            },
                            separatorBuilder: (BuildContext context, int index) {
                              return const SizedBox(height: 8);
                            },
                            itemCount: data.length,
                          );
                        });
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
