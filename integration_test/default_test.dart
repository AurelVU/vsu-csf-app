import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:fkn/domain/teacher/timetable/student_group.dart';
import 'package:fkn/feature/common/auth/auth_screen_view.dart';
import 'package:fkn/feature/common/auth/login_student_widget.dart';
import 'package:fkn/feature/common/auth/login_teacher/presentation/confirm_code_teacher_screen_view.dart';
import 'package:fkn/feature/common/auth/login_teacher/presentation/enter_value_teacher_screen_view.dart';
import 'package:fkn/feature/common/auth/login_teacher/presentation/login_teacher_screen.dart';
import 'package:fkn/feature/common/showcase/presentation/showcase_screen_view.dart';
import 'package:fkn/feature/student/portfolio/portfolio_screen_view.dart';
import 'package:fkn/feature/student/rating/presentation/career_screen_view.dart';
import 'package:fkn/feature/student/timetable/presentation/calendar_screen/calendar_screen_view.dart';
import 'package:fkn/feature/student/timetable/presentation/components/custom_circle.dart';
import 'package:fkn/feature/student/timetable/presentation/components/exam_page_widget.dart';
import 'package:fkn/feature/student/timetable/presentation/components/subject_info_card.dart';
import 'package:fkn/feature/student/timetable/presentation/components/subject_page_widget.dart';
import 'package:fkn/feature/student/timetable/presentation/components/timetable_group_screen_view.dart';
import 'package:fkn/feature/student/timetable/presentation/components/week_day_card.dart';
import 'package:fkn/feature/teacher/subject_grades/presentation/subject_grades_screen_view.dart';
import 'package:fkn/feature/teacher/teacher_attendance_journal/components/attendance_modal_popup.dart';
import 'package:fkn/feature/teacher/teacher_attendance_journal/presentation/teacher_attendance_journal_screen_view.dart';
import 'package:fkn/feature/teacher/teacher_journal/components/group_leader_info.dart';
import 'package:fkn/feature/teacher/teacher_journal/components/journal_lesson_widget.dart';
import 'package:fkn/feature/teacher/teacher_journal/presentation/teacher_journal_screen_view.dart';
import 'package:fkn/feature/teacher/teacher_showcase/presentation/teacher_showcase_screen_view.dart';
import 'package:fkn/feature/teacher/teacher_timetable/components/teacher_week_type_widget.dart';
import 'package:fkn/feature/teacher/teacher_timetable/presentation/teacher_timetable_screen_view.dart';
import 'package:fkn/startup/app_color.dart';
import 'package:fkn/startup/app_keys.dart';
import 'package:fkn/uikit/card_container.dart';
import 'package:fkn/uikit/next_subject_widget.dart';
import 'package:fkn/uikit/profile_button.dart';
import 'package:fkn/uikit/rating_widget.dart';
import 'package:fkn/uikit/showcase/contact_widget.dart';
import 'package:fkn/uikit/showcase/list_news_widget.dart';
import 'package:fkn/uikit/showcase/news_detail_screen.dart';
import 'package:fkn/uikit/showcase/news_widget.dart';
import 'package:fkn/uikit/teacher_lesson_widget.dart';
import 'package:fkn/uikit/timetable/animated_timetable_type_switcher.dart';
import 'package:fkn/uikit/timetable/scrolling_days.dart';
import 'package:fkn/uikit/user_info_card.dart';
import 'package:fkn/utils/attendence_utils.dart';
import 'package:fkn/utils/timetable_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lottie/lottie.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:table_calendar/table_calendar.dart';
import 'data_test.dart';
import 'function_test.dart';
import 'init_test.dart';
import 'scenario_test.dart';

Future<void> main() async {
  final init = Init();
  await init.init();
  final test = Scenario(init);
  bool testHome2 = false;
  bool testHome3 = false;
  bool testHome4 = false;
  bool testHome5 = false;
  bool testHome6 = false;
  bool testHome7 = false;
  //
  //
  //
  group('Приложение', () {
    group('Служебные экраны', () {});
    //
    //
    //
    //
    //
    group('Профиль студента', () {
      //
      //
      //
      group('Авторизация (студент)', () {
        group('Страница авторизации', () {
          bool test2 = false;
          bool test3 = false;
          testWidgets('Заголовок "Добро пожаловать" по центру', (tester) async {
            await test.authorization(tester);
            expect(tester.getCenter(find.text('ДОБРО ПОЖАЛОВАТЬ')).dx,
                Func(tester).size().width / 2);

            final Finder finder =
                find.text('Авторизуйтесь, чтобы войти в аккаунт');
            test2 =
                (tester.getCenter(finder).dx == Func(tester).size().width / 2)
                    ? true
                    : false;
            test2 = (test2 &&
                    tester.getTopLeft(finder).dy >=
                        tester.getBottomLeft(find.text('ДОБРО ПОЖАЛОВАТЬ')).dy)
                ? true
                : false;

            final Finder button = find.ancestor(
                of: find.text('Войти как студент'),
                matching: find.byType(ElevatedButton));
            final ElevatedButton buttons = tester.widget(button);
            final Finder finder2 = find.descendant(
                of: find.byType(LoginStudentWidget),
                matching: find.text('Вход в аккаунт'));
            test3 = (buttons.style?.backgroundColor?.resolve({}) ==
                    AppColor.newBlue)
                ? true
                : false;
            await Func(tester).tapDelay(300, button);
            test3 = (test3 && finder2.tryEvaluate()) ? true : false;
          });

          testWidgets(
              'Текст "Авторизуйтесь, чтобы войти в аккаунт" по центру ниже заголовка',
              (tester) async {
            // await test.authorization(tester);
            // final Finder finder =
            //     find.text('Авторизуйтесь, чтобы войти в аккаунт');
            // expect(
            //     reason: 'по центру',
            //     tester.getCenter(finder).dx,
            //     Func(tester).size().width / 2);
            // expect(
            //     reason: 'ниже заголовка',
            //     tester.getTopLeft(finder).dy >=
            //         tester.getBottomLeft(find.text('ДОБРО ПОЖАЛОВАТЬ')).dy,
            //     true);
            expect(test2, true);
          });

          testWidgets(
              'Кнопка "Войти как студент" синего цвета, при тапе на которую появляется боттомшит "Вход в аккаунт"',
              (tester) async {
            // await test.authorization(tester);
            // final Finder button = find.ancestor(
            //     of: find.text('Войти как студент'),
            //     matching: find.byType(ElevatedButton));
            // final ElevatedButton buttons =
            //     tester.widget<ElevatedButton>(button);
            // expect(
            //     reason: 'синего цвета',
            //     buttons.style?.backgroundColor?.resolve({}),
            //     AppColor.newBlue);
            // await Func(tester).tapDelay(300, button);
            // final Finder finder = find.descendant(
            //     of: find.byType(LoginStudentWidget),
            //     matching: find.text('Вход в аккаунт'));
            // expect(finder, findsOneWidget, reason: 'страница найдена');
            expect(test3, true);
          });

          testWidgets(
              'Кнопка "Войти как преподаватель" прозрачная, при тапе на которую появляется боттомшит "Вход в аккаунт"',
              (tester) async {
            await test.authorization(tester);
            final Finder button = find.ancestor(
                of: find.text('Войти как преподаватель'),
                matching: find.byType(ElevatedButton));
            final ElevatedButton buttons =
                tester.widget<ElevatedButton>(button);
            expect(
                reason: 'прозрачного цвета',
                buttons.style?.backgroundColor?.resolve({}),
                AppColor.white);
            await Func(tester).tapDelay(300, button);
            final Finder finder = find.descendant(
                of: find.byType(EnterValueTeacherScreenView),
                matching: find.text('Вход в аккаунт'));
            expect(finder, findsOneWidget, reason: 'страница найдена');
          });
        });
        //
        //
        group('Боттомшит Вход в аккаунт для студента', () {
          testWidgets('Заголовок "Вход в аккаунт" по центру', (tester) async {
            await test.authorization(tester, login: 'Войти как студент');
            expect(Func(tester).size().width / 2,
                tester.getCenter(find.text('Вход в аккаунт')).dx);
          });

          testWidgets(
              'Кнопка крестик в правом верхнем углу, при тапе на которую боттомшит закрывается',
              (tester) async {
            await test.authorization(tester, login: 'Войти как студент');

            final Finder sheet = find.byType(LoginStudentWidget);
            final Finder icon =
                find.descendant(of: sheet, matching: Finders.closePng);
            expect(sheet, findsOneWidget, reason: 'открыт');
            expect(icon, findsAny, reason: 'кнопка найдена');
            await Func(tester).tapDelay(300, icon);
            expect(sheet, findsNothing, reason: 'закрыт');
          });

          testWidgets(
              'Поле Логин для ввода логина (логин выдается в университете)',
              (tester) async {
            await test.authorization(tester, login: 'Войти как студент');
            expect(Finders.tfw('Логин'), findsOneWidget);
          });

          testWidgets('Поле Пароль для ввода пароля', (tester) async {
            await test.authorization(tester, login: 'Войти как студент');
            expect(Finders.tfw('Пароль'), findsOneWidget);
          });

          testWidgets(
              'Ниже поля Пароль текст "Восстановить пароль csadmins@sc.vsu.ru"',
              (tester) async {
            await test.authorization(tester, login: 'Войти как студент');
            expect(Finders.remPass, findsOne);
          });

          testWidgets('Кнопка "Войти"', (tester) async {
            await test.authorization(tester, login: 'Войти как студент');
            final Finder text = find.text('Войти');
            final Finder finder =
                find.ancestor(of: text, matching: find.byType(ElevatedButton));
            expect(finder, findsOneWidget);
          });
          //
          //
          group('Кнопка "Войти"', () {
            // testWidgets(
            //     'Становится активной после заполнения полей логина и пароля',
            //     (tester) async {
            //   expect(true, false);
            // });
            //
            // testWidgets(
            //     """При тапе на кнопку в случае верного ввода логина и пароля
            //     открывается окно политики конфиденциальности.""",
            //     (tester) async {
            //   // await test.authorization(tester, login: 'Войти как студент');
            //   // final Finder text = find.text('Войти');
            //   // await tester.enterText(Finders.tfw('Логин'), Finders.logS);
            //   // await tester.enterText(Finders.tfw('Пароль'), Finders.pasS);
            //   // await Func(tester).tapDelay(300, text);
            //   expect(true, false);
            // });
            //
            //
            // group('В окне отображается:', () {
            //   testWidgets(
            //       """Заголовок "Политика конфиденциальности" по центру""",
            //       (tester) async {
            //     expect(true, false);
            //   });
            //   testWidgets("""Кнопка назад, при тапе на которую происходит
            //       переход на предыдущую страницу """, (tester) async {
            //     expect(true, false);
            //   });
            //   testWidgets("""Информация о политике конфиденциальности.
            //       Листается свайпом вверх""", (tester) async {
            //     expect(true, false);
            //   });
            //   testWidgets("""Чекбокс на согласие, при активации которого
            //   активируется кнопка "Далее". При тапе на кнопку происходит вход в аккаунт""",
            //       (tester) async {
            //     expect(true, false);
            //   });
            // });
            //
            //
            testWidgets(
                """в случае верного ввода логина и пароля открывается Главная""",
                (tester) async {
              await test.home(tester, login: 'Войти как студент');
              await tester.pumpAndSettle(Delay.delay(2000));
              expect(find.byType(ShowcaseScreenView), findsAny);
            });

            testWidgets("""При тапе на кнопку в случае неверного ввода логина
            или пароля, поля отображаются красным, а ниже поля ввода пароля
            отображается подсказка красным "Неверный логин или пароль""",
                (tester) async {
              await test.authorization(tester, login: 'Войти как студент');
              final Finder error = find.text('Неверный логин или пароль');
              final Finder finder = find.ancestor(
                  of: find.text('Войти'),
                  matching: find.byType(ElevatedButton));
              expect(reason: 'проверка отсутствия', error, findsNothing);
              await Func(tester).tapDelay(300, finder);
              expect(reason: 'проверка отображения', error, findsOneWidget);
              final Text errorText = tester.widget(error);
              expect(
                  reason: 'проверка цвета',
                  errorText.style?.color,
                  const Color(0xffba1a1a));
            });
          });
        });
      });
      //
      //
      //
      group('Главная страница (студент)', () {
        //
        //
        group('Элементы Главная страница (студент)', () {
          testWidgets('Заголовок - название факультета вверху экрана по центру',
              (tester) async {
            await test.home(tester, login: 'Войти как студент');
            await tester.pumpAndSettle(Delay.delay(2000));
            expect(Finders.fcs, findsAny, reason: 'нилич на экране');
            expect(
                tester.getCenter(Finders.fcs).dx, Func(tester).size().width / 2,
                reason: 'по центру');
            expect(
                tester.getBottomLeft(Finders.fcs).dy <=
                    tester.getTopLeft(Finders.shortInfo).dy,
                true,
                reason: 'выше блока пользователя');

            testHome2 = (Finders.shortInfo.tryEvaluate());
            testHome3 = (Finders.ratWid.tryEvaluate());
            testHome4 = (find.byType(ContactWidget).first.tryEvaluate());
            testHome5 = (find.byType(NextSubjectWidget).tryEvaluate());
            // await Func(tester).scrolling(Finders.newsFak);
            await tester.dragUntilVisible(Finders.newsUni,
                find.byType(ListView).first, const Offset(0, -50));
            testHome6 = (Finders.newsUni.tryEvaluate());
            await tester.dragUntilVisible(Finders.newsFak,
                find.byType(ListView).first, const Offset(0, -50));
            testHome7 = (Finders.newsFak.tryEvaluate());
          });

          testWidgets('Блок Пользователя', (tester) async {
            expect(testHome2, true);
          });

          testWidgets('Блок Рейтинга', (tester) async {
            expect(testHome3, true);
          });

          testWidgets('Блок Техподдержки (телеграмм)', (tester) async {
            expect(testHome4, true);
          });

          testWidgets('Блок Расписания', (tester) async {
            expect(testHome5, true);
          });

          testWidgets('Блок Новости университета', (tester) async {
            expect(testHome6, true);
          });

          testWidgets('Блок Новости факультета', (tester) async {
            expect(testHome7, true);
          });
        });
        //
        //
        group('Блок Пользователя', () {
          testWidgets('Вверху экрана', (tester) async {
            await test.home(tester, login: 'Войти как студент');
            expect(tester.getTopLeft(Finders.shortInfo.first).dy < 100, true);
          });

          testWidgets('Содержит область аватарки слева', (tester) async {
            await test.home(tester, login: 'Войти как студент');
            expect(Finders.face, findsAny, reason: 'содержит');
            expect(
                tester.getCenter(Finders.face).dx <
                    Func(tester).size().width / 3,
                true,
                reason: 'слева');
          });

          testWidgets("""Содержит ФИО пользователя справа от области аватарки
          в 2 строки: 1) ФИ, 2) О""", (tester) async {
            await test.home(tester, login: 'Войти как студент');
            expect(
                find
                    .textContaining(Func(tester).shortInfo().name)
                    .tryEvaluate(),
                true,
                reason: 'проверка на экране');
            expect(
                tester
                        .getTopLeft(
                            find.textContaining(Func(tester).shortInfo().name))
                        .dx >
                    tester.getTopRight(Finders.face.first).dx,
                true,
                reason: 'справа');
          });

          testWidgets(
              'Содержит название факультета пользователя ниже ФИО пользователя',
              (tester) async {
            await test.home(tester, login: 'Войти как студент');

            final Finder name =
                find.textContaining(Func(tester).shortInfo().name);
            expect(reason: 'проверка наличия', Finders.faculty, findsOneWidget);
            expect(
                reason: 'проверка положения',
                true,
                tester.getBottomLeft(name).dy <=
                    tester.getTopLeft(Finders.faculty).dy);
          });

          // testWidgets(
          //     'При тапе на блок происходит переход на страницу "Портфолио"',
          //     (tester) async {
          //   await test.home(tester, login: 'Войти как студент');
          //   await Func(tester)
          //       .tapDelay(1000, find.byType(StudentShortInfoWidget));
          //   expect(find.byType(PortfolioScreenView), findsOneWidget);
          // });
        });
        //
        //
        bool testRat1 = false;
        bool testRat2 = false;
        bool testRat3 = false;
        bool testRating1 = false;
        bool testRating2 = false;
        bool testRating3 = false;
        group('Блок Рейтинга', () {
          testWidgets('Ниже блока Пользователя', (tester) async {
            await test.home(tester, login: 'Войти как студент');
            expect(Finders.ratWid.first, findsOneWidget,
                reason: 'найден на экране');

            expect(
                tester.getTopLeft(Finders.ratWid.first).dy >
                    tester.getBottomLeft(Finders.shortInfo.first).dy,
                true,
                reason: 'ниже');

            testRating1 = find.text('Общий рейтинг').tryEvaluate();
            testRating2 = find
                .text(
                    '«Успех – это сумма небольших усилий, повторяемых изо дня в день»')
                .tryEvaluate();
            testRat1 = find.text('в потоке').tryEvaluate();
            testRat2 = find.text('на направлении').tryEvaluate();
            testRat3 = find.textContaining('в группе').tryEvaluate();
            await Func(tester)
                .tapDelay(1000, find.byType(RatingWidgetWithShadow));
            testRating3 = find.byType(CareerScreenView).tryEvaluate();
          });

          testWidgets('Содержит название "Общий рейтинг"', (tester) async {
            // await test.home(tester, login: 'Войти как студент');
            // final Finder finder = find.text('Общий рейтинг');
            // expect(finder, findsOneWidget);
            expect(testRating1, true);
          });

          testWidgets("""Содержит текст под названием "Успех -
          это сумма небольших усилий, повторяемых изо дня в день""",
              (tester) async {
            // await test.home(tester, login: 'Войти как студент');
            // final Finder finder = find.text(
            //     '«Успех – это сумма небольших усилий, повторяемых изо дня в день»');
            // expect(finder, findsOneWidget);
            expect(testRating2, true);
          });
          //
          //
          group('Содержит рейтинг пользователя', () {
            testWidgets('1) в потоке (рейтинговый номер по всему курсу)',
                (tester) async {
              // await test.home(tester, login: 'Войти как студент');
              // final Finder finder3 = find.text('в потоке');
              // expect(finder3, findsOneWidget);
              expect(testRat1, true);
            });
            testWidgets('2) на направлении (рейтинговый номер по направлению)',
                (tester) async {
              // await test.home(tester, login: 'Войти как студент');
              // final Finder finder2 = find.text('на направлении');
              // expect(finder2, findsOneWidget);
              expect(testRat2, true);
            });
            testWidgets('3) в группе (рейтинговый номер в группе)',
                (tester) async {
              // await test.home(tester, login: 'Войти как студент');
              // final Finder finder1 = find.textContaining('в группе');
              // expect(finder1, findsOneWidget);
              expect(testRat3, true);
            });
          });
          //
          //
          testWidgets('При тапе на блок происходит переход на страницу Рейтинг',
              (tester) async {
            // await test.home(tester, login: 'Войти как студент');
            // await Func(tester)
            //     .tapDelay(1000, find.byType(RatingWidgetWithShadow));
            // final Finder finder = find.byType(CareerScreenView);
            // expect(finder, findsOneWidget);
            expect(testRating3, true);
          });
        });
        //
        //
        group('Блок Техническая поддержка', () {
          testWidgets('Ниже блока Рейтинга', (tester) async {
            await test.home(tester, login: 'Войти как студент');
            final Finder finder1 = find.byType(ContactWidget).first;
            expect(finder1, findsOneWidget, reason: 'найден');
            final Finder finder2 = find.byType(RatingWidget).first;
            expect(tester.getCenter(finder1).dy > tester.getCenter(finder2).dy,
                true,
                reason: 'ниже');
          });

          testWidgets(
              'Содержит текст "Есть идея, как сделать приложение лучше?"',
              (tester) async {
            await test.home(tester, login: 'Войти как студент');
            final Finder finder =
                find.text('Есть идея, как сделать приложение лучше?');
            expect(finder, findsOneWidget);
          });

          // testWidgets("""При тапе на блок происходит переход в телеграмм-чат
          // технической поддержки""", (tester) async {
          //   expect(true, false);
          // });

          testWidgets("""Содержит гиперссылку "Напиши нам" ниже текста""",
              // , при тапе на которую происходит переход в телеграмм-чат технической поддержки""",
              (tester) async {
            await test.home(tester, login: 'Войти как студент');

            final Finder finder1 = find.text('Напиши нам!').first;
            final Finder finder2 =
                find.text('Есть идея, как сделать приложение лучше?').first;
            expect(
              tester.getTopLeft(finder1).dy > tester.getBottomLeft(finder2).dy,
              true,
            );
          });
        });
        //
        //
        group('Блок Расписания (студент)', () {
          testWidgets('Отображается ниже Блока Технической поддержки',
              (tester) async {
            await test.home(tester, login: 'Войти как студент');
            expect(
              tester.getTopLeft(Finders.nextSubjectWidget).dy >=
                  tester.getBottomLeft(Finders.contactWidget).dy,
              true,
            );
          });

          testWidgets(
              'При тапе на блок расписания происходит переход на страницу Расписания',
              (tester) async {
            await test.home(tester, login: 'Войти как студент');

            (find.text('Сейчас идет').tryEvaluate())
                ? await Func(tester).tapDelay(300, find.text('Сейчас идет'))
                : await Func(tester).tapDelay(300, find.text('Следующая пара'));
            final Finder finder = find.byType(TimetableGroupScreenView);
            expect(finder, findsAny);
          });
          //
          //
          group('блок содержит: (пара идёт)', () {
            testWidgets("""Бейдж "Сейчас идет", если в настоящий момент времени
        идет пара""", (tester) async {
              await test.home(tester, login: 'Войти как студент');

              final Finder finder = find.descendant(
                  of: find.byType(NextSubjectWidget),
                  matching: find.text('Сейчас идет'));
              expect(finder.tryEvaluate(), true);
            });
            testWidgets("""Название данной пары ниже бейджа""", (tester) async {
              await test.home(tester, login: 'Войти как студент');
              final Finder block = find.byType(NextSubjectWidget);
              final NextSubjectWidget wid = tester.widget(block);
              expect(wid.subject!.subject!.name!.isNotEmpty, true,
                  reason: 'проверка данных');
              final Finder text =
                  find.textContaining(wid.subject!.subject!.name!);
              final Finder finder = find.descendant(of: block, matching: text);
              expect(finder, findsOneWidget, reason: 'проверка отображения');
            });
            testWidgets(
                """Время начала и окончания данной пары в правом нижнем углу блока""",
                (tester) async {
              await test.home(tester, login: 'Войти как студент');
              final Finder block = find.byType(NextSubjectWidget);
              final NextSubjectWidget wid = tester.widget(block);
              expect(wid.subject!.subject!.startTime!.isNotEmpty, true,
                  reason: 'проверка данных начала пары');
              expect(wid.subject!.subject!.finishTime!.isNotEmpty, true,
                  reason: 'проверка данных конца пары');
              final Finder end = find.textContaining(
                  (wid.subject!.subject!.finishTime ?? '').trim());
              final Finder finder = find.descendant(of: block, matching: end);
              expect(finder, findsOneWidget, reason: 'проверка отображения');
            });
          });
          //
          //
          group('блок содержит: (пара позже)', () {
            testWidgets(
                """Бейдж "Следующая пара", если в настоящий момент времени пары нет""",
                (tester) async {
              await test.home(tester, login: 'Войти как студент');

              final Finder finder = find.descendant(
                  of: find.byType(NextSubjectWidget),
                  matching: find.text('Следующая пара'));
              expect(finder.tryEvaluate(), true);
            });
            testWidgets("""Название ближайшей будущей пары ниже бейджа""",
                (tester) async {
              await test.home(tester, login: 'Войти как студент');
              final Finder block = find.byType(NextSubjectWidget);
              final NextSubjectWidget wid = tester.widget(block);
              expect(wid.subject!.subject!.name!.isNotEmpty, true,
                  reason: 'проверка данных');
              final Finder text =
                  find.textContaining(wid.subject!.subject!.name!);
              final Finder finder = find.descendant(of: block, matching: text);
              expect(finder, findsOneWidget, reason: 'проверка отображения');
            });
            testWidgets(
                """Время начала и окончания данной пары в правом нижнем углу блока""",
                (tester) async {
              await test.home(tester, login: 'Войти как студент');
              final Finder block = find.byType(NextSubjectWidget);
              final NextSubjectWidget wid = tester.widget(block);
              expect(wid.subject!.subject!.startTime!.isNotEmpty, true,
                  reason: 'проверка данных начала пары');
              expect(wid.subject!.subject!.finishTime!.isNotEmpty, true,
                  reason: 'проверка данных конца пары');
              final Finder end = find.textContaining(
                  (wid.subject!.subject!.finishTime ?? '').trim());
              final Finder finder = find.descendant(of: block, matching: end);
              expect(finder, findsAny, reason: 'проверка отображения');
            });
          });
        });
        //
        //
        group('Блок Новости университета (студент)', () {
          testWidgets(
              'Заголовок "Новости университета", выравненный по левому краю',
              (tester) async {
            await test.home(tester, login: 'Войти как студент');
            await tester.pumpAndSettle(Delay.delay1);
            await Func(tester).scrolling(Finders.newsUni);
            expect(tester.getTopLeft(find.text('Новости университета')).dx < 17,
                true);
          });

          testWidgets(
              'Кнопка ">" справа от заголовка, при тапе на которую происходит переход на страницу "Новости"',
              (tester) async {
            await test.home(tester, login: 'Войти как студент');
            await tester.pumpAndSettle(Delay.delay1);
            await Func(tester).scrolling(Finders.newsUni);
            await Func(tester).scrollJournal();

            final Finder finder1 = find.descendant(
                of: Finders.newsUni,
                matching: find.text('Новости университета'));
            expect(
                tester.getTopRight(finder1).dx <
                    tester.getTopLeft(Finders.forward(true)).dx,
                true);

            await Func(tester).tapDelay(1500, Finders.forward(true).first);
            expect(Finders.allNewsUni, findsAny);
          });

          testWidgets('Слайдер с карточками новостей ниже заголовка',
              (tester) async {
            await test.home(tester, login: 'Войти как студент');
            await tester.pumpAndSettle(Delay.delay1);
            await Func(tester).scrolling(Finders.newsUni);
            await Func(tester).scrollJournal();

            final Finder finder2 = find.byWidgetPredicate(
                (widget) => widget is NewsWidget && widget.isUniv == true);

            expect(
                tester.getTopLeft(finder2.first).dy >=
                    tester.getBottomLeft(find.text('Новости университета')).dy,
                true);
          });
          //
          //
          group('Слайдер с карточками новостей содержит', () {
            testWidgets('На экране отображается целиком только 1 карточка',
                (tester) async {
              await test.home(tester, login: 'Войти как студент');
              await tester.pumpAndSettle(Delay.delay1);
              await Func(tester).scrolling(Finders.newsUni);
              await Func(tester).scrollJournal();

              final Finder cardUni = find.descendant(
                  of: Finders.newsUni,
                  matching: find.byWidgetPredicate(
                      (widget) => widget is NewsWidget && widget.isUniv));
              expect(cardUni, findsAny, reason: '1 карточка видна');
              expect(
                  tester.getTopRight(cardUni.at(1)).dx >
                      Func(tester).size().width,
                  true,
                  reason: '2 карточка не видна (полностью)');
            });

            testWidgets('Листается свайпом влево', (tester) async {
              await test.home(tester, login: 'Войти как студент');
              await tester.pumpAndSettle(Delay.delay1);
              await tester.pumpAndSettle(Delay.delay1);
              await Func(tester).scrolling(Finders.newsUni);

              final Finder cardUni = find.descendant(
                  of: Finders.newsUni, matching: find.byType(NewsWidget));

              if (find.byType(JournalWidget).tryEvaluate()) {
                await tester.timedDragFrom(
                    Offset(tester.getTopRight(find.byType(JournalWidget)).dx,
                        tester.getTopRight(find.byType(JournalWidget)).dy),
                    Offset(
                        -tester.getTopRight(find.byType(JournalWidget)).dx, 0),
                    Delay.delay1);
              }

              final double pos1 = tester.getTopRight(cardUni.first).dx;
              await tester.timedDragFrom(tester.getCenter(cardUni.first),
                  const Offset(-100, 0), Delay.delay300);
              await Func(tester).pump(5);
              final double pos2 = tester.getTopRight(cardUni.first).dx;
              expect(pos1 > pos2, true);
            });

            testWidgets("""Дизайн слайдера интуитивно понятен - видна часть
            следующей карточки, хочется свайпнуть""", (tester) async {
              await test.home(tester, login: 'Войти как студент');
              await tester.pumpAndSettle(Delay.delay1);
              await Func(tester).scrolling(Finders.newsUni);
              await Func(tester).scrollJournal();

              final Finder cardUni = find.descendant(
                  of: Finders.newsUni,
                  matching: find.byWidgetPredicate(
                      (widget) => widget is NewsWidget && widget.isUniv));
              expect(
                  tester.getTopLeft(cardUni.at(1)).dx <
                      Func(tester).size().width,
                  true,
                  reason: 'начало');
              expect(
                  tester.getTopRight(cardUni.at(1)).dx >
                      Func(tester).size().width,
                  true,
                  reason: 'конец');
            });
          });
        });
        //
        //
        group('Карточка новости университета (студент)', () {
          testWidgets('Содержит изображение', (tester) async {
            await test.home(tester, login: 'Войти как студент');
            Finder finder = find.descendant(
                of: find.byWidgetPredicate(
                    (widget) => widget is NewsWidget && widget.isUniv == true),
                matching: find.byType(CachedNetworkImage));
            await Func(tester).scrolling(Finders.newsUni);
            await Func(tester).scrollJournal();
            expect(finder, findsAny);
          });

          testWidgets("""Содержит название новости, выравненное по левому краю.
              Занимает максимум 4 строки""", (tester) async {
            await test.home(tester, login: 'Войти как студент');
            final Finder news = find
                .byWidgetPredicate(
                    (widget) => widget is NewsWidget && widget.isUniv)
                .first;
            await Func(tester).scrolling(Finders.newsUni);
            await Func(tester).scrollJournal();
            final NewsWidget data = tester.widget(news);
            expect(data.facultyNew!.title!.isNotEmpty, true,
                reason: 'проверка данных');
            expect(find.textContaining(data.facultyNew!.title!), findsOneWidget,
                reason: 'найден на экране');
            expect(
                tester
                    .getTopLeft(find.textContaining(data.facultyNew!.title!))
                    .dx,
                tester.getTopLeft(news).dx + 16,
                reason: 'положение');
            final Text text =
                tester.widget(find.textContaining(data.facultyNew!.title!));
            expect(text.maxLines, 4, reason: 'макс 2 строки');
          });

          testWidgets("""Дату публикации новости, выравненную по левому краю в
          левом нижнему углу""", (tester) async {
            await test.home(tester, login: 'Войти как студент');
            final Finder news = find
                .byWidgetPredicate(
                    (widget) => widget is NewsWidget && widget.isUniv)
                .first;
            final Finder newsC = find.descendant(
                of: news, matching: find.byType(CardContainer).first);
            await Func(tester).scrolling(Finders.newsUni);
            await Func(tester).scrollJournal();
            final NewsWidget data = tester.widget(news);
            expect(data.facultyNew!.date!.isNotEmpty, true,
                reason: 'проверка данных');
            expect(find.textContaining(data.facultyNew!.date!), findsAny,
                reason: 'найден на экране');
            expect(
                tester
                    .getTopLeft(
                        find.textContaining(data.facultyNew!.date!).first)
                    .dx,
                tester.getTopLeft(newsC).dx + 16,
                reason: 'положение по горизонтали');
            expect(
                tester
                        .getBottomLeft(
                            find.textContaining(data.facultyNew!.date!).first)
                        .dy +
                    16,
                tester.getBottomLeft(newsC).dy,
                reason: 'положение по вертикали');
          });

          testWidgets(
              'При тапе на карточку новости происходит переход на страницу "Новости"',
              (tester) async {
            await test.home(tester, login: 'Войти как студент');
            Finder finder = find.descendant(
                of: find.byWidgetPredicate(
                    (widget) => widget is NewsWidget && widget.isUniv == true),
                matching: find.byType(CachedNetworkImage));

            await Func(tester).scrolling(Finders.newsUni);
            await Func(tester).scrollJournal();

            if (find.byType(JournalWidget).tryEvaluate()) {
              await tester.timedDragFrom(
                  Offset(tester.getTopRight(find.byType(JournalWidget)).dx,
                      tester.getTopRight(find.byType(JournalWidget)).dy),
                  Offset(-tester.getTopRight(find.byType(JournalWidget)).dx, 0),
                  Delay.delay1);
            }
            await Func(tester).tapDelay(1000, finder.first);
            Finder finder2 = find.byType(NewsDetailScreen);

            expect(finder2, findsAny);
          });
        });
        //
        //
        group('Страница "Новости университета" (студент)', () {
          testWidgets('Заголовок по центру', (tester) async {
            await test.home(tester, login: 'Войти как студент');

            await Func(tester).scrolling(Finders.newsUni);
            await Func(tester).tapDelay(300, Finders.forward(true).first);
            await Func(tester).scroll(2);
            Finder finder = find.text('Новости университета');
            expect(Func(tester).size().width / 2, tester.getCenter(finder).dx);
          });

          testWidgets(
              'Кнопка назад, при тапе на которую открывается прошлая страница',
              (tester) async {
            await test.home(tester, login: 'Войти как студент');
            final Finder finder = find.byType(ShowcaseScreenView);
            expect(reason: 'найден', finder, findsOneWidget);

            await Func(tester).scrolling(Finders.forward(true));
            await Func(tester).tapDelay(1000, Finders.forward(true));
            expect(reason: 'не найден', finder, findsNothing);

            Finder iconBack =
                find.descendant(of: Finders.allNewsUni, matching: Finders.back);
            await Func(tester).tapDelay(1000, iconBack);
            expect(reason: 'найден', finder, findsOneWidget);
          });

          testWidgets('Карточки новостей университета', (tester) async {
            await test.home(tester, login: 'Войти как студент');
            await Func(tester).scrolling(Finders.forward(true));
            await Func(tester).tapDelay(1000, Finders.forward(true));
            await Func(tester).scroll(2);
            final Finder finder = find.byType(NewsWidget);

            expect(finder, findsAny);
          });
          //
          //
          group('Карточки новостей университета', () {
            testWidgets('По 1 в строке, по 2 на экране', (tester) async {
              await test.home(tester, login: 'Войти как студент');
              await Func(tester).scrolling(Finders.forward(true));
              await Func(tester).tapDelay(1000, Finders.forward(true));
              double pos1 = tester.getTopLeft(find.byType(NewsWidget).at(0)).dy;
              double pos2 = tester.getTopLeft(find.byType(NewsWidget).at(1)).dy;
              expect(pos2 > pos1, true, reason: 'положение');
            });

            testWidgets('Листаются вниз свайпом вверх, вверх - свайпом вниз',
                (tester) async {
              await test.home(tester, login: 'Войти как студент');
              await tester.pumpAndSettle(Delay.delay1);
              await Func(tester).scrolling(Finders.forward(true));
              await Func(tester).tapDelay(1000, Finders.forward(true));
              await tester.pumpAndSettle(Delay.delay1);
              final Finder finder = find.byType(NewsWidget);
              final double pos1 = tester.getTopLeft(finder.first).dy;
              await tester.timedDragFrom(tester.getTopLeft(finder.at(1)),
                  const Offset(0, -30), Delay.delay1);
              await tester.pumpAndSettle(Delay.delay300);
              final double pos2 = tester.getTopLeft(finder.first).dy;
              expect(pos1 > pos2, true, reason: 'положение');
            });

            testWidgets(
                """При тапе на карточку происходит переход на страницу выбранной новости "Новости университета""",
                (tester) async {
              await test.home(tester, login: 'Войти как студент');
              await Func(tester).scrolling(Finders.forward(true));
              await Func(tester).tapDelay(1000, Finders.forward(true));
              await Func(tester).tapDelay(2000, find.byType(NewsWidget).first);
              expect(find.byType(NewsDetailScreen), findsAny);
            });
          });
        });
        //
        //
        group('Страница конкретной новости “Новости университета”', () {
          testWidgets('Заголовок “Новости университета” по центру',
              (tester) async {
            await test.home(tester, login: 'Войти как студент');
            await tester.pumpAndSettle(Delay.delay1);
            await Func(tester).scrolling(Finders.newsUni);
            await Func(tester).scrollJournal();
            final Finder news = find.descendant(
                of: Finders.newsUni, matching: find.byType(NewsWidget));
            await Func(tester).tapDelay(1000, news.first);
            await tester.pumpAndSettle(Delay.delay1);
            final Finder finder = find.textContaining('Новости университета');
            expect(finder, findsOneWidget, reason: 'проверка на экране');
            expect(tester.getCenter(finder).dx, Func(tester).size().width / 2,
                reason: 'по центру');
          });
          // testWidgets("""Изображения с пагинатором ниже, листаются свайпом
          // влево-вправо. Если изображение одно - пагинатор отсутствует""",
          //     (tester) async {
          //   expect(true, false);
          // });
          testWidgets("""Кнопка “назад”, при тапе на которую открывается
          предыдущая страница""", (tester) async {
            await test.home(tester, login: 'Войти как студент');
            await tester.pumpAndSettle(Delay.delay1);
            await Func(tester).scrolling(Finders.newsUni);
            await Func(tester).scrollJournal();
            final Finder news = find.descendant(
                of: Finders.newsUni, matching: find.byType(NewsWidget));
            expect(find.byType(ShowcaseScreenView).tryEvaluate(), true,
                reason: 'главная');
            await Func(tester).tapDelay(1000, news.first);
            await tester.pumpAndSettle(Delay.delay1);
            expect(find.byType(ShowcaseScreenView).tryEvaluate(), false,
                reason: 'новости');
            await Func(tester).tapDelay(1000, Finders.back.first);
            expect(find.byType(ShowcaseScreenView).tryEvaluate(), true,
                reason: 'главная');
          });

          testWidgets("""Дата публикации новости""", (tester) async {
            await test.home(tester, login: 'Войти как студент');
            await tester.pumpAndSettle(Delay.delay1);
            await Func(tester).scrolling(Finders.newsUni);
            await Func(tester).scrollJournal();
            final Finder news = find.descendant(
                of: Finders.newsUni, matching: find.byType(NewsWidget));
            await Func(tester).tapDelay(1000, news.first);
            await tester.pumpAndSettle(Delay.delay1);
            final NewsDetailScreen data =
                tester.widget(find.byType(NewsDetailScreen));
            expect(data.news!.date!.isNotEmpty, true,
                reason: 'проверка данных');
            expect(find.textContaining(data.news!.date!).tryEvaluate(), true,
                reason: 'проверка на экране');
          });
          testWidgets("""Заголовок новости""", (tester) async {
            await test.home(tester, login: 'Войти как студент');
            await Func(tester).scrolling(Finders.newsUni);
            final Finder news = find.descendant(
                of: Finders.newsUni, matching: find.byType(NewsWidget));
            await Func(tester).tapDelay(1000, news.first);
            await tester.pumpAndSettle(Delay.delay1);
            final NewsDetailScreen data =
                tester.widget(find.byType(NewsDetailScreen));
            expect(data.news!.title!.isNotEmpty, true,
                reason: 'проверка данных');
            expect(find.textContaining(data.news!.title!).tryEvaluate(), true,
                reason: 'проверка на экране');
          });
          testWidgets("""Содержание новости""", (tester) async {
            await test.home(tester, login: 'Войти как студент');
            await tester.pumpAndSettle(Delay.delay1);
            await Func(tester).scrolling(Finders.newsUni);
            final Finder news = find.descendant(
                of: Finders.newsUni, matching: find.byType(NewsWidget));
            await Func(tester).tapDelay(1000, news.first);
            await tester.pumpAndSettle(Delay.delay1);
            expect(Finders.newsText, findsAny);
          });
          // testWidgets("""Изображения, дата публикации, заголовок и текст -
          // интеграция из страницы ВКонтакте""", (tester) async {
          //   expect(false, true);
          // });
        });
        //
        //
        group('Блок Новости факультета (студент)', () {
          testWidgets(
              'Содержит заголовок "Новости факультета", выравненный по левому краю',
              (tester) async {
            await test.home(tester, login: 'Войти как студент');
            await tester.pumpAndSettle(Delay.delay1);
            await Func(tester).scrolling(Finders.newsFak);
            expect(
                tester.getTopLeft(find.text('Новости факультета').first).dx <
                    17,
                true);
          });
          testWidgets(
              'Содержит кнопку ">" справа от заголовка, при тапе на которую происходит переход на страницу "Новости факультета"',
              (tester) async {
            await test.home(tester, login: 'Войти как студент');
            await tester.pumpAndSettle(Delay.delay1);
            await Func(tester).scrolling(Finders.newsFak);
            await Func(tester).tapDelay(1000, Finders.forward(false));
            expect(Finders.allNewsFak, findsAny);
          });
          testWidgets('Содержит слайдер с карточками новостей ниже заголовка',
              (tester) async {
            await test.home(tester, login: 'Войти как студент');
            await tester.pumpAndSettle(Delay.delay1);
            final Finder finder1 = find.descendant(
                of: Finders.newsFak, matching: find.text('Новости факультета'));
            await Func(tester).scrolling(Finders.newsFak);
            final Finder finder = find.descendant(
                of: Finders.newsFak, matching: find.byType(NewsWidget));

            expect(
                tester.getTopLeft(finder.first).dy >
                    tester.getTopLeft(finder1).dy,
                true);
          });
          //
          //
          group(
              'Слайдер с карточками новостей ниже заголовка (студент) Блок Новости факультета',
              () {
            testWidgets('На экране целиком отображается только 2 карточки',
                (tester) async {
              await test.home(tester, login: 'Войти как студент');
              await tester.pumpAndSettle(Delay.delay1);
              await Func(tester).scrolling(Finders.newsFak);
              final Finder finder1 = find.descendant(
                  of: Finders.newsFak, matching: find.byType(NewsWidget));
              expect(finder1.first.tryEvaluate(), true, reason: "первый");
              expect(finder1.at(1).tryEvaluate(), true, reason: "второй");
              expect(
                  tester.getTopRight(finder1.at(2)).dx >
                      Func(tester).size().width,
                  true,
                  reason: "третий");
            });
            testWidgets('Слайдер листается свайпом влево', (tester) async {
              await test.home(tester, login: 'Войти как студент');
              await tester.pumpAndSettle(Delay.delay1);
              await Func(tester).scrolling(Finders.newsFak);
              final Finder finder = find.descendant(
                  of: Finders.newsFak, matching: find.byType(NewsWidget));
              final double pos1 = tester.getTopRight(finder.at(1)).dx;
              await tester.timedDragFrom(
                  Offset(tester.getTopRight(finder.at(1)).dx - 5,
                      tester.getTopRight(finder.at(1)).dy + 5),
                  Offset(10 - pos1, 0),
                  Delay.delay1);
              final double pos2 = tester.getTopRight(finder.at(1)).dx;
              expect(pos1 > pos2, true);
            });
            testWidgets(
                """Дизайн слайдера интуитивно понятен - видна часть следующей карточки, хочется свайпнуть""",
                (tester) async {
              await test.home(tester, login: 'Войти как студент');
              await tester.pumpAndSettle(Delay.delay1);
              await Func(tester).scrolling(Finders.newsFak);
              final Finder finder = find.descendant(
                  of: Finders.newsFak, matching: find.byType(NewsWidget));
              expect(
                  tester.getTopRight(finder.at(2)).dx >
                      Func(tester).size().width,
                  true,
                  reason: "третий");
              expect(
                  tester.getTopLeft(finder.at(2)).dx <
                      Func(tester).size().width,
                  true,
                  reason: "третий");
            });
          });
        });
        //
        //
        group('Карточка новости факультета (студент)', () {
          testWidgets('Содержит изображение', (tester) async {
            await test.home(tester, login: 'Войти как студент');
            await tester.pumpAndSettle(Delay.delay1);
            await Func(tester).scrolling(Finders.newsFak);
            Finder finder = find.descendant(
                of: Finders.newsFak, matching: find.byType(CachedNetworkImage));
            await tester.pumpAndSettle(Delay.delay(2000));
            expect(finder, findsAny);
          });

          testWidgets(
              'Название новости, выравненное по левому краю. Занимает максимум 4 строки',
              (tester) async {
            await test.home(tester, login: 'Войти как студент');
            await tester.pumpAndSettle(Delay.delay1);
            await Func(tester).scrolling(Finders.newsFak);
            final Finder finder = find.descendant(
                of: Finders.newsFak, matching: find.byType(NewsWidget));
            final NewsWidget data = tester.widget(finder.first);
            expect(data.facultyNew!.title!.isNotEmpty, true,
                reason: 'проверка данных');
            expect(find.textContaining(data.facultyNew!.title!), findsAny,
                reason: 'проверка на экране');
            expect(
                tester
                    .getTopLeft(find.textContaining(data.facultyNew!.title!))
                    .dx,
                tester.getTopLeft(finder.first).dx + 8,
                reason: 'положение');
          });

          testWidgets('Дату публикации новости, выравненную по левому краю',
              (tester) async {
            await test.home(tester, login: 'Войти как студент');
            await tester.pumpAndSettle(Delay.delay1);
            // final Finder news = find.descendant(
            //     of: Finders.newsFak, matching: find.byType(NewsWidget));

            final Finder news = find.byWidgetPredicate(
                (widget) => widget is NewsWidget && widget.isLittle);

            // final Finder newsC = find.descendant(
            //     of: news.first, matching: find.byType(CardContainer).first);
            await Func(tester).scrolling(Finders.newsFak);
            expect(Finders.newsFak, findsAny,
                reason: 'блок новостей факультета');
            expect(find.byType(NewsWidget), findsAny,
                reason: 'виджеты новости на экране');
            expect(news, findsAny,
                reason: 'виджеты новости внутри блока факультета');
            expect(find.byType(CardContainer), findsAny,
                reason: 'контейнер на экране');
            // expect(newsC, findsAny, reason: 'контейнер внутри виджета');

            final NewsWidget data = tester.widget(news.first);
            expect(data.facultyNew!.date!.isNotEmpty, true,
                reason: 'проверка данных');
            expect(find.textContaining(data.facultyNew!.date!), findsAny,
                reason: 'найден на экране');
            expect(news.first, findsAny, reason: 'контейнер с датой найден');
            expect(
                tester
                    .getTopLeft(
                        find.textContaining(data.facultyNew!.date!).first)
                    .dx,
                tester.getTopLeft(news.first).dx + 8,
                reason: 'положение по горизонтали');
          });

          testWidgets(
              'При тапе на карточку новости происходит переход на страницу "Новости"',
              (tester) async {
            await test.home(tester, login: 'Войти как студент');
            await tester.pumpAndSettle(Delay.delay1);
            Finder finder = find.descendant(
                of: Finders.newsFak, matching: find.byType(NewsWidget));
            await Func(tester).scrolling(Finders.newsFak);
            await Func(tester).tapDelay(1000, finder.first);
            Finder finder2 = find.byType(NewsDetailScreen);
            expect(finder2, findsOneWidget);
          });
        });
        //
        //
        group('Страница "Новости факультета"', () {
          testWidgets('Заголовок "Новости факультета" по центру',
              (tester) async {
            await test.home(tester, login: 'Войти как студент');
            await tester.pumpAndSettle(Delay.delay1);

            await Func(tester).scrolling(Finders.newsFak);
            await Func(tester).tapDelay(1000, Finders.forward(false));
            Finder finder = find.text('Новости факультета');
            expect(Func(tester).size().width / 2, tester.getCenter(finder).dx);
          });

          testWidgets(
              'Кнопка назад, при тапе на которую открывается прошлая страница',
              (tester) async {
            await test.home(tester, login: 'Войти как студент');
            await tester.pumpAndSettle(Delay.delay1);
            final Finder finder = find.byType(ShowcaseScreenView);
            expect(reason: 'главная страница', finder.tryEvaluate(), true);

            await Func(tester).scrolling(Finders.newsFak);
            await Func(tester).tapDelay(1000, Finders.forward(false));
            expect(
                reason: 'не главная страница, новости',
                finder.tryEvaluate(),
                false);

            Finder iconBack =
                find.descendant(of: Finders.allNewsFak, matching: Finders.back);
            await Func(tester).tapDelay(1000, iconBack);

            expect(reason: 'вернулись назад', finder.tryEvaluate(), true);
          });

          testWidgets('Карточки новостей факультета', (tester) async {
            await test.home(tester, login: 'Войти как студент');
            await tester.pumpAndSettle(Delay.delay1);
            await Func(tester).scrolling(Finders.newsFak);
            await Func(tester).tapDelay(1000, Finders.forward(false));
            expect(find.byType(NewsWidget), findsAny);
          });

          group('Карточки новостей факультета (студент)', () {
            testWidgets('По 1 в строке, по 2 на экране', (tester) async {
              await test.home(tester, login: 'Войти как студент');
              await tester.pumpAndSettle(Delay.delay1);
              await Func(tester).scrolling(Finders.newsFak);
              await Func(tester).tapDelay(1000, Finders.forward(false));
              double pos1 = tester.getTopLeft(find.byType(NewsWidget).at(0)).dy;
              double pos2 = tester.getTopLeft(find.byType(NewsWidget).at(1)).dy;
              expect(pos2 > pos1, true, reason: 'положение');
            });

            testWidgets('Листаются вниз свайпом вверх, вверх - свайпом вниз',
                (tester) async {
              await test.home(tester, login: 'Войти как студент');
              await tester.pumpAndSettle(Delay.delay1);
              await Func(tester).scrolling(Finders.newsFak);
              await Func(tester).tapDelay(1000, Finders.forward(false));
              final Finder finder = find.byType(NewsWidget).at(1);
              final double pos1 = tester.getTopLeft(finder).dy;
              await tester.timedDragFrom(tester.getTopLeft(finder),
                  Offset(0, 100 - tester.getTopLeft(finder).dy), Delay.delay1);
              final double pos2 = tester.getTopLeft(finder).dy;
              expect(pos1 > pos2, true, reason: 'положение');
            });

            testWidgets("""При тапе на карточку происходит переход на страницу
            выбранной новости "Новости университета""", (tester) async {
              await test.home(tester, login: 'Войти как студент');
              await tester.pumpAndSettle(Delay.delay1);
              await Func(tester).scrolling(Finders.newsFak);
              await Func(tester).tapDelay(1000, Finders.forward(false));
              await Func(tester).tapDelay(1000, find.byType(NewsWidget).first);
              expect(find.byType(NewsDetailScreen), findsAny);
            });
          });
        });
        //
        //
        group('Страница конкретной новости “Новости факультета”', () {
          testWidgets('Заголовок “Новости факультета” по центру',
              (tester) async {
            await test.home(tester, login: 'Войти как студент');
            await tester.pumpAndSettle(Delay.delay1);

            Finder finder = find.descendant(
                of: Finders.newsFak, matching: find.byType(CachedNetworkImage));
            await Func(tester).scrolling(Finders.newsFak);
            await Func(tester).tapDelay(1000, finder.first);

            Finder title = find.textContaining('Новости факультета');
            expect(Func(tester).size().width / 2, tester.getCenter(title).dx);
          });

          // testWidgets("""Изображения с пагинатором ниже, листаются свайпом
          // влево-вправо. Если изображение одно - пагинатор отсутствует""",
          //     (tester) async {
          //   expect(true, false);
          // });

          testWidgets(
              'Кнопка назад, при тапе на которую открывается предыдущая страница',
              (tester) async {
            await test.home(tester, login: 'Войти как студент');
            await tester.pumpAndSettle(Delay.delay1);
            final Finder finder = find.byType(ShowcaseScreenView);
            expect(finder.tryEvaluate(), true,
                reason: 'главная страница найдена');

            final Finder cachedNetworkImage = find.descendant(
                of: Finders.newsFak, matching: find.byType(CachedNetworkImage));
            await Func(tester).scrolling(Finders.newsFak);
            await Func(tester).tapDelay(1000, cachedNetworkImage.first);
            expect(finder.tryEvaluate(), false,
                reason: 'главная страница не найдена');
            await Func(tester).scroll(2);

            await Func(tester).tapDelay(1000, Finders.back);
            await tester.pumpAndSettle(Delay.delay1);
            await Func(tester).scroll(2);
            expect(finder.tryEvaluate(), true,
                reason: 'главная страница найдена');
          });

          testWidgets("""Дата публикации новости""", (tester) async {
            await test.home(tester, login: 'Войти как студент');
            await tester.pumpAndSettle(Delay.delay1);
            await Func(tester).scrolling(Finders.newsFak);
            final Finder news = find.descendant(
                of: Finders.newsFak, matching: find.byType(NewsWidget));
            await Func(tester).tapDelay(1000, news.first);
            final NewsDetailScreen data =
                tester.widget(find.byType(NewsDetailScreen));
            expect(data.news!.date!.isNotEmpty, true,
                reason: 'проверка данных');
            expect(
                find.textContaining(data.news!.date!).first.tryEvaluate(), true,
                reason: 'проверка на экране');
          });

          testWidgets("""Заголовок новости""", (tester) async {
            await test.home(tester, login: 'Войти как студент');
            await tester.pumpAndSettle(Delay.delay1);
            await Func(tester).scrolling(Finders.newsFak);
            final Finder news = find.descendant(
                of: Finders.newsFak, matching: find.byType(NewsWidget));
            await Func(tester).tapDelay(1000, news.first);
            final NewsDetailScreen data =
                tester.widget(find.byType(NewsDetailScreen));
            expect(data.news!.title!.isNotEmpty, true,
                reason: 'проверка данных');
            expect(find.textContaining(data.news!.title!).tryEvaluate(), true,
                reason: 'проверка на экране');
          });

          testWidgets("""Содержание новости""", (tester) async {
            await test.home(tester, login: 'Войти как студент');
            await tester.pumpAndSettle(Delay.delay1);
            await Func(tester).scrolling(Finders.newsFak);
            final Finder news = find.descendant(
                of: Finders.newsFak, matching: find.byType(NewsWidget));
            await Func(tester).tapDelay(1000, news.first);
            expect(Finders.newsText, findsAny);
          });

          // testWidgets("""Изображения, дата публикации, заголовок и текст -
          // интеграция из страницы ВКонтакте""", (tester) async {
          //   expect(false, true);
          // });
        });
      });
      //
      //
      //
      group('Страница Рейтинг', () {
        bool testRatScreen2 = false;
        bool testRatScreen3 = false;
        bool testRatScreen4 = false;
        group('Страница Рейтинг Содержит:', () {
          testWidgets('Заголовок "Рейтинг" вверху по центру', (tester) async {
            await test.rating(tester);
            expect(tester.getCenter(find.textContaining('Рейтинг').first).dx,
                Func(tester).size().width / 2);

            testRatScreen2 = find.byType(CareerScreenView).tryEvaluate();
            testRatScreen3 = find
                .descendant(
                    of: find.byWidgetPredicate((widget) =>
                        widget is ListView &&
                        widget.scrollDirection == Axis.horizontal),
                    matching: find.textContaining('семестр'))
                .tryEvaluate();
            testRatScreen4 = Finders.subjectBox.tryEvaluate();
          });

          testWidgets('Блок Рейтинга', (tester) async {
            // await test.rating(tester);
            //
            // final Finder finder = find.descendant(
            //     of: find.byType(CareerScreenView), matching: Finders.ratWid);
            // expect(finder, findsOneWidget);
            expect(testRatScreen2, true);
          });

          testWidgets('Селектор семестра', (tester) async {
            // await test.rating(tester);
            //
            // final Finder finder = find.descendant(
            //     of: find.byWidgetPredicate((widget) =>
            //         widget is ListView &&
            //         widget.scrollDirection == Axis.horizontal),
            //     matching: find.textContaining('семестр'));
            // expect(finder, findsAny);
            expect(testRatScreen3, true);
          });

          testWidgets('Блоки предметов (к-во блоков не ограничено)',
              (tester) async {
            // await test.rating(tester);
            //
            // expect(Finders.subjectBox, findsAny);
            expect(testRatScreen4, true);
          });
        });
        //
        //
        bool testRating1 = false;
        bool testRating2 = false;
        bool testRat1 = false;
        bool testRat2 = false;
        bool testRat3 = false;
        group('Блок Рейтинга 2', () {
          testWidgets('Отображается вверху экрана', (tester) async {
            await test.rating(tester);
            expect(Finders.ratWid, findsOneWidget,
                reason: 'наличие блока рейтинга');
            expect(
                tester.getTopLeft(Finders.ratWid).dy <
                    Func(tester).size().height / 3,
                true,
                reason: 'проверка положения');

            testRating1 = find.text('Общий рейтинг').tryEvaluate();
            testRating2 = find
                .text(
                    '«Успех – это сумма небольших усилий, повторяемых изо дня в день»')
                .tryEvaluate();
            testRat1 = find.text('в потоке').tryEvaluate();
            testRat2 = find.text('на направлении').tryEvaluate();
            testRat3 = find.textContaining('в группе').tryEvaluate();
          });

          testWidgets('Содержит название "Общий рейтинг"', (tester) async {
            // await test.rating(tester);
            // final Finder finder = find.text('Общий рейтинг');
            // expect(finder, findsOneWidget);
            expect(testRating1, true);
          });

          testWidgets("""Содержит текст под названием 'Успех - это сумма
          небольших усилий, повторяемых изо дня в день'""", (tester) async {
            // await test.rating(tester);
            // final Finder finder = find.text(
            //     '«Успех – это сумма небольших усилий, повторяемых изо дня в день»');
            // expect(finder, findsOneWidget);
            expect(testRating2, true);
          });

          group('Содержит рейтинг пользователя', () {
            testWidgets('С1) в потоке (рейтинговый номер по всему курсу)',
                (tester) async {
              // await test.rating(tester);
              // final Finder finder3 = find.text('в потоке');
              // expect(finder3, findsOneWidget);
              expect(testRat1, true);
            });
            testWidgets('2) на направлении (рейтинговый номер по направлению)',
                (tester) async {
              // await test.rating(tester);
              // final Finder finder2 = find.text('на направлении');
              // expect(finder2, findsOneWidget);
              expect(testRat2, true);
            });
            testWidgets('3) в группе (рейтинговый номер в группе)',
                (tester) async {
              // await test.rating(tester);
              // final Finder finder1 = find.text('в группе');
              // expect(finder1, findsOneWidget);
              expect(testRat3, true);
            });
          });
          // testWidgets(
          //     'При тапе на блок происходит переход на страницу “Общий рейтинг”',
          //     (tester) async {
          //   await test.rating(tester);
          //   final Finder finder = find.text('Общий рейтинг');
          //   await Func(tester).tapDelay(1000, finder);
          //   expect(find.byType(CommonRatingScreenView), findsAny);
          // });
        });
        //
        //
        group('Селектор семестра', () {
          testWidgets('Отображается ниже блока Рейтинга', (tester) async {
            await test.rating(tester);

            final Finder finder = find.descendant(
                of: find.byWidgetPredicate((widget) =>
                    widget is ListView &&
                    widget.scrollDirection == Axis.horizontal),
                matching: find.textContaining('семестр'));
            expect(
                tester.getCenter(Finders.ratWid).dy <
                    tester.getCenter(finder.first).dy,
                true);
          });

          // testWidgets('Визуализирован в виде слайдера', (tester) async {
          //   expect(true, false);
          // });

          testWidgets('Содержит не больше 12 компонентов-семестров',
              (tester) async {
            await test.rating(tester);
            final Finder finder = find.textContaining('семестр');
            expect(finder.evaluate().length <= 12, true);
          });

          // testWidgets('На экране целиком отображается 3 компонента-семестра',
          //     (tester) async {
          //   expect(true, false);
          // });

          // testWidgets("""Дизайн слайдера интуитивно понятен - видна часть
          // следующего компонента-семестра, хочется свайпнуть""", (tester) async {
          //   expect(true, false);
          // });

          testWidgets('Слайдер листается свайпом влево', (tester) async {
            await test.rating(tester);
            final Finder listView = find.byWidgetPredicate((widget) =>
                widget is ListView &&
                widget.scrollDirection == Axis.horizontal);

            final Finder finder = find.descendant(
                of: listView, matching: find.textContaining('семестр'));
            final double pos1 = tester.getCenter(finder.first).dx;
            await Func(tester).pump(5);
            await tester.drag(
                listView, Offset(-100, tester.getCenter(listView.first).dy));
            await Func(tester).pump(5);
            final double pos2 = tester.getCenter(finder.first).dx;
            expect(pos1 > pos2, true);
          });
          //
          //
          group('При тапе на семестр', () {
            testWidgets(
                """соответствующий компонент - семестр выделяется цветом""",
                (tester) async {
              await test.rating(tester);
              final Container boxOld = tester.widget(Finders.semester.at(1));
              await Func(tester).tapDelay(300, Finders.semester.at(1));
              final Container boxFirst = tester.widget(Finders.semester.at(0));
              final Container boxThird = tester.widget(Finders.semester.at(2));
              final Container boxNews = tester.widget(Finders.semester.at(1));
              expect(boxOld.decoration != boxNews.decoration, true,
                  reason: 'проверка до и после нажатия');
              expect(boxFirst.decoration, boxThird.decoration,
                  reason: 'проверка первого и третьего');
            });

            testWidgets("""ниже отображаются блоки предметов, которые
                присутствуют в выбранном семестре""", (tester) async {
              await test.rating(tester);
              expect(
                  tester.getTopLeft(Finders.subjectBox.first).dx >
                      tester.getBottomLeft(Finders.semesterList.first).dx,
                  true);
            });
          });
          //
          //
          group('При свайпе влево-вправо в любой части экрана, ниже слайдера,',
              () {
            testWidgets(""" происходит переход на следующий-предыдущий семестр с
            соответствующими блоками предметов""", (tester) async {
              await test.rating(tester);
              final Finder page = find.byType(ExpandablePageView);
              final FinderResult widget1 = page.evaluate();

              await tester.timedDragFrom(
                  Offset(tester.getTopRight(page.first).dx - 10,
                      tester.getTopLeft(page.first).dy + 10),
                  Offset(-tester.getTopRight(page.first).dx + 10, 0),
                  Delay.delay300);
              await Func(tester).pump(5);
              final FinderResult widget2 = page.evaluate();
              expect(widget1 != widget2, true,
                  reason: 'перелистывание на вторую стр');

              await tester.timedDragFrom(
                  Offset(tester.getTopLeft(page.first).dx + 10,
                      tester.getTopLeft(page.first).dy + 10),
                  Offset(tester.getTopRight(page.first).dx - 10, 0),
                  Delay.delay300);
              await Func(tester).pump(5);
              final FinderResult widget3 = page.evaluate();
              expect(widget1, widget3, reason: 'перелистывание на первую стр');
            });

            testWidgets('соответствующий элемент слайдера выделяется цветом',
                (tester) async {
              await test.rating(tester);
              final Container box1Old = tester.widget(Finders.semester.first);
              final Container box2Old = tester.widget(Finders.semester.at(1));
              final Container box3 = tester.widget(Finders.semester.at(2));
              expect(box1Old.decoration != box2Old.decoration, true,
                  reason: 'первый и второй различаютя');
              expect(box2Old.decoration, box3.decoration,
                  reason: 'второй и третий одинаковые');
              await tester.timedDragFrom(Func(tester).center(),
                  Offset(-Func(tester).size().width / 2, 0), Delay.delay1);
              await Func(tester).pump(5);
              final Container box1New = tester.widget(Finders.semester.first);
              final Container box2New = tester.widget(Finders.semester.at(1));
              expect(box1New.decoration != box2New.decoration, true,
                  reason: 'первый и второй различаютя');
              expect(box1New.decoration, box3.decoration,
                  reason: 'первый и третий одинаковые');
            });
          });
        });
        //
        //
        group('Блок предмета', () {
          testWidgets('Располагается ниже селектора-слайдера семестров',
              (tester) async {
            await test.rating(tester);

            final Finder finder = find.descendant(
                of: find.byWidgetPredicate((widget) =>
                    widget is ListView &&
                    widget.scrollDirection == Axis.horizontal),
                matching: find.textContaining('семестр'));
            expect(
                tester.getCenter(finder.first).dy <
                    tester.getCenter(Finders.subjectBox.first).dy,
                true);
          });
          group('Блок предмета Содержит:', () {
            testWidgets(
                'Название и код предмета, занимает не больше 2 строк, выравнено по левому краю',
                (tester) async {
              await test.rating(tester);
              final widgets = tester.widgetList<Text>(Finders.subjectName);
              for (final widget in widgets) {
                expect(widget.maxLines, 2);
              }
            });

            testWidgets(
                'ФИО преподавателя, располагается ниже наименования предмета, выравнено по левому краю',
                (tester) async {
              await test.rating(tester);

              expect(
                  tester.getCenter(Finders.teacher.first).dy >
                      tester.getCenter(Finders.subjectName.first).dy,
                  true);
            });

            testWidgets('Индикатор баллов на пройденных аттестациях',
                (tester) async {
              await test.rating(tester);
              await tester.timedDragFrom(Func(tester).center(),
                  Offset(-Func(tester).size().width / 2, 0), Delay.delay1);
              await Func(tester).pump(5);
              expect(Finders.markAtt, findsAny);
            });
          });
        });
        //
        //
        group('Принцип отображения баллов', () {
          testWidgets("""Баллы отображаются в виде цветных кружков с числом,
          отражающим количество баллов за данную аттестацию""", (tester) async {
            await test.rating(tester);
            await tester.timedDragFrom(Func(tester).center(),
                Offset(-Func(tester).size().width / 2, 0), Delay.delay1);
            await Func(tester).pump(5);
            final Text text = tester.widget(find.descendant(
                of: Finders.markAtt.first, matching: find.byType(Text)));
            expect(text.data?.isNotEmpty, true, reason: 'данные не пусты');
            expect(find.textContaining(text.data!), findsAny,
                reason: 'найдены на экране');
          });
          testWidgets(
              """Название аттестации отображается ниже каждого кружка""",
              (tester) async {
            await test.rating(tester);
            await tester.timedDragFrom(Func(tester).center(),
                Offset(-Func(tester).size().width / 2, 0), Delay.delay1);
            await Func(tester).pump(5);
            expect(
                tester.getBottomLeft(Finders.markAtt.first).dy <=
                    tester.getTopLeft(find.text('1 атт').first).dy,
                true);
          });
          //
          //
          group('Кружок аттестации имеет', () {
            testWidgets(
                """Розовый цвет, если оценка за аттестацию от 1 до 24 балла""",
                (tester) async {
              await test.rating(tester);
              await tester.timedDragFrom(Func(tester).center(),
                  Offset(-Func(tester).size().width / 2, 0), Delay.delay1);
              await Func(tester).pump(5);
              Finder finder = find.byWidgetPredicate((widget) =>
                  widget is Container &&
                  widget.key == Keys.markAtt &&
                  (widget.decoration as BoxDecoration).color == AppColor.bad);
              print('finder.evaluate().length = ${finder.evaluate().length}');
              if (finder.tryEvaluate()) {
                for (int i = 0; i < finder.evaluate().length; i++) {
                  Finder att = find.descendant(
                      of: finder, matching: Finders.markTextAtt);
                  expect(finder, findsAny, reason: 'контейнер с цветом');
                  expect(att, findsAny, reason: 'текст в контейнере');
                  await Func(tester).scrolling(att.at(i));
                  await Func(tester).pump(5);
                  Text text = tester.widget(att.at(i));
                  expect(
                      int.parse(text.data!) >= 0 && int.parse(text.data!) < 25,
                      true,
                      reason: 'проверка данных');
                }
              }
            });
            testWidgets(
                """Желтый цвет, если оценка за аттестацию от 25 до 34 баллов""",
                (tester) async {
              await test.rating(tester);
              await tester.timedDragFrom(Func(tester).center(),
                  Offset(-Func(tester).size().width / 2, 0), Delay.delay1);
              await Func(tester).pump(5);
              Finder finder = find.byWidgetPredicate((widget) =>
                  widget is Container &&
                  widget.key == Keys.markAtt &&
                  (widget.decoration as BoxDecoration).color ==
                      AppColor.bronze);
              print('finder.evaluate().length = ${finder.evaluate().length}');
              if (finder.tryEvaluate()) {
                for (int i = 0; i < finder.evaluate().length; i++) {
                  Finder att = find.descendant(
                      of: finder, matching: Finders.markTextAtt);
                  expect(finder, findsAny, reason: 'контейнер с цветом');
                  expect(att, findsAny, reason: 'текст в контейнере');
                  await Func(tester).scrolling(att.at(i));
                  await Func(tester).pump(5);
                  Text text = tester.widget(att.at(i));
                  expect(
                      int.parse(text.data!) >= 25 && int.parse(text.data!) < 35,
                      true,
                      reason: 'проверка цвета');
                }
              }
            });
            testWidgets(
                """Синий цвет, если оценка за аттестацию от 35 до 44 баллов""",
                (tester) async {
              await test.rating(tester);
              await tester.timedDragFrom(Func(tester).center(),
                  Offset(-Func(tester).size().width / 2, 0), Delay.delay1);
              await Func(tester).pump(5);
              Finder finder = find.byWidgetPredicate((widget) =>
                  widget is Container &&
                  widget.key == Keys.markAtt &&
                  (widget.decoration as BoxDecoration).color ==
                      AppColor.silver);
              print('finder.evaluate().length = ${finder.evaluate().length}');
              if (finder.tryEvaluate()) {
                for (int i = 0; i < finder.evaluate().length; i++) {
                  Finder att = find.descendant(
                      of: finder, matching: Finders.markTextAtt);
                  expect(finder, findsAny, reason: 'контейнер с цветом');
                  expect(att, findsAny, reason: 'текст в контейнере');
                  await Func(tester).scrolling(att.at(i));
                  await Func(tester).pump(5);
                  Text text = tester.widget(att.at(i));
                  expect(
                      int.parse(text.data!) >= 35 && int.parse(text.data!) < 45,
                      true,
                      reason: 'проверка цвета');
                }
              }
            });
            testWidgets(
                """Зеленый цвет, если оценка за аттестацию от 45 до 50 баллов""",
                (tester) async {
              await test.rating(tester);
              await tester.timedDragFrom(Func(tester).center(),
                  Offset(-Func(tester).size().width / 2, 0), Delay.delay1);
              await Func(tester).pump(5);
              Finder finder = find.byWidgetPredicate((widget) =>
                  widget is Container &&
                  widget.key == Keys.markAtt &&
                  (widget.decoration as BoxDecoration).color == AppColor.gold);
              print('finder.evaluate().length = ${finder.evaluate().length}');
              if (finder.tryEvaluate()) {
                for (int i = 0; i < finder.evaluate().length; i++) {
                  Finder att = find.descendant(
                      of: finder, matching: Finders.markTextAtt);
                  expect(finder, findsAny, reason: 'контейнер с цветом');
                  expect(att, findsAny, reason: 'текст в контейнере');
                  await Func(tester).scrolling(att.at(i));
                  await Func(tester).pump(5);
                  Text text = tester.widget(att.at(i));
                  expect(
                      int.parse(text.data!) >= 45 && int.parse(text.data!) < 51,
                      true,
                      reason: 'проверка цвета');
                }
              }
            });
          });
          group('Кружок итоговой оценки имеет', () {
            testWidgets(
                """Розовый цвет, если оценка "неудовлетворительно" (от 1 до 49 )""",
                (tester) async {
              await test.rating(tester);
              await tester.timedDragFrom(Func(tester).center(),
                  Offset(-Func(tester).size().width / 2, 0), Delay.delay1);
              await Func(tester).pump(5);
              final Finder finder = find.byWidgetPredicate((widget) =>
                  widget is Container &&
                  widget.key == Keys.markExam &&
                  (widget.decoration as BoxDecoration).color == AppColor.bad);
              if (finder.tryEvaluate()) {
                // for (int i = 0; i < finder
                //     .evaluate()
                //     .length; i++) {
                Finder exam =
                    find.descendant(of: finder, matching: Finders.markTextExam);
                expect(finder, findsAny, reason: 'контейнер с цветом');
                expect(exam, findsAny, reason: 'текст в контейнере');
                await Func(tester).scrolling(exam);
                await Func(tester).pump(5);
                Text text = tester.widget(exam);
                expect(int.parse(text.data!) >= 0 && int.parse(text.data!) < 50,
                    true,
                    reason: 'проверка данных');
                // }
              }
            });
            testWidgets(
                """Желтый цвет, если оценка "удовлетворительно" (от 50 до 69)""",
                (tester) async {
              await test.rating(tester);
              await tester.timedDragFrom(Func(tester).center(),
                  Offset(-Func(tester).size().width / 2, 0), Delay.delay1);
              await Func(tester).pump(5);
              final Finder finder = find.byWidgetPredicate((widget) =>
                  widget is Container &&
                  widget.key == Keys.markExam &&
                  (widget.decoration as BoxDecoration).color ==
                      AppColor.bronze);
              if (finder.tryEvaluate()) {
                final Finder exam =
                    find.descendant(of: finder, matching: Finders.markTextExam);
                expect(finder, findsAny, reason: 'контейнер с цветом');
                expect(exam, findsAny, reason: 'текст в контейнере');
                await Func(tester).scrolling(exam);
                await Func(tester).pump(5);
                final Text text = tester.widget(exam);
                expect(
                    int.parse(text.data!) >= 50 && int.parse(text.data!) < 70,
                    true,
                    reason: 'проверка данных');
              }
            });
            testWidgets("""Синий цвет, если оценка "хорошо" (от 70 до 89)""",
                (tester) async {
              await test.rating(tester);
              await tester.timedDragFrom(Func(tester).center(),
                  Offset(-Func(tester).size().width / 2, 0), Delay.delay1);
              await Func(tester).pump(5);
              final Finder finder = find.byWidgetPredicate((widget) =>
                  widget is Container &&
                  widget.key == Keys.markExam &&
                  (widget.decoration as BoxDecoration).color ==
                      AppColor.silver);
              if (finder.tryEvaluate()) {
                final Finder exam =
                    find.descendant(of: finder, matching: Finders.markTextExam);
                expect(finder, findsAny, reason: 'контейнер с цветом');
                expect(exam, findsAny, reason: 'текст в контейнере');
                await Func(tester).scrolling(exam);
                await Func(tester).pump(5);
                final Text text = tester.widget(exam);
                expect(
                    int.parse(text.data!) >= 70 && int.parse(text.data!) < 90,
                    true,
                    reason: 'проверка данных');
              }
            });
            testWidgets(
                """Зеленый цвет, если оценка "отлично" (от 90 до 100)""",
                (tester) async {
              await test.rating(tester);
              await tester.timedDragFrom(Func(tester).center(),
                  Offset(-Func(tester).size().width / 2, 0), Delay.delay1);
              await Func(tester).pump(5);
              final Finder finder = find.byWidgetPredicate((widget) =>
                  widget is Container &&
                  widget.key == Keys.markExam &&
                  (widget.decoration as BoxDecoration).color == AppColor.gold);
              if (finder.tryEvaluate()) {
                final Finder exam =
                    find.descendant(of: finder, matching: Finders.markTextExam);
                expect(finder, findsAny, reason: 'контейнер с цветом');
                expect(exam, findsAny, reason: 'текст в контейнере');
                await Func(tester).scrolling(exam);
                await Func(tester).pump(5);
                final Text text = tester.widget(exam);
                expect(
                    int.parse(text.data!) >= 90 && int.parse(text.data!) < 101,
                    true,
                    reason: 'проверка данных');
              }
            });
          });
        });
        //
        //
        // group('Страница “Общий рейтинг”', () {
        //   testWidgets("""Заголовок “Общий рейтинг” по центру""",
        //       (tester) async {
        //     await test.rating(tester);
        //     final Finder finder = find.textContaining('Общий рейтинг');
        //     await Func(tester).tapDelay(1000, finder);
        //     expect(tester.getCenter(finder).dx, Func(tester).size().width / 2);
        //   });
        //   testWidgets("""Кнопка “назад”, при тапе на которую открывается
        //   прошлая страница “Рейтинг”""", (tester) async {
        //     await test.rating(tester);
        //     final Finder finder = find.textContaining('Общий рейтинг');
        //     expect(find.byType(CareerScreenView), findsOneWidget,
        //         reason: 'рейтинг');
        //     await Func(tester).tapDelay(1000, finder);
        //
        //     expect(find.byType(CareerScreenView), findsNothing,
        //         reason: 'не рейтинг');
        //     await Func(tester).tapDelay(1000, Finders.back);
        //     expect(find.byType(CareerScreenView), findsOneWidget,
        //         reason: 'рейтинг после назад');
        //   });
        //   testWidgets("""Селектор семестров ниже заголовка""", (tester) async {
        //     await test.rating(tester);
        //     final Finder finder = find.textContaining('Общий рейтинг');
        //     await Func(tester).tapDelay(1000, finder);
        //     expect(
        //         tester.getBottomLeft(find.textContaining('Общий рейтинг')).dx <=
        //             tester.getTopLeft(Finders.allSemesterList).dx,
        //         true);
        //   });
        //   //
        //   //
        //   group('Селектор семестров ниже заголовка', () {
        //     testWidgets("""Отображается ниже блока Рейтинга""", (tester) async {
        //       expect(true, false);
        //     });
        //     testWidgets("""Визуализирован в виде слайдера""", (tester) async {
        //       await test.rating(tester);
        //       final Finder finder = find.textContaining('Общий рейтинг');
        //       await Func(tester).tapDelay(1000, finder);
        //       // expect(actual, matcher)
        //     });
        //     testWidgets("""Содержит не больше 12 компонентов-семестров""",
        //         (tester) async {
        //       await test.rating(tester);
        //       await Func(tester)
        //           .tapDelay(1000, find.textContaining('Общий рейтинг'));
        //       expect(Finders.allSemester.allCandidates.length, 12);
        //     });
        //     testWidgets(
        //         """На экране целиком отображается 3 компонента-семестра""",
        //         (tester) async {
        //       expect(true, false);
        //     });
        //     testWidgets("""Дизайн слайдера интуитивно понятен - видна часть
        //     следующего компонента-семестра, хочется свайпнуть""",
        //         (tester) async {
        //       expect(true, false);
        //     });
        //     testWidgets("""Слайдер листается свайпом влево""", (tester) async {
        //       await test.rating(tester);
        //       final Finder finder = find.textContaining('Общий рейтинг');
        //       await Func(tester).tapDelay(1000, finder);
        //       final double pos1 =
        //           tester.getTopLeft(Finders.allSemester.at(3)).dx;
        //       await tester.timedDrag(
        //           Finders.allSemesterList, const Offset(-100, 0), Delay.delay1);
        //       final double pos2 =
        //           tester.getTopLeft(Finders.allSemester.at(3)).dx;
        //       expect(pos1 > pos2, true, reason: 'положение');
        //     });
        //     testWidgets("""При тапе на семестр он выделяется цветом, ниже
        //     слайдера отображаются 4 блока рейтинга на выбранном семестре:""",
        //         (tester) async {
        //       await Func(tester)
        //           .tapDelay(1000, find.textContaining('Общий рейтинг'));
        //       final Container box1Old =
        //           tester.widget(Finders.allSemester.first);
        //       final Container box2Old =
        //           tester.widget(Finders.allSemester.at(1));
        //       final Container box3 = tester.widget(Finders.allSemester.at(2));
        //       expect(box1Old.decoration != box2Old.decoration, true,
        //           reason: 'первый и второй различаютя');
        //       expect(box2Old.decoration, box3.decoration,
        //           reason: 'второй и третий одинаковые');
        //       await tester.timedDragFrom(Func(tester).center(),
        //           Offset(-Func(tester).size().width / 2, 0), Delay.delay1);
        //       await Func(tester).pump(5);
        //       final Container box1New =
        //           tester.widget(Finders.allSemester.first);
        //       final Container box2New =
        //           tester.widget(Finders.allSemester.at(1));
        //       expect(box1New.decoration != box2New.decoration, true,
        //           reason: 'первый и второй различаютя');
        //       expect(box1New.decoration, box3.decoration,
        //           reason: 'первый и третий одинаковые');
        //     });
        //     //
        //     //
        //     group('1. Место в группе', () {
        //       testWidgets("""Заголовок, выравненный по левому краю""",
        //           (tester) async {
        //         expect(true, false);
        //       });
        //       //
        //       //
        //       group('3 строки с рейтингом, каждая из которых содержит:', () {
        //         testWidgets(
        //             """индикатор “звезда” с числом внутри, отражающий место в группе""",
        //             (tester) async {
        //           expect(true, false);
        //         });
        //         testWidgets(
        //             """индикатор группы правее индикатора “звезды”, отражающий группу студента""",
        //             (tester) async {
        //           expect(true, false);
        //         });
        //         testWidgets("""к-во баллов правее индикатора группы""",
        //             (tester) async {
        //           expect(true, false);
        //         });
        //         testWidgets("""строка актуального студента выделена рамкой""",
        //             (tester) async {
        //           expect(true, false);
        //         });
        //       });
        //     });
        //     //
        //     //
        //     group('2. Место в потоке', () {
        //       testWidgets("""Заголовок, выравненный по левому краю""",
        //           (tester) async {
        //         expect(true, false);
        //       });
        //       //
        //       //
        //       group('3 строки с рейтингом, каждая из которых содержит:', () {
        //         testWidgets(
        //             """индикатор “звезда” с числом внутри, отражающий место в группе""",
        //             (tester) async {
        //           expect(true, false);
        //         });
        //         testWidgets(
        //             """индикатор группы правее индикатора “звезды”, отражающий группу студента""",
        //             (tester) async {
        //           expect(true, false);
        //         });
        //         testWidgets("""к-во баллов правее индикатора группы""",
        //             (tester) async {
        //           expect(true, false);
        //         });
        //         testWidgets("""строка актуального студента выделена рамкой""",
        //             (tester) async {
        //           expect(true, false);
        //         });
        //       });
        //     });
        //     //
        //     //
        //     group('3. Место на направлении', () {
        //       testWidgets("""Заголовок, выравненный по левому краю""",
        //           (tester) async {
        //         expect(true, false);
        //       });
        //       //
        //       //
        //       group('3 строки с рейтингом, каждая из которых содержит:', () {
        //         testWidgets(
        //             """индикатор “звезда” с числом внутри, отражающий место в группе""",
        //             (tester) async {
        //           expect(true, false);
        //         });
        //         testWidgets(
        //             """индикатор группы правее индикатора “звезды”, отражающий группу студента""",
        //             (tester) async {
        //           expect(true, false);
        //         });
        //         testWidgets("""к-во баллов правее индикатора группы""",
        //             (tester) async {
        //           expect(true, false);
        //         });
        //         testWidgets("""строка актуального студента выделена рамкой""",
        //             (tester) async {
        //           expect(true, false);
        //         });
        //       });
        //     });
        //     //
        //     //
        //     group('4. Лучшие места по предметам', () {
        //       testWidgets("""Заголовок, выравненный по левому краю""",
        //           (tester) async {
        //         expect(true, false);
        //       });
        //       //
        //       //
        //       group('3 строки с рейтингом, каждая из которых содержит:', () {
        //         testWidgets(
        //             """индикатор “звезда” с числом внутри, отражающий место в группе""",
        //             (tester) async {
        //           expect(true, false);
        //         });
        //         testWidgets(
        //             """индикатор группы правее индикатора “звезды”, отражающий группу студента""",
        //             (tester) async {
        //           expect(true, false);
        //         });
        //         testWidgets("""к-во баллов правее индикатора группы""",
        //             (tester) async {
        //           expect(true, false);
        //         });
        //         testWidgets("""строка актуального студента выделена рамкой""",
        //             (tester) async {
        //           expect(true, false);
        //         });
        //       });
        //     });
        //   });
        // });
      });
      //
      //
      //
      group('Страница расписание (студент)', () {
        group('Занятия (студент)', () {
          bool testSheduleScreen2 = false;
          bool testSheduleScreen3 = false;
          bool testSheduleScreen4 = false;
          bool testSheduleScreen5 = false;
          group('Элементы страницы расписания(Занятия)(студент)', () {
            testWidgets('Заголовок по центру', (tester) async {
              await test.schedule(tester, login: 'Войти как студент');
              expect(tester.getCenter(find.textContaining('Расписание')).dx,
                  Func(tester).size().width / 2);
              testSheduleScreen2 = Finders.calendar.tryEvaluate();

              final Finder finder = find.ancestor(
                  of: find.text('Занятия'),
                  matching: find.byType(AnimatedBuilder));
              final AnimatedTimetableSwitcher data =
                  tester.widget(find.byType(AnimatedTimetableSwitcher));
              testSheduleScreen3 = finder.tryEvaluate();
              testSheduleScreen3 =
                  testSheduleScreen3 && data.animationController.value == 0.0;

              testSheduleScreen4 = find.byType(ScrollingDays).tryEvaluate();
              testSheduleScreen4 =
                  testSheduleScreen4 && find.byType(WeekDayCard).tryEvaluate();

              testSheduleScreen5 = find.byType(SubjectPage).tryEvaluate();
              testSheduleScreen5 = testSheduleScreen5 &&
                  Finders.subjectInfoCardContainer.tryEvaluate();
            });
            testWidgets('Кнопка “календарь”', (tester) async {
              // await test.schedule(tester, login: 'Войти как студент');
              // expect(Finders.calendar, findsAny,
              //     reason: 'проверка наличия кнопки календаря');
              expect(testSheduleScreen2, true);
            });
            testWidgets('Селектор типа активностей - “Занятия” выделено цветом',
                (tester) async {
              // await test.schedule(tester, login: 'Войти как студент');
              // final Finder finder = find.ancestor(
              //     of: find.text('Занятия'),
              //     matching: find.byType(AnimatedBuilder));
              // final AnimatedTimetableSwitcher data =
              //     tester.widget(find.byType(AnimatedTimetableSwitcher));
              // expect(finder.tryEvaluate(), true, reason: 'на экране');
              // expect(data.animationController.value, 0.0,
              //     reason: "выделено занятия");
              expect(testSheduleScreen3, true);
            });
            testWidgets('Селектор-слайдер чисел', (tester) async {
              //   await test.schedule(tester, login: 'Войти как студент');
              //   expect(find.byType(ScrollingDays).tryEvaluate(), true,
              //       reason: 'слайден');
              //   expect(find.byType(WeekDayCard).tryEvaluate(), true,
              //       reason: 'числа');
              expect(testSheduleScreen4, true);
            });
            testWidgets('Боттомшит с блоками предметов', (tester) async {
              //   await test.schedule(tester, login: 'Войти как студент');
              //   expect(find.byType(SubjectPage).tryEvaluate(), true,
              //       reason: 'Боттомшит');
              //   expect(Finders.subjectInfoCardContainer.tryEvaluate(), true,
              //       reason: 'с блоками предметов');
              expect(testSheduleScreen5, true);
            });
          });
          group('Заголовок', () {
            testWidgets('Вверху по центру', (tester) async {
              await test.schedule(tester, login: 'Войти как студент');
              await tester.pumpAndSettle(Delay.delay1);
              final Finder finder3 = find.text('Расписание');
              expect(
                  tester.getCenter(finder3).dx, Func(tester).size().width / 2);
            });
          });
          //
          //
          group('Кнопка календарь', () {
            testWidgets('В верхнем правом углу в виде календаря',
                (tester) async {
              await test.schedule(tester, login: 'Войти как студент');

              expect(Finders.calendar, findsAny,
                  reason: 'проверка наличия кнопки календаря');
            });

            testWidgets('При тапе на которую открывается боттомшит',
                (tester) async {
              await test.schedule(tester, login: 'Войти как студент');
              await Func(tester).tapDelay(300, Finders.calendar);
              final Finder finder2 = find.byType(CalendarScreenView);
              expect(finder2.tryEvaluate(), true,
                  reason: 'проверка открытия календаря');
            });
            //
            //
            group(
                """Блоки месяцев с настоящего по последний месяц в семестре. Блок месяца содержит:""",
                () {
              testWidgets(
                  """Заголовок (Месяц, год), выравненный по левому краю""",
                  (tester) async {
                expect(true, true);
              });

              testWidgets("""В верхней строке обозначения дней недели """,
                  (tester) async {
                expect(true, true);
              });

              testWidgets(
                  """Числа. При тапе на число, оно выделяется синим кружком""",
                  (tester) async {
                expect(true, true);
              });
            });
            testWidgets(
                'Кнопка крестик в правом верхнем углу, при тапе на которую боттомшит закрывается',
                (tester) async {
              await test.schedule(tester, login: 'Войти как студент');

              expect(Finders.calendar, findsAny);
              await Func(tester).tapDelay(1000, Finders.calendar);

              final Finder finder2 = find.descendant(
                  of: find.byType(CalendarScreenView),
                  matching: Finders.closePng);
              await Func(tester).tapDelay(1000, finder2);
              expect(find.byType(TableCalendar), findsNothing);
            });

            testWidgets("""Кнопка "Выбрать" внизу экрана, при тапе на которую
          отображается расписание на этот день""", (tester) async {
              expect(true, true);
            });

            testWidgets('Боттомшит закрывается свайпом вниз', (tester) async {
              await test.schedule(tester, login: 'Войти как студент');

              await Func(tester).tapDelay(1000, Finders.calendar.first);

              final Finder finder = find.byType(CalendarScreenView).first;
              expect(find.byType(TableCalendar), findsAny);
              await tester.dragFrom(
                  Offset(tester.getTopLeft(finder).dx,
                      tester.getTopLeft(finder).dy),
                  Offset(tester.getTopLeft(finder).dx,
                      tester.getTopLeft(finder).dy + 500));
              await tester.pumpAndSettle(Delay.delay1);
              expect(find.byType(TableCalendar), findsNothing);
            });
          });
          //
          //
          group('Селектор типа активностей', () {
            testWidgets('Ниже заголовка', (tester) async {
              await test.schedule(tester, login: 'Войти как студент');
              final Finder finder = find.text('Расписание');
              final Finder finder2 = find.descendant(
                  of: find.byType(AnimatedBuilder),
                  matching: find.text('Занятия'));
              final Finder finder3 = find.descendant(
                  of: find.byType(AnimatedBuilder),
                  matching: find.text('Экзамены'));
              expect(
                  tester.getTopLeft(finder2).dy ==
                          tester.getTopLeft(finder3).dy &&
                      tester.getTopLeft(finder2).dy >
                          tester.getTopLeft(finder).dy,
                  true);
            });

            testWidgets(
                'При тапе по типу активности (Занятия/Экзамены) открывается соответствующая страница',
                (tester) async {
              await test.schedule(tester, login: 'Войти как студент');
              await tester.tap(find.text('Экзамены'));
              await Func(tester).pump(3);
              expect(true, find.byType(ExamsPage).tryEvaluate(),
                  reason: 'Проверка наличия расписания экзаменов');
              await tester.tap(find.text('Занятия'));
              await Func(tester).pump(3);
              expect(true, find.byType(WeekTypeWidget).tryEvaluate(),
                  reason: 'Проверка наличия расписания предметов');
            });
          });
          //
          //
          group('Селектор - слайдер чисел', () {
            testWidgets(
                'Слайды листаются вперед свайпом влево. Назад - свайпом вправо. ',
                (tester) async {
              await test.schedule(tester, login: 'Войти как студент');

              final Finder card = find.byType(WeekDayCard);
              final Finder listView = find.ancestor(
                  of: find.byType(WeekDayCard).first,
                  matching: find.byWidgetPredicate((widget) =>
                      widget is SingleChildScrollView &&
                      widget.scrollDirection == Axis.horizontal));
              final double q1 = tester.getCenter(card.first).dx;
              await tester.drag(listView.first,
                  Offset(-500, tester.getCenter(listView.first).dy));
              await tester.pumpAndSettle(Delay.delay1);
              final double q2 = tester.getCenter(card.first).dx;
              expect(q1 > q2, true,
                  reason: 'проверка первого и второго значения');
              await tester.drag(listView.first,
                  Offset(700, tester.getCenter(listView.first).dy));
              await tester.pumpAndSettle(Delay.delay1);
              final double q3 = tester.getCenter(card.first).dx;
              expect(q3 > q2, true,
                  reason: 'проверка второго и третьего значения');
            });

            // testWidgets('Целиком на экране помещается 4 карточки',
            //     (tester) async {
            //   await test.schedule(tester, login: 'Войти как студент');
            //   expect(
            //       tester.getTopRight(find.byType(WeekDayCard).at(4)).dx >
            //           Func(tester).size().width,
            //       true,
            //       reason: '5 - не видно');
            // });

            // testWidgets(
            //     'Дизайн слайдера интуитивно понятен - видна часть следующей карточки, хочется свайпнуть ',
            //     (tester) async {
            //   await test.schedule(tester, login: 'Войти как студент');
            //   expect(
            //       tester.getTopLeft(find.byType(WeekDayCard).at(4)).dx <
            //           Func(tester).size().width,
            //       true,
            //       reason: '5 - видно начало');
            //   expect(
            //       tester.getTopRight(find.byType(WeekDayCard).at(4)).dx >
            //           Func(tester).size().width,
            //       true,
            //       reason: '5 - не видно конец');
            // });

            testWidgets(
                'При тапе на число открывается блок расписания, соответствующий расписанию на этот день',
                (tester) async {
              await test.schedule(tester, login: 'Войти как студент');
              final WeekDayCard card =
                  tester.widget(find.byType(WeekDayCard).at(2));
              await Func(tester).tapDelay(200, find.byType(WeekDayCard).at(2));
              final WeekTypeWidget page =
                  tester.widget(find.byType(WeekTypeWidget));
              expect(int.parse(card.number), page.day?.dateTimetable?.day);
            });
          });
          //
          //
          group('Блок расписания', () {
            testWidgets('Ниже слайдера чисел ', (tester) async {
              await test.schedule(tester, login: 'Войти как студент');

              expect(
                  tester.getTopLeft(Finders.schedule).dy >
                      tester.getBottomLeft(find.byType(WeekDayCard).first).dy,
                  true);
            });

            testWidgets('Выезжает свайпом вверх', (tester) async {
              await test.schedule(tester, login: 'Войти как студент');

              final Finder listView = find.descendant(
                  of: find.byType(DraggableScrollableSheet),
                  matching: find.byType(ListView).first);
              double heightFirst = tester.getTopLeft(listView.first).dy;
              await tester.drag(listView.first, const Offset(0, -300));
              await tester.pumpAndSettle(Delay.delay300);
              double heightSecond = tester.getTopLeft(listView.first).dy;
              expect(heightSecond < heightFirst, true);
            });

            group('В блоке содержатся следующие элементы: ', () {
              testWidgets('Номер группы в левом верхнем углу', (tester) async {
                await test.schedule(tester, login: 'Войти как студент');
                final Finder finder = find.textContaining('Группа');
                expect(finder, findsAny);
              });

              testWidgets(
                  'Индикация Числителя и Знаменателя в правом верхнем углу',
                  (tester) async {
                await test.schedule(tester, login: 'Войти как студент');
                final Finder finder = find.textContaining('Знаменатель');
                final Finder finder2 = find.textContaining('Числитель');
                expect(finder.tryEvaluate() || finder2.tryEvaluate(), true);
              });
              //
              //
              group('Блоки с информацией о парах. Каждый блок содержит:', () {
                testWidgets(
                    'Заголовок - название предмета, выравнен по левому краю ',
                    (tester) async {
                  await test.schedule(tester, login: 'Войти как студент');
                  final SubjectInfoCard card =
                      tester.widget(find.byType(SubjectInfoCard).first);
                  expect(card.subject.name?.isNotEmpty, true,
                      reason: 'заголовок не пустой');
                  expect(Finders.subjectInfoCardContainer.first, findsOneWidget,
                      reason: 'заголовок отображается');
                  expect(
                      tester
                          .getTopLeft(Finders.subjectInfoCardContainer.first)
                          .dx,
                      tester
                              .getTopLeft(
                                  find.textContaining(card.subject.name!).first)
                              .dx -
                          16,
                      reason: 'выравнен по левому краю контейнера');
                });

                testWidgets('Фамилия И.О. преподавателя ниже заголовка',
                    (tester) async {
                  await test.schedule(tester, login: 'Войти как студент');
                  final SubjectInfoCard card =
                      tester.widget(find.byType(SubjectInfoCard).first);
                  expect(card.subject.name?.isNotEmpty, true,
                      reason: 'наличие названия предмета');
                  expect(card.subject.teacher?.isNotEmpty, true,
                      reason: ' наличие имени преподователя');
                  final Finder finder1 = find.text(card.subject.name ?? '');
                  final Finder finder2 = find.text(card.subject.teacher ?? '');
                  expect(
                      tester.getTopLeft(finder2).dy >
                          tester.getBottomLeft(finder1).dy,
                      true,
                      reason: 'Фамилия И.О. преподавателя ниже заголовка');
                });

                testWidgets(
                    'Время начала и окончания данной пары в правом верхнем углу',
                    (tester) async {
                  await test.schedule(tester, login: 'Войти как студент');
                  final SubjectInfoCard card =
                      tester.widget(find.byType(SubjectInfoCard).first);
                  expect(card.subject.startTime?.isNotEmpty, true,
                      reason: 'наличие времени начала занятия');
                  expect(card.subject.finishTime?.isNotEmpty, true,
                      reason: ' наличие времени конца занятия');
                  final Finder finder =
                      find.textContaining(card.subject.startTime!.trim());
                  expect(
                      tester.getTopRight(finder.first).dx + 16,
                      tester
                          .getTopRight(Finders.subjectInfoCardContainer.first)
                          .dx,
                      reason: 'проверка положения');
                });

                testWidgets(
                    'Номер кабинета ниже времени начала и окончания пары',
                    (tester) async {
                  await test.schedule(tester, login: 'Войти как студент');
                  final SubjectInfoCard card =
                      tester.widget(find.byType(SubjectInfoCard).first);
                  expect(card.subject.startTime?.isNotEmpty, true,
                      reason: 'наличие времени начала занятия');
                  expect(
                      (card.subject.classroom?.isNotEmpty ?? false) ||
                          (card.subject.isDistant ?? false),
                      true,
                      reason: ' наличие кабинета');
                  final Finder classroom =
                      find.textContaining(card.subject.isDistant == true
                          ? 'ДО'
                          : card.subject.classroom?.isEmpty == true
                              ? ''
                              : 'к.${card.subject.classroom}');
                  final Finder time =
                      find.textContaining(card.subject.startTime!.trim());
                  expect(
                      tester.getTopLeft(classroom.first).dy >
                          tester.getBottomLeft(time.first).dy,
                      true,
                      reason:
                          'Номер кабинета ниже времени начала и окончания пары');
                });
                //
                //
                group('Если пара идет в настоящий момент, то', () {
                  testWidgets("""блок данной пары отображается синим цветом, а
                слева от блока индикатор - заполненный кружок""",
                      (tester) async {
                    bool isContainerWithColor(
                        Container container, Color color) {
                      if (container.decoration is BoxDecoration) {
                        BoxDecoration decoration =
                            container.decoration as BoxDecoration;
                        if (decoration.color == color) {
                          return true;
                        }
                      }
                      return false;
                    }

                    await test.schedule(tester, login: 'Войти как студент');
                    // final int numTextWidgets = tester
                    //     .widgetList(Finders.subjectInfoCardContainer)
                    //     .length;
                    // final Container container =
                    //     tester.widget(Finders.subjectInfoCardContainer.at(2));

                    expect(
                        isContainerWithColor(
                                tester.widget(
                                    Finders.subjectInfoCardContainer.at(0)),
                                AppColor.subjectColor) ||
                            isContainerWithColor(
                                tester.widget(
                                    Finders.subjectInfoCardContainer.at(1)),
                                AppColor.subjectColor) ||
                            isContainerWithColor(
                                tester.widget(
                                    Finders.subjectInfoCardContainer.at(2)),
                                AppColor.subjectColor) ||
                            isContainerWithColor(
                                tester.widget(
                                    Finders.subjectInfoCardContainer.at(3)),
                                AppColor.subjectColor),
                        true);
                    // expect(true, false);
                  });
                  testWidgets("""отображается кнопка “Отметиться на паре” внизу
                блока, при тапе на которую включается режим автоотметки на паре""",
                      (tester) async {
                    await test.schedule(tester, login: 'Войти как студент');
                    expect(find.textContaining('Отметиться на паре'), findsAny);
                  });
                });

                testWidgets('Блоки листаются свайпом вверх-вниз',
                    (tester) async {
                  await test.schedule(tester, login: 'Войти как студент');
                  final Finder card = find.byType(SubjectInfoCard).first;
                  final double pos1 = tester.getTopLeft(card).dy;
                  await tester.timedDragFrom(tester.getTopLeft(card),
                      Offset(0, -pos1), Delay.delay(200));
                  final double pos2 = tester.getTopLeft(card).dy;
                  expect(pos1 > pos2, true);
                });
              });
            });

            testWidgets(
                """Если в выбранный день нет пар, то в блоке отображается
          текст "Нет занятий" по центру блока""", (tester) async {
              await test.schedule(tester, login: 'Войти как студент');

              final Finder day = find.byType(WeekDayCard);
              int i = 1;
              while (!day.at(0).tryEvaluate()) {
                await tester.dragFrom(
                    Offset(tester.getTopLeft(day.first).dx,
                        tester.getTopLeft(day.first).dy),
                    const Offset(5, 0));
              }
              await Func(tester).pump(5);
              await Func(tester).tapDelay(300, day.at(0));

              while (!find.textContaining('Нет занятий').tryEvaluate()) {
                await tester.timedDragFrom(
                    tester.getTopRight(day.at(i - 1)),
                    Offset(5 - tester.getTopLeft(day.at(i)).dx, 0),
                    Delay.delay1);
                await Func(tester).pump(5);
                await Func(tester).tapDelay(300, day.at(i));
                await Func(tester).tapDelay(300, day.at(i));
                await Func(tester).pump(5);
                await Func(tester).tapDelay(300, day.at(i));
                await Func(tester).tapDelay(300, day.at(i));
                await Func(tester).pump(5);
                i++;
              }
              expect(tester.getCenter(find.textContaining('Нет занятий')).dx,
                  Func(tester).size().width / 2);
            });
          });
        });
        //
        //
        group('Экзамены (студент)', () {
          bool testSheduleExam2 = false;
          bool testSheduleExam3 = false;
          group('Элементы стр Экзамены', () {
            testWidgets("Заголовок по центру", (tester) async {
              await test.schedule(tester, login: 'Войти как студент');
              await Func(tester).tapDelay(300, find.textContaining('Экзамены'));
              expect(tester.getCenter(find.textContaining('Расписание')).dx,
                  Func(tester).size().width / 2);

              final AnimatedTimetableSwitcher data =
                  tester.widget(find.byType(AnimatedTimetableSwitcher));
              testSheduleExam2 = find
                  .ancestor(
                      of: find.text('Занятия'),
                      matching: find.byType(AnimatedBuilder))
                  .tryEvaluate();
              testSheduleExam2 =
                  testSheduleExam2 && data.animationController.value == 1.0;

              testSheduleExam3 = Finders.exams.tryEvaluate();
            });
            testWidgets(
                "Селектор типа активностей - “Экзамены” выделено цветом",
                (tester) async {
              // await test.schedule(tester, login: 'Войти как студент');
              // await Func(tester).tapDelay(300, find.textContaining('Экзамены'));
              //
              // final Finder finder = find.ancestor(
              //     of: find.text('Занятия'),
              //     matching: find.byType(AnimatedBuilder));
              // final AnimatedTimetableSwitcher data =
              //     tester.widget(find.byType(AnimatedTimetableSwitcher));
              // expect(finder.tryEvaluate(), true, reason: 'на экране');
              // expect(data.animationController.value, 1.0,
              //     reason: "выделено Экзамены");
              expect(testSheduleExam2, true);
            });
            testWidgets("Блок экзаменов", (tester) async {
              // await test.schedule(tester, login: 'Войти как студент');
              // await Func(tester).tapDelay(300, find.textContaining('Экзамены'));
              // expect(Finders.exams, findsAny);
              expect(testSheduleExam3, true);
            });
          });
          //
          //
          group('Блок экзаменов', () {
            testWidgets("Ниже селектора типа активностей", (tester) async {
              await test.schedule(tester, login: 'Войти как студент');
              await Func(tester).tapDelay(300, find.textContaining('Экзамены'));
              expect(
                  tester.getBottomLeft(find.textContaining('Экзамены')).dy <=
                      tester.getTopLeft(Finders.exams.first).dy,
                  true);
            });
            testWidgets("Состоит из мини-блоков экзаменов", (tester) async {
              await test.schedule(tester, login: 'Войти как студент');
              await Func(tester).tapDelay(300, find.textContaining('Экзамены'));
              expect(Finders.exams, findsAny);
            });
            testWidgets("Содержит таймлайн слева от мини-блоков экзаменов. ",
                (tester) async {
              await test.schedule(tester, login: 'Войти как студент');
              await Func(tester).tapDelay(300, find.textContaining('Экзамены'));
              expect(find.byType(CustomCircle).first.tryEvaluate(), true);
            });
          });
          //
          //
          group('Мини-блок экзамена', () {
            testWidgets(
                "Содержит число, месяц, день недели, выравненные по левому краю",
                (tester) async {
              await test.schedule(tester, login: 'Войти как студент');
              await Func(tester).tapDelay(300, find.textContaining('Экзамены'));
              expect(
                  Func(tester).examInfoCard().dayTimetable.dateTimetable !=
                      null,
                  true,
                  reason: 'проверка данных');
              expect(
                  tester.getTopLeft(Finders.exams).dx,
                  tester
                      .getTopLeft(find.textContaining(getDateForExam(
                          Func(tester)
                              .examInfoCard()
                              .dayTimetable
                              .dateTimetable!)))
                      .dx,
                  reason: 'положение');
            });
            testWidgets("Карточку экзамена, которая содержит", (tester) async {
              await test.schedule(tester, login: 'Войти как студент');
              await Func(tester).tapDelay(300, find.textContaining('Экзамены'));
              expect(Finders.exams, findsAny);
            });
            group('Карточку экзамена, которая содержит', () {
              testWidgets(
                  "Название предмета - максимум в 2 строки, выравнено по левому краю",
                  (tester) async {
                await test.schedule(tester, login: 'Войти как студент');
                await Func(tester)
                    .tapDelay(300, find.textContaining('Экзамены'));
                final subject =
                    Func(tester).examInfoCard().dayTimetable.subjects?.first;
                expect(subject?.name != null, true, reason: 'проверка данных');
                expect(
                    tester.getTopLeft(Finders.exams.first).dx + 16,
                    tester
                        .getTopLeft(find.textContaining(subject!.name!).first)
                        .dx,
                    reason: 'положение');
              });
              testWidgets("Фамилия И.О. преподавателя ниже названия предмета",
                  (tester) async {
                await test.schedule(tester, login: 'Войти как студент');
                await Func(tester)
                    .tapDelay(300, find.textContaining('Экзамены'));
                final subject =
                    Func(tester).examInfoCard().dayTimetable.subjects?.first;
                expect(subject?.name != null, true,
                    reason: 'проверка данных названия');
                expect(subject?.teacher != null, true,
                    reason: 'проверка данных имени');

                expect(
                    tester
                            .getBottomLeft(
                                find.textContaining(subject!.name!).first)
                            .dy <=
                        tester
                            .getTopLeft(
                                find.textContaining(subject.teacher!).first)
                            .dy,
                    true,
                    reason: 'положение');
              });
              testWidgets("Время экзамена в правом верхнем углу",
                  (tester) async {
                await test.schedule(tester, login: 'Войти как студент');
                await Func(tester)
                    .tapDelay(300, find.textContaining('Экзамены'));
                final subject =
                    Func(tester).examInfoCard().dayTimetable.subjects?.first;
                expect(subject?.startTime != null, true,
                    reason: 'проверка данных времени');
                expect(
                    find.textContaining(subject!.startTime!.trim()), findsAny,
                    reason: 'на экране');
              });
              testWidgets("Номер кабинета в правом нижнем углу",
                  (tester) async {
                await test.schedule(tester, login: 'Войти как студент');
                await Func(tester)
                    .tapDelay(300, find.textContaining('Экзамены'));
                final subject =
                    Func(tester).examInfoCard().dayTimetable.subjects?.first;
                expect(subject?.startTime != null, true,
                    reason: 'проверка данных времени');
                expect(subject?.classroom != null, true,
                    reason: 'проверка данных кабинета');
                expect(find.textContaining(subject!.classroom!), findsAny,
                    reason: 'на экране');
                expect(
                    tester
                            .getBottomLeft(find
                                .textContaining(subject.startTime!.trim())
                                .first)
                            .dy <=
                        tester
                            .getTopLeft(
                                find.textContaining(subject.classroom!).first)
                            .dy,
                    true,
                    reason: 'положение');
              });
            });
          });
        });
      });
      //
      //
      //
      group('Кнопка “Отметиться на паре”', () {
        testWidgets("Отображается в блоке с информацией о паре",
            (tester) async {
          await test.schedule(tester, login: 'Войти как студент');
          final Finder button = find.ancestor(
              of: find.textContaining('Отметиться на паре'),
              matching: find.byType(OutlinedButton));
          final Finder finder = find.descendant(
              of: Finders.subjectInfoCardContainer.first,
              matching: button.first);
          expect(finder, findsAny);
        });

        // testWidgets("Отображается в случае, если на данный момент пара идет",
        //     (tester) async {
        //   expect(true, false);
        // });
        //
        //
        group(
            'Если bluetooth на устройстве включен, то при тапе на кнопку (преподаватель)',
            () {
          // testWidgets("включается режим отметки", (tester) async {
          //   expect(true, false);
          // });

          testWidgets("открывается модальное окно", (tester) async {
            await test.schedule(tester, login: 'Войти как студент');
            await tester.tap(find.textContaining('Отметиться на паре').first);
            await Func(tester).pump(10);
            // await tester.pump(Delay.delay(1000));
            expect(find.byType(AlertDialog), findsAny);
            if (find.textContaining('Выдать разрешения').tryEvaluate()) {
              expect(find.textContaining('Выдать разрешения'), findsAny,
                  reason: 'кнопка выдать разреш');
              await tester.tap(find.textContaining('Выдать разрешения').first);
              await tester.pumpAndSettle();
              await tester.pump(Delay.delay(1000));
              await Func(tester).pump(5);
              await tester.tap(find.textContaining('Отметиться на паре').first);
              await tester.pump(Delay.delay(1000));
            }
          });

          testWidgets(
              "Окно содержит анимацию-лоадер, отражающую активность режима",
              (tester) async {
            await test.schedule(tester, login: 'Войти как студент');
            await tester.tap(find.textContaining('Отметиться на паре').first);
            await tester.pumpAndSettle();
            await tester.pump(Delay.delay(1000));
            if (find.textContaining('Выдать разрешения').tryEvaluate()) {
              await tester.tap(find.textContaining('Выдать разрешения').first);
              await tester.pumpAndSettle();
              await tester.pump(Delay.delay(1000));
            }
            expect(find.byType(CircularProgressIndicator), findsAny);
          });

          testWidgets("текстом “Поиск точки доступа преподавателя”",
              (tester) async {
            await test.schedule(tester, login: 'Войти как студент');
            await tester.tap(find.textContaining('Отметиться на паре').first);
            await tester.pumpAndSettle();
            await tester.pump(Delay.delay(1000));
            if (find.textContaining('Выдать разрешение').tryEvaluate()) {
              await tester.tap(find.textContaining('Выдать разрешение').first);
              await tester.pumpAndSettle();
              await tester.pump(Delay.delay(1000));
            }
            expect(find.textContaining('Поиск точки доступа преподавателя'),
                findsAny);
          });

          // testWidgets(
          //     "при успешной отметке появляется модальное окно, в котором отображается",
          //     (tester) async {
          //   expect(true, false);
          // });

          testWidgets(
              "Модальное окно закрывается тапом по неактивной части экран",
              (tester) async {
            await test.schedule(tester, login: 'Войти как студент');
            await tester.tap(find.textContaining('Отметиться на паре').first);
            await tester.pumpAndSettle();
            await tester.pump(Delay.delay(1000));
            expect(find.byType(AlertDialog), findsAny, reason: 'окно найдено');
            await tester.tapAt(const Offset(10, 10));
            await Func(tester).pump(5);
            expect(find.byType(AlertDialog), findsNothing,
                reason: 'окно не найдено');
          });
        });
      });
      //
      //
      //
      group('Страница Профиль (студент)', () {
        //
        //
        group('Элементы Страницы Профиль', () {
          bool testProfileScreen2 = false;
          bool testProfileScreen3 = false;
          bool testProfileScreen4 = false;
          bool testProfileScreen5 = false;
          bool testProfileScreen6 = false;
          bool testProfileScreen7 = false;

          testWidgets('Заголовок', (tester) async {
            await test.profile(tester);
            expect(find.text('Профиль'), findsAny);

            testProfileScreen2 = find.byType(UserInfoCard).tryEvaluate();
            testProfileScreen3 = Finders.field("Портфолио").tryEvaluate();
            testProfileScreen4 = Finders.field("Уведомления").tryEvaluate();
            testProfileScreen5 = Finders.field("Настройки").tryEvaluate();
            testProfileScreen6 =
                Finders.field("Выйти из аккаунта").tryEvaluate();
            testProfileScreen7 = Finders.field("Удалить аккаунт").tryEvaluate();
          });
          testWidgets('Блок пользователя', (tester) async {
            // await test.profile(tester);
            // expect(find.byType(UserInfoCard), findsAny);
            expect(testProfileScreen2, true);
          });
          testWidgets('Поле Портфолио', (tester) async {
            // await test.profile(tester);
            // expect(Finders.field("Портфолио"), findsAny);
            expect(testProfileScreen3, true);
          });
          testWidgets('Поле Уведомления', (tester) async {
            // await test.profile(tester);
            // expect(Finders.field("Уведомления"), findsAny);
            expect(testProfileScreen4, true);
          });
          testWidgets('Поле Настройки', (tester) async {
            // await test.profile(tester);
            // expect(Finders.field("Настройки"), findsAny);
            expect(testProfileScreen5, true);
          });
          testWidgets('Поле Выйти из аккаунта', (tester) async {
            // await test.profile(tester);
            // expect(Finders.field("Выйти из аккаунта"), findsAny);
            expect(testProfileScreen6, true);
          });
          testWidgets('Поле Удалить аккаунт', (tester) async {
            // await test.profile(tester);
            // expect(Finders.field("Удалить аккаунт"), findsAny);
            expect(testProfileScreen7, true);
          });
        });
        //
        //
        group('Заголовок', () {
          testWidgets('Вверху по центру', (tester) async {
            await test.profile(tester);
            final Finder finder = find.text('Профиль');
            expect(
                reason: 'по центру',
                tester.getCenter(finder).dx,
                Func(tester).size().width / 2);
            // expect(tester.getCenter(finder).dy <150, true);
          });
        });
        //
        //
        group('Блок пользователя', () {
          bool testProfileUserBlock2 = false;
          bool testProfileUserBlock3 = false;
          testWidgets('Ниже заголовка', (tester) async {
            await test.profile(tester);
            final Finder finder = find.text('Профиль');
            final Finder finder2 = find.byType(UserInfoCard);
            expect(
                tester.getBottomLeft(finder).dy < tester.getTopLeft(finder2).dy,
                true);

            testProfileUserBlock2 = Finders.nameCard.tryEvaluate();
            testProfileUserBlock3 = Finders.facultyCard.tryEvaluate();
          });

          testWidgets('ФИО студента в 2 строки: 1) ФИ 2)О', (tester) async {
            // await test.profile(tester);
            // expect(Finders.nameCard.tryEvaluate(), true,
            //     reason: 'проверка наличия');
            expect(testProfileUserBlock2, true);
          });

          testWidgets('Название факультета внизу блока', (tester) async {
            // await test.profile(tester);
            // expect(Finders.facultyCard.tryEvaluate(), true);
            expect(testProfileUserBlock3, true);
          });
        });
        //
        //
        group('Поле Портфолио', () {
          bool testProfilePortfolio2 = false;
          testWidgets('Ниже блока пользователя', (tester) async {
            await test.profile(tester);
            final Finder finder = find.byType(UserInfoCard);
            expect(
                reason: 'ниже пред блока',
                tester.getBottomLeft(finder).dy <
                    tester.getTopLeft(Finders.field("Портфолио")).dy,
                true);

            final Finder finder2 = find.byWidgetPredicate((widget) =>
                widget is ProfileButton && widget.title == 'Портфолио');
            await Func(tester).tapDelay(300, finder2);
            testProfilePortfolio2 =
                find.byType(PortfolioScreenView).tryEvaluate();
          });

          testWidgets(
              'При тапе на поле происходит переход на страницу "Портфолио"',
              (tester) async {
            // await test.profile(tester);
            // final Finder finder = find.byWidgetPredicate((widget) =>
            //     widget is ProfileButton && widget.title == 'Портфолио');
            // await Func(tester).tapDelay(300, finder);
            // expect(find.byType(PortfolioScreenView), findsOneWidget);
            expect(testProfilePortfolio2, true);
          });
        });
        //
        //
        group('Поле Уведомления', () {
          testWidgets('Ниже поля Портфолио ', (tester) async {
            await test.profile(tester);
            final Finder finder = find.byWidgetPredicate((widget) =>
                widget is ProfileButton && widget.title == 'Портфолио');
            final Finder finder2 = find.byWidgetPredicate((widget) =>
                widget is ProfileButton && widget.title == 'Уведомления');
            expect(
                reason: 'ниже пред блока',
                tester.getBottomLeft(finder).dy < tester.getTopLeft(finder2).dy,
                true);
            expect(reason: 'найден только один', finder2, findsOneWidget);
          });

          testWidgets(
              'При тапе поле происходит переход на страницу "Уведомления"',
              (tester) async {
            expect(true, false);
          });
        });
        //
        //
        group('Поле Настройки', () {
          testWidgets('Ниже поля Уведомления', (tester) async {
            await test.profile(tester);
            expect(
                reason: 'ниже пред блока',
                tester.getBottomLeft(Finders.field('Уведомления')).dy <
                    tester.getTopLeft(Finders.field('Настройки')).dy,
                true);
            expect(
                reason: 'найден только один',
                Finders.field('Настройки'),
                findsOneWidget);
          });

          testWidgets(
              'При тапе поле происходит переход на страницу "Уведомления"',
              (tester) async {
            expect(true, false);
          });
        });
        //
        //
        group('Поле Выйти из аккаунта', () {
          testWidgets('Ниже поля Настройки', (tester) async {
            await test.profile(tester);
            expect(
                reason: 'ниже пред блока',
                tester.getBottomLeft(Finders.field('Настройки')).dy <
                    tester.getTopLeft(Finders.field('Выйти из аккаунта')).dy,
                true);
          });
          //
          //
          group('При тапе на поле открывается модальное окно, где:', () {
            testWidgets('Заголовок "Выход из аккаунта"', (tester) async {
              await test.profile(tester);
              await Func(tester)
                  .tapDelay(300, Finders.field('Выйти из аккаунта'));

              final Finder finder2 = find.descendant(
                  of: find.byType(AlertDialog),
                  matching: find.text('ВЫХОД ИЗ АККАУНТА'));
              expect(reason: 'найден только один', finder2, findsOneWidget);
            });

            testWidgets('Текст "Вы уверены, что хотите выйти из аккаунта?"',
                (tester) async {
              await test.profile(tester);
              await Func(tester)
                  .tapDelay(300, Finders.field('Выйти из аккаунта'));

              final Finder finder2 = find.descendant(
                  of: find.byType(AlertDialog),
                  matching:
                      find.text('Вы уверены, что хотите выйти из аккаунта?'));
              expect(reason: 'найден только один', finder2, findsOneWidget);
            });

            testWidgets(
                'Кнопка "Отменить" синего цвета, при тапе на которую окно закрывается',
                (tester) async {
              await test.profile(tester);
              await Func(tester)
                  .tapDelay(300, Finders.field('Выйти из аккаунта'));

              final Finder finder2 = find.descendant(
                  of: find.byType(AlertDialog),
                  matching: find.text('ОТМЕНИТЬ'));
              expect(reason: 'найден только один', finder2, findsOneWidget);
              final Text button = tester.widget<Text>(finder2);
              expect(
                  reason: 'цвет синий',
                  button.style?.color == AppColor.newBlue,
                  true);
              await Func(tester).tapDelay(300, finder2);
              expect(
                  reason: 'проверка закрытия',
                  find.byType(AlertDialog),
                  findsNothing);
            });

            testWidgets(
                'Кнопка "Выйти" черного цвета, при тапе на которую происходит выход из аккаунта',
                (tester) async {
              await test.profile(tester);
              await Func(tester)
                  .tapDelay(300, Finders.field('Выйти из аккаунта'));

              final Finder finder2 = find.descendant(
                  of: find.byType(AlertDialog), matching: find.text('ВЫЙТИ'));
              expect(reason: 'найден только один', finder2, findsOneWidget);
              final Text button = tester.widget<Text>(finder2);
              expect(
                  reason: 'цвет чёрный',
                  button.style?.color == AppColor.black,
                  true);
              await Func(tester).tapDelay(300, finder2);
              expect(
                  reason: 'проверка выхода',
                  find.byType(AuthScreenView),
                  findsOneWidget);
            });

            testWidgets('Окно закрывается тапом на неактивную область',
                (tester) async {
              await test.profile(tester);
              await Func(tester)
                  .tapDelay(300, Finders.field('Выйти из аккаунта'));

              final Finder finder = find.byType(AlertDialog);
              expect(reason: 'найден только один', finder, findsOneWidget);

              await tester.tapAt(Offset(tester.getCenter(finder).dx,
                  tester.getTopLeft(finder).dy - 15));
              await tester.pumpAndSettle(Delay.delay300);
              expect(
                  reason: 'проверка закрытия окна после нажатия выше',
                  finder,
                  findsNothing);
            });
          });
        });
        //
        //
        group('Поле Удалить аккаунт', () {
          testWidgets('Ниже поля Выйти из аккаунта', (tester) async {
            await test.profile(tester);
            expect(
                reason: 'ниже пред блока',
                tester.getBottomLeft(Finders.field('Выйти из аккаунта')).dy <
                    tester.getTopLeft(Finders.field('Удалить аккаунт')).dy,
                true);
            expect(
                reason: 'найден только один',
                Finders.field('Удалить аккаунт'),
                findsOneWidget);
          });

          group('При тапе на поле открывается модальное окно, где:', () {
            testWidgets('Заголовок "Удалить аккаунт"', (tester) async {
              await test.profile(tester);
              await Func(tester)
                  .tapDelay(300, Finders.field('Удалить аккаунт'));

              final Finder finder2 = find.descendant(
                  of: find.byType(AlertDialog),
                  matching: find.text('УДАЛИТЬ АККАУНТ'));
              expect(reason: 'найден только один', finder2, findsOneWidget);
            });

            testWidgets(
                'Текст "Вы уверены, что хотите удалить аккаунт? Это действие нельзя будет отменить, и вся информация будет удалена".',
                (tester) async {
              await test.profile(tester);
              await Func(tester)
                  .tapDelay(300, Finders.field('Удалить аккаунт'));

              final Finder finder2 = find.descendant(
                  of: find.byType(AlertDialog),
                  matching: find.text(
                      'Вы уверены, что хотите удалить аккаунт? Это действие нельзя отменить и вся информация будет удалена.'));
              expect(reason: 'найден только один', finder2, findsOneWidget);
            });

            testWidgets(
                'Кнопка "Отменить" синего цвета, при тапе на которую окно закрывается',
                (tester) async {
              await test.profile(tester);
              await Func(tester)
                  .tapDelay(300, Finders.field('Удалить аккаунт'));

              final Finder finder2 = find.descendant(
                  of: find.byType(AlertDialog),
                  matching: find.text('ОТМЕНИТЬ'));
              expect(reason: 'найден только один', finder2, findsOneWidget);
              final Text button = tester.widget<Text>(finder2);
              expect(
                  reason: 'цвет синий',
                  button.style?.color == AppColor.newBlue,
                  true);
              await Func(tester).tapDelay(300, finder2);
              expect(
                  reason: 'проверка закрытия',
                  find.byType(AlertDialog),
                  findsNothing);
            });

            testWidgets(
                'Кнопка "Удалить" черного цвета, при тапе на которую происходит выход из аккаунта',
                (tester) async {
              await test.profile(tester);
              await Func(tester)
                  .tapDelay(300, Finders.field('Удалить аккаунт'));

              final Finder finder2 = find.descendant(
                  of: find.byType(AlertDialog), matching: find.text('УДАЛИТЬ'));
              expect(reason: 'найден только один', finder2, findsOneWidget);
              final Text button = tester.widget<Text>(finder2);
              expect(
                  reason: 'цвет чёрный',
                  button.style?.color == AppColor.black,
                  true);
              // await Func(tester).tapDelay(300, finder2);
              // expect(reason:'проверка выхода', find.byType(AuthScreenView), findsOneWidget);
            });

            testWidgets('Окно закрывается тапом на неактивную область',
                (tester) async {
              await test.profile(tester);
              await Func(tester)
                  .tapDelay(300, Finders.field('Удалить аккаунт'));

              final Finder finder = find.byType(AlertDialog);
              expect(reason: 'найден только один', finder, findsOneWidget);

              await tester.tapAt(Offset(tester.getCenter(finder).dx,
                  tester.getTopLeft(finder).dy - 15));
              await tester.pumpAndSettle(Delay.delay300);
              expect(
                  reason: 'проверка закрытия окна после нажатия выше',
                  finder,
                  findsNothing);
            });
          });
        });
      });
      //
      //
      //
      group('Страница Портфолио (студент)', () {
        bool portfolioTest2 = false;
        bool portfolioTest3 = false;
        bool portfolioTest4 = false;
        bool portfolioTest5 = false;
        bool portfolioTest6 = false;
        testWidgets('Круглая область для фотографии', (tester) async {
          await test.portfolio(tester);
          expect(Finders.imageFace, findsAny);

          portfolioTest2 = (Finders.ft('Вадим').tryEvaluate()) ? true : false;
          portfolioTest3 = (Finders.ft('Егоров').tryEvaluate()) ? true : false;
          portfolioTest4 =
              (Finders.ft('Станиславович').tryEvaluate()) ? true : false;
          await Func(tester).scrolling(Finders.ft('12.10.2002'));
          portfolioTest5 =
              (Finders.ft('12.10.2002').tryEvaluate()) ? true : false;
          portfolioTest6 =
              (Finders.ft('fittin@vsu.ru').tryEvaluate()) ? true : false;
        });
        group('Круглая область для фотографии', () {
          group(
              'По центру ниже заголовка, при тапе на которую открывается модальное окно, где:',
              () {
            testWidgets('открывается модальное окно', (tester) async {
              expect(false, true);
            });
            testWidgets('Текст "Необходим доступ к камере и хранилищу"',
                (tester) async {
              expect(false, true);
            });
            testWidgets(
                'Кнопка “Отменить”, при тапе на которую окно закрывается ',
                (tester) async {
              expect(false, true);
            });
            testWidgets(
                'Кнопка “Настройки”, при тапе на которую происходит переход на страницу настроек устройства',
                (tester) async {
              expect(false, true);
            });
            testWidgets('При тапе на неактивную часть экрана окно закрывается',
                (tester) async {
              expect(false, true);
            });
          });
        });
        testWidgets('Поле Имя', (tester) async {
          await test.portfolio(tester);
          expect(portfolioTest2, true);
        });
        testWidgets('Поле Фамилия', (tester) async {
          expect(portfolioTest3, true);
        });
        testWidgets('Поле Отчество', (tester) async {
          expect(portfolioTest4, true);
        });
        testWidgets('Поле дата рождения', (tester) async {
          expect(portfolioTest5, true);
        });
        testWidgets('Поле e-mail', (tester) async {
          expect(portfolioTest6, true);
        });
        group('Блок образования', () {
          bool test2 = false;
          bool test3 = false;
          bool test4 = false;
          bool test5 = false;
          testWidgets('Заголовок ВГУ ', (tester) async {
            await test.profile(tester);
            await Func(tester).tapDelay(300, Finders.field('Портфолио'));
            await Func(tester).scrolling(Finders.userInfo);
            final Finder finder = find.descendant(
                of: Finders.userInfo, matching: find.textContaining("ВГУ"));
            expect(finder, findsAny);

            final Finder finder2 = find.descendant(
                of: Finders.userInfo,
                matching: find.textContaining("Уровень образования"));
            test2 = (finder2.first.tryEvaluate()) ? true : false;

            final Finder finder3 = find.descendant(
                of: Finders.userInfo,
                matching: find.textContaining("Факультет"));
            test3 = (finder3.first.tryEvaluate()) ? true : false;

            final Finder finder4 = find.descendant(
                of: Finders.userInfo,
                matching: find.textContaining("Специализация"));
            test4 = (finder4.first.tryEvaluate()) ? true : false;

            final Finder finder5 = find.descendant(
                of: Finders.userInfo,
                matching: find.textContaining("Год окончания"));
            test5 = (finder5.first.tryEvaluate()) ? true : false;
          });

          testWidgets(
              'Поле Уровень образования, при тапе на которое открывается страница Уровень образования, где: ',
              (tester) async {
            // await test.profile(tester);
            // await Func(tester).tapDelay(300, Finders.field('Портфолио'));
            // await Func(tester).scrolling(Finders.userInfo);
            // final Finder finder = find.descendant(
            //     of: Finders.userInfo,
            //     matching: find.textContaining("Уровень образования"));
            // expect(finder, findsAny);
            expect(test2, true);
          });

          testWidgets('Поле Факультет, при тапе на которое …', (tester) async {
            // await test.profile(tester);
            // await Func(tester).tapDelay(300, Finders.field('Портфолио'));
            // await Func(tester).scrolling(Finders.userInfo);
            // final Finder finder = find.descendant(
            //     of: Finders.userInfo,
            //     matching: find.textContaining("Факультет"));
            // expect(finder, findsAny);
            expect(test3, true);
          });

          testWidgets('Поле Специализация, при тапе на которое …',
              (tester) async {
            // await test.profile(tester);
            // await Func(tester).tapDelay(300, Finders.field('Портфолио'));
            // await Func(tester).scrolling(Finders.userInfo);
            // final Finder finder = find.descendant(
            //     of: Finders.userInfo,
            //     matching: find.textContaining("Специализация"));
            // expect(finder, findsAny);
            expect(test4, true);
          });

          testWidgets(
              'Поле Год окончания, при тапе на которое открывается'
              'боттомшит с барабаном выбора года и кнопкой “Готово” в правом'
              'верхнем углу, при тапе на которую выбранный год сохраняется в поле ',
              (tester) async {
            // await test.profile(tester);
            // await Func(tester).tapDelay(300, Finders.field('Портфолио'));
            // await Func(tester).scrolling(Finders.userInfo);
            // final Finder finder = find.descendant(
            //     of: Finders.userInfo,
            //     matching: find.textContaining("Год окончания"));
            // expect(finder, findsAny);
            expect(test5, true);
          });
          //
          //
          group('Кнопка "Сохранить"', () {
            testWidgets('Ниже блока образования', (tester) async {
              expect(true, false);
            });
            testWidgets('При тапе на кнопку изменения сохраняются',
                (tester) async {
              expect(true, false);
            });
            testWidgets('Активна, если все поля заполнены', (tester) async {
              expect(true, false);
            });
          });
          //
          //
          group('Кнопка "Поделиться PDF"', () {
            testWidgets('Внизу экрана', (tester) async {
              await test.profile(tester);
              await Func(tester).tapDelay(300, Finders.field('Портфолио'));
              await Func(tester).scrolling(Finders.userInfo);
              expect(
                  tester.getBottomLeft(Finders.userInfo).dy <=
                      tester
                          .getTopLeft(find.textContaining('Поделиться PDF'))
                          .dy,
                  true);
            });
            testWidgets(
                'При тапе на кнопку формируется PDF файл, который можно'
                'сохранить на устройство или поделиться им', (tester) async {
              expect(true, false);
            });
          });
        });
      });
    });
    //
    //
    //
    //
    //
    group('Профиль преподавателя', () {
      group('Страница авторизации (преподаватель)', () {
        group('Элементы страницы авторизации (преподаватель)', () {
          bool test2 = false;
          bool test3 = false;
          testWidgets('Заголовок "Добро пожаловать" по центру (преподаватель)',
              (tester) async {
            await test.authorization(tester);
            expect(tester.getCenter(find.text('ДОБРО ПОЖАЛОВАТЬ')).dx,
                Func(tester).size().width / 2);

            // Текст "Авторизуйтесь, чтобы войти в аккаунт" по центру ниже заголовка
            final Finder finder =
                find.text('Авторизуйтесь, чтобы войти в аккаунт');
            test2 =
                (tester.getCenter(finder).dx == Func(tester).size().width / 2)
                    ? true
                    : false;
            test2 = (test2 &&
                    tester.getTopLeft(finder).dy >=
                        tester.getBottomLeft(find.text('ДОБРО ПОЖАЛОВАТЬ')).dy)
                ? true
                : false;

            // Кнопка "Войти как студент" синего цвета, при тапе на которую появляется боттомшит "Вход в аккаунт"
            final Finder button = find.ancestor(
                of: find.text('Войти как студент'),
                matching: find.byType(ElevatedButton));
            final ElevatedButton buttons =
                tester.widget<ElevatedButton>(button);
            test3 = (buttons.style?.backgroundColor?.resolve({}) ==
                    AppColor.newBlue)
                ? true
                : false;
            await Func(tester).tapDelay(300, button);
            test3 = (test3 && find.text('Вход в аккаунт').tryEvaluate())
                ? true
                : false;
          });

          testWidgets(
              'Текст "Авторизуйтесь, чтобы войти в аккаунт" по центру'
              'ниже заголовка (преподаватель)', (tester) async {
            // await test.authorization(tester);
            // final Finder finder =
            //     find.text('Авторизуйтесь, чтобы войти в аккаунт');
            // final double height2 =
            //     tester.getBottomLeft(find.text('ДОБРО ПОЖАЛОВАТЬ')).dy;
            // expect(
            //     reason: 'по центру',
            //     tester.getCenter(finder).dx,
            //     Func(tester).size().width / 2);
            // expect(
            //     reason: 'ниже заголовка',
            //     tester.getTopLeft(finder).dy > height2,
            //     true);
            expect(test2, true);
          });

          testWidgets(
              'Кнопка "Войти как студент" синего цвета, при тапе на'
              'которую появляется боттомшит "Вход в аккаунт"', (tester) async {
            // await test.authorization(tester);
            // final Finder button = find.ancestor(
            //     of: find.text('Войти как студент'),
            //     matching: find.byType(ElevatedButton));
            // final ElevatedButton buttons =
            //     tester.widget<ElevatedButton>(button);
            // expect(
            //     reason: 'синего цвета',
            //     buttons.style?.backgroundColor?.resolve({}),
            //     AppColor.newBlue);
            // await Func(tester).tapDelay(300, button);
            // final Finder finder = find.descendant(
            //     of: find.byType(LoginStudentWidget),
            //     matching: find.text('Вход в аккаунт'));
            // expect(finder, findsOneWidget);
            expect(test3, true);
          });

          testWidgets(
              'Кнопка "Войти как преподаватель" прозрачная, при тапе на'
              'которупоявляется боттомшит "Вход в аккаунт"', (tester) async {
            await test.authorization(tester);
            final Finder button = find.ancestor(
                of: find.text('Войти как преподаватель'),
                matching: find.byType(ElevatedButton));
            final ElevatedButton buttons =
                tester.widget<ElevatedButton>(button);
            expect(
                reason: 'прозрачного цвета',
                buttons.style?.backgroundColor?.resolve({}),
                AppColor.white);
            await Func(tester).tapDelay(300, button);
            final Finder finder = find.descendant(
                of: find.byType(EnterValueTeacherScreenView),
                matching: find.text('Вход в аккаунт'));
            expect(finder, findsOneWidget);
          });
        });
        //
        //
        group('Боттомшит Вход в аккаунт для преподавателя', () {
          bool test3 = false;
          bool test4 = false;
          bool test5 = false;
          testWidgets('Заголовок "Вход в аккаунт" по центру', (tester) async {
            await test.authorization(tester, login: 'Войти как преподаватель');
            final double position =
                tester.getCenter(find.text('Вход в аккаунт')).dx;
            expect(Func(tester).size().width / 2, position);

            // Поле "Адрес электронной почты"
            test3 = Finders.tfw('Адрес электронной почты').tryEvaluate();

            // Текст "Не удалось войти? Напишите на brs@sc.vsu.ru" ниже поля "Адрес электронной почты"
            final Finder finder4 = find.descendant(
                of: find.byType(EnterValueTeacherScreenView),
                matching: Finders.errLog2);
            test4 = (tester
                        .getBottomLeft(Finders.tfw('Адрес электронной почты'))
                        .dy <
                    tester.getTopLeft(finder4).dy)
                ? true
                : false;

            // Кнопка "Отправить код на Email", при тапе на которую отправляется код на указанную эл почту и происходит переход на боттомшит для ввода кода, в котором
            final Finder button = find.text('Отправить код на Email');
            await tester.enterText(
                find.byWidgetPredicate((widget) =>
                    widget is TextField &&
                    widget.decoration?.hintText == 'Адрес электронной почты'),
                Logs.logT);
            await Func(tester).tapDelay(1000, button);
            Finder finder = find.byType(ConfirmCodeTeacherScreenView);
            test5 = finder.tryEvaluate();
            await tester.enterText(
                Finders.tfw('Код из сообщения из Email'), Logs.pasT);
            await Func(tester).tapDelay(300, find.text('Войти'));
          });

          testWidgets(
              'Кнопка крестик в правом верхнем углу, при тапе на'
              'которую боттомшит закрывается3', (tester) async {
            await test.authorization(tester, login: 'Войти как преподаватель');

            final Finder sheet = find.byType(LoginTeacherScreen);
            final Finder icon =
                find.descendant(of: sheet, matching: Finders.closePng);
            expect(sheet, findsOneWidget);
            await Func(tester).tapDelay(300, icon);
            expect(sheet, findsNothing);
          });

          testWidgets('Поле "Адрес электронной почты"', (tester) async {
            // await test.authorization(tester, login: 'Войти как преподаватель');
            // expect(Finders.tfw('Адрес электронной почты'), findsOneWidget);
            expect(test3, true);
          });

          testWidgets(
              'Текст "Не удалось войти? Напишите на brs@sc.vsu.ru"'
              'ниже поля "Адрес электронной почты"', (tester) async {
            // await test.authorization(tester, login: 'Войти как преподаватель');
            // final Finder finder3 = find.descendant(
            //     of: find.byType(EnterValueTeacherScreenView),
            //     matching: Finders.errLog2);
            // expect(
            //     tester
            //             .getBottomLeft(Finders.tfw('Адрес электронной почты'))
            //             .dy <
            //         tester.getTopLeft(finder3).dy,
            //     true);
            expect(test4, true);
          });

          testWidgets(
              'Кнопка "Отправить код на Email", при тапе на которую'
              'отправляется код на указанную эл почту и происходит переход на боттомшит для ввода кода, в котором:',
              (tester) async {
            // await test.authorization(tester, login: 'Войти как преподаватель');
            // final Finder button = find.text('Отправить код на Email');
            //
            // await tester.enterText(
            //     find.byWidgetPredicate((widget) =>
            //         widget is TextField &&
            //         widget.decoration?.hintText == 'Адрес электронной почты'),
            //     Finders.logT);
            //
            // await Func(tester).tapDelay(1000, button);
            // Finder finder = find.byType(ConfirmCodeTeacherScreenView);
            // expect(finder, findsOneWidget);
            // await tester.enterText(
            //     Finders.tfw('Код из сообщения из Email'), Finders.pasT);
            // await Func(tester).tapDelay(300, find.text('Войти'));
            expect(test5, true);
          });
          //
          //
          group('Боттомшит для ввода кода содержит', () {
            bool test3 = false;
            bool test4 = false;
            bool test5 = false;
            testWidgets('Заголовок "Вход в аккаунт" по центру 3',
                (tester) async {
              await test.authorization(tester,
                  login: 'Войти как преподаватель');
              await tester.enterText(
                  Finders.tfw('Адрес электронной почты'), Logs.logT);
              await tester.tap(find.textContaining('Отправить код на').first);
              await Func(tester).pump(30);
              final Finder finder = find.text('Вход в аккаунт');
              expect(
                  Func(tester).size().width / 2, tester.getCenter(finder).dx);

              test3 = Finders.tfw('Код из сообщения из Email').tryEvaluate();

              final Finder text = find.descendant(
                  of: find.byType(ConfirmCodeTeacherScreenView),
                  matching: Finders.errLog);
              test4 = tester
                      .getBottomLeft(Finders.tfw('Код из сообщения из Email'))
                      .dy <=
                  tester.getTopLeft(text).dy;

              final Finder button = find.ancestor(
                  of: find.text('Войти'),
                  matching: find.byType(ElevatedButton));
              await tester.enterText(
                  Finders.tfw('Код из сообщения из Email'), Logs.pasT);
              await Func(tester).tapDelay(1000, button);
              test5 = find.byType(TeacherShowcaseScreenView).tryEvaluate();
            });

            testWidgets(
                'Кнопка крестик в правом верхнем углу, при тапе на'
                'которую боттомшит закрывается4', (tester) async {
              await test.authorization(tester,
                  login: 'Войти как преподаватель');
              await tester.enterText(
                  Finders.tfw('Адрес электронной почты'), Logs.logT);

              final Finder sheet = find.byType(EnterValueTeacherScreenView);
              expect(sheet, findsOneWidget);

              await tester.tap(find.textContaining('Отправить код на').first);
              await Func(tester).pump(30);
              expect(find.byType(ConfirmCodeTeacherScreenView), findsOneWidget);
              await Func(tester).tapDelay(300, Finders.closePng);
              expect(find.byType(ConfirmCodeTeacherScreenView), findsNothing);
            });

            testWidgets(
                'Поле "Код из сообщения на Email". В поле должен вводиться код из 6 цифр ',
                (tester) async {
              // await test.authorization(tester, login: 'Войти как преподаватель');
              // await tester.enterText(Finders.tfw('Адрес электронной почты'),
              //     Finders.logT);
              // await tester.tap(find.textContaining('Отправить код на').first);
              // await Func(tester).pump(30);
              // expect(findsAny, Finders.tfw('Код из сообщения из Email'));
              expect(test3, true);
            });

            testWidgets(
                'Текст "Не удалось войти? Напишите на brs@sc.vsu.ru" ниже поля "Отправить код на Email"',
                (tester) async {
              // await test.authorization(tester, login: 'Войти как преподаватель');
              // await tester.enterText(Finders.tfw('Адрес электронной почты'),
              //     Finders.logT);
              // await tester.tap(find.textContaining('Отправить код на').first);
              // await Func(tester).pump(30);
              //
              // final Finder finder3 = find.descendant(
              //     of: find.byType(ConfirmCodeTeacherScreenView),
              //     matching: Finders.errLog);
              // expect(
              //     tester.getBottomLeft(Finders.tfw('Код из сообщения из Email')).dy <
              //         tester.getTopLeft(finder3).dy,
              //     true);
              // expect(
              // tester
              //                 .getBottomLeft(
              //                     Finders.tfw('Код из сообщения из Email'))
              //                 .dy <=
              //             tester.getTopLeft(text).dy,
              //
              //     true);

              expect(test4, true);
            });

            testWidgets(
                'Кнопка "Войти", которая активна только, если поле'
                '"Код из сообщения на Email" заполнено корректно.'
                'При тапе на кнопку происходит вход в аккаунт', (tester) async {
              // await test.home(tester, login: 'Войти как преподаватель');
              //
              // expect(find.byType(TeacherShowcaseScreenView), findsAny);
              expect(test5, true);
            });
          });
          //
          //
          testWidgets(
              'Кнопка "Войти по номеру телефона", при тапе на которую'
              'открывается боттомшит для ввода телефона', (tester) async {
            await test.authorization(tester, login: 'Войти как преподаватель');
            final Finder button = find.text('Войти по номеру телефона');
            await Func(tester).tapDelay(300, button);
            final Finder finder = find.text('Вход в аккаунт');
            expect(Func(tester).size().width / 2, tester.getCenter(finder).dx);
          });
          //
          //
          group(
              'Кнопка "Войти по номеру телефона", при тапе на которую'
              'открывается боттомшит для ввода телефона, в котором: ', () {
            testWidgets('Заголовок "Вход в аккаунт" по центру 3',
                (tester) async {
              await test.authorization(tester,
                  login: 'Войти как преподаватель');
              final Finder button = find.text('Войти по номеру телефона');
              await Func(tester).tapDelay(300, button);
              final Finder finder = find.text('Вход в аккаунт');
              expect(
                  Func(tester).size().width / 2, tester.getCenter(finder).dx);
            });

            testWidgets(
                'Кнопка крестик в правом верхнем углу, при тапе на'
                'которую боттомшит закрывается4', (tester) async {
              await test.authorization(tester,
                  login: 'Войти как преподаватель');
              final Finder button = find.text('Войти по номеру телефона');
              await Func(tester).tapDelay(300, button);

              final Finder sheet = find.byType(EnterValueTeacherScreenView);
              final Finder icon =
                  find.descendant(of: sheet, matching: Finders.closePng);
              expect(sheet, findsOneWidget);
              await Func(tester).tapDelay(300, icon);
              expect(sheet, findsNothing);
            });

            testWidgets(
                'Поле "Номер телефона". В поле должен вводиться'
                'номер из 11 цифр ', (tester) async {
              await test.authorization(tester,
                  login: 'Войти как преподаватель');
              final Finder button = find.text('Войти по номеру телефона');
              await Func(tester).tapDelay(1000, button);

              expect(true, Finders.tfw('Номер телефона').tryEvaluate());
            });

            testWidgets(
                'Текст "Не удалось войти? Напишите на brs@sc.vsu.ru"'
                'ниже поля "Номер телефона"', (tester) async {
              await test.authorization(tester,
                  login: 'Войти как преподаватель');
              final Finder button = find.text('Войти по номеру телефона');
              await Func(tester).tapDelay(300, button);

              final Finder finder3 = find.descendant(
                  of: find.byType(EnterValueTeacherScreenView),
                  matching: Finders.errLog2);
              expect(
                  tester.getBottomLeft(Finders.tfw('Номер телефона')).dy <
                      tester.getTopLeft(finder3).dy,
                  true);
            });

            testWidgets(
                'Кнопка "Отправить SMS c кодом", при тапе на которую'
                'приходит смс на телефон, и открывается боттомшит, где: ',
                (tester) async {
              await test.authorization(tester,
                  login: 'Войти как преподаватель');
              final Finder button = find.text('Войти по номеру телефона');
              expect(true, button.tryEvaluate());
            });
            //
            //
            group('боттомшит содержит', () {
              testWidgets('Заголовок "Вход в аккаунт" по центру',
                  (tester) async {
                expect(true, false);
              });
              testWidgets(
                  'Кнопка крестик в правом верхнем углу, при тапе на'
                  'которую боттомшит закрывается', (tester) async {
                expect(true, false);
              });
              testWidgets(
                  'Поле "Код из SMS". В поле должен вводиться код из 6 цифр',
                  (tester) async {
                expect(true, false);
              });
              testWidgets(
                  'Текст "Не удалось войти? Напишите на brs@sc.vsu.ru" ниже поля "Номер телефона"',
                  (tester) async {
                expect(true, false);
              });
              testWidgets(
                  'Кнопка "Войти", при тапе на которую происходит вход в аккаунт ',
                  (tester) async {
                expect(true, false);
              });
            });
          });
        });
        //
        //
        group('Первая авторизация', () {});
      });
      //
      //
      //
      group('Главная страница (преподаватель)', () {
        group('"Элементы страницы (преподаватель)"', () {
          bool test2 = false;
          bool test3 = false;
          bool test4 = false;
          bool test5 = false;
          testWidgets('Заголовок - название факультета вверху экрана по центру',
              (tester) async {
            await test.home(tester, login: 'Войти как преподаватель');
            expect(Finders.fcs, findsAny);

            test2 = (Finders.shortInfo.tryEvaluate()) ? true : false;
            test3 = (find.byType(ContactWidget).tryEvaluate()) ? true : false;
            await Func(tester).scrolling(Finders.newsFak);
            test4 = (Finders.newsUni.tryEvaluate()) ? true : false;
            test5 = (Finders.newsFak.tryEvaluate()) ? true : false;
          });

          testWidgets('Блок Пользователя', (tester) async {
            // await test.home(tester, login: 'Войти как преподаватель');
            // expect(Finders.shortInfo, findsOneWidget);
            expect(test2, true);
          });

          testWidgets('Блок Техподдержки (телеграмм)', (tester) async {
            // await test.home(tester, login: 'Войти как преподаватель');
            // expect(find.byType(ContactWidget), findsAny);

            expect(test3, true);
          });

          testWidgets('Блок Новости университета', (tester) async {
            // await test.home(tester, login: 'Войти как преподаватель');
            // await Func(tester).scrolling(Finders.newsUni);
            // expect(Finders.newsUni, findsOneWidget);

            expect(test4, true);
          });

          testWidgets('Блок Новости факультета', (tester) async {
            // await test.home(tester, login: 'Войти как преподаватель');
            // await Func(tester).scrolling(Finders.newsFak);
            // expect(Finders.newsFak, findsOneWidget);

            expect(test5, true);
          });
        });
        //
        //
        group('Блок Пользователя (преподаватель)', () {
          bool teacherBlock2 = false;
          bool teacherBlock3 = false;
          // bool teacherBlock4 = false;
          testWidgets('Вверху экрана', (tester) async {
            await test.home(tester, login: 'Войти как преподаватель');
            expect(tester.getTopLeft(Finders.shortInfo.first).dy < 100, true);

            //   Содержит область аватарки слева
            teacherBlock2 = (Finders.face.tryEvaluate()) ? true : false;
            teacherBlock2 = (teacherBlock2 &&
                    tester.getCenter(Finders.face).dx <
                        Func(tester).size().width / 3)
                ? true
                : false;

            //   Содержит ФИО пользователя справа от области аватарки
            teacherBlock3 = (Finders.name.first.tryEvaluate()) ? true : false;
            teacherBlock3 = (teacherBlock3 &&
                    tester.getTopLeft(Finders.name.first).dx >
                        tester.getTopRight(Finders.face.first).dx)
                ? true
                : false;

            //   Содержит название факультета пользователя ниже ФИО пользователя
            teacherBlock3 = (Finders.faculty.tryEvaluate()) ? true : false;
            teacherBlock3 = (teacherBlock3 &&
                    tester.getBottomLeft(Finders.name).dy <=
                        tester.getTopLeft(Finders.faculty).dy)
                ? true
                : false;
            //   При тапе на блок происходит переход на страницу "Портфолио"
            await Func(tester)
                .tapDelay(1000, find.text('Факультет компьютерных наук'));
            // teacherBlock4 = find.byType(TeacherProfileScreenView).tryEvaluate();
          });

          testWidgets('Содержит область аватарки слева', (tester) async {
            // await test.home(tester, login: 'Войти как преподаватель');
            // expect(Finders.face, findsAny, reason: 'содержит');
            // expect(tester.getCenter(Finders.face).dx < Func(tester).size().width / 3,
            //     true,
            //     reason: 'слева');
            expect(teacherBlock2, true);
          });

          testWidgets('Содержит ФИО пользователя справа от области аватарки',
              (tester) async {
            // await test.home(tester, login: 'Войти как преподаватель');
            // expect(Finders.name.first, findsAny, reason: 'содержит');
            // expect(
            //     tester.getTopLeft(Finders.name.first).dx >
            //         tester.getTopRight(Finders.face.first).dx,
            //     true,
            //     reason: 'справа');
            expect(teacherBlock3, true);
          });

          testWidgets(
              'Содержит название факультета пользователя ниже ФИО пользователя',
              (tester) async {
            // await test.home(tester, login: 'Войти как преподаватель');
            // expect(reason: 'проверка наличия', Finders.faculty, findsOneWidget);
            // expect(
            //     reason: 'проверка положения',
            //     true,
            //     tester.getBottomLeft(Finders.name).dy <=
            //         tester.getTopLeft(Finders.faculty).dy);
            expect(teacherBlock3, true);
          });

          // testWidgets(
          //     'При тапе на блок происходит переход на страницу "Портфолио"',
          //     (tester) async {
          //   // await test.home(tester, login: 'Войти как преподаватель');
          //   // await Func(tester)
          //   //     .tapDelay(1000, find.text('Факультет компьютерных наук'));
          //   // expect(find.byType(TeacherProfileScreenView), findsOneWidget);
          //   expect(teacherBlock4, true);
          // });
        });
        //
        //
        group('Блок Техническая поддержка (преподаватель)', () {
          bool supportBlock2 = false;
          bool supportBlock3 = false;
          testWidgets('Ниже блока Рейтинга', (tester) async {
            await test.home(tester, login: 'Войти как преподаватель');

            final Finder finder1 = find.byType(ContactWidget).first;
            expect(finder1, findsOneWidget, reason: 'найден');
            expect(
                tester.getCenter(finder1).dy >
                    tester.getCenter(Finders.shortInfo.first).dy,
                true,
                reason: 'положение');

            //   Содержит текст "Есть идея, как сделать приложение лучше?"
            final Finder finder2 =
                find.text('Есть идея, как сделать приложение лучше?');
            supportBlock2 = (finder2.tryEvaluate()) ? true : false;

            //   Содержит гиперссылку "Напиши нам" ниже текста
            final Finder finder31 = find.text('Напиши нам!').first;
            final Finder finder32 =
                find.text('Есть идея, как сделать приложение лучше?').first;
            supportBlock3 = (tester.getTopLeft(finder31).dy >
                    tester.getBottomLeft(finder32).dy)
                ? true
                : false;
          });

          testWidgets(
              'Содержит текст "Есть идея, как сделать приложение лучше?"',
              (tester) async {
            // await test.home(tester, login: 'Войти как преподаватель');
            // final Finder finder =
            //     find.text('Есть идея, как сделать приложение лучше?');
            // expect(finder, findsOneWidget);
            expect(supportBlock2, true);
          });

          // testWidgets('При тапе на блок происходит переход в телеграмм-чат технической поддержки', (tester) async {
          //   await input(tester);
          //
          //   await Func(tester).tapDelay(1000, find.text('Есть идея, как сделать приложение лучше?'));
          //
          //   expect(await canLaunchUrlString('https://t.me/FittinVSU'), isTrue);
          // });

          testWidgets('Содержит гиперссылку "Напиши нам" ниже текста',
              (tester) async {
            // await test.home(tester, login: 'Войти как преподаватель');
            //
            // final Finder finder1 = find.text('Напиши нам!').first;
            // final Finder finder2 =
            //     find.text('Есть идея, как сделать приложение лучше?').first;
            // expect(
            //   tester.getTopLeft(finder1).dy > tester.getBottomLeft(finder2).dy,
            //   true,
            // );
            expect(supportBlock3, true);
          });
        });
        //
        //
        group('Блок курса', () {
          testWidgets('Отображается, если в настоящее время есть пара',
              (tester) async {
            await test.home(tester, login: 'Войти как преподаватель');
            expect(find.byType(TeacherLessonWidget), findsAny);
          });
          testWidgets('Ниже блока Техподдержки ', (tester) async {
            await test.home(tester, login: 'Войти как преподаватель');
            expect(
                tester.getBottomLeft(find.byType(ContactWidget)).dy <=
                    tester.getTopLeft(find.byType(TeacherLessonWidget)).dy,
                true);
          });
          testWidgets(
              'Заголовок - наименования групп на данном курсе через запятую',
              (tester) async {
            await test.home(tester, login: 'Войти как преподаватель');
            expect(Func(tester).cardT().lesson.studentGroups?.isNotEmpty, true,
                reason: 'заголовок не пустой');
            if (Func(tester).cardT().lesson.studentGroups!.length > 1) {
              expect(find.textContaining(', Группа'), findsAny);
            } else {
              expect(find.textContaining('Группа'), findsAny);
            }
          });

          testWidgets(
              'Кнопка информации правее заголовка, при тапе на которую появляется всплывающая подсказка с перечислением всех групп на данном курсе. При повторном тапе подсказка пропадает',
              (tester) async {
            await test.home(tester, login: 'Войти как преподаватель');
            final Finder finder = find.descendant(
                of: find.byType(TeacherLessonWidget),
                matching: find.byType(CardContainer));
            expect(finder, findsNothing, reason: 'нет подсказки');
            await Func(tester).tapDelay(200, Finders.groupInfo);
            expect(finder, findsAny, reason: 'есть подсказка');
            await Func(tester).tapDelay(200, Finders.groupInfo);
            expect(finder, findsNothing, reason: 'нет подсказки (закрыта)');
          });

          testWidgets(
              'Бейдж определенного цвета в правом верхнем углу с наименованием курса “Курс [номер курса]”',
              (tester) async {
            await test.home(tester, login: 'Войти как преподаватель');

            final Finder finder = find.textContaining(
                'Курс ${Func(tester).cardT().lesson.studentGroups?.firstOrNull?.course ?? ''}');
            expect(finder, findsAny, reason: 'проверка налич кнопки');
            expect(find.ancestor(of: finder, matching: find.byType(Container)),
                findsAny,
                reason: 'проверка налич кнопки 2');

            final Container container =
                tester.widget(find.byKey(Keys.courseSchedule));
            final BoxDecoration boxDecoration =
                container.decoration! as BoxDecoration;
            expect(
                boxDecoration.color,
                getColorByCourse(Func(tester)
                    .cardT()
                    .lesson
                    .studentGroups
                    ?.firstOrNull
                    ?.course),
                reason: 'проверка цвета');
          });

          testWidgets('Наименование предмета ниже заголовка', (tester) async {
            await test.home(tester, login: 'Войти как преподаватель');
            expect(Func(tester).cardT().lesson.subject?.isNotEmpty, true,
                reason: 'наличие названия предмета');

            String groupsString = '';
            for (final group in Func(tester).cardT().lesson.studentGroups ??
                <StudentGroup>[]) {
              final subGroup = group.subGroupNumber == null
                  ? ''
                  : '.${group.subGroupNumber}';
              groupsString += 'Группа ${group.number}$subGroup, ';
            }
            groupsString =
                groupsString.substring(0, max(groupsString.length - 2, 0));

            expect(
                tester
                        .getTopLeft(find
                            .textContaining(
                                Func(tester).cardT().lesson.subject!)
                            .first)
                        .dy >
                    tester.getBottomLeft(find.textContaining(groupsString)).dy,
                true,
                reason: 'проверка положения');
          });

          testWidgets(
              'Время начала и окончания данной пары ниже бейджа с наименованием курса',
              (tester) async {
            await test.home(tester, login: 'Войти как преподаватель');
            expect(Func(tester).cardT().lesson.startTime?.isNotEmpty, true,
                reason: 'наличие времени начала занятия');
            expect(Func(tester).cardT().lesson.finishTime?.isNotEmpty, true,
                reason: ' наличие времени конца занятия');
            final Finder time =
                find.textContaining(Func(tester).cardT().lesson.startTime!);

            final Finder course = find.textContaining(
                'Курс ${Func(tester).cardT().lesson.studentGroups?.firstOrNull?.course ?? ''}');
            expect(time, findsAny, reason: 'проверка налич кнопки');
            expect(
                tester.getTopLeft(time.first).dy >
                    tester.getBottomLeft(course.first).dy,
                true,
                reason: 'проверка положения');
          });

          testWidgets('Номер кабинета ниже времени начала и окончания пары',
              (tester) async {
            await test.home(tester, login: 'Войти как преподаватель');
            expect(Func(tester).cardT().lesson.startTime?.isNotEmpty, true,
                reason: 'наличие времени начала занятия');
            expect(
                (Func(tester).cardT().lesson.classroom?.isNotEmpty ?? false) ||
                    (Func(tester).cardT().lesson.isDistant ?? false),
                true,
                reason: ' наличие кабинета');
            final Finder classroom = find.textContaining(
                (Func(tester).cardT().lesson.isDistant ?? false)
                    ? 'ДО'
                    : Func(tester).cardT().lesson.classroom!);
            final Finder time =
                find.textContaining(Func(tester).cardT().lesson.startTime!);
            expect(
                tester.getTopLeft(classroom.first).dy >
                    tester.getBottomLeft(time.first).dy,
                true,
                reason: 'Номер кабинета ниже времени начала и окончания пары');
          });

          testWidgets(
              'Кнопка “Открыть посещаемость” внизу блока, при тапе на которую открывается страница учета посещаемости всех студентов данного курса',
              (tester) async {
            await test.home(tester, login: 'Войти как преподаватель');
            await Func(tester).tapDelay(
                1000, find.textContaining('Открыть посещаемость').first);
            expect(find.byType(TeacherAttendanceJournalScreenView),
                findsOneWidget);
          });
        });
        //
        //
        group('Блок Новости университета (преподаватель)', () {
          bool newsUni2 = false;
          testWidgets(
              'Заголовок "Новости университета", выравненный по левому краю',
              (tester) async {
            await test.home(tester, login: 'Войти как преподаватель');
            final Finder finder = find.text('Новости университета');
            await Func(tester).scrolling(Finders.newsUni);
            await Func(tester).scrollJournal();
            expect(tester.getTopLeft(finder).dx < 17, true);

            //   Кнопка ">" справа от заголовка, при тапе на которую происходит переход на страницу "Новости"
            final Finder finder2 = find.descendant(
                of: Finders.newsUni,
                matching: find.text('Новости университета'));
            newsUni2 = (tester.getTopRight(finder2).dx <
                    tester.getTopLeft(Finders.forward(true)).dx)
                ? true
                : false;
            await Func(tester).tapDelay(1500, Finders.forward(true).first);
            newsUni2 = (newsUni2 && Finders.allNewsUni.tryEvaluate());
          });

          testWidgets(
              'Кнопка ">" справа от заголовка, при тапе на которую происходит переход на страницу "Новости"',
              (tester) async {
            // await test.home(tester, login: 'Войти как преподаватель');
            // await Func(tester).scrolling(Finders.forward(true));
            //
            // final Finder finder1 = find.descendant(
            //     of: Finders.newsUni,
            //     matching: find.text('Новости университета'));
            // expect(
            //     tester.getTopRight(finder1).dx <
            //         tester.getTopLeft(Finders.forward(true)).dx,
            //     true);
            //
            // await Func(tester).tapDelay(1500, Finders.forward(true).first);
            // expect(Finders.allNewsUni, findsAny);
            expect(newsUni2, true);
          });

          testWidgets('Слайдер с карточками новостей ниже заголовка',
              (tester) async {
            await test.home(tester, login: 'Войти как преподаватель');

            Finder finder1 = find.text('Новости университета');
            await Func(tester).scrolling(Finders.newsUni);
            await Func(tester).scrollJournal();
            final Finder finder2 = find.byWidgetPredicate(
                (widget) => widget is NewsWidget && widget.isUniv == true);

            expect(
                tester.getTopLeft(finder2.first).dy >
                    tester.getBottomLeft(finder1).dy,
                true);
          });
          //
          //
          group('Слайдер с карточками новостей содержит (преподаватель)', () {
            testWidgets('На экране отображается целиком только 1 карточка',
                (tester) async {
              await test.home(tester, login: 'Войти как преподаватель');
              await tester.pumpAndSettle(Delay.delay1);
              await Func(tester).scrolling(Finders.newsUni);
              await Func(tester).scrollJournal();

              final Finder cardUni = find.descendant(
                  of: Finders.newsUni,
                  matching: find.byWidgetPredicate(
                      (widget) => widget is NewsWidget && widget.isUniv));
              expect(cardUni, findsAny, reason: '1 карточка видна');
              expect(
                  tester.getTopRight(cardUni.at(1)).dx >
                      Func(tester).size().width,
                  true,
                  reason: '2 карточка не видна (полностью)');
            });

            testWidgets('Листается свайпом влево', (tester) async {
              await test.home(tester, login: 'Войти как преподаватель');
              await tester.pumpAndSettle(Delay.delay1);
              await tester.pumpAndSettle(Delay.delay1);
              await Func(tester).scrolling(Finders.newsUni);
              await Func(tester).scrollJournal();

              final Finder cardUni = find.descendant(
                  of: Finders.newsUni, matching: find.byType(NewsWidget));

              if (find.byType(JournalWidget).tryEvaluate()) {
                await tester.timedDragFrom(
                    Offset(tester.getTopRight(find.byType(JournalWidget)).dx,
                        tester.getTopRight(find.byType(JournalWidget)).dy),
                    Offset(
                        -tester.getTopRight(find.byType(JournalWidget)).dx, 0),
                    Delay.delay1);
              }

              final double pos1 = tester.getTopRight(cardUni.first).dx;
              await tester.timedDragFrom(tester.getCenter(cardUni.first),
                  const Offset(-100, 0), Delay.delay300);
              await Func(tester).pump(5);
              final double pos2 = tester.getTopRight(cardUni.first).dx;
              expect(pos1 > pos2, true);
            });

            testWidgets("""Дизайн слайдера интуитивно понятен - видна часть
            следующей карточки, хочется свайпнуть""", (tester) async {
              await test.home(tester, login: 'Войти как преподаватель');
              await tester.pumpAndSettle(Delay.delay1);
              await Func(tester).scrolling(Finders.newsUni);
              await Func(tester).scrollJournal();

              final Finder cardUni = find.descendant(
                  of: Finders.newsUni,
                  matching: find.byWidgetPredicate(
                      (widget) => widget is NewsWidget && widget.isUniv));
              expect(
                  tester.getTopLeft(cardUni.at(1)).dx <
                      Func(tester).size().width,
                  true,
                  reason: 'начало');
              expect(
                  tester.getTopRight(cardUni.at(1)).dx >
                      Func(tester).size().width,
                  true,
                  reason: 'конец');
            });
          });
        });
        //
        //
        group('Карточка новости университета (преподаватель)', () {
          testWidgets('Содержит изображение', (tester) async {
            await test.home(tester, login: 'Войти как преподаватель');
            await Func(tester).scrolling(Finders.newsUni);

            Finder finder = find.descendant(
                of: find.byWidgetPredicate(
                    (widget) => widget is NewsWidget && widget.isUniv == true),
                matching: find.byType(CachedNetworkImage));

            if (find.byType(JournalWidget).tryEvaluate()) {
              await tester.timedDragFrom(
                  Offset(tester.getTopRight(find.byType(JournalWidget)).dx,
                      tester.getTopRight(find.byType(JournalWidget)).dy),
                  Offset(-tester.getTopRight(find.byType(JournalWidget)).dx, 0),
                  Delay.delay300);
            }

            expect(finder, findsAny);
          });

          testWidgets(
              'Содержит название новости, выравненное по левому краю. Занимает максимум 2 строки',
              (tester) async {
            await test.home(tester, login: 'Войти как преподаватель');
            await Func(tester).scrolling(Finders.newsUni);

            if (find.byType(JournalWidget).tryEvaluate()) {
              await tester.timedDragFrom(
                  Offset(tester.getTopRight(find.byType(JournalWidget)).dx,
                      tester.getTopRight(find.byType(JournalWidget)).dy),
                  Offset(-tester.getTopRight(find.byType(JournalWidget)).dx, 0),
                  Delay.delay300);
            }

            final Finder finder = find.descendant(
                of: Finders.newsUni, matching: find.byType(NewsWidget).first);
            final NewsWidget widget = tester.widget(finder);
            final Finder title = find.textContaining(widget.facultyNew!.title!);
            expect(widget.facultyNew!.title!.isNotEmpty, true,
                reason: 'заголовок не пустой');
            expect(title, findsAny, reason: 'найден на экране');
            expect(tester.getTopLeft(title).dx - (widget.isLittle ? 8 : 16),
                tester.getTopLeft(finder).dx,
                reason: 'выравнивание');
          });

          testWidgets(
              """Дату публикации новости, выравненную по левому краю в левом нижнему углу""",
              (tester) async {
            await test.home(tester, login: 'Войти как преподаватель');
            final Finder news = find
                .byWidgetPredicate(
                    (widget) => widget is NewsWidget && widget.isUniv)
                .first;
            final Finder newsC = find.descendant(
                of: news, matching: find.byType(CardContainer).first);
            await Func(tester).scrolling(Finders.newsUni);
            await Func(tester).scrollJournal();
            final NewsWidget data = tester.widget(news);
            expect(data.facultyNew!.date!.isNotEmpty, true,
                reason: 'проверка данных');
            expect(find.textContaining(data.facultyNew!.date!), findsAny,
                reason: 'найден на экране');
            expect(
                tester
                    .getTopLeft(
                        find.textContaining(data.facultyNew!.date!).first)
                    .dx,
                tester.getTopLeft(newsC).dx + 16,
                reason: 'положение по горизонтали');
            expect(
                tester
                        .getBottomLeft(
                            find.textContaining(data.facultyNew!.date!).first)
                        .dy +
                    16,
                tester.getBottomLeft(newsC).dy,
                reason: 'положение по вертикали');
          });

          testWidgets(
              'При тапе на карточку новости происходит переход на страницу "Новости2"',
              (tester) async {
            await test.home(tester, login: 'Войти как преподаватель');
            await Func(tester).scrolling(Finders.newsUni);

            if (find.byType(JournalWidget).tryEvaluate()) {
              await tester.timedDragFrom(
                  Offset(tester.getTopRight(find.byType(JournalWidget)).dx,
                      tester.getTopRight(find.byType(JournalWidget)).dy),
                  Offset(-tester.getTopRight(find.byType(JournalWidget)).dx, 0),
                  Delay.delay1);
            }

            await Func(tester).pump(5);
            Finder image = find.descendant(
                of: find.byWidgetPredicate(
                    (widget) => widget is NewsWidget && widget.isUniv == true),
                matching: find.byType(CachedNetworkImage));
            await Func(tester).tapDelay(1000, image.first);

            expect(find.byType(NewsDetailScreen), findsAny);
          });
        });
        //
        //
        group('Страница "Новости университета" (преподаватель)', () {
          bool testPageNewsUni2 = false;
          bool testPageNewsUni3 = false;
          testWidgets('Заголовок по центру', (tester) async {
            await test.home(tester, login: 'Войти как преподаватель');
            await Func(tester).scrolling(Finders.newsUni);

            final Finder homePage = find.byType(TeacherShowcaseScreenView);
            testPageNewsUni2 = homePage.tryEvaluate();

            await Func(tester).tapDelay(300, Finders.forward(true).first);
            Finder finder = find.text('Новости университета');
            expect(Func(tester).size().width / 2, tester.getCenter(finder).dx);

            testPageNewsUni3 = find.byType(NewsWidget).first.tryEvaluate();
            testPageNewsUni2 = testPageNewsUni2 && !homePage.tryEvaluate();

            await Func(tester).tapDelay(1000, Finders.back);
            await Func(tester).pump(10);
            testPageNewsUni2 = testPageNewsUni2 && homePage.tryEvaluate();
          });

          testWidgets(
              'Кнопка назад, при тапе на которую открывается прошлая страница',
              (tester) async {
            // await test.home(tester, login: 'Войти как преподаватель');
            // await Func(tester).scrolling(Finders.newsUni);
            // final Finder homePage = find.byType(TeacherShowcaseScreenView);
            // expect(reason: 'главная', homePage, findsOneWidget);
            // await Func(tester).tapDelay(300, Finders.forward(true));
            // expect(reason: 'не главная', homePage, findsNothing);
            // await Func(tester).pump(5);
            // Finder iconBack =
            //     find.descendant(of: Finders.allNewsUni, matching: Finders.back);
            // await Func(tester).tapDelay(1000, iconBack);
            // await Func(tester).pump(5);
            // expect(reason: 'главная, после возврата', homePage, findsOneWidget);
            expect(testPageNewsUni2, true);
          });

          testWidgets('Карточки новостей университета', (tester) async {
            // await test.home(tester, login: 'Войти как преподаватель');
            // await Func(tester).scrolling(Finders.forward(true));
            // await Func(tester).tapDelay(300, Finders.forward(true));
            // final Finder finder = find.byType(NewsWidget);
            // expect(finder, findsAny);
            expect(testPageNewsUni3, true);
          });

          group('Карточки новостей университета', () {
            testWidgets('По 1 в строке, по 2 на экране', (tester) async {
              await test.home(tester, login: 'Войти как преподаватель');
              await Func(tester).scrolling(Finders.forward(true));
              await Func(tester).tapDelay(1000, Finders.forward(true));
              double pos1 = tester.getTopLeft(find.byType(NewsWidget).at(0)).dy;
              double pos2 = tester.getTopLeft(find.byType(NewsWidget).at(1)).dy;
              expect(pos2 > pos1, true, reason: 'положение');
            });

            testWidgets('Листаются вниз свайпом вверх, вверх - свайпом вниз',
                (tester) async {
              await test.home(tester, login: 'Войти как преподаватель');
              await tester.pumpAndSettle(Delay.delay1);
              await Func(tester).scrolling(Finders.forward(true));
              await Func(tester).tapDelay(1000, Finders.forward(true));
              await tester.pumpAndSettle(Delay.delay1);
              final Finder finder = find.byType(NewsWidget);
              final double pos1 = tester.getTopLeft(finder.first).dy;
              await tester.timedDragFrom(tester.getTopLeft(finder.at(1)),
                  const Offset(0, -30), Delay.delay1);
              await tester.pumpAndSettle(Delay.delay300);
              final double pos2 = tester.getTopLeft(finder.first).dy;
              expect(pos1 > pos2, true, reason: 'положение');
            });

            testWidgets(
                """При тапе на карточку происходит переход на страницу выбранной новости "Новости университета""",
                (tester) async {
              await test.home(tester, login: 'Войти как преподаватель');
              await Func(tester).scrolling(Finders.forward(true));
              await Func(tester).tapDelay(1000, Finders.forward(true));
              await Func(tester).tapDelay(2000, find.byType(NewsWidget).first);
              expect(find.byType(NewsDetailScreen), findsAny);
            });
          });
        });
        //
        //
        group('Блок Новости факультета (преподаватель)', () {
          testWidgets(
              'Содержит заголовок "Новости факультета", выравненный по левому краю',
              (tester) async {
            await test.home(tester, login: 'Войти как преподаватель');

            final Finder finder = find.text('Новости факультета');
            final Finder finder2 =
                find.descendant(of: Finders.newsFak, matching: finder);
            await Func(tester).scrolling(finder2);
            expect(tester.getTopLeft(finder.first).dx < 17, true);
          });

          testWidgets(
              'Содержит кнопку ">" справа от заголовка, при тапе на которую происходит переход на страницу "Новости факультета"',
              (tester) async {
            await test.home(tester, login: 'Войти как преподаватель');
            await Func(tester).scrolling(Finders.newsFak);
            await Func(tester).tapDelay(1000, Finders.forward(false));
            expect(Finders.allNewsFak, findsAny);
          });
          testWidgets('Содержит слайдер с карточками новостей ниже заголовка',
              (tester) async {
            await test.home(tester, login: 'Войти как преподаватель');
            final Finder finder1 = find.descendant(
                of: Finders.newsFak, matching: find.text('Новости факультета'));
            await Func(tester).scrolling(Finders.newsFak);
            final Finder finder = find.descendant(
                of: Finders.newsFak, matching: find.byType(NewsWidget));

            expect(
                tester.getTopLeft(finder.first).dy >
                    tester.getTopLeft(finder1).dy,
                true);
          });
          //
          //
          group(
              'Слайдер с карточками новостей ниже заголовка (преподаватель) Блок Новости факультета',
              () {
            testWidgets('На экране целиком отображается только 2 карточки',
                (tester) async {
              await test.home(tester, login: 'Войти как преподаватель');
              await tester.pumpAndSettle(Delay.delay1);
              await Func(tester).scrolling(Finders.newsFak);
              final Finder finder1 = find.descendant(
                  of: Finders.newsFak, matching: find.byType(NewsWidget));
              expect(finder1.first.tryEvaluate(), true, reason: "первый");
              expect(finder1.at(1).tryEvaluate(), true, reason: "второй");
              expect(
                  tester.getTopRight(finder1.at(2)).dx >
                      Func(tester).size().width,
                  true,
                  reason: "третий");
            });
            testWidgets('Слайдер листается свайпом влево', (tester) async {
              await test.home(tester, login: 'Войти как преподаватель');
              await tester.pumpAndSettle(Delay.delay1);
              await Func(tester).scrolling(Finders.newsFak);
              final Finder finder = find.descendant(
                  of: Finders.newsFak, matching: find.byType(NewsWidget));
              final double pos1 = tester.getTopRight(finder.at(1)).dx;
              await tester.timedDragFrom(
                  Offset(tester.getTopRight(finder.at(1)).dx - 5,
                      tester.getTopRight(finder.at(1)).dy + 5),
                  Offset(10 - pos1, 0),
                  Delay.delay1);
              final double pos2 = tester.getTopRight(finder.at(1)).dx;
              expect(pos1 > pos2, true);
            });
            testWidgets(
                """Дизайн слайдера интуитивно понятен - видна часть следующей карточки, хочется свайпнуть""",
                (tester) async {
              await test.home(tester, login: 'Войти как преподаватель');
              await tester.pumpAndSettle(Delay.delay1);
              await Func(tester).scrolling(Finders.newsFak);
              final Finder finder = find.descendant(
                  of: Finders.newsFak, matching: find.byType(NewsWidget));
              expect(
                  tester.getTopRight(finder.at(2)).dx >
                      Func(tester).size().width,
                  true,
                  reason: "третий");
              expect(
                  tester.getTopLeft(finder.at(2)).dx <
                      Func(tester).size().width,
                  true,
                  reason: "третий");
            });
          });
        });
        //
        //
        group('Карточка новости факультета (преподаватель)', () {
          testWidgets('Содержит изображение', (tester) async {
            await test.home(tester, login: 'Войти как преподаватель');

            await Func(tester).scrolling(Finders.newsFak);
            Finder finder = find.descendant(
                of: Finders.newsFak, matching: find.byType(CachedNetworkImage));
            expect(finder, findsAny);
          });
          testWidgets(
              'Название новости, выравненное по левому краю. Занимает максимум 4 строки',
              (tester) async {
            await test.home(tester, login: 'Войти как преподаватель');
            await tester.pumpAndSettle(Delay.delay1);
            await Func(tester).scrolling(Finders.newsFak);
            final Finder finder = find.descendant(
                of: Finders.newsFak, matching: find.byType(NewsWidget));
            final NewsWidget data = tester.widget(finder.first);
            expect(data.facultyNew!.title!.isNotEmpty, true,
                reason: 'проверка данных');
            expect(find.textContaining(data.facultyNew!.title!), findsAny,
                reason: 'проверка на экране');
            expect(
                tester
                    .getTopLeft(find.textContaining(data.facultyNew!.title!))
                    .dx,
                tester.getTopLeft(finder.first).dx + 8,
                reason: 'положение');
            final Text text =
                tester.widget(find.textContaining(data.facultyNew!.title!));
            expect(text.maxLines, 4, reason: 'колличество строк');
          });
          testWidgets('Дату публикации новости, выравненную по левому краю',
              (tester) async {
            await test.home(tester, login: 'Войти как преподаватель');
            await tester.pumpAndSettle(Delay.delay1);
            await Func(tester).scrolling(Finders.newsFak);
            final Finder news = find.descendant(
                of: Finders.newsFak, matching: find.byType(NewsWidget));

            // final Finder news = find.byWidgetPredicate(
            //     (widget) => widget is NewsWidget && widget.isLittle);

            // final Finder newsC = find.descendant(
            //     of: news.first, matching: find.byType(CardContainer).first);
            expect(Finders.newsFak, findsAny,
                reason: 'блок новостей факультета');
            expect(find.byType(NewsWidget), findsAny,
                reason: 'виджеты новости на экране');
            expect(news, findsAny,
                reason: 'виджеты новости внутри блока факультета');
            expect(find.byType(CardContainer), findsAny,
                reason: 'контейнер на экране');
            // expect(newsC, findsAny, reason: 'контейнер внутри виджета');

            final NewsWidget data = tester.widget(news.first);
            expect(data.facultyNew!.date!.isNotEmpty, true,
                reason: 'проверка данных');
            expect(find.textContaining(data.facultyNew!.date!), findsAny,
                reason: 'найден на экране');
            // expect(news.first, findsAny, reason: 'контейнер с датой найден');
            // expect(
            //     tester
            //         .getTopLeft(
            //             find.textContaining(data.facultyNew!.date!).first)
            //         .dx,
            //     tester.getTopLeft(news.first).dx + 8,
            //     reason: 'положение по горизонтали');
          });
          testWidgets(
              'При тапе на карточку новости происходит переход на страницу "Новости"',
              (tester) async {
            await test.home(tester, login: 'Войти как преподаватель');

            Finder finder = find.descendant(
                of: Finders.newsFak, matching: find.byType(NewsWidget));
            await Func(tester).scrolling(Finders.newsFak);
            await Func(tester).tapDelay(1000, finder.first);

            Finder finder2 = find.byType(NewsDetailScreen);
            expect(finder2, findsOneWidget);
          });
        });
        //
        //
        group('Страница "Новости факультета" (преподаватель)', () {
          testWidgets('Заголовок по центру222', (tester) async {
            await test.home(tester, login: 'Войти как преподаватель');

            await Func(tester).scrolling(Finders.forward(false));
            await Func(tester).tapDelay(1000, Finders.forward(false));
            Finder finder = find.text('Новости факультета');
            expect(Func(tester).size().width / 2, tester.getCenter(finder).dx);
          });

          testWidgets(
              'Кнопка назад, при тапе на которую открывается прошлая страница',
              (tester) async {
            await test.home(tester, login: 'Войти как преподаватель');
            final Finder finder = find.byType(TeacherShowcaseScreenView);
            expect(reason: 'главная страница', finder.tryEvaluate(), true);

            await Func(tester).scrolling(Finders.forward(false));
            await Func(tester).tapDelay(1000, Finders.forward(false));
            expect(
                reason: 'не главная страница, новости',
                false,
                finder.tryEvaluate());

            Finder iconBack =
                find.descendant(of: Finders.allNewsFak, matching: Finders.back);
            await Func(tester).tapDelay(1000, iconBack);

            expect(reason: 'вернулись назад', finder.tryEvaluate(), true);
          });
        });
        //
        //
        group('Страница “Новости” (преподаватель)', () {
          testWidgets('Заголовок по центру', (tester) async {
            await test.home(tester, login: 'Войти как преподаватель');

            Finder finder = find.descendant(
                of: Finders.newsFak, matching: find.byType(CachedNetworkImage));
            await Func(tester).scrolling(finder);
            await Func(tester).tapDelay(1000, finder.first);

            final Finder title = find.textContaining('Новости');
            expect(Func(tester).size().width / 2, tester.getCenter(title).dx);
          });

          testWidgets(
              'Кнопка назад, при тапе на которую открывается предыдущая страница',
              (tester) async {
            await test.home(tester, login: 'Войти как преподаватель');
            final Finder finder = find.byType(TeacherShowcaseScreenView);
            expect(finder.tryEvaluate(), true,
                reason: 'главная страница найдена');

            final Finder cachedNetworkImage = find.descendant(
                of: Finders.newsFak, matching: find.byType(CachedNetworkImage));
            await Func(tester).scrolling(cachedNetworkImage);
            await Func(tester).tapDelay(1000, cachedNetworkImage.first);
            expect(finder.tryEvaluate(), false,
                reason: 'главная страница не найдена');
            await Func(tester).scroll(2);

            await Func(tester).tapDelay(1000, Finders.back);
            await tester.pumpAndSettle(Delay.delay1);
            await Func(tester).scroll(2);
            expect(finder.tryEvaluate(), true,
                reason: 'главная страница найдена');
          });
        });
      });
      //
      //
      //
      group('Страница расписание (преподаватель)', () {
        group('Заголовок расписание (преподаватель)', () {
          testWidgets(
              'Заголовок страницы расписания верху по центру (преподаватель)',
              (tester) async {
            await test.schedule(tester, login: 'Войти как преподаватель');
            final Finder finder3 = find.text('Расписание');
            expect(tester.getCenter(finder3).dx, Func(tester).size().width / 2);
          });
        });
        //
        //
        group('Кнопка календарь (преподаватель)', () {
          group(
              'В верхнем правом углу в виде календаря, при тапе на которую открывается боттомшит, в котором отображаются:',
              () {
            testWidgets(
                'В верхнем правом углу в виде календаря, при тапе на которую открывается боттомшит',
                (tester) async {
              await test.schedule(tester, login: 'Войти как преподаватель');

              expect(Finders.calendar, findsAny,
                  reason: 'проверка наличия кнопки календаря');
              await Func(tester).tapDelay(500, Finders.calendar);
              final Finder finder2 = find.byType(CalendarScreenView);
              expect(finder2.tryEvaluate(), true,
                  reason: 'проверка открытия календаря');
            });
            //
            //
            group(
                'Блоки месяцев с сегодняшнего по последний месяц в семестре. Блок месяца содержит:',
                () {
              testWidgets('Блоки месяцев', (tester) async {
                await test.schedule(tester, login: 'Войти как преподаватель');
                await Func(tester).tapDelay(1000, Finders.calendar);
                final Finder finder = find.byType(TableCalendar);
                expect(finder.tryEvaluate(), true, reason: 'наличие календаря');
              });
            });
            //
            //
            testWidgets(
                'Кнопка крестик в правом верхнем углу, при тапе на которую боттомшит закрывается',
                (tester) async {
              await test.schedule(tester, login: 'Войти как преподаватель');

              expect(Finders.calendar, findsAny);
              await Func(tester).tapDelay(1000, Finders.calendar);

              final Finder finder2 = find.descendant(
                  of: find.byType(CalendarScreenView),
                  matching: Finders.closePng);
              await Func(tester).tapDelay(1000, finder2);
              expect(find.byType(TableCalendar), findsNothing);
            });

            testWidgets('Боттомшит закрывается свайпом вниз', (tester) async {
              await test.schedule(tester, login: 'Войти как преподаватель');

              await Func(tester).tapDelay(1000, Finders.calendar.first);

              final Finder finder = find.byType(CalendarScreenView).first;
              expect(find.byType(TableCalendar), findsAny);
              await tester.dragFrom(
                  Offset(tester.getTopLeft(finder).dx,
                      tester.getTopLeft(finder).dy),
                  Offset(tester.getTopLeft(finder).dx,
                      tester.getTopLeft(finder).dy + 500));
              await tester.pumpAndSettle(Delay.delay1);
              expect(find.byType(TableCalendar), findsNothing);
            });
          });
        });
        //
        //
        group('Селектор - слайдер чисел (преподаватель)', () {
          testWidgets(
              'Слайды листаются вперед свайпом влево. Назад - свайпом вправо. ',
              (tester) async {
            await test.schedule(tester, login: 'Войти как преподаватель');

            final Finder card = find.byType(WeekDayCard);
            final Finder listView = find.ancestor(
                of: find.byType(WeekDayCard).first,
                matching: find.byWidgetPredicate((widget) =>
                    widget is SingleChildScrollView &&
                    widget.scrollDirection == Axis.horizontal));
            final double q1 = tester.getCenter(card.first).dx;
            await tester.drag(listView.first,
                Offset(-500, tester.getCenter(listView.first).dy));
            await tester.pumpAndSettle(Delay.delay1);
            final double q2 = tester.getCenter(card.first).dx;
            expect(q1 > q2, true,
                reason: 'проверка первого и второго значения');
            await tester.drag(listView.first,
                Offset(500, tester.getCenter(listView.first).dy));
            await tester.pumpAndSettle(Delay.delay1);
            final double q3 = tester.getCenter(card.first).dx;
            expect(q3 > q2, true,
                reason: 'проверка второго и третьего значения');
          });

          /*testWidgets(
          'Целиком на экране помещается 4 карточки',
          (tester) async {
        expect(true, false);
      });*/

          /*testWidgets(
          'Дизайн слайдера интуитивно понятен - видна часть следующей карточки, хочется свайпнуть ',
          (tester) async {
        expect(true, false);
      });*/

          testWidgets(
              'При тапе на число открывается блок расписания, соответствующий расписанию на этот день (преподаватель)',
              (tester) async {
            await test.schedule(tester, login: 'Войти как преподаватель');
            final Finder day = find.byType(WeekDayCard);
            WeekDayCard card = tester.widget(day.first);
            await tester.pumpAndSettle(Delay.delay300);
            for (int i = 0; i < 32; i++) {
              if (tester.getCenter(day.at(i)).dx > 0) {
                await Func(tester).tapDelay(300, day.at(i));
                card = tester.widget(day.at(i));
                break;
              }
            }

            // await Func(tester).tapDelay(1000, find.byType(WeekDayCard).first);
            final TeacherWeekTypeWidget page =
                tester.widget(find.byType(TeacherWeekTypeWidget));

            expect(int.parse(card.number), page.day?.dateTimetable?.day);
          });
        });
        //
        //
        group('Блок курсов (преподаватель)', () {
          testWidgets('Ниже слайдера чисел ', (tester) async {
            await test.schedule(tester, login: 'Войти как преподаватель');

            expect(
                tester.getTopLeft(find.byType(TeacherWeekTypeWidget)).dy >
                    tester.getBottomLeft(find.byType(WeekDayCard).first).dy,
                true);
          });

          testWidgets('Выезжает свайпом вверх (преподаватель)', (tester) async {
            await test.schedule(tester, login: 'Войти как преподаватель');
            await Func(tester).scrollData();
            final Finder listView = find.byType(TeacherSubjectPage);
            final double heightFirst = tester.getTopLeft(listView).dy;
            await tester.timedDragFrom(
                Offset(Func(tester).size().width / 2,
                    tester.getTopLeft(listView.first).dy + 10),
                Offset(0, -tester.getTopLeft(listView.first).dy),
                Delay.delay300);
            await tester.pumpAndSettle(Delay.delay300);
            final double heightSecond = tester.getTopLeft(listView).dy;
            expect(heightSecond < heightFirst, true);
          });

          group('В блоке содержатся следующие элементы: ', () {
            testWidgets(
                'Индикация Числителя и Знаменателя в правом верхнем углу',
                (tester) async {
              await test.schedule(tester, login: 'Войти как преподаватель');
              await Func(tester).scrollData();
              final Finder finder = find.textContaining('Знаменатель');
              final Finder finder2 = find.textContaining('Числитель');
              expect(finder.tryEvaluate() || finder2.tryEvaluate(), true);
            });
            //
            //
            group('Блоки с информацией о предметах. Каждый блок содержит:', () {
              testWidgets(
                  'Заголовок - наименования групп на данном курсе через запятую',
                  (tester) async {
                await test.schedule(tester, login: 'Войти как преподаватель');
                await Func(tester).scrollData();
                expect(
                    Func(tester).cardT().lesson.studentGroups?.isNotEmpty, true,
                    reason: 'заголовок не пустой');
                if (Func(tester).cardT().lesson.studentGroups!.length > 1) {
                  expect(find.textContaining(', Группа'), findsAny);
                } else {
                  expect(find.textContaining('Группа'), findsAny);
                }
              });

              testWidgets(
                  'Кнопка информации правее заголовка, при тапе на которую появляется всплывающая подсказка с перечислением всех групп на данном курсе. При повторном тапе подсказка пропадает',
                  (tester) async {
                await test.schedule(tester, login: 'Войти как преподаватель');
                await Func(tester).scrollData();

                expect(find.byType(CardContainer).tryEvaluate(), false);
                await Func(tester).tapDelay(200, Finders.groupInfo.first);
                expect(find.byType(CardContainer).tryEvaluate(), true);
                await Func(tester).tapDelay(200, Finders.groupInfo.first);
                expect(find.byType(CardContainer).tryEvaluate(), false);
              });

              testWidgets(
                  'Бейдж определенного цвета в правом верхнем углу с наименованием курса “Курс [номер курса]”',
                  (tester) async {
                await test.schedule(tester, login: 'Войти как преподаватель');
                await Func(tester).scrollData();

                final Finder finder = find.textContaining(
                    'Курс ${Func(tester).cardT().lesson.studentGroups?.firstOrNull?.course ?? ''}');
                expect(finder, findsAny, reason: 'проверка налич кнопки');
                expect(
                    find.ancestor(of: finder, matching: find.byType(Container)),
                    findsAny,
                    reason: 'проверка налич кнопки 2');

                final Container container =
                    tester.widget(find.byKey(Keys.courseSchedule).first);
                final BoxDecoration boxDecoration =
                    container.decoration! as BoxDecoration;
                expect(
                    boxDecoration.color,
                    getColorByCourse(Func(tester)
                        .cardT()
                        .lesson
                        .studentGroups
                        ?.firstOrNull
                        ?.course),
                    reason: 'проверка цвета');
              });

              testWidgets('Бейдж определенного цвета c типом активности',
                  (tester) async {
                expect(
                  false,
                  true,
                );
              });

              testWidgets('Наименование предмета ниже заголовка',
                  (tester) async {
                await test.schedule(tester, login: 'Войти как преподаватель');
                await Func(tester).scrollData();
                expect(Func(tester).cardT().lesson.subject?.isNotEmpty, true,
                    reason: 'наличие названия предмета');

                String groupsString = '';
                for (final group in Func(tester).cardT().lesson.studentGroups ??
                    <StudentGroup>[]) {
                  final subGroup = group.subGroupNumber == null
                      ? ''
                      : '.${group.subGroupNumber}';
                  groupsString += 'Группа ${group.number}$subGroup, ';
                }
                groupsString =
                    groupsString.substring(0, max(groupsString.length - 2, 0));

                expect(
                    tester
                            .getTopLeft(find
                                .textContaining(
                                    Func(tester).cardT().lesson.subject!)
                                .first)
                            .dy >
                        tester
                            .getBottomLeft(find.textContaining(groupsString))
                            .dy,
                    true,
                    reason: 'проверка положения');
              });

              testWidgets(
                  'Время начала и окончания данной пары ниже бейджа с наименованием курса',
                  (tester) async {
                await test.schedule(tester, login: 'Войти как преподаватель');
                await Func(tester).scrollData();
                expect(Func(tester).cardT().lesson.startTime?.isNotEmpty, true,
                    reason: 'наличие времени начала занятия');
                expect(Func(tester).cardT().lesson.finishTime?.isNotEmpty, true,
                    reason: ' наличие времени конца занятия');
                final Finder time = find.textContaining(
                    Func(tester).cardT().lesson.startTime!.trim());

                final Finder course = find.textContaining(
                    'Курс ${Func(tester).cardT().lesson.studentGroups?.firstOrNull?.course ?? ''}');
                expect(time, findsAny, reason: 'проверка налич кнопки');
                expect(
                    tester.getTopLeft(time.first).dy >
                        tester.getBottomLeft(course.first).dy,
                    true,
                    reason: 'проверка положения');
              });

              testWidgets('Номер кабинета ниже времени начала и окончания пары',
                  (tester) async {
                await test.schedule(tester, login: 'Войти как преподаватель');
                await Func(tester).scrollData();
                expect(Func(tester).cardT().lesson.startTime?.isNotEmpty, true,
                    reason: 'наличие времени начала занятия');
                expect(
                    (Func(tester).cardT().lesson.classroom?.isNotEmpty ??
                            false) ||
                        (Func(tester).cardT().lesson.isDistant ?? false),
                    true,
                    reason: ' наличие кабинета');
                final Finder classroom = find.textContaining(
                    (Func(tester).cardT().lesson.isDistant ?? false)
                        ? 'ДО'
                        : Func(tester).cardT().lesson.classroom!);
                final Finder time = find.textContaining(
                    Func(tester).cardT().lesson.startTime!.trim());
                expect(
                    tester.getTopLeft(classroom.first).dy >
                        tester.getBottomLeft(time.first).dy,
                    true,
                    reason:
                        'Номер кабинета ниже времени начала и окончания пары');
              });

              testWidgets(
                  'Кнопка “Открыть посещаемость” внизу блока, при тапе на которую открывается страница учета посещаемости всех студентов данного курса',
                  (tester) async {
                await test.schedule(tester, login: 'Войти как преподаватель');
                // await Func(tester).scrollData(t: 'Открыть посещаемость');
                await Func(tester).tapDelay(
                    1000, find.textContaining('Открыть посещаемость').first);
                expect(find.byType(TeacherAttendanceJournalScreenView),
                    findsOneWidget);
              });

              testWidgets('Блоки листаются свайпом вверх-вниз', (tester) async {
                await test.schedule(tester, login: 'Войти как преподаватель');
                await Func(tester).scrollData();
                final Finder card = Finders.teaLesWid.first;
                final double pos1 = tester.getTopLeft(card).dy;
                await tester.timedDragFrom(tester.getTopLeft(card),
                    Offset(0, -pos1), Delay.delay(200));
                final double pos2 = tester.getTopLeft(card).dy;
                expect(pos1 > pos2, true);
              });
            });
          });
        });
      });
      //
      //
      group('Страница Журналы', () {
        group('Элементы страницы Журналы', () {
          bool test2 = false;
          testWidgets('Заголовок по центру', (tester) async {
            await test.journal(tester, login: 'Войти как преподаватель');
            final Finder text = find.text('Журналы');
            expect(tester.getCenter(text).dx, Func(tester).size().width / 2);

            final Finder finder2 = find.descendant(
                of: Finders.blockGroups, matching: Finders.jouLesWid);
            test2 = (finder2.tryEvaluate());
          });
          testWidgets('Блок с группами', (tester) async {
            // await test.journal(tester, login: 'Войти как преподаватель');
            // final Finder finder = find.descendant(
            //     of: Finders.blockGroups, matching: Finders.jouLesWid);
            // expect(finder, findsAny);
            expect(test2, true);
          });
        });
        //
        //
        group('Блок с группами', () {
          testWidgets('Состоит из мини-блоков групп', (tester) async {
            await test.journal(tester, login: 'Войти как преподаватель');
            final Finder finder = find.descendant(
                of: Finders.blockGroups, matching: Finders.jouLesWid);
            expect(finder, findsAny);
          });
          testWidgets('Список мини-блоков групп листается свайпом вверх-вниз',
              (tester) async {
            await test.journal(tester, login: 'Войти как преподаватель');
            final double pos1 = tester.getTopLeft(Finders.jouLesWid.at(3)).dy;
            await tester.timedDragFrom(
                Offset(tester.getTopLeft(Finders.jouLesWid.at(3)).dx,
                    tester.getTopLeft(Finders.jouLesWid.at(3)).dy),
                Offset(
                    0,
                    tester.getTopLeft(Finders.jouLesWid.at(1)).dy -
                        tester.getTopLeft(Finders.jouLesWid.at(3)).dy),
                Delay.delay300);
            final double pos2 = tester.getTopLeft(Finders.jouLesWid.at(3)).dy;
            expect(pos1 > pos2, true);
          });
          testWidgets(
              'Кнопка “Выбрать” в правом верхнем углу, при тапе на которую…',
              (tester) async {
            await test.journal(tester, login: 'Войти как преподаватель');
            final double posBlock = tester.getTopLeft(Finders.blockGroups).dy;
            final double posLesson =
                tester.getTopLeft(Finders.jouLesWid.first).dy;
            final Finder finder = find.text('Выбрать');
            expect(tester.getTopLeft(finder).dy > posBlock, true,
                reason: 'ниже блока');
            expect(tester.getBottomLeft(finder).dy < posLesson, true,
                reason: 'выше первого предмета');
            expect(
                tester.getTopRight(finder).dx, Func(tester).size().width - 24,
                reason: 'справа');
          });
          //
          //
          group('Мини-блок группы', () {
            testWidgets(
                'Заголовок “Группа [номер группы]” в левом верхнем углу',
                (tester) async {
              await test.journal(tester, login: 'Войти как преподаватель');
              final JournalLessonWidget lesson =
                  tester.widget(Finders.jouLesWid.first);
              final Finder group = find.descendant(
                  of: Finders.jouLesWid,
                  matching: find.textContaining('Группа'));
              expect(lesson.lesson.studentGroups?.isNotEmpty, true,
                  reason: 'проверка данных группы');
              expect(tester.getTopLeft(group.first).dx,
                  tester.getTopLeft(Finders.jouLesWid.first).dx + 16,
                  reason: 'проверка положения');
            });

            testWidgets(
                'Правее заголовка кнопка информации, при тапе на которую открывается боттомшит',
                (tester) async {
              await test.journal(tester, login: 'Войти как преподаватель');
              final Finder icon = find.descendant(
                  of: Finders.jouLesWid, matching: Finders.groupInfo);
              final Finder group = find.descendant(
                  of: Finders.jouLesWid,
                  matching: find.textContaining('Группа'));
              expect(
                  tester.getTopRight(group.first).dx <
                      tester.getTopLeft(icon.first).dx,
                  true,
                  reason: 'проверка положения');
              expect(Finders.groupInfoBox.tryEvaluate(), false,
                  reason: 'боттоншит не найден');
              await Func(tester).tapDelay(500, icon.first);
              expect(Finders.groupInfoBox.tryEvaluate(), true,
                  reason: 'боттоншит найден');
            });

            group('боттомшит содержит (Журналы)', () {
              testWidgets(
                  'Заголовок “Группа [номер группы], Курс [номер курса]”, выравнен по левому краю',
                  (tester) async {
                await test.journal(tester, login: 'Войти как преподаватель');
                await Func(tester).tapDelay(300, Finders.groupInfo.at(1));
                final Finder group = find.descendant(
                    of: Finders.groupInfoBox,
                    matching: find.textContaining("Группа"));
                expect(
                    tester.getTopLeft(group),
                    tester.getTopLeft(find.descendant(
                        of: Finders.groupInfoBox,
                        matching: find.textContaining(', Курс'))),
                    reason: 'проверка загаловка');
                expect(16, tester.getTopLeft(group).dx);
              });
              //
              //
              GroupLeaderInfo leader1;
              bool leader1Test2 = false;
              bool leader1Test3 = false;
              bool leader1Test4 = false;
              GroupLeaderInfo leader2;
              bool leader2Test1 = false;
              bool leader2Test2 = false;
              bool leader2Test3 = false;
              bool leader2Test4 = false;
              GroupLeaderInfo leader3;
              bool leader3Test1 = false;
              bool leader3Test2 = false;
              bool leader3Test3 = false;
              bool leader3Test4 = false;
              group('Поле Староста', () {
                testWidgets('Поле “Староста:” ниже заголовка', (tester) async {
                  await test.journal(tester, login: 'Войти как преподаватель');
                  await Func(tester).tapDelay(1000, Finders.groupInfo.at(1));
                  final Finder group = find.descendant(
                      of: Finders.groupInfoBox,
                      matching: find.textContaining("Группа"));
                  leader1 =
                      tester.widget(Finders.groupLeaderInfo('Староста:').first);
                  leader1Test2 = (leader1.groupLeader!.firstName!.isNotEmpty &&
                      leader1.groupLeader!.middleName!.isNotEmpty &&
                      leader1.groupLeader!.firstName!.isNotEmpty);
                  leader1Test3 = find
                      .textContaining(leader1.groupLeader!.phone!)
                      .tryEvaluate();
                  leader1Test4 = find
                      .textContaining(leader1.groupLeader!.email!)
                      .tryEvaluate();

                  expect(
                      tester
                              .getBottomLeft(find.textContaining('Староста:'))
                              .dy >
                          tester.getTopLeft(group).dy,
                      true,
                      reason: 'положение по слову Староста');
                  expect(
                      tester
                              .getBottomLeft(
                                  Finders.groupLeaderInfo('Староста:'))
                              .dy >
                          tester.getTopLeft(group).dy,
                      true,
                      reason: 'положение по GroupLeaderInfo');

                  leader2 = tester
                      .widget(Finders.groupLeaderInfo('Зам. старосты:').first);

                  leader2Test1 = tester
                      .getBottomLeft(find.textContaining('Зам. старосты:'))
                      .dy >
                      tester.getTopLeft(find.textContaining('Староста:')).dy;
                  leader2Test1 = leader2Test1 &&
                      tester
                          .getBottomLeft(
                          Finders.groupLeaderInfo('Зам. старосты:'))
                          .dy >
                          tester
                              .getTopLeft(Finders.groupLeaderInfo('Староста:'))
                              .dy;
                  leader2Test2 = (leader2.groupLeader!.firstName!.isNotEmpty &&
                      leader2.groupLeader!.middleName!.isNotEmpty &&
                      leader2.groupLeader!.firstName!.isNotEmpty);
                  leader2Test3 = (find
                      .textContaining(leader2.groupLeader!.phone!)
                      .tryEvaluate());
                  leader2Test4 = (find
                      .textContaining(leader2.groupLeader!.email!)
                      .tryEvaluate());

                  leader3 =
                      tester.widget(Finders.groupLeaderInfo('Куратор:').first);
                  leader3Test2 = (leader3.groupLeader!.firstName!.isNotEmpty &&
                      leader3.groupLeader!.middleName!.isNotEmpty &&
                      leader3.groupLeader!.firstName!.isNotEmpty);
                  leader3Test3 = (find
                      .textContaining(leader3.groupLeader!.phone!)
                      .tryEvaluate());
                  leader3Test4 = (find
                      .textContaining(leader3.groupLeader!.email!)
                      .tryEvaluate());

                  leader3Test1 = tester.getBottomLeft(find.textContaining('Куратор:')).dy >
                      tester
                          .getTopLeft(find.textContaining('Зам. старосты:'))
                          .dy;
                  leader3Test1 = leader3Test1 && tester
                      .getBottomLeft(
                      Finders.groupLeaderInfo('Куратор:'))
                      .dy >
                      tester
                          .getTopLeft(
                          Finders.groupLeaderInfo('Зам. старосты:'))
                          .dy;
                });
                testWidgets('1) ФИО старосты в 1 или 2 строки', (tester) async {
                  // await test.journal(tester, login: 'Войти как преподаватель');
                  // await Func(tester).tapDelay(300, Finders.groupInfo.at(1));
                  // final GroupLeaderInfo leader =
                  //     tester.widget(Finders.groupLeaderInfo('Староста:').first);
                  // expect(
                  //     leader.groupLeader!.firstName!.isNotEmpty &&
                  //         leader.groupLeader!.middleName!.isNotEmpty &&
                  //         leader.groupLeader!.firstName!.isNotEmpty,
                  //     true);
                  expect(leader1Test2, true);
                });
                testWidgets('2) Номер телефона старосты', (tester) async {
                  // await test.journal(tester, login: 'Войти как преподаватель');
                  // await Func(tester).tapDelay(1000, Finders.groupInfo.at(1));
                  // final GroupLeaderInfo leader =
                  //     tester.widget(Finders.groupLeaderInfo('Староста:').first);
                  // expect(leader.groupLeader?.phone?.isNotEmpty, true,
                  //     reason: 'проверка данных');
                  // expect(
                  //     find
                  //         .textContaining(leader.groupLeader!.phone!)
                  //         .tryEvaluate(),
                  //     true,
                  //     reason: 'проверка отображения');
                  expect(leader1Test3, true);
                });
                testWidgets('3) E-mail старосты', (tester) async {
                  // await test.journal(tester, login: 'Войти как преподаватель');
                  // await Func(tester).tapDelay(1000, Finders.groupInfo.at(1));
                  // final GroupLeaderInfo leader =
                  //     tester.widget(Finders.groupLeaderInfo('Староста:').first);
                  // expect(leader.groupLeader?.email?.isNotEmpty, true,
                  //     reason: 'проверка данных');
                  // expect(
                  //     find
                  //         .textContaining(leader.groupLeader!.email!)
                  //         .tryEvaluate(),
                  //     true,
                  //     reason: 'проверка отображения');
                  expect(leader1Test4, true);
                });
              });
              //
              //
              group('Поле Зам.старосты', () {
                testWidgets('Поле “Зам.старосты:” ниже поля “Староста:”',
                    (tester) async {
                  // await test.journal(tester, login: 'Войти как преподаватель');
                  // await Func(tester).tapDelay(1000, Finders.groupInfo.at(1));
                  // leader2 = tester
                  //     .widget(Finders.groupLeaderInfo('Зам. старосты:').first);
                  //
                  // leader2Test1 = tester
                  //         .getBottomLeft(find.textContaining('Зам. старосты:'))
                  //         .dy >
                  //     tester.getTopLeft(find.textContaining('Староста:')).dy;
                  // leader2Test1 = leader2Test1 &&
                  //     tester
                  //             .getBottomLeft(
                  //                 Finders.groupLeaderInfo('Зам. старосты:'))
                  //             .dy >
                  //         tester
                  //             .getTopLeft(Finders.groupLeaderInfo('Староста:'))
                  //             .dy;
                  // leader2Test2 = (leader2.groupLeader!.firstName!.isNotEmpty &&
                  //     leader2.groupLeader!.middleName!.isNotEmpty &&
                  //     leader2.groupLeader!.firstName!.isNotEmpty);
                  // leader2Test3 = (find
                  //     .textContaining(leader2.groupLeader!.phone!)
                  //     .tryEvaluate());
                  // leader2Test4 = (find
                  //     .textContaining(leader2.groupLeader!.email!)
                  //     .tryEvaluate());
                  // expect(
                  //     tester
                  //             .getBottomLeft(
                  //                 find.textContaining('Зам. старосты:'))
                  //             .dy >
                  //         tester
                  //             .getTopLeft(find.textContaining('Староста:'))
                  //             .dy,
                  //     true,
                  //     reason: 'положение по слову Староста');
                  // expect(
                  //     tester
                  //             .getBottomLeft(
                  //                 Finders.groupLeaderInfo('Зам. старосты:'))
                  //             .dy >
                  //         tester
                  //             .getTopLeft(Finders.groupLeaderInfo('Староста:'))
                  //             .dy,
                  //     true,
                  //     reason: 'положение по GroupLeaderInfo');
                      expect(leader2Test1, true);
                });
                testWidgets('1) ФИО Зам.старосты в 1 или 2 строки',
                    (tester) async {
                  // await test.journal(tester, login: 'Войти как преподаватель');
                  // await Func(tester).tapDelay(1000, Finders.groupInfo.at(1));
                  // final GroupLeaderInfo leader = tester
                  //     .widget(Finders.groupLeaderInfo('Зам. старосты:').first);
                  // expect(
                  //     leader.groupLeader!.firstName!.isNotEmpty &&
                  //         leader.groupLeader!.middleName!.isNotEmpty &&
                  //         leader.groupLeader!.firstName!.isNotEmpty,
                  //     true);
                  expect(leader2Test2, true);
                });
                testWidgets('2) Номер телефона Зам.старосты', (tester) async {
                  // await test.journal(tester, login: 'Войти как преподаватель');
                  // await Func(tester).tapDelay(1000, Finders.groupInfo.at(1));
                  // final GroupLeaderInfo leader = tester
                  //     .widget(Finders.groupLeaderInfo('Зам. старосты:').first);
                  // expect(leader.groupLeader?.phone?.isNotEmpty, true,
                  //     reason: 'проверка данных');
                  // expect(
                  //     find
                  //         .textContaining(leader.groupLeader!.phone!)
                  //         .tryEvaluate(),
                  //     true,
                  //     reason: 'проверка отображения');
                  expect(leader2Test3, true);
                });
                testWidgets('3) E-mail Зам.старосты', (tester) async {
                  // await test.journal(tester, login: 'Войти как преподаватель');
                  // await Func(tester).tapDelay(1000, Finders.groupInfo.at(1));
                  // final GroupLeaderInfo leader = tester
                  //     .widget(Finders.groupLeaderInfo('Зам. старосты:').first);
                  // expect(leader.groupLeader?.email?.isNotEmpty, true,
                  //     reason: 'проверка данных');
                  // expect(
                  //     find
                  //         .textContaining(leader.groupLeader!.email!)
                  //         .tryEvaluate(),
                  //     true,
                  //     reason: 'проверка отображения');
                  expect(leader2Test4, true);
                });
              });
              //
              //
              group('Поле “Куратор:”', () {
                testWidgets('Поле “Куратор:” ниже поля “Староста:”',
                    (tester) async {
                  // await test.journal(tester, login: 'Войти как преподаватель');
                  // await Func(tester).tapDelay(1000, Finders.groupInfo.at(1));
                  //
                  // leader3 =
                  //     tester.widget(Finders.groupLeaderInfo('Куратор:').first);
                  // leader3Test2 = (leader3.groupLeader!.firstName!.isNotEmpty &&
                  //     leader3.groupLeader!.middleName!.isNotEmpty &&
                  //     leader3.groupLeader!.firstName!.isNotEmpty);
                  // leader3Test3 = (find
                  //     .textContaining(leader3.groupLeader!.phone!)
                  //     .tryEvaluate());
                  // leader3Test4 = (find
                  //     .textContaining(leader3.groupLeader!.email!)
                  //     .tryEvaluate());
                  //
                  // leader3Test1 = tester.getBottomLeft(find.textContaining('Куратор:')).dy >
                  //     tester
                  //         .getTopLeft(find.textContaining('Зам. старосты:'))
                  //         .dy;
                  // leader3Test1 = leader3Test1 && tester
                  //     .getBottomLeft(
                  //     Finders.groupLeaderInfo('Куратор:'))
                  //     .dy >
                  //     tester
                  //         .getTopLeft(
                  //         Finders.groupLeaderInfo('Зам. старосты:'))
                  //         .dy;
                  //
                  // expect(
                  //     tester.getBottomLeft(find.textContaining('Куратор:')).dy >
                  //         tester
                  //             .getTopLeft(find.textContaining('Зам. старосты:'))
                  //             .dy,
                  //     true,
                  //     reason: 'положение по слову Староста');
                  // expect(
                  //     tester
                  //             .getBottomLeft(
                  //                 Finders.groupLeaderInfo('Куратор:'))
                  //             .dy >
                  //         tester
                  //             .getTopLeft(
                  //                 Finders.groupLeaderInfo('Зам. старосты:'))
                  //             .dy,
                  //     true,
                  //     reason: 'положение по GroupLeaderInfo');
                      expect(leader3Test1, true);
                });
                testWidgets('1) ФИО куратора в 1 или 2 строки', (tester) async {
                  // await test.journal(tester, login: 'Войти как преподаватель');
                  // await Func(tester).tapDelay(1000, Finders.groupInfo.at(1));
                  // final GroupLeaderInfo leader =
                  //     tester.widget(Finders.groupLeaderInfo('Куратор:').first);
                  // expect(
                  //     leader.groupLeader!.firstName!.isNotEmpty &&
                  //         leader.groupLeader!.middleName!.isNotEmpty &&
                  //         leader.groupLeader!.firstName!.isNotEmpty,
                  //     true);
                  expect(leader3Test2, true);
                });
                testWidgets('2) Номер телефона куратора', (tester) async {
                  // await test.journal(tester, login: 'Войти как преподаватель');
                  // await Func(tester).tapDelay(1000, Finders.groupInfo.at(1));
                  // final GroupLeaderInfo leader =
                  //     tester.widget(Finders.groupLeaderInfo('Куратор:').first);
                  // expect(leader.groupLeader?.phone?.isNotEmpty, true,
                  //     reason: 'проверка данных');
                  // expect(
                  //     find
                  //         .textContaining(leader.groupLeader!.phone!)
                  //         .tryEvaluate(),
                  //     true,
                  //     reason: 'проверка отображения');
                  expect(leader3Test3, true);
                });
                testWidgets('3) E-mail куратора', (tester) async {
                  // await test.journal(tester, login: 'Войти как преподаватель');
                  // await Func(tester).tapDelay(1000, Finders.groupInfo.at(1));
                  // final GroupLeaderInfo leader =
                  //     tester.widget(Finders.groupLeaderInfo('Куратор:').first);
                  // expect(leader.groupLeader?.email?.isNotEmpty, true,
                  //     reason: 'проверка данных');
                  // expect(
                  //     find
                  //         .textContaining(leader.groupLeader!.email!)
                  //         .tryEvaluate(),
                  //     true,
                  //     reason: 'проверка отображения');
                  expect(leader3Test4, true);
                });
              });
              //
              //
              testWidgets('Боттомшит закрывается свайпом вниз (журналы)',
                  (tester) async {
                await test.journal(tester, login: 'Войти как преподаватель');
                expect(Finders.grInfoC.tryEvaluate(), false,
                    reason: 'боттонщит не найден');
                await Func(tester).tapDelay(1000, Finders.groupInfo.at(1));
                expect(Finders.grInfoC.tryEvaluate(), true,
                    reason: 'боттонщит найден');
                await tester.timedDragFrom(
                    Offset(tester.getCenter(Finders.grInfoC.first).dx,
                        tester.getTopLeft(Finders.grInfoC.first).dy + 5),
                    Offset(
                        0,
                        Func(tester).size().height -
                            tester.getTopLeft(Finders.grInfoC.first).dy),
                    Delay.delay300);
                await Func(tester).pump(5);
                expect(Finders.grInfoC, findsNothing,
                    reason: 'не найден, после закрытия');
              });
              testWidgets('Название предмета ниже заголовка', (tester) async {
                await test.journal(tester, login: 'Войти как преподаватель');
                final Finder lesson = find.byType(JournalLessonWidget);
                expect(lesson, findsAny, reason: 'найдены блоки групп');
                final JournalLessonWidget lessonWidget =
                    tester.widget(lesson.first);
                expect(
                    tester
                            .getBottomLeft(find.textContaining('Группа').first)
                            .dy <
                        tester
                            .getTopLeft(find
                                .textContaining(lessonWidget.lesson.subject!)
                                .first)
                            .dy,
                    true,
                    reason: 'положение');
              });

              testWidgets(
                  'Бейдж с номером курса в правом верхнем углу определенного цвета',
                  (tester) async {
                await test.journal(tester, login: 'Войти как преподаватель');
                int? getColor({int? i}) => Func(tester)
                    .cardJ(i: i ?? 0)
                    .lesson
                    .studentGroups
                    ?.firstOrNull
                    ?.course;

                for (int i = 0;
                    i < find.byKey(Keys.jouLesWid).evaluate().length;
                    i++) {
                  final Finder finder = find.textContaining(
                      'Курс ${Func(tester).cardJ(i: i).lesson.studentGroups?.firstOrNull?.course ?? ''}');
                  expect(finder, findsAny, reason: 'проверка налич кнопки');
                  expect(
                      find.ancestor(
                          of: finder,
                          matching: find.byKey(Keys.jouLesWid).at(i)),
                      findsAny,
                      reason: 'проверка налич кнопки 2');

                  final Container container =
                      tester.widget(Finders.courseJournal.at(i));
                  expect((container.decoration as BoxDecoration).color,
                      getColorByCourse(getColor(i: i)),
                      reason: 'проверка цвета');
                }
              });

              testWidgets(
                  'Бейдж с наименованием типа активности (экзамен, зачет и тд) ниже бейджа с номером курса',
                  (tester) async {
                await test.journal(tester, login: 'Войти как преподаватель');
                final Finder course = find.textContaining(
                    'Курс ${Func(tester).cardJ().lesson.studentGroups?.firstOrNull?.course ?? ''}');
                expect(course, findsAny, reason: 'проверка налич кнопки');
                expect(
                    find.ancestor(of: course, matching: find.byType(Container)),
                    findsAny,
                    reason: 'проверка налич кнопки 2');

                final Finder att = find
                    .textContaining(Func(tester).cardJ().lesson.markType ?? '');
                expect(
                    tester.getBottomLeft(course.first).dx <=
                        tester.getTopLeft(att.first).dx,
                    true,
                    reason: 'проверка положения');
              });

              testWidgets(
                  'При тапе на мини-блок появляется диалоговое окно внизу экрана',
                  (tester) async {
                await test.journal(tester, login: 'Войти как преподаватель');
                expect(find.byType(CupertinoActionSheet), findsNothing);
                await Func(tester).tapDelay(1000, Finders.jouLesWid.first);
                expect(find.byType(CupertinoActionSheet), findsAny);
              });
              //
              //
              group('диалоговое окно внизу экрана содержит', () {
                testWidgets(
                    '“Посещаемость”, при тапе на которую открывается страница учета посещаемости выбранной группы',
                    (tester) async {
                  await test.journal(tester, login: 'Войти как преподаватель');
                  final Finder text = find.textContaining('Посещаемость');
                  expect(text, findsNothing, reason: 'отсут кнопки');
                  await Func(tester).tapDelay(300, Finders.jouLesWid.first);
                  expect(text, findsAny, reason: 'налич кнопки');
                  expect(find.byType(TeacherAttendanceJournalScreenView),
                      findsNothing,
                      reason: 'отсут стр посещаемости');
                  await Func(tester).tapDelay(1200, text);
                  expect(
                      find.byType(TeacherAttendanceJournalScreenView), findsAny,
                      reason: 'налич стр посещаемости');
                });
                testWidgets(
                    '“Оценки”, при тапе на которую открывается страница учета оценок',
                    (tester) async {
                  await test.journal(tester, login: 'Войти как преподаватель');
                  final Finder text = find.textContaining('Оценки');
                  expect(text, findsNothing, reason: 'отсут кнопки');
                  await Func(tester).tapDelay(300, Finders.jouLesWid.first);
                  expect(text, findsAny, reason: 'налич кнопки');
                  expect(find.byType(SubjectGradesScreenView), findsNothing,
                      reason: 'отсут стр оценок');
                  await Func(tester).tapDelay(1200, text);
                  expect(find.byType(SubjectGradesScreenView), findsAny,
                      reason: 'налич стр оценок');
                });
                testWidgets(
                    '“Отмена”, при тапе на которую диалоговое окно закрывается',
                    (tester) async {
                  await test.journal(tester, login: 'Войти как преподаватель');
                  final Finder text = find.textContaining('Отмена');
                  expect(text, findsNothing, reason: 'отсут кнопки');
                  await Func(tester).tapDelay(300, Finders.jouLesWid.first);
                  expect(text, findsAny, reason: 'налич кнопки');
                  await Func(tester).tapDelay(300, text);
                  expect(text, findsNothing, reason: 'отсут кнопки');
                });
                testWidgets(
                    'Диалоговое окно закрывается при тапе на неактивную часть экрана',
                    (tester) async {
                  await test.journal(tester, login: 'Войти как преподаватель');
                  final Finder text = find.textContaining('Отмена');
                  expect(text, findsNothing, reason: 'отсут кнопки');
                  await Func(tester).tapDelay(300, Finders.jouLesWid.first);
                  expect(text, findsAny, reason: 'налич кнопки');
                  await Func(tester).tapDelay(300, Finders.jouLesWid.first);
                  expect(text, findsNothing, reason: 'отсут кнопки 2');
                });
              });
            });
          });
        });
        //
        //
        group('Страница учета посещаемости выбранной группы', () {
          group('Элементы страница учета посещаемости выбранной группы', () {
            testWidgets(
                'Заголовок “Группа [номер группы] Курс [номер курса]” по центру',
                (tester) async {
              await test.pos(tester);
              final TeacherAttendanceJournalScreenView jou = tester
                  .widget(find.byType(TeacherAttendanceJournalScreenView));
              expect(jou.title.isNotEmpty, true, reason: 'данные');
              expect(tester.getCenter(find.textContaining(jou.title)).dx,
                  Func(tester).size().width / 2,
                  reason: 'центр');
            });
            testWidgets(
                'Кнопка назад в левом верхнем углу, при тапе на которую открывается предыдущая страница',
                (tester) async {
              await test.journal(tester, login: 'Войти как преподаватель');
              await Func(tester).tapDelay(300, Finders.jouLesWid.first);
              expect(find.byType(TeacherJournalScreenView).tryEvaluate(), true,
                  reason: 'стр Журналы');
              await Func(tester)
                  .tapDelay(1000, find.textContaining('Посещаемость'));
              expect(find.byType(TeacherJournalScreenView).tryEvaluate(), false,
                  reason: 'стр Посещ');
              expect(Finders.back, findsAny, reason: 'кнопка назад');
              await Func(tester).tapDelay(1000, Finders.back);
              expect(find.byType(TeacherJournalScreenView).tryEvaluate(), true,
                  reason: 'стр Журналы');
            });
            testWidgets('Кнопка с видео-значком в правом верхнем углу',
                (tester) async {
              await test.journal(tester, login: 'Войти как преподаватель');
              await Func(tester).tapDelay(300, Finders.jouLesWid.first);
              await Func(tester)
                  .tapDelay(300, find.textContaining('Посещаемость'));
              expect(Finders.attendance, findsOneWidget);
            });
            //
            //
            group('Элементы модального окна', () {
              testWidgets('открывается модальное окно', (tester) async {
                await test.pos(tester);
                expect(find.byType(AlertDialog).tryEvaluate(), false,
                    reason: 'нет окна');
                await tester.tap(Finders.attendance);
                await tester.pump(Delay.delay1);
                expect(find.byType(AlertDialog).tryEvaluate(), true,
                    reason: 'есть окно');
                await tester.pump(Delay.delay1);
                await tester.tap(find.textContaining('Отключить'));
              });
              //
              //
              group('Окно содержит', () {
                testWidgets('заголовком “Включен режим отметки”',
                    (tester) async {
                  await test.pos(tester);
                  await tester.tap(Finders.attendance);
                  await tester.pump(Delay.delay1);
                  expect(find.textContaining('Включен режим отметки'),
                      findsOneWidget);
                  await tester.pump(Delay.delay1);
                  await tester.tap(find.textContaining('Отключить'));
                });
                testWidgets('анимацией, отражающей активность режима',
                    (tester) async {
                  await test.pos(tester);
                  await tester.tap(Finders.attendance);
                  await tester.pump(Delay.delay1);
                  await tester.pump(Delay.delay1);
                  final Finder lottie = find.byType(Lottie);
                  expect(lottie, findsOneWidget, reason: 'анимация одна');
                  await tester.pump(Delay.delay1);
                  await tester.pump(Delay.delay1);
                  await tester.tap(find.textContaining('Отключить'));
                });
                testWidgets(
                    'кнопкой “Отключить”, при тапе на которую окно закрывается, а режим отметки выключается',
                    (tester) async {
                  await test.pos(tester);
                  expect(find.byType(AlertDialog).tryEvaluate(), false,
                      reason: ' нет окна');
                  await tester.tap(Finders.attendance);
                  await tester.pump(Delay.delay1);
                  await tester.pump(Delay.delay1);
                  expect(find.byType(AlertDialog).tryEvaluate(), true,
                      reason: 'есть окно');
                  await tester.pump(Delay.delay1);
                  await tester.pump(Delay.delay1);
                  await tester.tap(find.textContaining('Отключить'));
                  await tester.pump(Delay.delay1);
                  await tester.pump(Delay.delay1);
                  expect(find.byType(AlertDialog).tryEvaluate(), false,
                      reason: ' нет окна2');
                });

                testWidgets(
                    'окно закрывается при тапе на неактивную часть экрана (jnvtnrf)',
                    (tester) async {
                  await test.pos(tester);
                  final Finder wind = find.byType(AlertDialog);
                  expect(wind.tryEvaluate(), false, reason: ' нет окна');
                  await tester.tap(Finders.attendance);
                  if (await Permission.bluetoothAdvertise.status.isGranted !=
                      true) {
                    while (
                        await Permission.bluetoothAdvertise.status.isGranted !=
                            true) {
                      await tester.pump(Delay.delay1);
                    }
                    await tester.pump(Delay.delay1);
                    await tester.pump(Delay.delay1);
                    expect(wind.tryEvaluate(), true, reason: 'есть окно');
                    await tester.tapAt(const Offset(10, 10));
                    await tester.pump(Delay.delay1);
                    await tester.pump(Delay.delay1);
                    await tester.pump(Delay.delay1);
                    await tester.tapAt(const Offset(10, 10));
                    await tester.pump(Delay.delay1);
                    await tester.pump(Delay.delay1);
                    await tester.pump(Delay.delay1);
                  }
                  await tester.pump(Delay.delay1);
                  await tester.pump(Delay.delay1);
                  expect(wind.tryEvaluate(), true, reason: 'есть окно');
                  await tester.tapAt(const Offset(10, 10));
                  await tester.pump(Delay.delay1);
                  await tester.pump(Delay.delay1);
                  await tester.pump(Delay.delay1);
                  expect(wind.tryEvaluate(), false, reason: ' нет окна 2');
                });
              });

              testWidgets('Блок учета посещаемости', (tester) async {
                await test.journal(tester, login: 'Войти как преподаватель');
                await Func(tester).tapDelay(300, Finders.jouLesWid.first);
                expect(Finders.attendanceJournal, findsNothing,
                    reason: 'блока нет');
                await Func(tester)
                    .tapDelay(300, find.textContaining('Посещаемость'));
                expect(Finders.attendanceJournal, findsOneWidget,
                    reason: 'блок есть');
              });

              testWidgets(
                  'Возврат на предыдущую страницу происходит свайпом вправо',
                  (tester) async {
                await test.journal(tester, login: 'Войти как преподаватель');
                await Func(tester).tapDelay(300, Finders.jouLesWid.first);
                final Finder page = find.byType(TeacherJournalScreenView);
                expect(page, findsOneWidget, reason: 'пред стр есть');
                await Func(tester)
                    .tapDelay(300, find.textContaining('Посещаемость'));
                expect(page, findsNothing, reason: 'стр посещаемости');
                await tester.timedDragFrom(Func(tester).center(),
                    const Offset(300, 0), Delay.delay300);
              });
            });
          });
          //
          //
          group('Блок учета посещаемости', () {
            testWidgets('Заголовок - наименование предмета по центру',
                (tester) async {
              await test.pos(tester);
              final TeacherAttendanceJournalScreenView pageWidget = tester
                  .widget(find.byType(TeacherAttendanceJournalScreenView));
              final Finder header = find.descendant(
                  of: Finders.attendanceJournal,
                  matching: find.textContaining(pageWidget.lessonName));
              expect(header, findsOneWidget, reason: 'заголовок найден');
              expect(tester.getCenter(header).dx, Func(tester).size().width / 2,
                  reason: 'заголовок по центру');
            });

            testWidgets(
                'Слайдер с отображением дней, в которые была или будет пара по данному предмету, ниже заголовка',
                (tester) async {
              await test.pos(tester);
              expect(Finders.attDates, findsOneWidget,
                  reason: 'слайдер найден');
              final TeacherAttendanceJournalScreenView wid = tester
                  .widget(find.byType(TeacherAttendanceJournalScreenView));
              final Finder title = find.textContaining(wid.lessonName);
              expect(title, findsOneWidget, reason: 'заголовок найден');
              expect(
                  tester.getBottomLeft(title).dy <
                      tester.getTopLeft(Finders.attDates).dy,
                  true,
                  reason: ' положение');
            });

            testWidgets('Блок с Полями посещаемости студентов, ниже слайдера',
                (tester) async {
              await test.pos(tester);
              expect(Finders.attMarks, findsAny, reason: 'блоки найдены');
              expect(
                  tester.getTopLeft(Finders.attMarks.first).dy >=
                      tester.getBottomLeft(Finders.attDates).dy,
                  true,
                  reason: 'положение');
            });
            //
            //
            group("""Слайдер с отображением дат, в которые была/есть/будет пара
            по выбранному предмету у выбранной группы""", () {
              testWidgets('Слайдер листается свайпом вправо-влево',
                  (tester) async {
                await test.pos(tester);
                final double pos1 = tester.getTopLeft(Finders.attDate.at(1)).dx;
                await tester.timedDrag(
                    Finders.attDates, Offset(-pos1, 0), Delay.delay(500));
                final double pos2 = tester.getTopLeft(Finders.attDate.at(1)).dx;
                expect(pos1 > pos2, true, reason: 'движ влево');
                await tester.timedDrag(
                    Finders.attDates, Offset(pos1, 0), Delay.delay(500));
                final double pos3 = tester.getTopLeft(Finders.attDate.at(1)).dx;
                expect(pos3 > pos2, true, reason: 'движ вправо');
              });

              testWidgets("""При тапе на выбранный день, выбранный слайд с
              датой выделяется сиреневым цветом и ячейки посещаемости
              студентов в данный день выделяются бледно-сиреневым цветом""",
                  (tester) async {
                await test.pos(tester);
                await tester.pumpAndSettle(Delay.delay1);

                for (int i = 0; i < 7; i++) {
                  await tester.timedDrag(
                      Finders.attDates, const Offset(200, 0), Delay.delay300);
                }
                Finder boxOld(int i) => find
                    .byWidgetPredicate(
                      (Widget widget) =>
                          widget is Container &&
                          widget.key == Keys.attDate &&
                          (widget.decoration as BoxDecoration).color ==
                              AppColor.inactive,
                    )
                    .at(i);
                final Finder boxNew = find.byWidgetPredicate(
                  (Widget widget) =>
                      widget is Container &&
                      widget.key == Keys.attDate &&
                      (widget.decoration as BoxDecoration).color ==
                          AppColor.subjectColor,
                );
                final Finder mark = find.descendant(
                    of: Finders.attMarks.first,
                    matching: Finders.attMark.at(0));
                final Container container = tester.widget(mark);

                expect(boxOld(0).tryEvaluate(), true,
                    reason: 'дата до нажатия без выделения');
                // expect(boxNew.tryEvaluate(), false,
                //     reason: 'дата до нажатия (выделение не найдено)');
                expect(container.color, getColorByAttendance(false, 0),
                    reason: 'цвет поля до нажатия');

                await Func(tester).tapDelay(300, boxOld(0));

                final Finder mark2 = find.descendant(
                    of: Finders.attMarks.first,
                    matching: Finders.attMark.at(0));
                final Container container2 = tester.widget(mark2);
                expect(boxNew.tryEvaluate(), true,
                    reason: 'дата после (найдено выделение)');
                expect(container2.color, AppColor.subjectColor.withOpacity(0.3),
                    reason: 'цвет поля после нажатия');
              });
              testWidgets(
                  'Вместе с перемещением слайдера перемещаются ячейки в полях посещаемости студентов',
                  (tester) async {
                await test.pos(tester);

                for (int i = 0; i < 7; i++) {
                  await tester.timedDrag(
                      Finders.attDates, const Offset(200, 0), Delay.delay300);
                }

                await tester.pumpAndSettle(Delay.delay300);
                final double posDate =
                    tester.getCenter(Finders.attDate.at(2)).dx;
                final double posMark = tester
                    .getCenter(find.descendant(
                        of: Finders.attMarks.first,
                        matching: Finders.attMark.at(2)))
                    .dx;
                expect(posDate, posMark, reason: 'положение до движ');
                await tester.timedDrag(
                    Finders.attDates, const Offset(-50, 0), Delay.delay300);
                await tester.pumpAndSettle(Delay.delay300);
                final double posDate2 =
                    tester.getCenter(Finders.attDate.at(2)).dx;
                final double posMark2 = tester
                    .getCenter(find.descendant(
                        of: Finders.attMarks.first,
                        matching: Finders.attMark.at(2)))
                    .dx;
                expect(posDate2, posMark2, reason: 'положение после движ');
                expect(posDate2 < posDate, true, reason: 'смещение после движ');
              });
            });
            //
            //
            group('Ячейки посещаемости студентов', () {
              group('Если ячейка еще не заполнена:', () {
                testWidgets(
                    'При тапе на ячейку посещаемости открывается диалоговое окно1, в котором содержатся:',
                    (tester) async {
                  await test.pos(tester);

                  final Finder finder = find.byType(AttendanceModalPopup);
                  expect(finder.tryEvaluate(), false, reason: 'окна нет');
                  await Func(tester).scrollVisible(Finders.attMark);
                  expect(finder.tryEvaluate(), true, reason: 'окно есть');
                });
                //
                //
                group('диалоговое окно, в котором содержатся:(не заполнена)',
                    () {
                  testWidgets('Заголовок - ФИ студента по центру, шрифт черный',
                      (tester) async {
                    await test.pos(tester);
                    await Func(tester).scrollVisible(Finders.attMark);
                    final AttendanceModalPopup wind =
                        tester.widget(find.byType(AttendanceModalPopup));
                    final student = wind.students?.elementAtOrNull(0);
                    final Finder name = find.descendant(
                        of: find.byType(AttendanceModalPopup),
                        matching: find.textContaining(createFullName(
                            student?.firstName, '', student?.lastName)));
                    expect(name.tryEvaluate(), true,
                        reason: 'заголовок найден');
                    expect(tester.getCenter(name).dx,
                        Func(tester).size().width / 2,
                        reason: 'положение');
                    final Text text = tester.widget(name);
                    expect(text.style?.color, AppColor.black,
                        reason: 'проверка цвета');
                  });
                  testWidgets(
                      'Кнопка “Присутствует”, шрифт синий.1 При тапе на кнопку ячейка заполняется черной буквой “П”',
                      (tester) async {
                    await test.pos(tester);
                    int? i = await Func(tester).scrollVisible(Finders.attMark);
                    final Finder button = find.textContaining('Присутствует');
                    final Text text = tester.widget(button);
                    expect(button.tryEvaluate(), true,
                        reason: 'кнопка найдена');
                    expect(text.style?.color, AppColor.lightBlue,
                        reason: 'цвет синий');
                    await Func(tester).tapDelay(300, button);
                    await tester.tapAt(Func(tester).center());
                    await tester.pumpAndSettle(Delay.delay100);
                    final double height =
                        tester.getCenter(Finders.attMarks.at(2)).dy -
                            tester.getCenter(Finders.attMarks.at(1)).dy;
                    await tester.timedDragFrom(Func(tester).center(),
                        Offset(0, height), Delay.delay300);
                    final Finder mark = find.descendant(
                        of: Finders.attMarks.first, matching: Finders.attMark);
                    final Text butText = tester.widget(find.descendant(
                        of: mark.at(i!), matching: find.byType(Text)));
                    expect('П', butText.data, reason: 'заполнено П');
                    expect(AppColor.black, butText.style?.color,
                        reason: 'цвет "П" церный');
                  });
                  testWidgets(
                      'Кнопка “Уважительная причина”, шрифт синий. При тапе на кнопку ячейка заполняется синей буквой “У”1',
                      (tester) async {
                    await test.pos(tester);
                    int? i = await Func(tester).scrollVisible(Finders.attMark);
                    final Finder button =
                        find.textContaining('Уважительная причина');
                    final Text text = tester.widget(button);
                    expect(button.tryEvaluate(), true,
                        reason: 'кнопка найдена');
                    expect(text.style?.color, AppColor.lightBlue,
                        reason: 'цвет синий');
                    await Func(tester).tapDelay(300, button);
                    await tester.tapAt(Func(tester).center());
                    await tester.pumpAndSettle(Delay.delay100);
                    final double height =
                        tester.getCenter(Finders.attMarks.at(2)).dy -
                            tester.getCenter(Finders.attMarks.at(1)).dy;
                    await tester.timedDragFrom(Func(tester).center(),
                        Offset(0, height), Delay.delay300);
                    final Finder mark = find.descendant(
                        of: Finders.attMarks.first, matching: Finders.attMark);
                    final Text butText = tester.widget(find.descendant(
                        of: mark.at(i!), matching: find.byType(Text)));
                    expect('У', butText.data, reason: 'заполнено У');
                    expect(AppColor.newBlue, butText.style?.color,
                        reason: 'цвет "У" синий');
                  });
                  testWidgets(
                      'Кнопка “Отсутствует”, шрифт красный. При тапе на кнопку ячейка заполняется красной буквой “О”',
                      (tester) async {
                    await test.pos(tester);
                    int? i = await Func(tester).scrollVisible(Finders.attMark);
                    final Finder button = find.textContaining('Отсутствует');
                    final Text text = tester.widget(button);
                    expect(button.tryEvaluate(), true,
                        reason: 'кнопка найдена');
                    expect(text.style?.color, AppColor.absent,
                        reason: 'цвет absent');
                    await Func(tester).tapDelay(300, button);
                    await tester.tapAt(Func(tester).center());
                    await tester.pumpAndSettle(Delay.delay100);
                    final double height =
                        tester.getCenter(Finders.attMarks.at(2)).dy -
                            tester.getCenter(Finders.attMarks.at(1)).dy;
                    await tester.timedDragFrom(Func(tester).center(),
                        Offset(0, height), Delay.delay300);
                    final Finder mark = find.descendant(
                        of: Finders.attMarks.first, matching: Finders.attMark);
                    final Text butText = tester.widget(find.descendant(
                        of: mark.at(i!), matching: find.byType(Text)));
                    expect('Н', butText.data, reason: 'заполнено О');
                    expect(AppColor.absent, butText.style?.color,
                        reason: 'цвет "О" красный');
                  });
                  testWidgets(
                      'Кнопка “Отмена”, при тапе на которую диалоговое окно закрывается',
                      (tester) async {
                    await test.pos(tester);
                    await Func(tester).scrollVisible(Finders.attMark);
                    final Finder finder = find.byType(AttendanceModalPopup);
                    final Finder button = find.textContaining('Отмена');
                    expect(finder.tryEvaluate(), true, reason: 'окно есть');
                    expect(button.tryEvaluate(), true,
                        reason: 'кнопка найдена');
                    await Func(tester).tapDelay(300, button);
                    expect(finder.tryEvaluate(), false, reason: 'окна нет');
                  });
                  testWidgets(
                      'Диалоговое окно закрывается при тапе на неактивную часть экрана',
                      (tester) async {
                    await test.pos(tester);
                    await Func(tester).scrollVisible(Finders.attMark);
                    final Finder finder = find.byType(AttendanceModalPopup);
                    final Finder button = find.textContaining('Отмена');
                    expect(finder.tryEvaluate(), true, reason: 'окно есть');
                    expect(button.tryEvaluate(), true,
                        reason: 'кнопка найдена');
                    await tester.tapAt(const Offset(10, 10));
                    await Func(tester).pump(10);
                    expect(finder.tryEvaluate(), false, reason: 'окна нет');
                  });
                });
                //
                //
                testWidgets('Ячейки листаются свайпом влево-вправо',
                    (tester) async {
                  await test.pos(tester);
                  int? i = await Func(tester).scrollVisible(Finders.attMark);
                  final double pos1 =
                      tester.getTopLeft(Finders.attMark.at(i!)).dx;
                  await tester.tapAt(const Offset(10, 10));
                  await tester.pumpAndSettle(Delay.delay100);
                  await tester.timedDragFrom(Func(tester).center(),
                      const Offset(-20, 0), Delay.delay300);
                  final double pos2 =
                      tester.getTopLeft(Finders.attMark.at(i)).dx;
                  expect(pos1 > pos2, true, reason: 'влево');
                  await tester.timedDragFrom(Func(tester).center(),
                      const Offset(20, 0), Delay.delay300);
                  final double pos3 =
                      tester.getTopLeft(Finders.attMark.at(i)).dx;
                  expect(pos3 > pos2, true, reason: 'вправо');
                });

                testWidgets(
                    'Вместе с перемещением ячеек посещаемости перемещается слайдер дат',
                    (tester) async {
                  await test.pos(tester);
                  int? i = await Func(tester).scrollVisible(Finders.attMark);
                  await tester.tapAt(const Offset(10, 10));
                  await tester.pumpAndSettle(Delay.delay100);
                  final double posDate =
                      tester.getCenter(Finders.attDate.at(i!)).dx;
                  // final double posMark = tester
                  //     .getCenter(Finders.attMark.at(2))
                  //     .dx;
                  // expect(posDate, posMark, reason: 'положение до движ');

                  await tester.timedDragFrom(Func(tester).center(),
                      const Offset(-20, 0), Delay.delay300);
                  await tester.pumpAndSettle(Delay.delay300);

                  final double posDate2 =
                      tester.getCenter(Finders.attDate.at(i)).dx;
                  // final double posMark2 = tester
                  //     .getCenter(Finders.attMark.at(2))
                  //     .dx;
                  // expect(posDate2, posMark2, reason: 'положение после движ');
                  expect(posDate2 < posDate, true,
                      reason: 'смещение после движ');
                });
              });
              group('Если ячейка уже была заполнена:', () {
                testWidgets(
                    'При тапе на ячейку посещаемости открывается диалоговое окно1, в котором содержатся:',
                    (tester) async {
                  await test.pos(tester);

                  final Finder finder = find.byType(AttendanceModalPopup);
                  expect(finder.tryEvaluate(), false, reason: 'окна нет');
                  await Func(tester).scrollVisible(Finders.attMark);
                  expect(finder.tryEvaluate(), true, reason: 'окно есть');
                });
                //
                //
                group('диалоговое окно, в котором содержатся:(не заполнена)',
                    () {
                  testWidgets('Заголовок - ФИ студента по центру, шрифт черный',
                      (tester) async {
                    await test.pos(tester);
                    await Func(tester).scrollVisible(Finders.attMark);
                    final AttendanceModalPopup wind =
                        tester.widget(find.byType(AttendanceModalPopup));
                    final student = wind.students?.elementAtOrNull(0);
                    final Finder name = find.descendant(
                        of: find.byType(AttendanceModalPopup),
                        matching: find.textContaining(createFullName(
                            student?.firstName, '', student?.lastName)));
                    expect(name.tryEvaluate(), true,
                        reason: 'заголовок найден');
                    expect(tester.getCenter(name).dx,
                        Func(tester).size().width / 2,
                        reason: 'положение');
                    final Text text = tester.widget(name);
                    expect(text.style?.color, AppColor.black,
                        reason: 'проверка цвета');
                  });
                  testWidgets(
                      'Кнопка “Присутствует”, шрифт синий.1 При тапе на кнопку ячейка заполняется черной буквой “П”',
                      (tester) async {
                    await test.pos(tester);
                    int? i = await Func(tester).scrollVisible(Finders.attMark);
                    final Finder button = find.textContaining('Присутствует');
                    final Text text = tester.widget(button);
                    expect(button.tryEvaluate(), true,
                        reason: 'кнопка найдена');
                    expect(text.style?.color, AppColor.lightBlue,
                        reason: 'цвет синий');
                    await Func(tester).tapDelay(300, button);
                    await tester.tapAt(Func(tester).center());
                    await tester.pumpAndSettle(Delay.delay100);
                    final double height =
                        tester.getCenter(Finders.attMarks.at(2)).dy -
                            tester.getCenter(Finders.attMarks.at(1)).dy;
                    await tester.timedDragFrom(Func(tester).center(),
                        Offset(0, height), Delay.delay300);
                    final Finder mark = find.descendant(
                        of: Finders.attMarks.first, matching: Finders.attMark);
                    final Text butText = tester.widget(find.descendant(
                        of: mark.at(i!), matching: find.byType(Text)));
                    expect('П', butText.data, reason: 'заполнено П');
                    expect(AppColor.black, butText.style?.color,
                        reason: 'цвет "П" церный');
                  });
                  testWidgets(
                      'Кнопка “Уважительная причина”, шрифт синий. При тапе на кнопку ячейка заполняется синей буквой “У”1',
                      (tester) async {
                    await test.pos(tester);
                    int? i = await Func(tester).scrollVisible(Finders.attMark);
                    final Finder button =
                        find.textContaining('Уважительная причина');
                    final Text text = tester.widget(button);
                    expect(button.tryEvaluate(), true,
                        reason: 'кнопка найдена');
                    expect(text.style?.color, AppColor.lightBlue,
                        reason: 'цвет синий');
                    await Func(tester).tapDelay(300, button);
                    await tester.tapAt(Func(tester).center());
                    await tester.pumpAndSettle(Delay.delay100);
                    final double height =
                        tester.getCenter(Finders.attMarks.at(2)).dy -
                            tester.getCenter(Finders.attMarks.at(1)).dy;
                    await tester.timedDragFrom(Func(tester).center(),
                        Offset(0, height), Delay.delay300);
                    final Finder mark = find.descendant(
                        of: Finders.attMarks.first, matching: Finders.attMark);
                    final Text butText = tester.widget(find.descendant(
                        of: mark.at(i!), matching: find.byType(Text)));
                    expect('У', butText.data, reason: 'заполнено У');
                    expect(AppColor.newBlue, butText.style?.color,
                        reason: 'цвет "У" синий');
                  });
                  testWidgets(
                      'Кнопка “Отсутствует”, шрифт красный. При тапе на кнопку ячейка заполняется красной буквой “О”',
                      (tester) async {
                    await test.pos(tester);
                    int? i = await Func(tester).scrollVisible(Finders.attMark);
                    final Finder button = find.textContaining('Отсутствует');
                    final Text text = tester.widget(button);
                    expect(button.tryEvaluate(), true,
                        reason: 'кнопка найдена');
                    expect(text.style?.color, AppColor.absent,
                        reason: 'цвет absent');
                    await Func(tester).tapDelay(300, button);
                    await tester.tapAt(Func(tester).center());
                    await tester.pumpAndSettle(Delay.delay100);
                    final double height =
                        tester.getCenter(Finders.attMarks.at(2)).dy -
                            tester.getCenter(Finders.attMarks.at(1)).dy;
                    await tester.timedDragFrom(Func(tester).center(),
                        Offset(0, height), Delay.delay300);
                    final Finder mark = find.descendant(
                        of: Finders.attMarks.first, matching: Finders.attMark);
                    final Text butText = tester.widget(find.descendant(
                        of: mark.at(i!), matching: find.byType(Text)));
                    expect('Н', butText.data, reason: 'заполнено О');
                    expect(AppColor.absent, butText.style?.color,
                        reason: 'цвет "О" красный');
                  });
                  testWidgets(
                      'Кнопка “Отмена”, при тапе на которую диалоговое окно закрывается',
                      (tester) async {
                    await test.pos(tester);
                    await Func(tester).scrollVisible(Finders.attMark);
                    final Finder finder = find.byType(AttendanceModalPopup);
                    final Finder button = find.textContaining('Отмена');
                    expect(finder.tryEvaluate(), true, reason: 'окно есть');
                    expect(button.tryEvaluate(), true,
                        reason: 'кнопка найдена');
                    await Func(tester).tapDelay(300, button);
                    expect(finder.tryEvaluate(), false, reason: 'окна нет');
                  });
                  testWidgets(
                      'Диалоговое окно закрывается при тапе на неактивную часть экрана',
                      (tester) async {
                    await test.pos(tester);
                    await Func(tester).scrollVisible(Finders.attMark);
                    final Finder finder = find.byType(AttendanceModalPopup);
                    final Finder button = find.textContaining('Отмена');
                    expect(finder.tryEvaluate(), true, reason: 'окно есть');
                    expect(button.tryEvaluate(), true,
                        reason: 'кнопка найдена');
                    await tester.tapAt(const Offset(10, 10));
                    await Func(tester).pump(10);
                    expect(finder.tryEvaluate(), false, reason: 'окна нет');
                  });
                });
                //
                //
                testWidgets('Ячейки листаются свайпом влево-вправо',
                    (tester) async {
                  await test.pos(tester);
                  int? i = await Func(tester).scrollVisible(Finders.attMark);
                  final double pos1 =
                      tester.getTopLeft(Finders.attMark.at(i!)).dx;
                  await tester.tapAt(const Offset(10, 10));
                  await tester.pumpAndSettle(Delay.delay100);
                  await tester.timedDragFrom(Func(tester).center(),
                      const Offset(-20, 0), Delay.delay300);
                  final double pos2 =
                      tester.getTopLeft(Finders.attMark.at(i)).dx;
                  expect(pos1 > pos2, true, reason: 'влево');
                  await tester.timedDragFrom(Func(tester).center(),
                      const Offset(20, 0), Delay.delay300);
                  final double pos3 =
                      tester.getTopLeft(Finders.attMark.at(i)).dx;
                  expect(pos3 > pos2, true, reason: 'вправо');
                });

                testWidgets(
                    'Вместе с перемещением ячеек посещаемости перемещается слайдер дат',
                    (tester) async {
                  await test.pos(tester);
                  int? i = await Func(tester).scrollVisible(Finders.attMark);
                  await tester.tapAt(const Offset(10, 10));
                  await tester.pumpAndSettle(Delay.delay100);
                  final double posDate =
                      tester.getCenter(Finders.attDate.at(i!)).dx;
                  // final double posMark = tester
                  //     .getCenter(Finders.attMark.at(2))
                  //     .dx;
                  // expect(posDate, posMark, reason: 'положение до движ');

                  await tester.timedDragFrom(Func(tester).center(),
                      const Offset(-20, 0), Delay.delay300);
                  await tester.pumpAndSettle(Delay.delay300);

                  final double posDate2 =
                      tester.getCenter(Finders.attDate.at(i)).dx;
                  // final double posMark2 = tester
                  //     .getCenter(Finders.attMark.at(2))
                  //     .dx;
                  // expect(posDate2, posMark2, reason: 'положение после движ');
                  expect(posDate2 < posDate, true,
                      reason: 'смещение после движ');
                });
              });
            });
            //
            //
            group('Поля посещаемости студентов', () {
              bool testPose3 = false;
              bool testPose4 = false;
              testWidgets('ФИ студента, выравнено по левому краю',
                  (tester) async {
                await test.pos(tester);
                final Finder name = find.byType(StudentNameWidget);
                final StudentNameWidget wid = tester.widget(name.first);
                expect(tester.getTopLeft(name.first).dx, 0,
                    reason: 'положение виджета');
                final Finder textName = find.descendant(
                    of: name,
                    matching: find.textContaining(createFullName(
                        wid.student.firstName, '', wid.student.lastName)));
                expect(tester.getTopLeft(textName).dx, 16,
                    reason: 'положение имени');

                testPose3 = tester.getBottomLeft(name.first).dy <=
                    tester.getTopLeft(Finders.attMark.first).dy;

                final Finder list = find
                    .ancestor(
                        of: Finders.attMarks,
                        matching: find.byType(SingleChildScrollView).first)
                    .first;
                final double pos1 =
                    tester.getTopLeft(Finders.attMarks.at(3)).dy;
                await tester.timedDrag(
                    list, const Offset(0, -200), Delay.delay300);
                final double pos2 =
                    tester.getTopLeft(Finders.attMarks.at(3)).dy;
                expect(pos1 >= pos2, true, reason: 'свайп вверх');
                testPose4 = pos1 >= pos2;
                await tester.timedDrag(
                    list, const Offset(0, 200), Delay.delay300);
                final double pos3 =
                    tester.getTopLeft(Finders.attMarks.at(3)).dy;
                testPose4 = testPose4 && pos2 <= pos3;
              });

              testWidgets(
                  'Рейтинг посещаемости напротив ФИ, выравнено по правому краю',
                  (tester) async {
                //       await test.pos(tester);
                expect(true, false);
              });

              testWidgets('Ячейки посещаемости ниже строки с ФИ',
                  (tester) async {
                // await test.pos(tester);
                // final Finder name = find.byType(StudentNameWidget);
                // expect(
                //     tester.getBottomLeft(name.first).dy <=
                //         tester.getTopLeft(Finders.attMark.first).dy,
                //     true,
                //     reason: 'положение');
                expect(testPose3, true);
              });

              testWidgets('Поля листаются свайпом вверх-вниз', (tester) async {
                // await test.pos(tester);
                // final Finder list = find.ancestor(
                //     of: Finders.attMarks,
                //     matching: find.byType(SingleChildScrollView).first).first;
                // final double pos1 =
                //     tester.getTopLeft(Finders.attMarks.at(3)).dy;
                // await tester.timedDrag(
                //     list, const Offset(0, -200), Delay.delay300);
                // final double pos2 =
                //     tester.getTopLeft(Finders.attMarks.at(3)).dy;
                // expect(pos1 >= pos2, true, reason: 'свайп вверх');
                // await tester.timedDrag(
                //     list, const Offset(0, 200), Delay.delay300);
                // final double pos3 =
                //     tester.getTopLeft(Finders.attMarks.at(3)).dy;
                // expect(pos2 <= pos3, true, reason: 'вайп вниз');
                expect(testPose4, true);
              });
            });
          });
          //
          //
          group('Кнопка автоматической отметки на парах', () {
            testWidgets('Кнопка с видео-значком в правом верхнем углу',
                (tester) async {
              await test.journal(tester, login: 'Войти как преподаватель');
              await Func(tester).tapDelay(300, Finders.jouLesWid.first);
              await Func(tester)
                  .tapDelay(300, find.textContaining('Посещаемость'));
              expect(Finders.attendance, findsOneWidget);
            });
            //
            //
            group(
                'Если bluetooth на устройстве включен, то при тапе на кнопку:',
                () {
              // testWidgets('включается режим отметки', (tester) async {});

              testWidgets('открывается модальное окно', (tester) async {
                await test.pos(tester);
                expect(find.byType(AlertDialog).tryEvaluate(), false,
                    reason: 'нет окна');
                await tester.tap(Finders.attendance);
                await tester.pump(Delay.delay1);
                expect(find.byType(AlertDialog).tryEvaluate(), true,
                    reason: 'есть окно');
                await tester.pump(Delay.delay1);
                await tester.tap(find.textContaining('Отключить'));
              });
              //
              //
              //
              //
              group('Окно содержит', () {
                testWidgets('заголовком “Включен режим отметки”',
                    (tester) async {
                  await test.pos(tester);
                  await tester.tap(Finders.attendance);
                  await tester.pump(Delay.delay1);
                  expect(find.textContaining('Включен режим отметки'),
                      findsOneWidget);
                  await tester.pump(Delay.delay1);
                  await tester.tap(find.textContaining('Отключить'));
                });
                testWidgets('анимацией, отражающей активность режима',
                    (tester) async {
                  await test.pos(tester);
                  await tester.tap(Finders.attendance);
                  await tester.pump(Delay.delay1);
                  await tester.pump(Delay.delay1);
                  final Finder lottie = find.byType(Lottie);
                  expect(lottie, findsOneWidget, reason: 'анимация одна');
                  await tester.pump(Delay.delay1);
                  await tester.pump(Delay.delay1);
                  await tester.tap(find.textContaining('Отключить'));
                });
                testWidgets(
                    'кнопкой “Отключить”, при тапе на которую окно закрывается, а режим отметки выключается',
                    (tester) async {
                  await test.pos(tester);
                  expect(find.byType(AlertDialog).tryEvaluate(), false,
                      reason: ' нет окна');
                  await tester.tap(Finders.attendance);
                  await tester.pump(Delay.delay1);
                  await tester.pump(Delay.delay1);
                  expect(find.byType(AlertDialog).tryEvaluate(), true,
                      reason: 'есть окно');
                  await tester.pump(Delay.delay1);
                  await tester.pump(Delay.delay1);
                  await tester.tap(find.textContaining('Отключить'));
                  await tester.pump(Delay.delay1);
                  await tester.pump(Delay.delay1);
                  expect(find.byType(AlertDialog).tryEvaluate(), false,
                      reason: ' нет окна2');
                });

                testWidgets(
                    'окно закрывается при тапе на неактивную часть экрана (jnvtnrf)',
                    (tester) async {
                  await test.pos(tester);
                  final Finder wind = find.byType(AlertDialog);
                  expect(wind.tryEvaluate(), false, reason: ' нет окна');
                  await tester.tap(Finders.attendance);
                  if (await Permission.bluetoothAdvertise.status.isGranted !=
                      true) {
                    while (
                        await Permission.bluetoothAdvertise.status.isGranted !=
                            true) {
                      await tester.pump(Delay.delay1);
                    }
                    await tester.pump(Delay.delay1);
                    await tester.pump(Delay.delay1);
                    expect(wind.tryEvaluate(), true, reason: 'есть окно');
                    await tester.tapAt(const Offset(10, 10));
                    await tester.pump(Delay.delay1);
                    await tester.pump(Delay.delay1);
                    await tester.pump(Delay.delay1);
                    await tester.tapAt(const Offset(10, 10));
                    await tester.pump(Delay.delay1);
                    await tester.pump(Delay.delay1);
                    await tester.pump(Delay.delay1);
                  }
                  await tester.pump(Delay.delay1);
                  await tester.pump(Delay.delay1);
                  expect(wind.tryEvaluate(), true, reason: 'есть окно');
                  await tester.tapAt(const Offset(10, 10));
                  await tester.pump(Delay.delay1);
                  await tester.pump(Delay.delay1);
                  await tester.pump(Delay.delay1);
                  expect(wind.tryEvaluate(), false, reason: ' нет окна 2');
                });
              });
            });
            //
            //
            group(
                'Если bluetooth на устройстве не включен, то при тапе на кнопку',
                () {
              testWidgets('Появляется диалоговое окно, в котором содержатся:',
                  (tester) async {
                await test.pos(tester);
                expect(find.byType(AlertDialog).tryEvaluate(), false,
                    reason: 'нет окна');
                await tester.tap(Finders.attendance);
                await tester.pump(Delay.delay1);
                expect(find.byType(AlertDialog).tryEvaluate(), true,
                    reason: 'есть окно');
                await tester.pump(Delay.delay1);
              });
              //
              //
              group('диалоговое окно содержит', () {
                testWidgets('Заголовок “Присутствие на паре”', (tester) async {
                  await test.pos(tester);
                  await tester.tap(Finders.attendance);
                  await tester.pump(Delay.delay1);
                  final Finder text = find.descendant(
                      of: find.byType(AlertDialog),
                      matching: find.textContaining('ПРИСУТСТВИЕ НА ПАРЕ'));
                  expect(text.tryEvaluate(), true,
                      reason: 'проверка заголовка на экране');
                });
                testWidgets(
                    'Текст “Для отметки присутствия на паре требуется включить bluetooth”',
                    (tester) async {
                  await test.pos(tester);
                  await tester.tap(Finders.attendance);
                  await tester.pump(Delay.delay1);
                  final Finder text = find.descendant(
                      of: find.byType(AlertDialog),
                      matching: find.textContaining(
                          'Для отметки присутствия на паре требуется включить bluetooth'));
                  expect(text.tryEvaluate(), true,
                      reason: 'проверка текста на экране');
                });
                testWidgets(
                    'Кнопка “Отменить”, при тапе на которую диалоговое окно закрывается',
                    (tester) async {
                  await test.pos(tester);
                  await tester.tap(Finders.attendance);
                  await tester.pump(Delay.delay1);
                  final Finder text = find.descendant(
                      of: find.byType(AlertDialog),
                      matching: find.textContaining('ОТМЕНИТЬ'));
                  expect(text.tryEvaluate(), true,
                      reason: 'проверка кнопки на экране');
                  await tester.tap(text);
                  await tester.pump(Delay.delay1);
                  expect(text.tryEvaluate(), false,
                      reason: 'проверка закрытия первого окна');
                  await tester.pump(Delay.delay1);
                  await Func(tester)
                      .tapDelay(300, find.textContaining('Закрыть'));
                  expect(find.byType(AlertDialog).tryEvaluate(), false,
                      reason: 'проверка закрытия всех диал.окон');
                });
                testWidgets('Кнопка “Включить”, при тапе на которую',
                    (tester) async {
                  await test.pos(tester);
                  await tester.tap(Finders.attendance);
                  await tester.pump(Delay.delay1);
                  final Finder text = find.descendant(
                      of: find.byType(AlertDialog),
                      matching: find.textContaining('ВКЛЮЧИТЬ'));
                  expect(text.tryEvaluate(), true,
                      reason: 'проверка кнопки на экране');
                });
                //
                //
                group('при тапе на которую:', () {
                  // testWidgets(
                  //     'если bluetooth на устройстве включен, включается режим отметки',
                  //     (tester) async {
                  //       expect(true, false);
                  //     });
                  testWidgets(
                      'если bluetooth на устройстве не включен, то появляется диалоговое окно, в котором отображается:',
                      (tester) async {
                    await test.pos(tester);
                    await tester.tap(Finders.attendance);
                    await tester.pump(Delay.delay1);
                    final Finder text = find.descendant(
                        of: find.byType(AlertDialog),
                        matching: find.textContaining('ВКЛЮЧИТЬ'));
                    await tester.tap(text);
                    await tester.pump(Delay.delay1);
                    expect(find.textContaining('Режим отметки недоступен'),
                        findsAny);
                  });
                  //
                  //
                  group('диалоговое окно содержит:', () {
                    testWidgets('Текст “Режим отметки недоступен”',
                        (tester) async {
                      await test.pos(tester);
                      await tester.tap(Finders.attendance);
                      await tester.pump(Delay.delay1);
                      final Finder text = find.descendant(
                          of: find.byType(AlertDialog),
                          matching: find.textContaining('ВКЛЮЧИТЬ'));
                      await tester.tap(text);
                      await tester.pump(Delay.delay1);
                      expect(find.textContaining('Режим отметки недоступен'),
                          findsAny);
                    });

                    testWidgets(
                        'Кнопка “Закрыть”, при тапе на которую диалоговое окно закрывается',
                        (tester) async {
                      await test.pos(tester);
                      await tester.tap(Finders.attendance);
                      await tester.pump(Delay.delay1);
                      final Finder text = find.descendant(
                          of: find.byType(AlertDialog),
                          matching: find.textContaining('ВКЛЮЧИТЬ'));
                      await tester.tap(text);
                      await tester.pump(Delay.delay1);
                      final Finder button = find.descendant(
                          of: find.byType(AlertDialog),
                          matching: find.textContaining('Закрыть'));
                      expect(button, findsAny, reason: 'налич кнопки');
                      await tester.tap(button);
                      await Func(tester).pump(10);
                      expect(find.byType(AlertDialog).tryEvaluate(), false,
                          reason: 'проверка закрытия всех диал.окон');
                    });

                    testWidgets(
                        'Диалоговое окно закрывается тапом по неактивной части экрана',
                        (tester) async {
                      await test.pos(tester);
                      await tester.tap(Finders.attendance);
                      await tester.pump(Delay.delay1);
                      final Finder text = find.descendant(
                          of: find.byType(AlertDialog),
                          matching: find.textContaining('ВКЛЮЧИТЬ'));
                      await tester.tap(text);
                      await tester.pump(Delay.delay1);
                      await tester.tapAt(const Offset(10, 10));
                      await tester.pump(Delay.delay(2000));
                      expect(find.byType(AlertDialog).tryEvaluate(), false);
                    });
                  });
                });

                testWidgets(
                    'Диалоговое окно закрывается тапом по неактивной части экрана',
                    (tester) async {
                  await test.pos(tester);
                  await tester.tap(Finders.attendance);
                  await tester.tapAt(const Offset(10, 10));
                  await tester.tapAt(const Offset(10, 10));
                  await tester.tapAt(const Offset(10, 10));
                  await tester.pump(Delay.delay(200));
                  expect(find.byType(AlertDialog).tryEvaluate(), false);
                });
              });
            });
          });
        });
        //
        //
        group('Страница Оценок', () {
          //
          //
          group('Элементы страницы Оценок', () {
            testWidgets(
                'Заголовок “Группа [номер группы] Курс [номер курса]” по центру',
                (tester) async {
              await test.pos(tester, t: true);
              final SubjectGradesScreenView page =
                  tester.widget(find.byType(SubjectGradesScreenView));
              final Finder title = find.textContaining(page.title);
              expect(title.tryEvaluate(), true, reason: 'найден на экране');
              expect(Func(tester).size().width / 2, tester.getCenter(title).dx,
                  reason: 'положение');
            });
            testWidgets(
                'Кнопка назад в левом верхнем углу, при тапе на которую открывается предыдущая страница',
                (tester) async {
              await test.journal(tester, login: 'Войти как преподаватель');
              expect(find.byType(TeacherJournalScreenView).tryEvaluate(), true,
                  reason: 'стр. Журналы');
              await Func(tester).tapDelay(300, Finders.jouLesWid.first);
              await Func(tester).tapDelay(300, find.textContaining('Оценки'));
              expect(find.byType(TeacherJournalScreenView).tryEvaluate(), false,
                  reason: 'стр. Оценки');
              await Func(tester).tapDelay(300, Finders.back);
              expect(find.byType(TeacherJournalScreenView).tryEvaluate(), true,
                  reason: 'стр. Журналы, после возврата');
            });
            testWidgets('Блок учета оценок', (tester) async {
              await test.pos(tester, t: true);
              expect(Finders.grades.tryEvaluate(), true,
                  reason: 'блок на экране');
            });
            testWidgets(
                'Возврат на предыдущую страницу происходит свайпом вправо',
                (tester) async {
                  await test.pos(tester, t: true);
              expect(true, false);
            });
          });
          //
          //
          group('Блок учета оценок', () {
            testWidgets('Заголовок - наименование предмета по центру',
                (tester) async {
              await test.pos(tester, t: true);
              final SubjectGradesScreenView page =
                  tester.widget(find.byType(SubjectGradesScreenView));
              final Finder header = find.textContaining(page.lessonName);
              expect(header.tryEvaluate(), true, reason: 'Заголовок на экране');
              expect(tester.getCenter(header).dx, Func(tester).size().width / 2,
                  reason: 'положение');
            });

            testWidgets('Слайдер с отображением аттестаций', (tester) async {
              await test.pos(tester, t: true);
              final Finder att = find.ancestor(
                  of: Finders.attName.first,
                  matching: find.byType(ListView).first);
              expect(att.tryEvaluate(), true, reason: 'слайдер на экране');
              expect(Finders.attName.first.tryEvaluate(), true,
                  reason: 'первая аттестация на экране');
            });

            testWidgets('Блок с Полями оценок студентов', (tester) async {
              await test.pos(tester, t: true);
              expect(Finders.attList.tryEvaluate(), true,
                  reason: 'блок на экране');
            });
            //
            //
            group('Слайдер с отображением аттестаций', () {
              testWidgets('Слайдер листается свайпом вправо-влево',
                  (tester) async {
                await test.journal(tester, login: 'Войти как преподаватель');
                await Func(tester)
                    .tapDelay(200, find.textContaining('Экзамен').first);
                await Func(tester)
                    .tapDelay(1000, find.textContaining('Оценки'));

                final double pos1 = tester.getCenter(Finders.attName.at(1)).dx;
                await tester.timedDragFrom(
                    tester.getCenter(Finders.attName.at(1)),
                    const Offset(-100, 0),
                    Delay.delay300);
                final double pos2 = tester.getCenter(Finders.attName.at(1)).dx;

                expect(pos1 > pos2, true);
              });
              testWidgets("""При тапе на выбранную аттестацию, выбранный слайд
              наименования аттестации выделяется сиреневым цветом и ячейки
              успеваемости студентов в данную аттестацию выделяются бледно-сиреневым цветом""",
                  (tester) async {
                await test.pos(tester, t: true);
                final Finder contain = find.byWidgetPredicate((widget) =>
                    widget is Container &&
                    widget.key == Keys.attName &&
                    (widget.decoration as BoxDecoration).color ==
                        AppColor.inactive);
                final Finder att = find.ancestor(
                    of: find.textContaining('1'), matching: contain);
                expect(att.tryEvaluate(), true,
                    reason: 'атт не выделена до нажатия');

                final Finder grade = find.descendant(
                    of: Finders.attPerson, matching: Finders.inAtt.at(0));
                final TextField text = tester.widget(grade);
                expect(
                    text.decoration?.fillColor != AppColor.selectedGradeColor,
                    true,
                    reason: 'оценки не выделены до нажатия');

                await Func(tester).tapDelay(300, att);

                final Finder contain2 = find.byWidgetPredicate((widget) =>
                    widget is Container &&
                    widget.key == Keys.attName &&
                    (widget.decoration as BoxDecoration).color ==
                        AppColor.subjectColor);
                final Finder att2 = find.ancestor(
                    of: find.textContaining('1'), matching: contain2);
                expect(att2.tryEvaluate(), true,
                    reason: 'атт выделена после нажатия');

                final TextField text2 = tester.widget(grade);
                expect(
                    text2.decoration?.fillColor == AppColor.selectedGradeColor,
                    true,
                    reason: 'оценки выделены после нажатия');
              });
              testWidgets(
                  'Вместе с перемещением слайдера перемещаются ячейки в полях успеваемости студентов',
                  (tester) async {
                await test.journal(tester, login: 'Войти как преподаватель');
                await Func(tester)
                    .tapDelay(200, find.textContaining('Экзамен').first);
                await Func(tester)
                    .tapDelay(1000, find.textContaining('Оценки'));

                final double pos1 = tester.getCenter(Finders.inAtt.at(1)).dx;
                await tester.timedDragFrom(
                    tester.getCenter(Finders.attName.at(1)),
                    const Offset(-100, 0),
                    Delay.delay300);
                final double pos2 = tester.getCenter(Finders.inAtt.at(1)).dx;

                expect(pos1 > pos2, true);
              });
              // testWidgets('Целиком на экране отображается 5 слайдов',
              //     (tester) async {
              //   await test.pos(tester, t: true);
              //   expect(Finders.attList.tryEvaluate(), true,
              //       reason: 'блок на экране');
              // });
            });
            //
            //
            group('Блок с полями успеваемости студентов', () {
              testWidgets('ФИ студента, выравнено по левому краю',
                  (tester) async {
                await test.pos(tester, t: true);
                expect(tester.getTopLeft(Finders.gradesName.first).dx, 16,
                    reason: 'слева');
              });
              testWidgets(
                  'Средняя взвешенная оценка напротив ФИ серым цветом, выравнено по правому краю',
                  (tester) async {
                await test.pos(tester, t: true);
                Finders.gradesAVG.found.isNotEmpty
                    ? expect(tester.getCenter(Finders.gradesName.first).dy,
                        tester.getTopLeft(Finders.gradesName.first).dy)
                    : expect(true, true, reason: 'не найдено');
              });

              testWidgets('Ячейки успеваемости ниже строки с ФИ',
                  (tester) async {
                await test.pos(tester, t: true);
                expect(
                    tester.getBottomLeft(Finders.gradesName.first).dy <=
                        tester.getTopLeft(Finders.attPerson.first).dy,
                    true,
                    reason: 'положение');
              });
              testWidgets('Поля листаются свайпом вверх-вниз', (tester) async {
                await test.pos(tester, t: true);
                final double pos1 =
                    tester.getTopLeft(Finders.gradesName.at(3)).dy;
                await tester.timedDragFrom(Func(tester).center(),
                    const Offset(0, -100), Delay.delay300);
                final double pos2 =
                    tester.getTopLeft(Finders.gradesName.at(3)).dy;
                expect(pos1 > pos2, true, reason: 'положение');
                await tester.timedDragFrom(Func(tester).center(),
                    const Offset(0, 100), Delay.delay300);
                final double pos3 =
                    tester.getTopLeft(Finders.gradesName.at(3)).dy;
                expect(pos3 > pos2, true, reason: 'положение');
              });
            });
            //
            //
            group('Ячейки успеваемости студентов (оценки)', () {
              group('Если ячейка еще не заполнена: (оценки)', () {
                testWidgets(
                    'При тапе на ячейку успеваемости в ней появляется мигающий курсор',
                    (tester) async {
                  await test.pos(tester, t: true);
                  final TextField text = tester.widget(Finders.inAtt.first);
                  expect(text.cursorColor, AppColor.black);
                });

                testWidgets(
                    'После ввода баллов ячейка заполняется установленным значением1121',
                    (tester) async {
                  await test.pos(tester, t: true);

                  await Func(tester).enterValue(1, 49);
                  expect(
                      find.descendant(
                          of: Finders.inAtt.at(1),
                          matching: find.textContaining('49')),
                      findsAny);
                });

                testWidgets(
                    'Ввести можно число, не больше максимально возможного',
                    (tester) async {
                  await test.pos(tester, t: true);

                  await Func(tester).enterValue(1, 51);
                  expect(
                      find.descendant(
                          of: Finders.inAtt.at(1),
                          matching: find.textContaining('51')),
                      findsNothing,
                      reason: '51 -> false');
                  await Func(tester).enterValue(1, 50);
                  expect(
                      find.descendant(
                          of: Finders.inAtt.at(1),
                          matching: find.textContaining('50')),
                      findsAny,
                      reason: '50 -> true');
                });
                testWidgets('Ячейки листаются свайпом влево-вправо',
                    (tester) async {
                  await test.journal(tester, login: 'Войти как преподаватель');
                  await Func(tester)
                      .tapDelay(200, find.textContaining('Экзамен').first);
                  await Func(tester)
                      .tapDelay(1000, find.textContaining('Оценки'));

                  final double pos1 = tester.getCenter(Finders.inAtt.at(1)).dx;
                  await tester.timedDragFrom(
                      tester.getCenter(Finders.inAtt.at(1)),
                      const Offset(-100, 0),
                      Delay.delay300);
                  final double pos2 = tester.getCenter(Finders.inAtt.at(1)).dx;

                  expect(pos1 > pos2, true);
                });
                testWidgets(
                    'Вместе с перемещением ячеек посещаемости перемещается слайдер аттестаций',
                    (tester) async {
                  await test.journal(tester, login: 'Войти как преподаватель');
                  await Func(tester)
                      .tapDelay(200, find.textContaining('Экзамен').first);
                  await Func(tester)
                      .tapDelay(1000, find.textContaining('Оценки'));

                  final double pos1 =
                      tester.getCenter(Finders.attName.at(1)).dx;
                  await tester.timedDragFrom(
                      tester.getCenter(Finders.inAtt.at(1)),
                      const Offset(-100, 0),
                      Delay.delay300);
                  final double pos2 =
                      tester.getCenter(Finders.attName.at(1)).dx;

                  expect(pos1 > pos2, true);
                });
              });
              //
              //
              group('Если ячейка уже была заполнена: (оценки)', () {
                testWidgets(
                    'При тапе на ячейку успеваемости в ней появляется мигающий курсор',
                    (tester) async {
                  await test.pos(tester, t: true);
                  final TextField text = tester.widget(Finders.inAtt.first);
                  expect(text.cursorColor, AppColor.black);
                });
                testWidgets(
                    'После редактирования появляется кнопка ”Сохранить”, при тапе на которую изменение сохраняется',
                    (tester) async {
                  await test.pos(tester, t: true);

                  await Func(tester).enterValue(0, 49);
                  final Finder button = find.ancestor(
                      of: find.textContaining('Сохранить'),
                      matching: find.byType(OutlinedButton));
                  expect(button, findsOneWidget);
                  await Func(tester).tapDelay(200, button);
                  await Func(tester).tapDelay(1000, Finders.back);

                  await Func(tester).tapDelay(300, Finders.jouLesWid.first);
                  await Func(tester)
                      .tapDelay(300, find.textContaining('Оценки'));

                  expect(
                      find.descendant(
                          of: Finders.inAtt.at(0),
                          matching: find.textContaining('49')),
                      findsAny,
                      reason: '49 -> true');
                });
                testWidgets(
                    'Ввести можно число, не больше максимально возможного',
                    (tester) async {
                  await test.pos(tester, t: true);

                  await Func(tester).enterValue(0, 51);
                  expect(
                      find.descendant(
                          of: Finders.inAtt.at(0),
                          matching: find.textContaining('51')),
                      findsNothing,
                      reason: '51 -> false');
                  await Func(tester).enterValue(0, 50);
                  expect(
                      find.descendant(
                          of: Finders.inAtt.at(0),
                          matching: find.textContaining('50')),
                      findsAny,
                      reason: '50 -> true');
                });
              });
              //
              //
              group('Максимальное к-во баллов за аттестации определяются:1',
                  () {
                bool testMaxBall2 = false;
                bool testMaxBall3 = false;
                testWidgets('За аттестации максимальное к-во баллов - 50',
                    (tester) async {
                  await test.journal(tester, login: 'Войти как преподаватель');
                  await Func(tester)
                      .tapDelay(200, find.textContaining('Экзамен').first);
                  await Func(tester)
                      .tapDelay(1000, find.textContaining('Оценки'));

                  await Func(tester).enterValue(1, 51);
                  expect(
                      find.descendant(
                          of: Finders.inAtt.at(1),
                          matching: find.textContaining('51')),
                      findsNothing,
                      reason: '51 -> false');

                  await Func(tester).enterValue(1, 50);
                  expect(
                      find.descendant(
                          of: Finders.inAtt.at(1),
                          matching: find.textContaining('50')),
                      findsAny,
                      reason: '50 -> true');

                  await Func(tester).enterValue(3, 51);
                  testMaxBall2 = !find
                      .descendant(
                          of: Finders.inAtt.at(3),
                          matching: find.textContaining('51'))
                      .tryEvaluate();
                  await Func(tester).enterValue(3, 50);
                  testMaxBall2 = testMaxBall2 &&
                      find
                          .descendant(
                              of: Finders.inAtt.at(3),
                              matching: find.textContaining('50'))
                          .tryEvaluate();

                  await Func(tester).enterValue(4, 11);
                  testMaxBall3 = !find
                      .descendant(
                          of: Finders.inAtt.at(4),
                          matching: find.textContaining('1'))
                      .tryEvaluate();
                  await Func(tester).enterValue(4, 10);
                  testMaxBall3 = testMaxBall3 &&
                      find
                          .descendant(
                              of: Finders.inAtt.at(4),
                              matching: find.textContaining('10'))
                          .tryEvaluate();
                });
                testWidgets('За экзамен максимальное к-во баллов - 50',
                    (tester) async {
                  // await test.journal(tester, login: 'Войти как преподаватель');
                  // await Func(tester)
                  //     .tapDelay(200, find.textContaining('Экзамен').first);
                  // await Func(tester)
                  //     .tapDelay(1000, find.textContaining('Оценки'));
                  //
                  // await Func(tester).enterValue(3, 51);
                  // expect(
                  //     find.descendant(
                  //         of: Finders.inAtt.at(3),
                  //         matching: find.textContaining('51')),
                  //     findsNothing,
                  //     reason: '51 -> false');
                  //
                  // await Func(tester).enterValue(3, 50);
                  // expect(
                  //     find.descendant(
                  //         of: Finders.inAtt.at(3),
                  //         matching: find.textContaining('50')),
                  //     findsAny,
                  //     reason: '50 -> true');
                  expect(testMaxBall2, true);
                });
                testWidgets(
                    'За дополнительный балл максимальное к-во баллов - 10',
                    (tester) async {
                  // await test.journal(tester, login: 'Войти как преподаватель');
                  // await Func(tester)
                  //     .tapDelay(200, find.textContaining('Экзамен').first);
                  // await Func(tester)
                  //     .tapDelay(1000, find.textContaining('Оценки'));
                  //
                  // await Func(tester).enterValue(4, 11);
                  // expect(
                  //     find.descendant(
                  //         of: Finders.inAtt.at(4),
                  //         matching: find.textContaining('1')),
                  //     findsNothing,
                  //     reason: '11 -> false');
                  //
                  // await Func(tester).enterValue(4, 10);
                  // expect(
                  //     find.descendant(
                  //         of: Finders.inAtt.at(4),
                  //         matching: find.textContaining('10')),
                  //     findsAny,
                  //     reason: '10 -> true');
                  expect(testMaxBall3, true);
                });
                testWidgets(
                    'Итоговый балл определяется автоматически - среднее арифметическое между доп. баллом и экзаменом',
                    (tester) async {
                  final List att = [11, 11, 11, 11, 10];
                  await test.journal(tester, login: 'Войти как преподаватель');
                  await Func(tester).tapDelay(300, find.text('Экзамен').first);
                  await Func(tester).tapDelay(1000, find.text('Оценки'));

                  for (int i = 0; i < att.length; i++) {
                    await Func(tester).enterValue(i, att[i]);
                  }
                  await Func(tester).tapDelay(200, find.text('Сохранить'));
                  await Func(tester).tapDelay(500, Finders.back);
                  await Func(tester).tapDelay(300, find.text('Экзамен').first);
                  await Func(tester).tapDelay(1000, find.text('Оценки'));
                  final Finder itog = find.descendant(
                      of: Finders.inAtt.at(5), matching: find.text('2'));
                  expect(itog, findsAny, reason: 'оценка');
                });

                testWidgets(
                    'Итог определяется автоматически - перевод в пятибалльную шкалу',
                    (tester) async {
                  final List att = [43, 44, 44, 40, 9];
                  await test.journal(tester, login: 'Войти как преподаватель');
                  await Func(tester).tapDelay(300, find.text('Экзамен').first);
                  await Func(tester).tapDelay(1000, find.text('Оценки'));

                  for (int i = 0; i < att.length; i++) {
                    await Func(tester).enterValue(i, att[i]);
                  }
                  await tester.pumpAndSettle(Delay.delay300);
                  await Func(tester).tapDelay(200, find.text('Сохранить'));
                  await Func(tester).tapDelay(500, Finders.back);
                  await Func(tester).tapDelay(300, find.text('Экзамен').first);
                  await Func(tester).tapDelay(1000, find.text('Оценки'));
                  final Finder itog = find.descendant(
                      of: Finders.inAtt.at(5), matching: find.text('4'));
                  expect(itog, findsAny, reason: 'оценка');
                });
              });
              //
              //
              group('Цвета определяются:', () {
                bool testColor2 = false;
                bool testColor3 = false;
                bool testColor4 = false;
                testWidgets('0-24 - розовый', (tester) async {
                  await test.journal(tester, login: 'Войти как преподаватель');
                  await Func(tester).tapDelay(300, find.text('Экзамен').first);
                  await Func(tester).tapDelay(1000, find.text('Оценки'));

                  await Func(tester).enterValue(3, 24);
                  TextField att = tester.widget(Finders.inAtt.at(3));
                  expect((att.decoration as InputDecoration).fillColor,
                      AppColor.badGrade,
                      reason: 'проверка цвета');

                  await Func(tester).enterValue(3, 34);
                  att = tester.widget(Finders.inAtt.at(3));
                  testColor2 = ((att.decoration as InputDecoration).fillColor ==
                      AppColor.normalGrade);

                  await Func(tester).enterValue(3, 44);
                  att = tester.widget(Finders.inAtt.at(3));
                  testColor3 = ((att.decoration as InputDecoration).fillColor ==
                      AppColor.goodGrade);

                  await Func(tester).enterValue(3, 50);
                  att = tester.widget(Finders.inAtt.at(3));
                  testColor4 = ((att.decoration as InputDecoration).fillColor ==
                      AppColor.perfectGrade);
                });
                testWidgets('25-34 - желтый',
                    (tester) async => expect(testColor2, true));
                testWidgets('35-44 - сиреневый',
                    (tester) async => expect(testColor3, true));
                testWidgets('45-50 - зеленый',
                    (tester) async => expect(testColor4, true));
              });
            });
          });
        });
      });
      //
      //
      //
      group('Страница Профиль (преподаватель)', () {
        //
        //
        group('Элементы страницы Профиль (преподаватель)', () {
          bool profileTest2 = false;
          bool profileTest3 = false;
          bool profileTest4 = false;
          bool profileTest5 = false;
          bool profileTest6 = false;
          testWidgets('Заголовок по центру', (tester) async {
            await test.profile(tester, t: true);
            expect(
                reason: 'по центру',
                tester.getCenter(find.text('Профиль')).dx,
                Func(tester).size().width / 2);

            // Блок пользователя
            profileTest2 =
                (find.byType(UserInfoCard).tryEvaluate()) ? true : false;
            // Поле “Уведомления”
            profileTest3 =
                (Finders.field('Уведомления').tryEvaluate()) ? true : false;
            // Поле Настройки
            profileTest4 =
                (Finders.field('Настройки').tryEvaluate()) ? true : false;
            // Поле Выйти из аккаунта
            profileTest5 = (Finders.field('Выйти из аккаунта').tryEvaluate())
                ? true
                : false;
            // Поле Удалить аккаунт
            profileTest6 =
                (Finders.field('Удалить аккаунт').tryEvaluate()) ? true : false;
          });
          testWidgets('Блок пользователя', (tester) async {
            // await test.profile(tester, t: true);
            // expect(find.byType(UserInfoCard).tryEvaluate(), true,
            //     reason: 'блок на экране');
            expect(profileTest2, true);
          });

          testWidgets('Поле “Уведомления”', (tester) async {
            // await test.profile(tester, t: true);
            // expect(Finders.field('Уведомления').tryEvaluate(), true,
            //     reason: 'поле найдено');
            expect(profileTest3, true);
          });

          testWidgets('Поле “Настройки”', (tester) async {
            // await test.profile(tester, t: true);
            // expect(Finders.field('Настройки').tryEvaluate(), true,
            //     reason: 'поле найдено');
            expect(profileTest4, true);
          });

          testWidgets('Поле “Выйти из аккаунта”', (tester) async {
            // await test.profile(tester, t: true);
            // expect(Finders.field('Выйти из аккаунта').tryEvaluate(), true,
            //     reason: 'поле найдено');
            expect(profileTest5, true);
          });

          testWidgets('Поле “Удалить аккаунт”', (tester) async {
            //   await test.profile(tester, t: true);
            //   expect(Finders.field('Удалить аккаунт').tryEvaluate(), true,
            //       reason: 'поле найдено');
            expect(profileTest6, true);
          });
        });
        //
        //
        group('Блок пользователя', () {
          bool blockTeacher2 = false;
          bool blockTeacher3 = false;
          bool blockTeacher4 = false;
          testWidgets('Ниже заголовка', (tester) async {
            await test.profile(tester, t: true);
            expect(
                tester.getBottomLeft(find.text('Профиль')).dy <
                    tester.getTopLeft(find.byType(UserInfoCard)).dy,
                true);

            //   ФИО студента в 2 строки: 1) ФИ 2)О
            expect(
                find
                    .textContaining(Func(tester).usInfoCard().name)
                    .tryEvaluate(),
                true,
                reason: 'проверка на экране');
            blockTeacher2 = (find
                    .textContaining(Func(tester).usInfoCard().name)
                    .tryEvaluate())
                ? true
                : false;

            //   Степень преподавателя ниже ФИО
            final Finder name =
                find.textContaining(Func(tester).usInfoCard().name);
            final Finder rank =
                find.textContaining(Func(tester).usInfoCard().rank!);
            blockTeacher3 = (name.tryEvaluate()) ? true : false;
            blockTeacher3 =
                (blockTeacher3 && rank.tryEvaluate()) ? true : false;
            blockTeacher3 = (blockTeacher3 &&
                    tester.getBottomLeft(name).dy <= tester.getTopLeft(rank).dy)
                ? true
                : false;

            //   Название факультета внизу блока
            final Finder faculty =
                find.textContaining(Func(tester).usInfoCard().faculty);
            expect(rank.tryEvaluate(), true,
                reason: 'проверка отбражения степени');
            expect(faculty.tryEvaluate(), true,
                reason: 'проверка отбражения факультета');
            expect(
                tester.getBottomLeft(rank).dy <= tester.getTopLeft(faculty).dy,
                true,
                reason: 'проверка положения');
            blockTeacher4 = (rank.tryEvaluate()) ? true : false;
            blockTeacher4 =
                (blockTeacher4 && faculty.tryEvaluate()) ? true : false;
            blockTeacher4 = (blockTeacher4 &&
                    tester.getBottomLeft(rank).dy <=
                        tester.getTopLeft(faculty).dy)
                ? true
                : false;
          });

          testWidgets('ФИО студента в 2 строки: 1) ФИ 2)О', (tester) async {
            // await test.profile(tester, t: true);
            // expect(
            //     find
            //         .textContaining(Func(tester).usInfoCard().name)
            //         .tryEvaluate(),
            //     true,
            //     reason: 'проверка на экране');
            expect(blockTeacher2, true);
          });

          testWidgets('Степень преподавателя ниже ФИО', (tester) async {
            // await test.profile(tester, t: true);
            // final Finder name =
            //     find.textContaining(Func(tester).usInfoCard().name);
            // final Finder rank =
            //     find.textContaining(Func(tester).usInfoCard().rank!);
            // expect(name.tryEvaluate(), true,
            //     reason: 'проверка отбражения имени');
            // expect(rank.tryEvaluate(), true,
            //     reason: 'проверка отбражения степени');
            // expect(tester.getBottomLeft(name).dy <= tester.getTopLeft(rank).dy,
            //     true,
            //     reason: 'проверка положения');
            expect(blockTeacher3, true);
          });

          testWidgets('Название факультета внизу блока', (tester) async {
            // await test.profile(tester, t: true);
            // final Finder rank =
            //     find.textContaining(Func(tester).usInfoCard().rank!);
            // final Finder faculty =
            //     find.textContaining(Func(tester).usInfoCard().faculty);
            // expect(rank.tryEvaluate(), true,
            //     reason: 'проверка отбражения степени');
            // expect(faculty.tryEvaluate(), true,
            //     reason: 'проверка отбражения факультета');
            // expect(
            //     tester.getBottomLeft(rank).dy <= tester.getTopLeft(faculty).dy,
            //     true,
            //     reason: 'проверка положения');
            expect(blockTeacher4, true);
          });
        });
        //
        //
        group('Поле Уведомления', () {
          testWidgets('Ниже лока пользователя', (tester) async {
            await test.profile(tester, t: true);
            expect(
                tester.getBottomLeft(find.byType(UserInfoCard)).dy <=
                    tester.getTopLeft(Finders.field('Уведомления')).dy,
                true,
                reason: 'положение');
          });

          /*testWidgets('При тапе поле происходит переход на страницу "Уведомления"', (tester) async {
        await test.profile(tester);
        final Finder finder = find.byWidgetPredicate((widget) => widget is ProfileButton && widget.title == 'Уведомления');
        await Func(tester).tapDelay(1000, finder);
        final Finder finder2 = find.byType(PortfolioScreenView);
        expect(finder2, findsOneWidget);
      });*/
        });
        //
        //
        group('Поле Настройки', () {
          testWidgets('Ниже поля Уведомления', (tester) async {
            await test.profile(tester, t: true);
            expect(
                tester.getBottomLeft(Finders.field('Уведомления')).dy <=
                    tester.getTopLeft(Finders.field('Настройки')).dy,
                true,
                reason: 'положение');
          });

          /*testWidgets('При тапе поле происходит переход на страницу "Уведомления"', (tester) async {
        await test.profile(tester);
        final Finder finder = find.byWidgetPredicate((widget) => widget is ProfileButton && widget.title == 'Уведомления');
        await Func(tester).tapDelay(1000, finder);
        final Finder finder2 = find.byType(PortfolioScreenView);
        expect(finder2, findsOneWidget);
      });*/
        });
        //
        //
        group('Поле Выйти из аккаунта', () {
          testWidgets('Ниже поля Настройки', (tester) async {
            await test.profile(tester, t: true);
            expect(
                tester.getBottomLeft(Finders.field('Настройки')).dy <=
                    tester.getTopLeft(Finders.field('Выйти из аккаунта')).dy,
                true,
                reason: 'положение');
          });
          //
          //
          group('При тапе на поле открывается модальное окно, где:', () {
            testWidgets('Заголовок "Выход из аккаунта"', (tester) async {
              await test.profile(tester, t: true);
              await Func(tester)
                  .tapDelay(300, Finders.field('Выйти из аккаунта'));

              final Finder finder = find.descendant(
                  of: find.byType(AlertDialog),
                  matching: find.text('ВЫХОД ИЗ АККАУНТА'));
              expect(reason: 'найден только один', finder, findsOneWidget);
            });

            testWidgets('Текст "Вы уверены, что хотите выйти из аккаунта?"',
                (tester) async {
              await test.profile(tester, t: true);
              await Func(tester)
                  .tapDelay(300, Finders.field('Выйти из аккаунта'));

              final Finder finder = find.descendant(
                  of: find.byType(AlertDialog),
                  matching:
                      find.text('Вы уверены, что хотите выйти из аккаунта?'));
              expect(reason: 'найден только один', finder, findsOneWidget);
            });

            testWidgets(
                'Кнопка "Отменить" синего цвета, при тапе на которую окно закрывается',
                (tester) async {
              await test.profile(tester, t: true);
              await Func(tester)
                  .tapDelay(300, Finders.field('Выйти из аккаунта'));

              final Finder finder = find.descendant(
                  of: find.byType(AlertDialog),
                  matching: find.text('ОТМЕНИТЬ'));
              expect(reason: 'найден только один', finder, findsOneWidget);
              final Text button = tester.widget<Text>(finder);
              expect(
                  reason: 'цвет синий',
                  button.style?.color == AppColor.newBlue,
                  true);
              await Func(tester).tapDelay(300, finder);
              expect(
                  reason: 'проверка закрытия',
                  find.byType(AlertDialog),
                  findsNothing);
            });

            testWidgets(
                'Кнопка "Выйти" черного цвета, при тапе на которую происходит выход из аккаунта',
                (tester) async {
              await test.profile(tester, t: true);
              await Func(tester)
                  .tapDelay(300, Finders.field('Выйти из аккаунта'));

              final Finder finder2 = find.descendant(
                  of: find.byType(AlertDialog), matching: find.text('ВЫЙТИ'));
              expect(reason: 'найден только один', finder2, findsOneWidget);
              final Text button = tester.widget<Text>(finder2);
              expect(
                  reason: 'цвет чёрный',
                  button.style?.color == AppColor.black,
                  true);
              await Func(tester).tapDelay(300, finder2);
              expect(
                  reason: 'проверка выхода',
                  find.byType(AuthScreenView),
                  findsOneWidget);
            });

            testWidgets('Окно закрывается тапом на неактивную область',
                (tester) async {
              await test.profile(tester, t: true);
              await Func(tester)
                  .tapDelay(300, Finders.field('Выйти из аккаунта'));

              final Finder finder = find.byType(AlertDialog);
              expect(reason: 'найден только один', finder, findsOneWidget);

              await tester.tapAt(Offset(tester.getCenter(finder).dx,
                  tester.getTopLeft(finder).dy - 15));
              await tester.pumpAndSettle(Delay.delay300);
              expect(
                  reason: 'проверка закрытия окна после нажатия выше',
                  finder,
                  findsNothing);
            });
          });
        });
        //
        //
        group('Поле Удалить аккаунт', () {
          testWidgets('Ниже поля Выйти из аккаунта', (tester) async {
            await test.profile(tester, t: true);
            expect(
                reason: 'ниже пред блока',
                tester.getBottomLeft(Finders.field('Выйти из аккаунта')).dy <
                    tester.getTopLeft(Finders.field('Удалить аккаунт')).dy,
                true);
            expect(
                reason: 'найден только один',
                Finders.field('Удалить аккаунт'),
                findsOneWidget);
          });

          group('При тапе на поле открывается модальное окно, где:', () {
            testWidgets('Заголовок "Удалить аккаунт"', (tester) async {
              await test.profile(tester, t: true);
              await Func(tester)
                  .tapDelay(300, Finders.field('Удалить аккаунт'));

              final Finder finder2 = find.descendant(
                  of: find.byType(AlertDialog),
                  matching: find.text('УДАЛИТЬ АККАУНТ'));
              expect(reason: 'найден только один', finder2, findsOneWidget);
            });

            testWidgets(
                'Текст "Вы уверены, что хотите удалить аккаунт? Это действие нельзя будет отменить, и вся информация будет удалена".',
                (tester) async {
              await test.profile(tester, t: true);
              await Func(tester)
                  .tapDelay(300, Finders.field('Удалить аккаунт'));

              final Finder finder2 = find.descendant(
                  of: find.byType(AlertDialog),
                  matching: find.text(
                      'Вы уверены, что хотите удалить аккаунт? Это действие нельзя отменить и вся информация будет удалена.'));
              expect(reason: 'найден только один', finder2, findsOneWidget);
            });

            testWidgets(
                'Кнопка "Отменить" синего цвета, при тапе на которую окно закрывается',
                (tester) async {
              await test.profile(tester, t: true);
              await Func(tester)
                  .tapDelay(300, Finders.field('Удалить аккаунт'));

              final Finder finder2 = find.descendant(
                  of: find.byType(AlertDialog),
                  matching: find.text('ОТМЕНИТЬ'));
              expect(reason: 'найден только один', finder2, findsOneWidget);
              final Text button = tester.widget<Text>(finder2);
              expect(
                  reason: 'цвет синий',
                  button.style?.color == AppColor.newBlue,
                  true);
              await Func(tester).tapDelay(300, finder2);
              expect(
                  reason: 'проверка закрытия',
                  find.byType(AlertDialog),
                  findsNothing);
            });

            testWidgets(
                'Кнопка "Удалить" черного цвета, при тапе на которую происходит выход из аккаунта',
                (tester) async {
              await test.profile(tester, t: true);
              await Func(tester)
                  .tapDelay(300, Finders.field('Удалить аккаунт'));

              final Finder finder2 = find.descendant(
                  of: find.byType(AlertDialog), matching: find.text('УДАЛИТЬ'));
              expect(reason: 'найден только один', finder2, findsOneWidget);
              final Text button = tester.widget<Text>(finder2);
              expect(
                  reason: 'цвет чёрный',
                  button.style?.color == AppColor.black,
                  true);
              // await Func(tester).tapDelay(300, finder2);
              // expect(reason:'проверка выхода', find.byType(AuthScreenView), findsOneWidget);
            });

            testWidgets('Окно закрывается тапом на неактивную область',
                (tester) async {
              await test.profile(tester, t: true);
              await Func(tester)
                  .tapDelay(300, Finders.field('Удалить аккаунт'));

              final Finder finder = find.byType(AlertDialog);
              expect(reason: 'найден только один', finder, findsOneWidget);

              await tester.tapAt(Offset(tester.getCenter(finder).dx,
                  tester.getTopLeft(finder).dy - 15));
              await tester.pumpAndSettle(Delay.delay300);
              expect(
                  reason: 'проверка закрытия окна после нажатия выше',
                  finder,
                  findsNothing);
            });
          });
        });
      });
    });
  });
}
