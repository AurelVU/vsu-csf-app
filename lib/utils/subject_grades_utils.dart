import 'package:fkn/feature/teacher/subject_grades/presentation/components/student_grades.dart';
import 'package:fkn/startup/app_color.dart';
import 'package:flutter/material.dart';

Color getColorByMark({
  required ModifiableMark mark,
  required String value,
  required int index,
  bool initial = false,
}) {
  if (value.isEmpty) {
    final color = mark.color;
    if (initial && color != null && color.isNotEmpty) {
      return Color(int.parse(color.replaceFirst('#', '0xFF')));
    }
    if (index % 2 == 0) {
      return AppColor.inactive;
    } else {
      return AppColor.white;
    }
  }
  final grade = int.tryParse(value);
  if (mark.markId == 'res_value_text') {
    return _getColorFinalGrade(grade ?? 0);
  }
  if (mark.markId == 'att_mark_append_ball') {
    return AppColor.inactive;
  }

  return _getColorAttestationGrade(grade ?? 0);
}

int getMaxValue(ModifiableMark mark) {
  if (mark.markId == 'res_value_text') {
    return 5;
  }
  if (mark.markId == 'att_mark_append_ball') {
    return 10;
  }
  return 50;
}

Color _getColorFinalGrade(int grade) {
  if (grade < 3) {
    return AppColor.badGrade;
  } else if (grade < 4) {
    return AppColor.normalGrade;
  } else if (grade < 5) {
    return AppColor.goodGrade;
  } else {
    return AppColor.perfectGrade;
  }
}

Color _getColorAttestationGrade(int grade) {
  if (grade < 25) {
    return AppColor.badGrade;
  } else if (grade < 35) {
    return AppColor.normalGrade;
  } else if (grade < 45) {
    return AppColor.goodGrade;
  } else {
    return AppColor.perfectGrade;
  }
}
