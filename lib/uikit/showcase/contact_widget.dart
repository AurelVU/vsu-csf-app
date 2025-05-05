import 'package:fkn/startup/app_color.dart';
import 'package:fkn/startup/app_keys.dart';
import 'package:fkn/startup/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContactWidget extends StatelessWidget {
  const ContactWidget({
    super.key,
    this.onTap,
  });

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Container(
          key: Keys.contactWidget,
          decoration: BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Expanded(
                          child: Text(
                            'Есть идея, как сделать приложение лучше?',
                            style: AppTypography.semiBold20,
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          'Напиши нам!',
                          style: AppTypography.normal14.copyWith(
                            decoration: TextDecoration.underline,
                            color: AppColor.newBlue,
                          ),
                        )
                      ],
                    ),
                  ),
                  SvgPicture.asset('assets/svg/fly.svg'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
