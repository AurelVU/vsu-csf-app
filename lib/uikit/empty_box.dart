import 'package:flutter/material.dart';

class EmptyBox extends StatelessWidget {
  final double? width;
  final double? height;
  final double radius;

  const EmptyBox({
    super.key,
    this.width = double.infinity,
    this.height = double.infinity,
    this.radius = 10,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        color: Theme.of(context).colorScheme.surface,
      ),
      width: width,
      height: height,
    );
  }
}
