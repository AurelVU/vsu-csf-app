import 'package:auto_route/auto_route.dart';
import 'package:fkn/feature/common/console/network/no_network_presenter.dart';
import 'package:fkn/feature/common/console/network/no_network_view.dart';
import 'package:fkn/utils/get_it_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

@RoutePage()
class NoNetworkScreen extends StatelessWidget {
  const NoNetworkScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider<NoNetworkPresenter>(
      create: (context) => NoNetworkPresenter(
        router: context.router,
        eventBus: context.get(),
      )..init(),
      dispose: (_, presenter) => presenter.dispose(),
      child: const NoNetworkView(),
    );
  }
}

