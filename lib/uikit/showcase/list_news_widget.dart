import 'package:appmetrica_plugin/appmetrica_plugin.dart';
import 'package:auto_route/auto_route.dart';
import 'package:fkn/domain/showcase/faculty_news.dart';
import 'package:fkn/router/router.dart';
import 'package:fkn/startup/app_color.dart';
import 'package:fkn/startup/app_typography.dart';
import 'package:fkn/uikit/empty_box.dart';
import 'package:fkn/uikit/showcase/news_widget.dart';
import 'package:fkn/utils/events_name.dart';
import 'package:flutter/material.dart';

// REFACTOR: Требуется оптимизировать логику работы компонента
// Рекомендуется использовать паттерн Builder для унификации карточек новостей
// вместо передачи параметров через несколько уровней компонентов
class ListNewsWidget extends StatelessWidget {
  const ListNewsWidget({
    super.key,
    required this.news,
    this.title,
    this.onShowAll,
    this.width = 150,
    this.height = 290,
    this.maxLines,
    this.isLittle = false,
    this.isUniv = true,
  });

  final List<FacultyNews>? news;

  // нужен для шиммеров
  final double? width;
  final double? height;
  final String? title;
  final int? maxLines;
  final VoidCallback? onShowAll;
  final bool isLittle;
  final bool isUniv;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title ?? '',
                  style: AppTypography.medium20,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.arrow_forward_ios, size: 16),
                onPressed: onShowAll,
              ),
            ],
          ),
        ),
        IntrinsicHeight(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 12),
            child: Row(
              children: [
                ...news?.map((newDetail) {
                      if (news == null) {
                        return EmptyBox(
                          width: width,
                          height: height,
                        );
                      }
                      if (newDetail.type == 'pdf') {
                        return Padding(
                          padding: const EdgeInsets.only(right: 12.0),
                          child: JournalWidget(newDetail: newDetail),
                        );
                      }
                      return Padding(
                        padding: const EdgeInsets.only(right: 12.0),
                        child: NewsWidget(
                          facultyNew: newDetail,
                          width: width,
                          maxLines: maxLines ?? 4,
                          isLittle: isLittle,
                          isUniv: isUniv,
                        ),
                      );
                    }).toList() ??
                    [],
              ],
            ),
          ),
        ),
        // SizedBox(
        //   height: height,
        //   child: Builder(builder: (context) {
        //     final body = ListView.separated(
        //       clipBehavior: Clip.none,
        //       scrollDirection: Axis.horizontal,
        //       padding: const EdgeInsets.symmetric(horizontal: 12),
        //       itemBuilder: (context, index) {
        //         if (news == null) {
        //           return EmptyBox(
        //             width: width,
        //             height: height,
        //           );
        //         }
        //         return NewsWidget(
        //           facultyNew: news?[index],
        //           width: width,
        //           height: height,
        //           maxLines: maxLines ?? 4,
        //           isLittle: isLittle,
        //           isUniv: isUniv,
        //         );
        //       },
        //       separatorBuilder: (context, index) {
        //         return const SizedBox(
        //           width: 16,
        //         );
        //       },
        //       itemCount: news?.length ?? 3,
        //     );
        //
        //     if (news == null) {
        //       return Shimmer.fromColors(
        //         baseColor: Theme.of(context).cardColor.withOpacity(0.6),
        //         highlightColor: Theme.of(context).colorScheme.primaryContainer,
        //         child: body,
        //       );
        //     }
        //     return body;
        //   }),
        // ),
        // const SizedBox(
        //   height: 16,
        // ),
      ],
    );
  }
}

class JournalWidget extends StatelessWidget {
  const JournalWidget({
    super.key,
    required this.newDetail,
  });

  final FacultyNews newDetail;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppMetrica.reportEvent(EventName.openNewsDetailPage);

        context.router.navigate(
          NewsDetailRoute(news: newDetail),
        );
      },
      child: Container(
        height: 350,
        width: 350,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage("assets/image/journal.png"),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              Text(
                '«Воронежский университет»',
                style: AppTypography.semiBold32.copyWith(
                  color: AppColor.white,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Газета университета',
                style: AppTypography.medium18.copyWith(
                  color: AppColor.white,
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
