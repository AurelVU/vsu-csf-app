import 'package:fkn/domain/teacher/profile/teacher_info.dart';
import 'package:fkn/feature/teacher/teacher_home/teacher_home_screen_presenter.dart';
import 'package:fkn/feature/teacher/teacher_showcase/presentation/teacher_showcase_presenter.dart';
import 'package:fkn/startup/app_color.dart';
import 'package:fkn/uikit/showcase/contact_widget.dart';
import 'package:fkn/uikit/showcase/list_news_widget.dart';
import 'package:fkn/uikit/showcase/student_short_info_widget.dart';
import 'package:fkn/uikit/teacher_lesson_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class TeacherShowcaseScreenView extends StatelessWidget {
  const TeacherShowcaseScreenView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final presenter = context.watch<TeacherShowcaseScreenPresenter>();
    final homePresenter = context.read<TeacherHomeScreenPresenter>();
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/image/main_background.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          title: SvgPicture.asset(
            'assets/svg/fcs.svg',
            width: 70,
            color: AppColor.black,
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: Colors.transparent,
        body: ListView(
          controller: homePresenter.homeScrollController,
          physics: const BouncingScrollPhysics(),
          children: [
            StreamBuilder<TeacherInfo?>(
              stream: presenter.profileManager.teacherInfo,
              builder: (context, snapshot) {
                final teacherInfo = snapshot.data;
                return StudentShortInfoWidget(
                  onTap: presenter.routeToProfile,
                  name:
                      '${teacherInfo?.lastName ?? ''} ${teacherInfo?.firstName ?? ''} ${teacherInfo?.middlename ?? ''}',
                );
              },
            ),
            const SizedBox(height: 16),
            ContactWidget(onTap: presenter.routeToContact),
            StreamBuilder(
              stream: presenter.teacherTimeTableManager.nextSubjectStream,
              builder: (context, snapshot) {
                final lesson = snapshot.data;
                if (lesson == null) {
                  return Container();
                }
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: GestureDetector(
                    onTap: () => presenter.routeToTimeTable(),
                    child: TeacherLessonWidget(
                      showAttendance: true,
                      backgroundColor: AppColor.white,
                      lesson: lesson,
                      onButtonTap: () => presenter.goToGroupAttendance(lesson),
                    ),
                  ),
                );
              },
            ),
            StreamBuilder(
              stream: presenter.showcaseManager.universityNewsPreviewStream,
              builder: (context, snapshot) {
                return ListNewsWidget(
                  news: snapshot.data,
                  height: 330,
                  title: 'Новости университета',
                  width: 330,
                  maxLines: 2,
                  onShowAll: () =>
                      presenter.showAllNews('vsumain', 'Новости университета'),
                );
              },
            ),
            StreamBuilder(
              stream: presenter.showcaseManager.departmentNewsPreviewStream,
              builder: (context, snapshot) {
                return ListNewsWidget(
                  news: snapshot.data,
                  height: 244,
                  title: 'Новости факультета',
                  width: 160,
                  maxLines: 4,
                  isLittle: true,
                  isUniv: false,
                  onShowAll: () => presenter.showAllNews(
                    'cs_vsu',
                    'Новости факультета',
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
