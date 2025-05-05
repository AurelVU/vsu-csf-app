import 'package:auto_route/auto_route.dart';
import 'package:fkn/startup/app_typography.dart';
import 'package:flutter/material.dart';

@RoutePage()
class TechWorkScreen extends StatelessWidget {
  const TechWorkScreen({
    Key? key,
    this.text,
  }) : super(key: key);

  final String? text;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset('assets/image/tech_work.png'),
            const Positioned(
              bottom: 16,
              left: 0,
              right: 0,
              child: Center(
                child: Column(
                  children: [
                    Text(
                      'ТЕХНИЧЕСКИЕ РАБОТЫ',
                      textAlign: TextAlign.center,
                      style: AppTypography.bold23,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40.0),
                      child: Center(
                        child: Text(
                          'Ведутся технические работы. Приносим свои извинения',
                          style: AppTypography.normal16,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
