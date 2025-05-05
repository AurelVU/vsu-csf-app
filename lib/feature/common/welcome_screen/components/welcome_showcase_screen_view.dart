import 'package:auto_route/auto_route.dart';
import 'package:fkn/feature/common/welcome_screen/components/welcome_showcase_presenter.dart';
import 'package:fkn/router/router.dart';

import 'package:fkn/startup/app_color.dart';
import 'package:fkn/uikit/showcase/contact_widget.dart';
import 'package:fkn/uikit/showcase/list_news_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class WelcomeShowcaseScreenView extends StatefulWidget {
  const WelcomeShowcaseScreenView({
    super.key,
  });

  @override
  State<WelcomeShowcaseScreenView> createState() =>
      _WelcomeShowcaseScreenViewState();
}

class _WelcomeShowcaseScreenViewState extends State<WelcomeShowcaseScreenView> {
  @override
  Widget build(BuildContext context) {
    final presenter = context.watch<WelcomeShowcaseScreenPresenter>();
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/image/main_background.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          title: SvgPicture.asset(
            'assets/svg/univer.svg',
            width: 150,
            color: AppColor.black,
          ),
          leading: GestureDetector(
            onTap: () => context.router.pop(),
            child: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: AppColor.backButton,
              size: 20,
            ),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: Colors.transparent,
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                height: 52,
                child: ElevatedButton(
                  onPressed: () {
                    presenter.router.push(AuthRoute());
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: colorScheme.primary,
                      foregroundColor: colorScheme.onPrimary,
                      disabledBackgroundColor: colorScheme.tertiary,

                      // Background Color
                      disabledForegroundColor: colorScheme.surface),
                  child: const Text('Войти в систему'),
                ),
              ),
            ),
            const SizedBox(height: 16),
            ContactWidget(onTap: presenter.routeToContact),
            StreamBuilder(
              stream: presenter.showcaseManager.universityNewsPreviewStream,
              builder: (context, snapshot) {
                return ListNewsWidget(
                  news: snapshot.data,
                  title: 'Новости университета',
                  width: 330,
                  maxLines: 2,
                  onShowAll: () => presenter.showAllNews(
                    'vsumain',
                    'Новости университета',
                  ),
                );
              },
            ),
            StreamBuilder(
              stream: presenter.showcaseManager.careerNewsPreviewStream,
              builder: (context, snapshot) {
                return ListNewsWidget(
                  news: snapshot.data,
                  title: 'Карьерная лента',
                  width: 160,
                  maxLines: 4,
                  isLittle: true,
                  isUniv: false,
                  onShowAll: () => presenter.showAllNews(
                    'admin_panel',
                    'Карьерная лента',
                  ),
                );
              },
            ),
            const SizedBox(height: 20)
          ],
        ),
      ),
    );
  }
}
