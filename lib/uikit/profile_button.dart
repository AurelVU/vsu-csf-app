import 'package:fkn/startup/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileButton extends StatelessWidget {
  const ProfileButton({
    super.key,
    required this.title,
    required this.svg,
    this.onTap,
  });

  final String title;
  final String svg;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(15),
      splashFactory: NoSplash.splashFactory,
      splashColor: Colors.transparent,
      child: Ink(
        decoration: BoxDecoration(
          color: AppColor.appBar,
          borderRadius: BorderRadius.circular(15),
        ),
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            minHeight: 50,
            maxHeight: 120,
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                SvgPicture.asset(
                  svg,
                  width: 24,
                  height: 24,
                ),
                const SizedBox(width: 16),
                Expanded(child: Text(title)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
