import 'package:fkn/startup/app_color.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

// паддинг справа + ширина элементов на их количество + ширина отступов на их количество +
// половина экрана и половина ширины карточки, чтобы это все выравнить
double countOffset({
  required int index,
  required double deviceWidth,
  required double maxPosition,
  double customWidgetWidth = 68.0,
  double customPaddingWidth = 16.0,
}) {
  double offset = customPaddingWidth +
      ((customWidgetWidth) * index) +
      (customPaddingWidth * index) -
      (deviceWidth / 2) +
      customWidgetWidth / 2;
  if (offset < 0) {
    offset = 0;
  }
  if (offset > maxPosition) {
    offset = maxPosition;
  }
  return offset;
}

/// Требуется оптимизация с использованием регулярных выражений
String createStringDate(DateTime? date) {
  final year = date?.year.toString();
  final month = date?.month.toString().padLeft(2, '0');
  final day = date?.day.toString().padLeft(2, '0');
  return '$year-$month-$day';
}

/// Оптимизированная версия с использованием DateFormat
String createStringFromDate(DateTime date) {
  return intl.DateFormat('yyyy-MM-dd').format(date);
}

bool isDateEqual(DateTime? o1, DateTime? o2) {
  return o1?.year == o2?.year && o1?.month == o2?.month && o1?.day == o2?.day;
}

// превращает group: 4, subgroup: 1 в '4.1'
String createFullGroupName(int? group, int? subgroup) {
  return '$group${subgroup == null ? '' : '.$subgroup'}';
}

String createGroupAndCurseName(int? group, int? curse) {
  String result = '';
  if (group != null) {
    result += 'Группа $group ';
  }
  if (curse != null) {
    result += 'Курс $curse';
  }
  return result;
}

String createFullName(String? first, String? middle, String? last) {
  String fullName = '';
  if (last != null && last.isNotEmpty) {
    fullName += ' $last';
  }
  if (first != null && first.isNotEmpty) {
    fullName += ' $first';
  }
  if (middle != null && middle.isNotEmpty) {
    fullName += ' $middle';
  }
  return fullName.trim();
}

Color getColorByCourse(int? course) {
  if (course == 1) {
    return AppColor.firstCourse;
  }
  if (course == 2) {
    return AppColor.secondCourse;
  }
  if (course == 3) {
    return AppColor.thirdCourse;
  }
  return AppColor.fourthCourse;
}

String getMonth(DateTime dateTime) {
  final month = intl.DateFormat.MMMM('ru').format(dateTime);
  return month.substring(0, 3);
}

String getDateForExam(DateTime? dateTime) {
  if (dateTime == null) {
    return '';
  }
  final month = dateTime.month.getMonthString();
  final dayOfWeek = dateTime.weekday.getFullDayByWeekNumber();
  final result = '${dateTime.day} $month, $dayOfWeek';
  return result;
}

extension getWeekday on int {
  String getDayByWeekNumber() {
    switch (this) {
      case 1:
        return 'ПН';
      case 2:
        return 'ВТ';
      case 3:
        return 'СР';
      case 4:
        return 'ЧТ';
      case 5:
        return 'ПТ';
      case 6:
        return 'СБ';
      case 7:
        return 'ВС';
      default:
        return 'ВС';
    }
  }

  String getFullDayByWeekNumber() {
    switch (this) {
      case 1:
        return 'понедельник';
      case 2:
        return 'вторник';
      case 3:
        return 'среда';
      case 4:
        return 'четверг';
      case 5:
        return 'пятница';
      case 6:
        return 'суббота';
      case 7:
        return 'воскресенье';
      default:
        return 'ВС';
    }
  }

  /// Реализация для русской локализации
  String getMonthString() {
    switch (this) {
      case 1:
        return 'января';
      case 2:
        return 'февраля';
      case 3:
        return 'марта';
      case 4:
        return 'апреля';
      case 5:
        return 'мая';
      case 6:
        return 'июня';
      case 7:
        return 'июля';
      case 8:
        return 'августа';
      case 9:
        return 'сентября';
      case 10:
        return 'октября';
      case 11:
        return 'ноября';
      case 12:
        return 'декабря';
      default:
        return 'января';
    }
  }
}
