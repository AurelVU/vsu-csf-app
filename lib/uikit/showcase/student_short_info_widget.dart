
import 'package:fkn/startup/app_keys.dart';
import 'package:fkn/startup/app_typography.dart';
import 'package:flutter/material.dart';


class StudentShortInfoWidget extends StatelessWidget {
  const StudentShortInfoWidget({super.key, this.onTap, required this.name});

  final VoidCallback? onTap;
  final String name;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 1.7,
                    color: const Color(0xFF0000FF),
                  )),
              key: Keys.face,
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                  width: 6,
                  color: Colors.transparent,
                )),
                child: ClipOval(
                  child: SizedBox(
                    width: 70,
                    height: 70,
                    child: Image.asset(
                      'assets/image/face.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    name,
                    key: Keys.name,
                    maxLines: 2,
                    style: AppTypography.semiBold22.copyWith(
                      height: 24 / 22,
                    ),
                  ),
                  Text(
                    'Факультет компьютерных наук',
                    key: Keys.faculty,
                    style: AppTypography.normal14.copyWith(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
