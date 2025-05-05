import 'package:fkn/domain/profile/student_rating.dart';
import 'package:fkn/startup/app_color.dart';
import 'package:fkn/startup/app_typography.dart';
import 'package:flutter/material.dart';

class RatingWidget extends StatelessWidget {
  const RatingWidget({
    super.key,
    this.rating,
    this.padding = const EdgeInsets.all(16.0),
    this.gradient = const LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: <Color>[
        Color(0xAA15154C),
        Color(0xAA1F34EF),
      ],
    ),
    this.onTap,
  });

  final StudentRating? rating;
  final LinearGradient gradient;
  final EdgeInsets padding;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: padding,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            gradient: gradient,
            boxShadow: const [
              BoxShadow(
                color: Color(0xFF616FED),
                blurRadius: 20,
                spreadRadius: -16,
                offset: Offset(0, 24),
              ),
            ],
          ),
          constraints: const BoxConstraints(
            minHeight: 112.0,
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: IntrinsicHeight(
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Общий рейтинг',
                              style: AppTypography.semiBold20.copyWith(
                                color: AppColor.white,
                              ),
                            ),
                            Text(
                              '«Успех – это сумма небольших усилий, повторяемых изо дня в день»',
                              style: AppTypography.medium12.copyWith(
                                color: AppColor.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
              Positioned(
                right: 70,
                bottom: 25,
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/image/star_1.png',
                      width: 76,
                      height: 76,
                    ),
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          'в потоке',
                          style: AppTypography.normal10.copyWith(
                            color: AppColor.white,
                          ),
                        ),
                      ),
                    ),
                    Positioned.fill(
                      child: Center(
                        child: Text(
                          rating?.course.toString() ?? '',
                          style: AppTypography.semiBold16.copyWith(
                            color: AppColor.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 16,
                bottom: 8,
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4.0),
                      child: Image.asset(
                        'assets/image/star_2.png',
                        width: 90,
                        height: 56,
                      ),
                    ),
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: FittedBox(
                          child: Text(
                            'на направлении',
                            style: AppTypography.normal10.copyWith(
                              color: AppColor.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned.fill(
                      bottom: 2,
                      child: Center(
                        child: Text(
                          rating?.specialty.toString() ?? '',
                          style: AppTypography.semiBold16.copyWith(
                            color: AppColor.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 8,
                top: 0,
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4.0),
                      child: Image.asset(
                        'assets/image/star_3.png',
                        width: 50,
                        height: 54,
                      ),
                    ),
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          'в группе',
                          style: AppTypography.normal10.copyWith(
                            color: AppColor.white,
                          ),
                        ),
                      ),
                    ),
                    Positioned.fill(
                      bottom: 2,
                      child: Center(
                        child: Text(
                          rating?.group.toString() ?? '',
                          style: AppTypography.semiBold16.copyWith(
                            color: AppColor.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
