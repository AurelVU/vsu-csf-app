import 'package:fkn/feature/common/console/network/no_network_presenter.dart';
import 'package:fkn/startup/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NoNetworkView extends StatelessWidget {
  const NoNetworkView({
    Key? key,
    this.text,
  }) : super(key: key);

  final String? text;

  @override
  Widget build(BuildContext context) {
    final presenter = context.read<NoNetworkPresenter>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.asset('assets/image/tech_work.png'),
              const Positioned(
                bottom: 16,
                left: 0,
                right: 0,
                child: Center(
                  child: Text(
                    'НЕТ ИНТЕРНЕТА',
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
                'Нет подключения к интернету. Проверьте подключение к сети',
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
                onPressed: () {
                  // presenter.reconnect();
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
                child: const Text('Подключиться снова'),
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
