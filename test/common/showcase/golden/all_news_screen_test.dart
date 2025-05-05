
import 'package:fkn/feature/common/news/all_news_screen.dart';
import 'package:flutter/cupertino.dart' hide Banner;
import 'package:flutter/material.dart' hide Banner, Tab;
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';

import '../../../test_util.dart';

void main() {
  testGoldens('Тестирвание баннера', (tester) async {
    await preload();

    final builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: [
        Device.phone,
        Device.iphone11,
        Device.tabletPortrait,
        Device.tabletLandscape,
      ])
      ..addScenario(
        name: 'Кнопка',
        widget: Builder(
            builder: (BuildContext context) => wrapWidget(
                  context,
                  const AllNewScreen(
                    title: 'Заголовок всех новостей',
                    type: '', //'university'
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
    await screenMatchesGolden(tester, 'all_news_screen_test');
  });
}
