import 'dart:math';

import 'package:fkn/domain/teacher/timetable/student_group.dart';
import 'package:fkn/domain/teacher/timetable/teacher_lesson.dart';
import 'package:fkn/startup/app_color.dart';
import 'package:fkn/startup/app_keys.dart';
import 'package:fkn/startup/app_typography.dart';
import 'package:fkn/uikit/card_container.dart';
import 'package:fkn/utils/timetable_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rxdart/rxdart.dart';

class TeacherLessonWidget extends StatefulWidget {
  const TeacherLessonWidget({
    super.key,
    required this.lesson,
    this.onButtonTap,
    this.showAttendance,
    this.backgroundColor,
  });

  final TeacherLesson lesson;
  final VoidCallback? onButtonTap;
  final bool? showAttendance;
  final Color? backgroundColor;

  @override
  State<TeacherLessonWidget> createState() => _TeacherLessonWidgetState();
}

class _TeacherLessonWidgetState extends State<TeacherLessonWidget> {
  // final OverlayPortalController _tooltipController = OverlayPortalController();
  final BehaviorSubject<bool> isOverlayShow = BehaviorSubject.seeded(false);

  @override
  void dispose() {
    isOverlayShow.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String groupsString = '';
    for (final group in widget.lesson.studentGroups ?? <StudentGroup>[]) {
      final subGroup =
          group.subGroupNumber == null ? '' : '.${group.subGroupNumber}';
      groupsString += 'Группа ${group.number}$subGroup, ';
    }
    groupsString = groupsString.substring(0, max(groupsString.length - 2, 0));
    return Container(
      decoration: BoxDecoration(
        color: widget.backgroundColor ?? AppColor.appBar,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 16.0, right: 16, bottom: 16, top: 8),
        child: Column(
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
                          groupsString,
                          maxLines: 1,
                          style: AppTypography.semiBold14
                              .copyWith(overflow: TextOverflow.ellipsis),
                        ),
                      ),
                      StreamBuilder<bool>(
                          stream: isOverlayShow,
                          builder: (context, snapshot) {
                            return PortalTarget(
                              visible: isOverlayShow.value,
                              anchor: const Aligned(
                                follower: Alignment.topCenter,
                                target: Alignment.centerRight,
                                offset: Offset(0, 10),
                              ),
                              portalFollower: TapRegion(
                                onTapInside: (_) {
                                  isOverlayShow.value = !isOverlayShow.value;
                                },
                                onTapOutside: (_) {
                                  isOverlayShow.value = false;
                                },
                                child: ConstrainedBox(
                                  constraints: const BoxConstraints(
                                    minWidth: 100,
                                    maxWidth: 200,
                                    minHeight: 40,
                                    maxHeight: 300,
                                  ),
                                  child: CardContainer(
                                    borderRadius: 6,
                                    useShadow: true,
                                    child: Padding(
                                      padding: const EdgeInsets.all(16),
                                      child: Text(groupsString),
                                    ),
                                  ),
                                ),
                              ),
                              child: IconButton(
                                icon: SvgPicture.asset(
                                  'assets/svg/group_info.svg',
                                ),
                                onPressed: () {
                                  if (isOverlayShow.value == false){
                                    isOverlayShow.value = true;
                                  }
                                },
                              ),
                            );
                          }),
                    ],
                  ),
                ),
                const Spacer(),
                Container(
                  key: Keys.courseSchedule,
                  decoration: BoxDecoration(
                    color: getColorByCourse(
                        widget.lesson.studentGroups?.firstOrNull?.course),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 3.0),
                    child: Text(
                      'Курс ${widget.lesson.studentGroups?.firstOrNull?.course ?? ''}',
                      style: AppTypography.semiBold14.copyWith(
                        color: AppColor.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Text(widget.lesson.subject ?? ''),
                ),
                Column(
                  children: [
                    Text(widget.lesson.startTime?.trim() ?? ''),
                    Text(widget.lesson.finishTime?.trim() ?? ''),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Spacer(),
                Text(widget.lesson.isDistant == false
                    ? 'к.${widget.lesson.classroom ?? ''}'
                    : 'ДО'),
              ],
            ),
            if (widget.showAttendance == true) const SizedBox(height: 8),
            if (widget.showAttendance == true)
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: widget.onButtonTap,
                  style: ElevatedButton.styleFrom(
                    foregroundColor: AppColor.white,
                    backgroundColor: AppColor.teacherTimetable,
                  ),
                  child: const Text('Открыть посещаемость'),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
