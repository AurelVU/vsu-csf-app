
import 'package:fkn/feature/student/timetable/presentation/components/exam_info_card.dart';
import 'package:fkn/feature/student/timetable/presentation/components/week_day_card.dart';
import 'package:fkn/feature/teacher/teacher_journal/components/journal_lesson_widget.dart';
import 'package:fkn/uikit/showcase/list_news_widget.dart';
import 'package:fkn/uikit/showcase/student_short_info_widget.dart';
import 'package:fkn/uikit/teacher_lesson_widget.dart';
import 'package:fkn/uikit/user_info_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'data_test.dart';

class Func {
  Func(this.tester);

  final WidgetTester tester;

  window() => tester.binding.window;

  size() => window().physicalSize / window().devicePixelRatio;

  Offset center() => Offset((size().width) / 2, (size().height) / 2);

  TeacherLessonWidget cardT({int? i}) =>
      tester.widget(Finders.teaLesWid.at(i ?? 0));

  JournalLessonWidget cardJ({int? i}) =>
      tester.widget(Finders.jouLesWid.at(i ?? 0));

  UserInfoCard usInfoCard() => tester.widget(find.byType(UserInfoCard));

  StudentShortInfoWidget shortInfo() =>
      tester.widget(find.byType(StudentShortInfoWidget));

  ExamInfoCard examInfoCard() => tester.widget(find.byType(ExamInfoCard).first);

  // Future<void> waitSplashScreen() async {
  //   await tester.pumpAndSettle(Delay.delay100);
  //   while (find.byType(SplashScreen).evaluate().isNotEmpty) {
  //     await tester.pumpAndSettle(Delay.delay100);
  //   }
  // }
  Future<void> tapDelay(int i, Finder finder) async {
    await tester.tap(finder);
    await tester.pumpAndSettle(Duration(milliseconds: i));
    await pump(i ~/ 100);
  }

  Future<void> enterValue(int num, int value) async {
    final TextField textField = tester.widget(Finders.inAtt.at(num));
    FocusNode focusNode = textField.focusNode!;
    focusNode.requestFocus();
    await Func(tester).tapDelay(200, Finders.inAtt.at(num));
    await tester.enterText(Finders.inAtt.at(num), '$value');
    await pump(10);
    focusNode.unfocus();
    await pump(20);
  }

  Future<void> scrolling(Finder finder) async {
    final Finder list = find.byType(ListView).first;
    while (!finder.tryEvaluate()) {
      await tester.drag(list, const Offset(0, -50));
      await tester.pumpAndSettle();
    }
    if (size().height < tester.getBottomLeft(finder).dy) {
      await tester.drag(
          list, Offset(0, size().height - tester.getBottomLeft(finder).dy));
    }
    await pump(5);
  }

  Future<void> scrollData({String? t}) async {
    if ((t != null)
        ? !find.textContaining(t).tryEvaluate()
        : find.textContaining('Нет занятий').tryEvaluate()) {
      final Finder day = find.byType(WeekDayCard);
      int i = 1;
      while (day.at(0).evaluate().isEmpty) {
        await tester.dragFrom(
            Offset(tester.getTopLeft(day.first).dx,
                tester.getTopLeft(day.first).dy),
            const Offset(5, 0));
      }
      await Func(tester).pump(5);
      await Func(tester).tapDelay(300, day.at(0));
      while ((t != null)
          ? !find.textContaining(t).tryEvaluate()
          : find.textContaining('Нет занятий').tryEvaluate()) {
        // while (find.textContaining('Нет занятий').evaluate().isNotEmpty) {
        await tester.timedDragFrom(tester.getTopRight(day.at(i - 1)),
            Offset(5 - tester.getTopLeft(day.at(i)).dx, 0), Delay.delay1);
        await Func(tester).pump(5);
        await Func(tester).tapDelay(300, day.at(i));
        await Func(tester).tapDelay(300, day.at(i));
        await Func(tester).pump(5);
        i++;
      }
    }
  }

  Future<void> scroll(int n) async {
    for (int i = 0; i < n; i++) {
      await tester.timedDragFrom(
          Func(tester).center(), const Offset(0, -150), Delay.delay300);
      await tester.pumpAndSettle();
      await tester.timedDragFrom(Func(tester).center(),
          Offset((size().width / 2), 150), Delay.delay300);
      await tester.pumpAndSettle();
    }
    await tester.pumpAndSettle(Delay.delay300);
  }

  Future<void> scrollJournal() async {
    if (find.byType(JournalWidget).tryEvaluate()) {
      await tester.timedDragFrom(
          Offset(tester.getTopRight(find.byType(JournalWidget)).dx,
              tester.getTopRight(find.byType(JournalWidget)).dy),
          Offset(-tester.getTopRight(find.byType(JournalWidget)).dx, 0),
          Delay.delay1);
    }
  }

  Future<int?> scrollVisible(Finder finder) async {
    for (int i = 0; i < 31; i++) {
      if (tester.getCenter(finder.at(i)).dx < Func(tester).size().width &&
          tester.getCenter(finder.at(i)).dx > 0) {
        await Func(tester).tapDelay(1000, finder.at(i));
        return i;
      }
    }
    return null;
  }

  Future<void> pump(int n) async {
    for (int i = 0; i < n; i++) {
      await tester.pumpAndSettle(Delay.delay(10));
    }
  }
// Future<void> pump(int n) async => Future.forEach(List.generate(n, (i) => i),
//     (i) async => await tester.pumpAndSettle(Delay.delay(10)));
}
