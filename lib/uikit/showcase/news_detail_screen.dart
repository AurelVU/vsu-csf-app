import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:fkn/domain/showcase/faculty_news.dart';
import 'package:fkn/domain/showcase/text_detail.dart';
import 'package:fkn/feature/common/showcase/presentation/showcase_presenter.dart';
import 'package:fkn/startup/app_color.dart';
import 'package:fkn/startup/app_keys.dart';
import 'package:fkn/startup/app_typography.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:url_launcher/url_launcher_string.dart';

@RoutePage()
class NewsDetailScreen extends StatelessWidget {
  const NewsDetailScreen({
    super.key,
    this.index,
    this.news,
    this.presenter,
    this.title,
  });

  final String? index;
  final String? title;
  final FacultyNews? news;
  final ShowcaseScreenPresenter? presenter;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    if (news?.type == 'pdf') {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.white,
          title: const Text('Новости', style: AppTypography.medium18),
          centerTitle: true,
          leading: GestureDetector(
            onTap: () => context.router.pop(),
            child: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: AppColor.backButton,
              size: 20,
            ),
          ),
        ),
        body: SfPdfViewer.network(
          news?.link ?? '',

        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title:  Text( title ?? 'Новости', style: AppTypography.medium18),
        centerTitle: true,
        backgroundColor: AppColor.white,
        leading: GestureDetector(
          onTap: () => context.router.pop(),
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColor.backButton,
            size: 20,
          ),
        ),
      ),
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: ListView(
          children: [
            PictureWidget(
              pictures: news?.picture,
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                news?.date ?? '',
                style: AppTypography.normal14.copyWith(
                  color: AppColor.grey,
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                news?.title ?? '',
                style: AppTypography.semiBold22,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: RichText(
                key: Keys.newsText,
                text: TextSpan(
                  children: [
                    for (final text in news?.text ?? []) generateTextSpan(text, context)
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            if (news?.link != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorScheme.secondary,
                    foregroundColor: colorScheme.primary,
                    side: BorderSide(
                      width: 1.0,
                      color: colorScheme.primary,
                    ),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                  ),
                  onPressed: () {
                    launchUrlString(news?.link ?? '');
                  },
                  child: const Text('Подробнее'),
                ),
              ),
          ],
        ),
      ),
    );
  }
}



TextSpan generateTextSpan(TextDetail textDetail, BuildContext context) {
  if (textDetail.type == 'link') {
    return TextSpan(
        text: textDetail.text,
        style:  AppTypography.normal14.copyWith(
          color: AppColor.lightBlue,
        ).apply(
            fontSizeFactor: MediaQuery.of(context).textScaleFactor
        ),
        recognizer: TapGestureRecognizer()
          ..onTap = () {
            launchUrlString(textDetail.link ?? '');
          });
  }
  return TextSpan(
    text: textDetail.text,
    style: AppTypography.normal14.copyWith(
      color: AppColor.black1F,
    ).apply(
      fontSizeFactor: MediaQuery.of(context).textScaleFactor
    ),
  );
}

class PictureWidget extends StatefulWidget {
  const PictureWidget({
    super.key,
    this.pictures,
  });

  final List<String?>? pictures;

  @override
  State<PictureWidget> createState() => _PictureWidgetState();
}

class _PictureWidgetState extends State<PictureWidget> {
  int _current = 0;

  /// русская смекалочка
  /// из-за того, что вьюпорт < 1, подгружается 0.5% картинки справа и слева
  /// это обеспечивает ленивую подгрузку следующей страницы
  final pageController = PageController(viewportFraction: 0.99);

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.pictures == null || widget.pictures?.isEmpty == true) {
      return Container();
    }
    if (widget.pictures?.length == 1) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          clipBehavior: Clip.hardEdge,
          child: CachedNetworkImage(
            imageUrl: widget.pictures?.firstOrNull ?? '',
            errorWidget: (context, url, error) {
              return Container();
            },
            width: double.infinity,
          ),
        ),
      );
    }
    return Column(
      children: [
        ExpandablePageView(
          controller: pageController,
          allowImplicitScrolling: true,
          onPageChanged: (index) {
            setState(() {
              _current = index;
            });
          },
          children: [
            for (final picture in widget.pictures ?? [])
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: CachedNetworkImage(
                    imageUrl: picture ?? '',
                    errorWidget: (context, url, error) {
                      return Container();
                    },
                    width: double.infinity,
                  ),
                ),
              ),
          ],
        ),
        // CarouselSlider(
        //   items: widget.pictures
        //           ?.map(
        //             (e) => Padding(
        //               padding: const EdgeInsets.symmetric(horizontal: 12.0),
        //               child: Container(
        //                 decoration: const BoxDecoration(
        //                   borderRadius: BorderRadius.all(
        //                     Radius.circular(15),
        //                   ),
        //                 ),
        //                 width: double.infinity,
        //                 clipBehavior: Clip.hardEdge,
        //                 child: CachedNetworkImage(
        //                   imageUrl: e ?? '',
        //                   fit: BoxFit.fill,
        //                   errorWidget: (context, url, error) {
        //                     return Container();
        //                   },
        //                 ),
        //               ),
        //             ),
        //           )
        //           .toList() ??
        //       [],
        //   carouselController: _controller,
        //   options: CarouselOptions(
        //     onPageChanged: (index, reason) {
        //       setState(() {
        //         _current = index;
        //       });
        //     },
        //     viewportFraction: 1,
        //   ),
        // ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.pictures?.asMap().entries.map((entry) {
                return Container(
                  width: 6.0,
                  height: 6.0,
                  margin: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _current == entry.key
                          ? AppColor.newBlue
                          : AppColor.grey),
                );
              }).toList() ??
              [],
        ),
      ],
    );
  }
}
