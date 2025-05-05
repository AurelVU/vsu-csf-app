import 'package:auto_route/auto_route.dart';
import 'package:fkn/feature/student/bookmark/presentation/bookmark_presenter.dart';
import 'package:fkn/feature/student/bookmark/presentation/bookmark_screen_view.dart';
import 'package:fkn/utils/get_it_extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage()
class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider<BookmarkScreenPresenter>(
      create: (context) => BookmarkScreenPresenter(
        router: context.router,
        bookmarkManager: context.get(),
      )..init(),
      dispose: (context, presenter) => presenter.dispose(),
      child: const BookmarkScreenView(),
    );
  }
}
