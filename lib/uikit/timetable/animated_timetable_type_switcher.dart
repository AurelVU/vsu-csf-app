import 'dart:ui';

import 'package:fkn/startup/app_color.dart';
import 'package:fkn/startup/app_typography.dart';
import 'package:flutter/material.dart';

class AnimatedTimetableSwitcher extends StatelessWidget {
  const AnimatedTimetableSwitcher({
    super.key,
    required this.animationController,
    required this.onFirstTap,
    required this.onSecondTap,
  });

  final AnimationController animationController;

  /// нажатие на первый элемент
  final VoidCallback onFirstTap;

  /// нажатие на второй элемент
  final VoidCallback onSecondTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: AnimatedBuilder(
        animation: animationController,
        builder: (context, child) {
          return SizedBox(
            height: 32,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaY: 15, sigmaX: 15),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColor.white.withOpacity(0.30),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Stack(
                      children: [
                        LayoutBuilder(
                          builder: (context, constraints) {
                            final width = constraints.maxWidth;
                            return Row(
                              children: [
                                Container(
                                  width:
                                      width / 2 * (animationController.value),
                                ),
                                Container(
                                  width: width / 2,
                                  decoration: BoxDecoration(
                                    color: AppColor.white,
                                    borderRadius: BorderRadius.circular(7),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                behavior: HitTestBehavior.opaque,
                                onTap: onFirstTap,
                                child: Center(
                                  child: Text(
                                    'Занятия',
                                    style: AppTypography.medium14.copyWith(
                                      color: Color.lerp(
                                        AppColor.secondarySubjectColor,
                                        AppColor.white,
                                        animationController.value,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                behavior: HitTestBehavior.opaque,
                                onTap: onSecondTap,
                                child: Center(
                                  child: Text(
                                    'Экзамены',
                                    style: AppTypography.medium14.copyWith(
                                      color: Color.lerp(
                                        AppColor.white,
                                        AppColor.lightBlue,
                                        animationController.value,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
