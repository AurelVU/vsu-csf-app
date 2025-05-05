import 'package:auto_route/auto_route.dart';
import 'package:fkn/feature/common/news/all_news_manager.dart';
import 'package:fkn/feature/common/news/all_news_screen_presenter.dart';
import 'package:fkn/feature/common/news/all_news_screen_view.dart';
import 'package:fkn/utils/get_it_extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage()
class AllNewScreen extends StatelessWidget {
  const AllNewScreen({
    Key? key,
    required this.title,
    required this.type,
  }) : super(key: key);

  final String title;
  final String type;

  @override
  Widget build(BuildContext context) {
    return Provider<AllNewsScreenPresenter>(
      create: (context) => AllNewsScreenPresenter(
        router: context.router,
        allNewsManager: context.get<AllNewsManager>(),
        type: type,
      )..init(),
      dispose: (context, presenter) => presenter.dispose(),
      child:  AllNewsScreenView(title: title),
    );
  }
}
