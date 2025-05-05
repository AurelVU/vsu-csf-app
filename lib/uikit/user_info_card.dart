import 'package:fkn/startup/app_color.dart';
import 'package:fkn/startup/app_keys.dart';
import 'package:fkn/startup/app_typography.dart';
import 'package:flutter/material.dart';

class UserInfoCard extends StatelessWidget {
  const UserInfoCard({
    super.key,
    required this.name,
    this.rank,
    required this.faculty,
  });

  final String name;
  final String? rank;
  final String faculty;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color(0xFF0000FF),
              blurRadius: 24,
              spreadRadius: -16,
              offset: Offset(0, 16),
            ),
          ],
        ),
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                    Color(0xFF18007A),
                    Color(0xFF0000FF),
                  ],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      key: Keys.nameCard,
                      style: AppTypography.medium26.copyWith(
                        color: AppColor.white,
                      ),
                    ),
                    const SizedBox(height: 40),
                    if (rank != null)
                      Text(
                        rank ?? '',
                        style: AppTypography.medium14.copyWith(
                          color: AppColor.white,
                        ),
                      ),
                    if (rank != null) const SizedBox(height: 4),
                    Text(
                      faculty,
                      key: Keys.facultyCard,
                      style: AppTypography.medium14.copyWith(
                        color: AppColor.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned.fill(
              top: 30,
              child: Align(
                alignment: Alignment.bottomRight,
                child: Image.asset(
                  'assets/image/card_logo.png',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
