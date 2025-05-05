
import 'package:fkn/domain/profile/student_rating.dart';
import 'package:fkn/domain/profile/user_data.dart';
import 'package:fkn/feature/common/showcase/presentation/showcase_presenter.dart';
import 'package:fkn/feature/student/home/home_screen_presenter.dart';

import 'package:fkn/startup/app_color.dart';
import 'package:fkn/uikit/next_subject_widget.dart';
import 'package:fkn/uikit/rating_widget.dart';
import 'package:fkn/uikit/showcase/contact_widget.dart';
import 'package:fkn/uikit/showcase/list_news_widget.dart';
import 'package:fkn/uikit/showcase/student_short_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class ShowcaseScreenView extends StatefulWidget {
  const ShowcaseScreenView({
    super.key,
  });

  @override
  State<ShowcaseScreenView> createState() => _ShowcaseScreenViewState();
}

class _ShowcaseScreenViewState extends State<ShowcaseScreenView> {
  @override
  Widget build(BuildContext context) {
    final presenter = context.watch<ShowcaseScreenPresenter>();
    final homePresenter = context.read<HomeScreenPresenter>();
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
            'assets/svg/fcs.svg',
            width: 70,
            color: AppColor.black,
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: Colors.transparent,
        body: ListView(
          controller: homePresenter.homeScrollController,
          physics: const BouncingScrollPhysics(),
          cacheExtent: 9999,
          children: [
            StreamBuilder<UserData?>(
              stream: presenter.profile.userData,
              builder: (context, snapshot) {
                return StudentShortInfoWidget(
                  // onTap: presenter.routeToPortfolio,
                  name: snapshot.data?.name ?? '',
                );
              },
            ),
            const SizedBox(height: 16),
            // кто будет читать это - простите
            StreamBuilder(
              stream: presenter.profile.studentRating,
              builder: (context, snapshot) {
                final rating = snapshot.data;
                return RatingWidgetWithShadow(
                  rating: rating,
                  onTap: presenter.routeToRating,
                );
              },
            ),
            const SizedBox(height: 32),
            ContactWidget(onTap: presenter.routeToContact),
            StreamBuilder(
              stream: presenter.timeTableManager.nextSubjectStream,
              builder: (context, subject) {
                final nextSubject = subject.data;
                return NextSubjectWidget(
                  onTap: presenter.routeToTimeTable,
                  subject: nextSubject,
                  padding: const EdgeInsets.all(16),
                );
              },
            ),
            StreamBuilder(
              stream: presenter.showcaseManager.universityNewsPreviewStream,
              builder: (context, snapshot) {
                return ListNewsWidget(
                  news: snapshot.data,
                  title: 'Новости университета',
                  width: 330,
                  maxLines: 2,
                  onShowAll: () => presenter.showAllNews('vsumain', 'Новости '
                      'университета'),
                );
              },
            ),
            StreamBuilder(
              stream: presenter.showcaseManager.departmentNewsPreviewStream,
              builder: (context, snapshot) {
                return ListNewsWidget(
                  news: snapshot.data,
                  title: 'Новости факультета',
                  width: 160,
                  maxLines: 4,
                  isLittle: true,
                  isUniv: false,
                  onShowAll: () => presenter.showAllNews('cs_vsu', 'Новости '
                      'факультета'),
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

class RatingWidgetWithShadow extends StatelessWidget {
  const RatingWidgetWithShadow({
    super.key,
    required this.rating,
    this.onTap,
  });

  final VoidCallback? onTap;
  final StudentRating? rating;

// Руслан, я же знаю, что это твой комментарий с моего мака
// way out from your mac, it is mistake
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Padding(
        //   padding: const EdgeInsets.only(top: 8.0),
        //   child: Image.asset(
        //     'assets/image/blur/showcase_rating_blur.png',
        //     fit: BoxFit.fill,
        //     height: 132,
        //   ),
        // ),
        RatingWidget(
          onTap: onTap,
          rating: rating,
          gradient: const LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: <Color>[
              Color(0xFF4949E9),
              Color(0xFF000000),
            ],
            stops: [0.3, 0.8],
          ),
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
          ),
        ),
      ],
    );
  }
}
