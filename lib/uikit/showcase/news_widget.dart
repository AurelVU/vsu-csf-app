import 'dart:math';

import 'package:appmetrica_plugin/appmetrica_plugin.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fkn/domain/showcase/faculty_news.dart';
import 'package:fkn/router/router.dart';
import 'package:fkn/startup/app_typography.dart';
import 'package:fkn/uikit/card_container.dart';
import 'package:fkn/uikit/empty_box.dart';
import 'package:fkn/utils/events_name.dart';
import 'package:flutter/material.dart';

class NewsWidget extends StatelessWidget {
  const NewsWidget({
    super.key,
    required this.facultyNew,
    this.width,
    this.height,
    this.maxLines = 4,
    this.isLittle = false,
    this.isUniv = true,
    this.useShadow = false,
  });

  final FacultyNews? facultyNew;
  final double? width;
  final double? height;
  final int maxLines;
  final bool isLittle;
  final bool isUniv;

  final bool useShadow;

  @override
  Widget build(BuildContext context) {
    if (facultyNew == null) {
      return EmptyBox(
        height: height,
        width: width,
      );
    }
    return GestureDetector(
      /// REFACTOR: Вынести логику обработки события в соответствующий презентер
      onTap: () {
        AppMetrica.reportEvent(EventName.openNewsDetailPage);

        context.router.navigate(
          NewsDetailRoute(
              news: facultyNew,
              title: isUniv == true
                  ? 'Новости университета'
                  : 'Новости факультета'),
        );
      },
      child: CardContainer(
        useShadow: useShadow,
        width: width,
        borderRadius: isLittle ? 10 : 16,
        child: Padding(
          padding: EdgeInsets.all(isLittle ? 8 : 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: isLittle ? 100 : 220,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(isLittle ? 10 : 16),
                  ),
                ),
                clipBehavior: Clip.hardEdge,
                child: CachedNetworkImage(
                  imageUrl: facultyNew?.picture?.firstOrNull ?? '',
                  errorWidget: (context, url, error) {
                    final int = Random().nextInt(10);
                    return Image.asset(
                      'assets/image/mocks/mock_$int.png',
                      fit: BoxFit.cover,
                    );
                  },

                  /// перезаписан, чтобы не выкидывать ошибки
                  errorListener: (value) {},
                  width: width == null
                      ? double.infinity
                      : width! - (isLittle ? 16.0 : 32.0),
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              if (facultyNew?.title != null)
                IntrinsicHeight(
                  child: Text(
                    facultyNew?.title ?? '',
                    maxLines: 4,
                    softWrap: false,
                    overflow: TextOverflow.ellipsis,
                    style: AppTypography.medium16,
                  ),
                ),
              if (facultyNew?.title != null) const Spacer(),
              if (facultyNew?.title != null) const SizedBox(height: 8),
              if (facultyNew?.date != null)
                Text(
                  facultyNew?.date ?? '',
                  style: AppTypography.normal14
                      .copyWith(color: Theme.of(context).hintColor),
                ),
              if (isLittle)
                const SizedBox(
                  height: 8,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
