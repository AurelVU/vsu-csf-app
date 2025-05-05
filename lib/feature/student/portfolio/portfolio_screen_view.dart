import 'package:auto_route/auto_route.dart';
import 'package:fkn/feature/student/portfolio/portfolio_presenter.dart';
import 'package:fkn/startup/app_color.dart';
import 'package:fkn/startup/app_keys.dart';
import 'package:fkn/startup/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class PortfolioScreenView extends StatelessWidget {
  const PortfolioScreenView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final presenter = context.watch<PortfolioScreenPresenter>();
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Портфолио',
          style: AppTypography.medium18,
        ),
        leading: GestureDetector(
          onTap: () => context.router.pop(),
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColor.backButton,
            size: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: StreamBuilder(
          stream: presenter.profile.userData,
          builder: (context, snapshot) {
            final user = snapshot.data;
            final splitName = user?.name?.split(' ');
            return ListView(
              padding: const EdgeInsets.all(16),
              clipBehavior: Clip.none,
              children: [
                Row(children: [
                  const Spacer(),
                  Expanded(
                    flex: 2,
                    child: Container(
                      key: Keys.imageFace,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 1.5,
                            color: const Color(0xFF0000FF),
                          )),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                          width: 6,
                          color: Colors.transparent,
                        )),
                        child: ClipOval(
                          child: Image.asset(
                            'assets/image/face.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                ]),
                const SizedBox(height: 16),
                FieldText(text: splitName?[0]),
                const SizedBox(height: 16),
                FieldText(text: splitName?[1]),
                const SizedBox(height: 16),
                FieldText(text: splitName?[2]),
                const SizedBox(height: 16),
                const FieldText(text: '12.10.2002'),
                const SizedBox(height: 32),
                const FieldText(text: '+7 (900) 001 3002'),
                const SizedBox(height: 16),
                const FieldText(text: 'fittin@vsu.ru'),
                const SizedBox(height: 24),
                Container(
                  key: Keys.userInfo,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: theme.colorScheme.surface,
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x14000000),
                        spreadRadius: 0,
                        blurRadius: 20,
                        offset: Offset(0, 0), // changes position of shadow
                      ),
                    ],
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'ВГУ',
                          style: AppTypography.semiBold22,
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        CustomListTile(
                          title: 'Уровень образования',
                          text: 'Бакалавр',
                        ),
                        Divider(
                          color: Color(0xFFCCCDD4),
                          height: 16,
                          thickness: 1,
                        ),
                        CustomListTile(
                          title: 'Факультет',
                          text: 'ФКН',
                        ),
                        Divider(
                          color: Color(0xFFCCCDD4),
                          height: 16,
                          thickness: 1,
                        ),
                        CustomListTile(
                          title: 'Специализация',
                          text: 'Прикладная информатика',
                        ),
                        Divider(
                          color: Color(0xFFCCCDD4),
                          height: 16,
                          thickness: 1,
                        ),
                        CustomListTile(
                          title: 'Год окончания',
                          text: '2024',
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/svg/download.svg'),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      'Поделиться PDF',
                      style: AppTypography.medium14.copyWith(decoration: TextDecoration.underline),
                    )
                  ],
                )
              ],
            );
          }),
    );
  }
}

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.title,
    required this.text,
  });

  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppTypography.normal12.copyWith(
                color: const Color(0xFF98989E),
              ),
            ),
            Text(
              text,
              style: AppTypography.normal16,
            ),
          ],
        ),
        const Icon(
          Icons.arrow_forward_ios_rounded,
          color: Color(0xFFCCCDD4),
          size: 14,
        ),
      ],
    );
  }
}

class FieldText extends StatelessWidget {
  const FieldText({super.key, this.text});

  final String? text;

  @override
  Widget build(BuildContext context) {
    if (text == null) {
      return Container();
    }
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: AppColor.appBar,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            text ?? '',
            style: AppTypography.normal16,
          ),
        ),
      ),
    );
  }
}
