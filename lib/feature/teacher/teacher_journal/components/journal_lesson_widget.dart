import 'package:fkn/domain/teacher/timetable/teacher_lesson.dart';
import 'package:fkn/feature/teacher/teacher_journal/components/group_leader_info.dart';
import 'package:fkn/startup/app_color.dart';
import 'package:fkn/startup/app_keys.dart';
import 'package:fkn/startup/app_typography.dart';
import 'package:fkn/utils/timetable_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class JournalLessonWidget extends StatelessWidget {
  const JournalLessonWidget({
    super.key,
    required this.lesson,
    this.onTap,
  });

  final TeacherLesson lesson;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final group = lesson.studentGroups?.firstOrNull;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        key: Keys.jouLesWid,
        decoration: BoxDecoration(
          color: AppColor.appBar,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.only(right: 16.0, left: 16, bottom: 16, top: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 5,
                    child: Row(
                      children: [
                        Flexible(
                          child: Text(
                            'Группа ${createFullGroupName(group?.number, group?.subGroupNumber)}',
                            maxLines: 1,
                            style: AppTypography.semiBold14.copyWith(
                              overflow: TextOverflow.ellipsis,
                              color: AppColor.teacherTimetable,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: SvgPicture.asset(
                            'assets/svg/group_info.svg',
                            width: 17,
                            height: 17,
                          ),
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              useSafeArea: true,
                              builder: (context) {
                                return Container(
                                  key: Keys.groupInfo,
                                  padding: const EdgeInsets.all(16.0),
                                  decoration: const BoxDecoration(
                                    color: AppColor.white,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(25),
                                      topRight: Radius.circular(25),
                                    ),
                                  ),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        SizedBox(
                                          height: 30,
                                          child: Align(
                                            alignment: Alignment.topCenter,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: AppColor.grey,
                                                borderRadius: BorderRadius.circular(10),
                                              ),
                                              width: 30,
                                              height: 4,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          'Группа ${createFullGroupName(group?.number, group?.subGroupNumber)}, Курс ${group?.course}',
                                          style: AppTypography.semiBold20,
                                        ),
                                        if (group?.groupLeader != null) ...[
                                          const SizedBox(height: 16),
                                          GroupLeaderInfo(
                                            title: 'Староста:',
                                            groupLeader: group?.groupLeader,
                                          ),
                                          const SizedBox(height: 28),
                                        ],
                                        if (group?.secondGroupLeader != null) ...[
                                          const SizedBox(height: 16),
                                          GroupLeaderInfo(
                                            title: 'Зам. старосты:',
                                            groupLeader: group?.secondGroupLeader,
                                          ),
                                          const SizedBox(height: 28),
                                        ],
                                        if (group?.curator != null) ...[
                                          const SizedBox(height: 16),
                                          GroupLeaderInfo(
                                            title: 'Куратор:',
                                            groupLeader: group?.curator,
                                          ),
                                          const SizedBox(height: 16),
                                        ],
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Container(
                    key: Keys.courseJournal,
                    decoration: BoxDecoration(
                      color: getColorByCourse(lesson.studentGroups?.firstOrNull?.course),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 3.0),
                      child: Text(
                        'Курс ${lesson.studentGroups?.firstOrNull?.course ?? ''}',
                        style: AppTypography.semiBold14.copyWith(
                          color: AppColor.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 4),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 5,
                    child: Text(lesson.subject ?? ''),
                  ),
                  if (lesson.markType != null)
                    Flexible(
                      flex: 2,
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColor.teacherTimetable,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 3.0),
                            child: Text(
                              lesson.markType ?? '',
                              maxLines: 3,
                              textAlign: TextAlign.end,
                              style: AppTypography.semiBold14.copyWith(
                                color: AppColor.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
