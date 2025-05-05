import 'package:fkn/domain/profile/student_rating.dart';
import 'package:fkn/domain/profile/user_data.dart';
import 'package:fkn/domain/showcase/faculty_news.dart';
import 'package:fkn/domain/showcase/next_subject.dart';
import 'package:fkn/domain/showcase/text_detail.dart';
import 'package:fkn/domain/timetable/subject.dart';
import 'package:fkn/feature/common/showcase/presentation/showcase_screen.dart';
import 'package:fkn/feature/common/showcase/showcase_manager.dart';
import 'package:fkn/feature/student/home/home_screen_presenter.dart';
import 'package:fkn/feature/student/profile/profile_manager.dart';
import 'package:fkn/feature/student/timetable/timetable_manager.dart';
import 'package:fkn/utils/get_it_extension.dart';
import 'package:flutter/cupertino.dart' hide Banner;
import 'package:flutter/material.dart' hide Banner, Tab;
import 'package:get_it/get_it.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart' hide Subject;

import '../../../test_util.dart';

void main() {
  testGoldens('Тестирвание баннера', (tester) async {
    await preload();
    when(() {
      return GetIt.instance.get<ShowcaseManager>().updateDepartmentPreview();
    }).thenAnswer((invocation) => Future.value());
    when(() {
      return GetIt.instance.get<ShowcaseManager>().updateUniversityPreview();
    }).thenAnswer((invocation) => Future.value());

    when(() {
      return GetIt.instance.get<IProfile<UserData>>().userData;
    }).thenAnswer((invocation) {
      return BehaviorSubject<UserData?>.seeded(UserData(name: 'Иванов Иван'));
    });

    when(() {
      return GetIt.instance.get<IProfile<UserData>>().studentRating;
    }).thenAnswer((invocation) {
      return BehaviorSubject.seeded(
          StudentRating(course: 3, specialty: 4, group: 2));
    });

    when(() {
      return GetIt.instance.get<TimeTableManager>().nextSubjectStream;
    }).thenAnswer((invocation) {
      return BehaviorSubject.seeded(NextSubject(
        subject: Subject(
          startTime: "startTime",
          finishTime: "finishTime",
          name: "name",
          classroom: "classroom",
          teacher: "teacher",
          isDistant: true,
        ),
      ));
    });

    when(() {
      return GetIt.instance.get<ShowcaseManager>().universityNewsPreviewStream;
    }).thenAnswer((invocation) {
      return BehaviorSubject.seeded([
        FacultyNews(
          picture: ["picture"],
          text: [const TextDetail(text: "description")],
          title: "title",
          date: "date",
          index: "index",
        ),
        FacultyNews(
          picture: ["picture"],
          text: [const TextDetail(text: "description")],
          title: "title",
          date: "date",
          index: "index",
        ),
        FacultyNews(
          picture: ["picture"],
          text: [const TextDetail(text: "description")],
          title: "title",
          date: "date",
          index: "index",
        ),
        FacultyNews(
          picture: ["picture"],
          text: [const TextDetail(text: "description")],
          title: "title",
          date: "date",
          index: "index",
        ),
      ]);
    });

    when(() {
      return GetIt.instance.get<ShowcaseManager>().departmentNewsPreviewStream;
    }).thenAnswer((invocation) {
      return BehaviorSubject.seeded([
        FacultyNews(
          picture: ["picture"],
          text: [const TextDetail(text: "description")],
          title: "title",
          date: "date",
          index: "index",
        ),
        FacultyNews(
          picture: ["picture"],
          text: [const TextDetail(text: "description")],
          title: "title",
          date: "date",
          index: "index",
        ),
        FacultyNews(
          picture: ["picture"],
          text: [const TextDetail(text: "description")],
          title: "title",
          date: "date",
          index: "index",
        ),
        FacultyNews(
          picture: ["picture"],
          text: [const TextDetail(text: "description")],
          title: "title",
          date: "date",
          index: "index",
        ),
      ]);
    });

    final builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: [
        Device.phone,
        Device.iphone11,
        Device.tabletPortrait,
        Device.tabletLandscape,
      ])
      ..addScenario(
        name: 'Экран главной',
        widget: Builder(
            builder: (BuildContext context) => wrapWidget(
                  context,
                  Provider(
                    create: (_) => HomeScreenPresenter(
                      router: MockStackRouter(),
                      homeScrollController: ScrollController(),
                      ratingScrollController: ScrollController(),
                      timetableScrollController:
                          DraggableScrollableController(),
                      consoleManager: MockConsoleManager(),
                      eventBus: MockEventBus(),
                      environment: context.get(),
                      profile: MockProfile(),
                    ),
                    child: const ShowcaseScreen(),
                  ),
                  useMediaQuery: false,
                )),
      );
    mockNetworkImages(
      () async {
        await tester.pumpWidgetBuilder(
          builder.build(),
          surfaceSize: const Size(3500, 1400),
        );
      },
      // imageBytes: File('assets/no_image.png').readAsBytesSync(),
    );
    await screenMatchesGolden(tester, 'showcase_screen_test');
  });
}
