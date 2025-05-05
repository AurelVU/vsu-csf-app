import 'package:fkn/domain/showcase/faculty_news.dart';
import 'package:fkn/domain/showcase/text_detail.dart';
import 'package:fkn/uikit/showcase/contact_widget.dart';
import 'package:fkn/uikit/showcase/list_news_widget.dart';
import 'package:fkn/uikit/showcase/news_widget.dart';
import 'package:fkn/uikit/showcase/student_short_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';

import '../../../test_util.dart';

void main() {
  testGoldens('Тестирвание баннера', (tester) async {
    await preload();

    final builder = GoldenBuilder.column()
      ..addScenarioBuilder(
        'Кнопка обратной связи',
        (context) => wrapWidget(context, const ContactWidget()),
      )
      ..addScenarioBuilder(
        'Виджет новостей',
        (context) => wrapWidget(
            context,
            ListNewsWidget(
              title: 'Список новостей',
              news: [
                FacultyNews(
                  picture: [
                    '',
                    '',
                  ],
                  text: [const TextDetail(text: 'Описание новости 1')],
                  title: 'Заголовок новости 1',
                  date: '01.01 2024',
                ),
                FacultyNews(
                  picture: [
                    '',
                    '',
                  ],
                  text: [const TextDetail(text: 'Описание новости 2')],
                  title: 'Заголовок новости 2',
                  date: '01.01 2024',
                ),
                FacultyNews(
                  picture: [
                    '',
                    '',
                  ],
                  text: [const TextDetail(text: 'Описание новости 3')],
                  title: 'Заголовок новости 3',
                  date: '01.01 2024',
                ),
              ],
            )),
      )
      ..addScenarioBuilder(
        'Виджет университетской новости большой',
        (context) => wrapWidget(
          context,
          NewsWidget(
            facultyNew: FacultyNews(
              picture: [
                '',
                '',
              ],
              text: [const TextDetail(text: 'Описание новости 1')],
              title: 'Заголовок новости 1',
              date: '01.01 2024',
            ),
            width: 120,
            height: 220,
          ),
        ),
      )
      ..addScenarioBuilder(
        'Виджет университетской новости маленький',
            (context) => wrapWidget(
          context,
          NewsWidget(
            facultyNew: FacultyNews(
              picture: [
                '',
                '',
              ],
              text: [const TextDetail(text: 'Описание новости 1')],
              title: 'Заголовок новости 1',
              date: '01.01 2024',
            ),
            width: 120,
            height: 220,
            isLittle: true,
          ),
        ),
      )
      ..addScenarioBuilder(
        'Виджет обычной новости большой',
            (context) => wrapWidget(
          context,
          NewsWidget(
            facultyNew: FacultyNews(
              picture: [
                '',
                '',
              ],
              text: [const TextDetail(text: 'Описание новости 1')],
              title: 'Заголовок новости 1',
              date: '01.01 2024',
            ),
            width: 120,
            height: 220,
            isUniv: false,
          ),
        ),
      )
      ..addScenarioBuilder(
        'Виджет обычной новости маленький',
            (context) => wrapWidget(
          context,
          NewsWidget(
            facultyNew: FacultyNews(
              picture: [
                '',
                '',
              ],
              text: [const TextDetail(text: 'Описание новости 1')],
              title: 'Заголовок новости 1',
              date: '01.01 2024',
            ),
            width: 120,
            height: 220,
            isLittle: true,
            isUniv: false,
          ),
        ),
      )
      ..addScenarioBuilder(
        'Виджет обычной новости маленький с тенью',
            (context) => wrapWidget(
          context,
          NewsWidget(
            facultyNew: FacultyNews(
              picture: [
                '',
                '',
              ],
              text: [const TextDetail(text: 'Описание новости 1')],
              title: 'Заголовок новости 1',
              date: '01.01 2024',
            ),
            width: 120,
            height: 220,
            isLittle: true,
            isUniv: false,
            useShadow: true,
          ),
        ),
      )
      ..addScenarioBuilder(
        'Виджет обычной новости с тенью',
            (context) => wrapWidget(
          context,
          NewsWidget(
            facultyNew: FacultyNews(
              picture: [
                '',
                '',
              ],
              text: [const TextDetail(text: 'Описание новости 1')],
              title: 'Заголовок новости 1',
              date: '01.01 2024',
            ),
            width: 120,
            height: 220,
            isUniv: false,
            useShadow: true,
          ),
        ),
      )
      ..addScenarioBuilder(
        'Короткоий информационный виджет для студентов',
            (context) => wrapWidget(
          context,
                const StudentShortInfoWidget(name: 'Заголовок виджета студентов',)
        ),
      )
    ;
    mockNetworkImages(
      () async {
        await tester.pumpWidgetBuilder(
          builder.build(),
          surfaceSize: const Size(500, 3000),
        );
      },
      // imageBytes: File('assets/no_image.png').readAsBytesSync(),
    );
    await screenMatchesGolden(tester, 'component_test');
  });
}
