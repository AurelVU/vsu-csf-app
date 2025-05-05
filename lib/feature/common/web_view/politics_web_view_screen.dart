import 'package:auto_route/auto_route.dart';
import 'package:fkn/feature/common/web_view/politics_web_view.dart';
import 'package:fkn/feature/common/web_view/politics_web_view_presenter.dart';
import 'package:fkn/utils/get_it_extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage()
class PoliticWebViewScreen extends StatelessWidget {
  const PoliticWebViewScreen({
    Key? key,
    required this.url,
    required this.isStudent,
  }) : super(key: key);
  final String url;
  final bool isStudent;

  @override
  Widget build(BuildContext context) {
    return Provider<PoliticWebViewScreenPresenter>(
      create: (context) => PoliticWebViewScreenPresenter(
        url: url,
        router: context.router,
        profile: context.get(),
        isStudent: isStudent,
        teacherProfile: context.get(),
      )..init(),
      dispose: (context, presenter) => presenter.dispose(),
      child: const PoliticsWebView(),
    );
  }
}
