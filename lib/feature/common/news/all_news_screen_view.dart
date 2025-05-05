import 'package:appmetrica_plugin/appmetrica_plugin.dart';
import 'package:auto_route/auto_route.dart';
import 'package:fkn/domain/showcase/faculty_news.dart';
import 'package:fkn/feature/common/news/all_news_screen_presenter.dart';
import 'package:fkn/router/router.dart';
import 'package:fkn/startup/app_color.dart';
import 'package:fkn/uikit/empty_box.dart';
import 'package:fkn/uikit/showcase/news_widget.dart';
import 'package:fkn/utils/events_name.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../../../startup/app_typography.dart';

class AllNewsScreenView extends StatelessWidget {
  const AllNewsScreenView({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final presenter = context.read<AllNewsScreenPresenter>();
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: () {
            presenter.goTop();
          },
          child: Text(title, style: AppTypography.medium18),
        ),
        leading: GestureDetector(
          onTap: () => context.router.pop(),
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColor.backButton,
            size: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: StreamBuilder<List<FacultyNews>?>(
          stream: presenter.allNewsManager.newsStream,
          builder: (context, snapshot) {
            final data = snapshot.data;

            final body = ListView.separated(
              padding: const EdgeInsets.all(16),
              controller: presenter.universityNewsController,
              itemBuilder: (context, index) {
                final news = data?[index];
                if (news == null) {
                  return const EmptyBox(
                    height: 330,
                  );
                }
                if (news.type == 'pdf') {
                  return GestureDetector(
                    onTap: () {
                      AppMetrica.reportEvent(EventName.openNewsDetailPage);

                      context.router.navigate(
                        NewsDetailRoute(news: news),
                      );
                    },
                    child: Container(
                      height: 104,
                      width: 350,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: AssetImage("assets/image/journal_mini.png"),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Spacer(),
                            Text(
                              '«Воронежский\nуниверситет»',
                              style: AppTypography.semiBold20.copyWith(
                                color: AppColor.white,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              'Газета университета',
                              style: AppTypography.medium12.copyWith(
                                color: AppColor.white,
                              ),
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),
                    ),
                  );
                }
                return IntrinsicHeight(
                  child: NewsWidget(
                    facultyNew: news,
                    width: double.infinity,
                    height: 330,
                    isUniv: true,
                    maxLines: 2,
                    useShadow: true,
                  ),
                );
              },
              itemCount: data?.length ?? 4,
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  height: 16,
                );
              },
            );

            if (data == null) {
              return Shimmer.fromColors(
                baseColor: Theme.of(context).cardColor.withOpacity(0.6),
                highlightColor: Theme.of(context).colorScheme.primaryContainer,
                child: body,
              );
            }
            return body;
          },
        ),
      ),
    );
  }
}
