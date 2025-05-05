import 'package:fkn/domain/teacher/timetable/teacher_lesson.dart';
import 'package:fkn/startup/app_color.dart';
import 'package:flutter/material.dart';

Color getColorByAttendance(bool selected, int index) {
  if (selected) {
    return AppColor.subjectColor.withOpacity(0.3);
  }
  if (index % 2 == 0) {
    return AppColor.white;
  }
  return AppColor.greyEF.withOpacity(0.5);
}

Color getMarkColorByAttendance(String mark) {
  if (mark == 'Н') {
    return AppColor.absent;
  }
  if (mark == 'У') {
    return AppColor.newBlue;
  }
  return AppColor.black;
}

String getAttendanceTitle(TeacherLesson lesson) {
  if (lesson.studentGroups?.length == 1) {
    String title = '';

    if (lesson.studentGroups?.firstOrNull?.number != null) {
      title += 'Группа ${lesson.studentGroups?.first.number}';
    }
    if (lesson.studentGroups?.firstOrNull?.course != null) {
      title += ' Курс ${lesson.studentGroups?.first.course}';
    }
    return title;
  }

  String title = 'Журнал';

  if (lesson.studentGroups?.firstOrNull?.course != null) {
    title += ' Курс ${lesson.studentGroups?.first.course}';
  }
  return title;
}
