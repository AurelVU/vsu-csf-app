import 'package:flutter/material.dart';

class StartUpWidgetConfig extends StatelessWidget {
  const StartUpWidgetConfig({
    required this.child,
    Key? key,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
