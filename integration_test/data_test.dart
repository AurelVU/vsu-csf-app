import 'package:fkn/feature/common/news/all_news_screen.dart';
import 'package:fkn/feature/student/portfolio/portfolio_screen_view.dart';
import 'package:fkn/feature/teacher/teacher_journal/components/group_leader_info.dart';
import 'package:fkn/feature/teacher/teacher_journal/components/journal_lesson_widget.dart';
import 'package:fkn/startup/app_keys.dart';
import 'package:fkn/uikit/profile_button.dart';
import 'package:fkn/uikit/rating_widget.dart';
import 'package:fkn/uikit/showcase/list_news_widget.dart';
import 'package:fkn/uikit/showcase/student_short_info_widget.dart';
import 'package:fkn/uikit/teacher_lesson_widget.dart';
import 'package:fkn/uikit/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_test/flutter_svg_test.dart';
import 'package:flutter_test/flutter_test.dart';

abstract class Logs {
  // static String logT = 'ksushazwf@gmail.com';
  static String logT = 'sborzunov@gmail.com';
  static String pasT = '297014';
  static String logS = 'egorov_v_s';
  static String pasS = 'zxczxczxc';
}

abstract class Delay {
  static const Duration delay100 = Duration(milliseconds: 100);
  static const Duration delay300 = Duration(milliseconds: 300);
  static const Duration delay1 = Duration(milliseconds: 1000);
  static Duration delay(n) => Duration(milliseconds: n);
}

abstract class Finders {
  static Finder newsUni = find.byWidgetPredicate((widget) =>
      widget is ListNewsWidget && widget.title == 'Новости университета');
  static Finder newsFak = find.byWidgetPredicate((widget) =>
      widget is ListNewsWidget && widget.title == 'Новости факультета');
  static Finder allNewsUni = find.byWidgetPredicate((widget) =>
      widget is AllNewScreen && widget.title == 'Новости университета');
  static Finder allNewsFak = find.byWidgetPredicate((widget) =>
      widget is AllNewScreen && widget.title == 'Новости факультета');
  static Finder closePng = find.byWidgetPredicate((widget) =>
      widget is Image &&
      widget.image is AssetImage &&
      (widget.image as AssetImage).assetName == 'assets/image/close.png');
  static Finder fcs = find.svgAssetWithPath('assets/svg/fcs.svg');
  static Finder calendar = find.svgAssetWithPath('assets/svg/calendar.svg');
  static Finder errLog = find.byWidgetPredicate(
      (widget) => widget is RichText && widget.key == Keys.brs);
  static Finder errLog2 = find.byWidgetPredicate(
      (widget) => widget is RichText && widget.key == Keys.brs2);
  static Finder remPass = find.byKey(Keys.remPass);
  static Finder newsText = find.byKey(Keys.newsText);
  static Finder shortInfo = find.byType(StudentShortInfoWidget);
  static Finder jouLesWid = find.byType(JournalLessonWidget);
  static Finder ratWid = find.byType(RatingWidget);
  static Finder attDate = find.byKey(Keys.attDate);
  static Finder attDates = find.byKey(Keys.attDates);
  static Finder blockGroups = find.byKey(Keys.blockGroups);
  static Finder face = find.byKey(Keys.face);
  static Finder courseJournal = find.byKey(Keys.courseJournal);
  static Finder courseSchedule = find.byKey(Keys.courseSchedule);
  static Finder name = find.byKey(Keys.name);
  static Finder exams = find.byKey(Keys.exams);
  static Finder faculty = find.byKey(Keys.faculty);
  static Finder subjectBox = find.byKey(Keys.subjectBox);
  static Finder subjectName = find.byKey(Keys.subjectName);
  static Finder teacher = find.byKey(Keys.teacher);
  static Finder schedule = find.byKey(Keys.schedule);
  static Finder nameCard = find.byKey(Keys.nameCard);
  static Finder groupInfoBox = find.byKey(Keys.groupInfo);
  static Finder semesterList = find.byKey(Keys.semesterList);
  static Finder semester = find.byKey(Keys.semester);
  static Finder markAtt = find.byKey(Keys.markAtt);
  static Finder markExam = find.byKey(Keys.markExam);
  static Finder markTextAtt = find.byKey(Keys.markTextAtt);
  static Finder markTextExam = find.byKey(Keys.markTextExam);
  static Finder teaLesWid = find.byType(TeacherLessonWidget);
  static Finder facultyCard = find.byKey(Keys.facultyCard);
  static Finder attendanceJournal = find.byKey(Keys.attendanceJournal);
  static Finder attMarks = find.byKey(Keys.attMarks);
  static Finder attMark = find.byKey(Keys.attMark);
  static Finder grades = find.byKey(Keys.gradesPage);
  static Finder userInfo = find.byKey(Keys.userInfo);
  static Finder imageFace = find.byKey(Keys.imageFace);
  static Finder attName = find.byKey(Keys.attName);
  static Finder gradesName = find.byKey(Keys.gradesName);
  static Finder gradesAVG = find.byKey(Keys.gradesAVG);
  static Finder attList = find.byKey(Keys.attList);
  static Finder inAtt = find.byKey(Keys.inAtt);
  static Finder allSemesterList = find.byKey(Keys.allSemesterList);
  static Finder allSemester = find.byKey(Keys.allSemester);
  static Finder attPerson = find.byKey(Keys.attPerson);
  static Finder contactWidget = find.byKey(Keys.contactWidget);
  static Finder nextSubjectWidget = find.byKey(Keys.nextSubjectWidget);
  static Finder subjectInfoCardContainer =
      find.byKey(Keys.subjectInfoCardContainer);
  static Finder back = find.byIcon(Icons.arrow_back_ios_new_rounded);
  static Finder grInfoC = find.byKey(Keys.groupInfo);
  static Finder groupInfo = find.svgAssetWithPath('assets/svg/group_info.svg');
  static Finder attendance = find.svgAssetWithPath('assets/svg/attendance.svg');

  static Finder forward(bool i) => find.descendant(
      of: i ? Finders.newsUni : Finders.newsFak,
      matching: find.byIcon(Icons.arrow_forward_ios));

  static Finder groupLeaderInfo(String t) => find.byWidgetPredicate(
      (widget) => widget is GroupLeaderInfo && widget.title == t);

  static Finder field(String t) => find.byWidgetPredicate(
      (widget) => widget is ProfileButton && widget.title == t);

  static Finder tfw(String hintText) => find.byWidgetPredicate(
      (widget) => widget is TextFieldWidget && widget.hintText == hintText);

  static Finder ft(String text) => find.byWidgetPredicate(
      (widget) => widget is FieldText && widget.text == text);
}
