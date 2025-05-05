import 'package:fkn/feature/common/politic/presentation/politic_screen_view.dart';
import 'package:fkn/feature/common/showcase/presentation/showcase_screen_view.dart';
import 'package:fkn/main.dart';
import 'package:fkn/startup/startup.dart';
import 'package:fkn/utils/bottom_navigation_bar_icon_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'data_test.dart';
import 'function_test.dart';
import 'init_test.dart';

class Scenario {
  final Init data;
  Scenario(this.data);
  Future<void> authorization(WidgetTester tester, {String? login}) async {
    final onErrorDefault = FlutterError.onError;
    FlutterError.onError = data.onErrorIgnoreOverFlowErrors(onErrorDefault!);
    await tester.pumpWidget(
      StartUpWidget(
        container: data.container,
        environment: data.environment,
        child: App(
          initialDeeplink: data.route,
          appType: data.appType ?? '',
        ),
      ),
    );
    // await tester.pumpAndSettle(Delay.delay(1300));
    await Func(tester).pump(100);
    // await Func(tester).waitSplashScreen();

    if (login != null) {
      final Finder button = find.ancestor(
          of: find.text(login), matching: find.byType(ElevatedButton));
      await Func(tester).tapDelay(300, button);
    }
  }

  Future<void> home(WidgetTester tester, {String? login}) async {
    await authorization(tester, login: login);
    if (login == 'Войти как студент') {
      await tester.enterText(Finders.tfw('Логин'), Logs.logS);
      await tester.enterText(Finders.tfw('Пароль'), Logs.pasS);
    } else {
      await tester.enterText(Finders.tfw('Адрес электронной почты'), Logs.logT);
      await Func(tester).tapDelay(2000, find.textContaining('Отправить код на').first);
      await tester.enterText(
          Finders.tfw('Код из сообщения из Email'), Logs.pasT);
      await Func(tester).pump(30);
    }
    await Func(tester).tapDelay(1000, find.text('Войти'));
    if (login == 'Войти как преподаватель' && find.byType(PoliticScreenView).tryEvaluate()) {
        await Func(tester).tapDelay(500, find.byType(Checkbox).first);
        final Finder finder = find.descendant(
            of: find.byType(ElevatedButton), matching: find.text('Далее'));
        await Func(tester).tapDelay(1000, finder);
    }
    await tester.pumpAndSettle(Delay.delay1);
  }

  Future<void> schedule(WidgetTester tester, {String? login}) async {
    await home(tester, login: login);
    final Finder icon = find.byIcon(BottomNavigationBarIcon.timetable);
    await Func(tester).tapDelay(5000, icon.first);
  }

  Future<void> journal(WidgetTester tester, {String? login}) async {
    await home(tester, login: login);
    final Finder icon = find.byIcon(BottomNavigationBarIcon.career);
    await Func(tester).tapDelay(2000, icon.first);
  }

  Future<void> pos(WidgetTester tester, {bool t = false}) async {
    await journal(tester, login: 'Войти как преподаватель');
    await Func(tester).tapDelay(3000, Finders.jouLesWid.first);
    await Func(tester)
        .tapDelay(3000, find.text(t ? 'Оценки' : 'Посещаемость'));
  }

  Future<void> rating(WidgetTester tester) async {
    await home(tester, login: 'Войти как студент');
    await Func(tester).tapDelay(3000, find.byType(RatingWidgetWithShadow));
  }

  Future<void> profile(WidgetTester tester, {bool t = false}) async {
    await home(tester, login: 'Войти как ${t ? 'преподаватель' : 'студент'}');
    await Func(tester)
        .tapDelay(3000, find.byIcon(BottomNavigationBarIcon.profile));
  }

  Future<void> portfolio(WidgetTester tester) async {
    await profile(tester);
    await Func(tester).tapDelay(3000, Finders.field('Портфолио'));
  }
}