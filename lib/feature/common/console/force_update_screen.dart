import 'package:auto_route/auto_route.dart';
import 'package:fkn/startup/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:store_redirect/store_redirect.dart';

@RoutePage()
class ForceUpdateScreen extends StatelessWidget {
  const ForceUpdateScreen({
    Key? key,
    this.text,
  }) : super(key: key);

  final String? text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.asset('assets/image/force_update.png'),
              const Positioned(
                bottom: 16,
                left: 0,
                right: 0,
                child: Center(
                  child: Text(
                    'ОБНОВЛЕНИЕ',
                    textAlign: TextAlign.center,
                    style: AppTypography.bold23,
                  ),
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.0),
            child: Center(
              child: Text(
                'Вышло новое обновление. Скачайте последнюю версию',
                style: AppTypography.normal16,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  await StoreRedirect.redirect(
                    androidAppId: 'ru.fittin.fcs',
                    iOSAppId: '6479411764',
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  foregroundColor: Theme.of(context).colorScheme.primary,
                  side: BorderSide(
                    width: 1.0,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                ),
                child: const Text('Обновить'),
              ),
            ),
          ),
          const Spacer(
            flex: 2,
          ),
        ],
      ),
    );
  }
}
