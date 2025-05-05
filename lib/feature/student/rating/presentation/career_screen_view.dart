import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:fkn/domain/profile/result/subject_result.dart';
import 'package:fkn/domain/profile/user_data.dart';
import 'package:fkn/feature/student/home/home_screen_presenter.dart';
import 'package:fkn/feature/student/rating/presentation/career_presenter.dart';
import 'package:fkn/startup/app_color.dart';
import 'package:fkn/startup/app_keys.dart';
import 'package:fkn/startup/app_typography.dart';

import 'package:fkn/uikit/rating_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';

class CareerScreenView extends StatefulWidget {
  const CareerScreenView({
    super.key,
  });

  @override
  State<CareerScreenView> createState() => _CareerScreenViewState();
}

class _CareerScreenViewState extends State<CareerScreenView> {
  @override
  Widget build(BuildContext context) {
    final presenter = context.watch<RatingScreenPresenter>();

    final homePresenter = context.read<HomeScreenPresenter>();

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: <Color>[
            Color(0xFFA0A0FF),
            Color(0xFF5F5FDB),
            Color(0xFF0E0E3E),
          ],
          stops: [0.0, 0.2, 1],
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text(
            'Рейтинг',
            style: AppTypography.medium24.copyWith(
              color: AppColor.white,
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: CustomScrollView(
            controller: homePresenter.ratingScrollController,
            slivers: [
              // potentially dangerous
              SliverToBoxAdapter(
                child: ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    StreamBuilder(
                      stream: presenter.profile.studentRating,
                      builder: (context, snapshot) {
                        final rating = snapshot.data;
                        return RatingWidget(
                          rating: rating,
                          // onTap: () {
                          //   presenter.router.navigate(const RatingRoute());
                          // },
                          padding: const EdgeInsets.only(
                              left: 16, right: 16, bottom: 16),
                        );
                      },
                    ),
                    StreamBuilder<UserData?>(
                      stream: presenter.profile.userData,
                      builder: (context, data) {
                        final results = data.data?.results;
                        return StreamBuilder<int?>(
                            stream: presenter.profile.chosenSemester,
                            builder: (context, chosenIndex) {
                              return SizedBox(
                                height: 32,
                                child: ListView.separated(
                                  key: Keys.semesterList,
                                  scrollDirection: Axis.horizontal,
                                  controller: presenter.termScrollController,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
                                  itemBuilder: (context, index) {
                                    final semester = results?[index];
                                    return GestureDetector(
                                      onTap: () {
                                        presenter.changeChosenSemester(index);
                                      },
                                      child: StreamBuilder<double?>(
                                          stream:
                                              presenter.pageAnimatedController,
                                          builder: (context, snapshot) {
                                            final currentPage = (presenter
                                                    .pageAnimatedController
                                                    .valueOrNull ??
                                                0);
                                            final pageOffset =
                                                currentPage - index;
                                            final offset = pageOffset > 1 ||
                                                    pageOffset < -1
                                                ? 1.0
                                                : pageOffset;
                                            print(offset);
                                            return Container(
                                              key: Keys.semester,
                                              height: 32,
                                              decoration: BoxDecoration(
                                                color: Color.lerp(
                                                  AppColor.white,
                                                  AppColor.pinkButton,
                                                  offset.abs(),
                                                ),
                                                borderRadius:
                                                    const BorderRadius.all(
                                                  Radius.circular(15),
                                                ),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 16.0),
                                                child: Center(
                                                  child: Text(
                                                    '${semester?.number} семестр',
                                                    style: AppTypography
                                                        .medium14
                                                        .copyWith(
                                                      color: Color.lerp(
                                                        AppColor.pinkText,
                                                        AppColor.white,
                                                        offset.abs(),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          }),
                                    );
                                  },
                                  itemCount: results?.length ?? 0,
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return const SizedBox(
                                      width: 8,
                                    );
                                  },
                                ),
                              );
                            });
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    StreamBuilder(
                      stream: presenter.profile.userData,
                      builder: (context, snapshot) {
                        final result = snapshot.data?.results;

                        return ExpandablePageView.builder(
                          itemCount: result?.length ?? 3,
                          controller: presenter.pageController,
                          onPageChanged: presenter.slidePage,
                          itemBuilder: (context, index) {
                            final semesterResult = result?[index];
                            if (semesterResult == null) {
                              return Container();
                            }
                            return ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              itemBuilder: (BuildContext context, int index) {
                                final subject = semesterResult.results?[index];
                                if (subject == null) {
                                  return Container();
                                }
                                return Container(
                                  key: Keys.subjectBox,
                                  decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                    color: Color(0x26FFFFFF),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                subject.subjectName ?? '',
                                                key: Keys.subjectName,
                                                style: AppTypography.medium18
                                                    .copyWith(
                                                  color: AppColor.white,
                                                ),
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                            const SizedBox(width: 16),
                                            AttendanceWidget(
                                              attendancePercent:
                                                  subject.attendancePercent,
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 3,
                                        ),
                                        Text(
                                          subject.markType ?? '',
                                          style:
                                              AppTypography.medium16.copyWith(
                                            color: AppColor.white,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 3,
                                        ),
                                        Text(
                                          subject.teacher ?? '',
                                          key: Keys.teacher,
                                          style:
                                              AppTypography.normal14.copyWith(
                                            color: AppColor.white,
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        ResultSubjectWidget(
                                          result: subject,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return const SizedBox(
                                  height: 16,
                                );
                              },
                              itemCount: semesterResult.results?.length ?? 0,
                            );
                          },
                        );
                      },
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AttendanceWidget extends StatelessWidget {
  const AttendanceWidget({
    super.key,
    this.attendancePercent,
  });

  final String? attendancePercent;

  @override
  Widget build(BuildContext context) {
    if (attendancePercent == null) {
      return Container();
    }
    final attendance = double.parse(attendancePercent!).toStringAsFixed(2);
    return Column(
      children: [
        Text(
          '$attendance%',
          style: AppTypography.medium16.copyWith(
            color: attendance == '100.00' ? AppColor.gold : AppColor.bad,
          ),
        ),
        Text(
          'посещ.',
          style: AppTypography.medium12.copyWith(
            color: AppColor.white,
          ),
        ),
      ],
    );
  }
}

class ResultSubjectWidget extends StatelessWidget {
  const ResultSubjectWidget({
    super.key,
    required this.result,
  });

  final SubjectResult result;

  @override
  Widget build(BuildContext context) {
    final att1 = result.att1;
    final att2 = result.att2;
    final att3 = result.att3;
    final exam = result.exam;
    final total = result.result;
    return IntrinsicHeight(
      child: Row(
        children: [
          if (att1 != null) CircleByMark(title: '1 атт', mark: att1),
          if (att1 != null) const SizedBox(width: 8),
          if (att2 != null) CircleByMark(title: '2 атт', mark: att2),
          if (att2 != null) const SizedBox(width: 8),
          if (att3 != null) CircleByMark(title: '3 атт', mark: att3),
          if (att3 != null) const SizedBox(width: 8),
          if (exam != null) CircleByMark(title: 'экз', mark: exam),
          if (exam != null) const SizedBox(width: 8),
          if (total != null)
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.transparent,
                    border: Border.all(
                      color: getColorByMark(int.parse(total)),
                      width: 1,
                    ),
                  ),
                  child: Container(
                    key: Keys.markExam,
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.transparent,
                        width: 2,
                      ),
                    ),
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: getColorByMark(int.parse(total)),
                      ),
                      child: Center(
                        child: Text(
                          key: Keys.markTextExam,
                          total,
                          style: AppTypography.semiBold16.copyWith(
                            color: AppColor.circleText,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  'итог',
                  style: AppTypography.medium14.copyWith(
                    color: AppColor.white,
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}

class CircleByMark extends StatelessWidget {
  const CircleByMark({
    super.key,
    required this.mark,
    required this.title,
  });

  final String mark;
  final String title;

  @override
  Widget build(BuildContext context) {
    final color = getColorByMark(int.parse(mark) * 2);
    return Column(
      children: [
        Container(
          key: Keys.markAtt,
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
          child: Center(
            child: Text(
              key: Keys.markTextAtt,
              mark,
              style: AppTypography.semiBold16.copyWith(
                color: AppColor.circleText,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          title,
          style: AppTypography.medium14.copyWith(
            color: AppColor.white,
          ),
        ),
      ],
    );
  }
}

Color getColorByMark(mark) {
  if (mark < 50) {
    return AppColor.bad;
  } else if (mark < 70) {
    return AppColor.bronze;
  } else if (mark < 90) {
    return AppColor.silver;
  } else {
    return AppColor.gold;
  }
}
