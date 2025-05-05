import 'package:auto_route/auto_route.dart';
import 'package:fkn/domain/profile/anonymous_rating.dart';
import 'package:fkn/feature/student/rating/components/term_animated_switcher.dart';
import 'package:fkn/feature/student/rating/student_rating/presentation/common_rating_presenter.dart';
import 'package:fkn/startup/app_color.dart';
import 'package:fkn/startup/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../domain/profile/list_rating.dart';

class CommonRatingScreenView extends StatelessWidget {
  const CommonRatingScreenView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final presenter = context.watch<CommonRatingScreenPresenter>();
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: <Color>[
            Color(0xFFA0A0FF),
            Color(0xFF5F5FDB),
            Color(0xFF0E0E3E),
          ],
          stops: [0.0, 0.2, 1],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          systemOverlayStyle: SystemUiOverlayStyle.light,
          title: Text(
            'Общий рейтинг',
            style: AppTypography.medium24.copyWith(
              color: AppColor.white,
            ),
          ),
          leading: IconButton(
            onPressed: () {
              context.router.pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 16,
            ),
            color: AppColor.white,
          ),
        ),
        body: StreamBuilder(
            stream: presenter.ratingManager.ratingStream,
            builder: (context, snapshot) {
              return StreamBuilder(
                  stream: presenter.profile.userData,
                  builder: (context, userSnapshot) {
                    final userResult = userSnapshot.data?.results ?? [];

                    return Column(
                      children: [
                        TermAnimatedSwitcher(
                          onTap: (value) {
                            presenter.changeChosenSemester(value);
                            presenter.scrollToTerm(value);
                          },
                          scrollController: presenter.termScrollController,
                          pageAnimatedController: presenter.pageAnimatedController,
                          firstColor: AppColor.pinkText,
                          secondColor: AppColor.white,
                          results: userResult,
                        ),
                        const SizedBox(height: 16),
                        Expanded(
                          child: PageView.builder(
                            itemCount: userResult.length ?? 3,

                            onPageChanged: (index) {

                              presenter.updateByNumber(index);
                            },

                            controller: presenter.pageController,
                            itemBuilder: (BuildContext context, int index) {
                              final rating = snapshot.data?.values
                                  .toList()
                                  .elementAtOrNull(index);
                              return ListView.separated(
                                shrinkWrap: true,
                                physics: const BouncingScrollPhysics(),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                itemBuilder: (BuildContext context, int index) {
                                  final listRating =
                                      rating?.elementAtOrNull(index);
                                  return ListRatingWidget(
                                      listRating: listRating);
                                },
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return const SizedBox(height: 16);
                                },
                                itemCount: rating?.length ?? 4,
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  });
            }),
      ),
    );
  }
}

class ListRatingWidget extends StatelessWidget {
  const ListRatingWidget({
    super.key,
    this.listRating,
  });

  final ListRating? listRating;

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
        firstChild: Shimmer.fromColors(
          baseColor: Theme.of(context).cardColor.withOpacity(0.3),
          highlightColor: Theme.of(context).colorScheme.primaryContainer,
          child: Container(
            height: 210,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: AppColor.blue,
            ),
            width: double.infinity,
          ),
        ),
        secondChild: Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
          decoration: BoxDecoration(
            color: AppColor.white.withOpacity(0.15),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8, bottom: 12),
                child: Text(
                  listRating?.name ?? '',
                  style: AppTypography.semiBold16.copyWith(
                    color: AppColor.white,
                  ),
                ),
              ),
              ListView.separated(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  final rating = listRating?.ratings?[index];
                  if (rating == null) {
                    return Container();
                  }
                  return AnonymousRatingWidget(anonymousRating: rating);
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(height: 8);
                },
                itemCount: listRating?.ratings?.length ?? 0,
              ),
            ],
          ),
        ),
        crossFadeState: listRating == null
            ? CrossFadeState.showFirst
            : CrossFadeState.showSecond,
        duration: const Duration(milliseconds: 300));
  }
}

class AnonymousRatingWidget extends StatelessWidget {
  const AnonymousRatingWidget({
    super.key,
    required this.anonymousRating,
  });

  final AnonymousRating anonymousRating;

  @override
  Widget build(BuildContext context) {
    final presenter = context.watch<CommonRatingScreenPresenter>();
    if (anonymousRating.isCurrentUser == true) {
      return Container(
        decoration: BoxDecoration(
            color: AppColor.ratingTextColor,
            borderRadius: BorderRadius.circular(100),
            border: Border.all(
              color: AppColor.ratingGroupColor,
              width: 0.7,
            )),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 12),
          child: RatingContent(
            anonymousRating: anonymousRating,
            controller: presenter.controller,
          ),
        ),
      );
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: RatingContent(
        anonymousRating: anonymousRating,
        controller: presenter.controller,
      ),
    );
  }
}

class RatingContent extends StatelessWidget {
  const RatingContent({
    super.key,
    required this.anonymousRating,
    required this.controller,
  });

  final AnonymousRating anonymousRating;
  final AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Stack(
          alignment: Alignment.centerLeft,
          children: [
            Image.asset(
              'assets/image/rating_star.png',
              width: 40,
              height: 40,
            ),
            Positioned.fill(
              child: Center(
                child: Text(
                  anonymousRating.place.toString(),
                  style: AppTypography.semiBold16.copyWith(
                    color: AppColor.white,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          width: 10,
        ),
        SizedBox(
          height: 32,
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              AnimatedBuilder(
                animation: controller,
                builder: (BuildContext context, Widget? child) {
                  final value = controller.value;
                  return Container(
                    width: 150.0 *
                            value *
                            (double.parse(anonymousRating.rating ?? '0') / 100) +
                        32,
                    height: 24,
                    decoration: BoxDecoration(
                      color: AppColor.ratingGroupColor,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          anonymousRating.name ?? '',
                          maxLines: 1,
                          style: AppTypography.medium14.copyWith(
                            color: AppColor.ratingTextColor,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
              Positioned(
                right: 0,
                bottom: 0,
                top: 0,
                child: Stack(
                  children: [
                    Container(
                      width: 32,
                      height: 32,
                      decoration: const BoxDecoration(
                        color: AppColor.white,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Positioned.fill(
                      child: Center(
                        child: SvgPicture.asset(
                          'assets/svg/rating.svg',
                          color: anonymousRating.isCurrentUser == true
                              ? AppColor.ratingTextColor
                              : AppColor.ratingGroupColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 10),
        AnimatedBuilder(
          animation: controller,
          builder: (BuildContext context, Widget? child) {
            final value = controller.value;
            return Text(
              (value * double.parse(anonymousRating.rating ?? '0'))
                  .toStringAsPrecision(3),
              style: AppTypography.medium14.copyWith(
                color: AppColor.white,
              ),
            );
          },
        ),
      ],
    );
  }
}
