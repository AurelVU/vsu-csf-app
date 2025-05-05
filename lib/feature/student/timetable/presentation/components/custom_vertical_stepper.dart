import 'package:flutter/material.dart';

import 'custom_circle.dart';
import 'nested_custom_circle.dart';

class CustomVerticalStep extends StatelessWidget {
  const CustomVerticalStep({
    super.key,
    required this.isComingNow,
    required this.color,
  });

  final bool isComingNow;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        isComingNow
            ? NestedCustomCircle(color: color)
            : CustomCircle(color: color),
         Expanded(
          child: VerticalDivider(
            width: 1,
            thickness: 1,
            indent: 3,
            endIndent: 3,
            color: color,
          ),
        ),
      ],
    );
  }
}
