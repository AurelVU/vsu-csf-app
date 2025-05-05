
import 'package:auto_route/auto_route.dart';
import 'package:fkn/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DebugFittinLogo extends StatefulWidget {
  const DebugFittinLogo({
    super.key,
  });

  @override
  State<DebugFittinLogo> createState() => _DebugFittinLogoState();
}

class _DebugFittinLogoState extends State<DebugFittinLogo> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        count++;
        if (count == 10) {
          context.router.navigate(const DebugRoute());
        }
      },
      child: SvgPicture.asset('assets/svg/fittin_logo.svg'),
    );
  }
}
