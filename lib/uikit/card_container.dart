import 'package:flutter/material.dart';

/// отечественная разработка
/// тень он Card не подходит, поэтому написал контейнер, который косит под card с подходящей тенью
class CardContainer extends StatelessWidget {
  const CardContainer({
    super.key,
    required this.child,
    this.width,
    this.height,
    this.borderRadius = 15,
    this.useShadow = false,
  });

  final Widget child;
  final double? width;
  final double? height;
  final double borderRadius;

  final bool useShadow;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: width,
      height: height,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius:  BorderRadius.all(
          Radius.circular(borderRadius),
        ),
        boxShadow: useShadow ? [
          BoxShadow(
            color: theme.colorScheme.onSurface.withOpacity(0.15),
            spreadRadius: 0,
            blurRadius: 10,
            offset: const Offset(0, -1), // changes position of shadow
          ),
        ] : [],
      ),
      child: child,
    );
  }
}
