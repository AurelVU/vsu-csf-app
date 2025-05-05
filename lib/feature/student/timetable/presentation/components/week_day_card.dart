import 'dart:math';

import 'package:fkn/startup/app_typography.dart';
import 'package:flutter/material.dart';

class WeekDayCard extends StatelessWidget {
  const WeekDayCard({
    super.key,
    this.onTap,
    required this.number,
    required this.dayOfWeek,
    this.itemBgColor,
    this.itemTextColor,
    this.month,
  });

  final VoidCallback? onTap;
  final String? month;
  final String number;
  final String dayOfWeek;
  final Color? itemBgColor;
  final Color? itemTextColor;

  @override
  Widget build(BuildContext context) {
    final scaleFactor = MediaQuery.textScaleFactorOf(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(

        width: max(32.6 * scaleFactor + 32, 68),
        padding: const EdgeInsets.symmetric(horizontal:  16.0, vertical: 8.0),
        decoration: BoxDecoration(
          color: itemBgColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(15.0),
          ),
        ),
        child: Column(
          children: [
            if (month != null)
            Text(
              month ?? '',
              style: AppTypography.normal14.copyWith(
                color: itemTextColor,
              ),
            ),
            if (month != null)
            const SizedBox(height: 2),
            Text(
              number,
              style: AppTypography.semiBold20.copyWith(
                color: itemTextColor,
                fontSize: 28,
                height: 1.32,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              dayOfWeek,
              overflow: TextOverflow.ellipsis,
              style: AppTypography.normal14.copyWith(
                // color: selected ? selectedItemTextColor : itemTextColor,
                color: itemTextColor,
                height: 1.32,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
