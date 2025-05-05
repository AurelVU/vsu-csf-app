
import 'package:fkn/feature/student/profile/presentation/profile_presenter.dart';
import 'package:fkn/startup/app_typography.dart';
import 'package:fkn/uikit/debug_fittin_logo.dart';
import 'package:fkn/uikit/profile_button.dart';
import 'package:fkn/uikit/user_info_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class ProfileScreenView extends StatefulWidget {
  const ProfileScreenView({
    super.key,
  });

  @override
  State<ProfileScreenView> createState() => _ProfileScreenViewState();
}

class _ProfileScreenViewState extends State<ProfileScreenView> {
  @override
  Widget build(BuildContext context) {
    final presenter = context.watch<ProfileScreenPresenter>();
    final height = MediaQuery.of(context).padding.top;
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: height),
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 12.0),
              child: Center(
                child: Text(
                  'Профиль',
                  style: AppTypography.medium24,
                ),
              ),
            ),
            StreamBuilder(
              stream: presenter.profile.userData,
              builder: (context, user) {
                return Stack(
                  children: [
                    // Stack(
                    //   children: [
                    //     Padding(
                    //       padding: const EdgeInsets.only(
                    //         top: 24,
                    //         left: 20,
                    //         right: 20,
                    //         bottom: 32,
                    //       ),
                    //       child: Container(
                    //         height: 150,
                    //         decoration: const BoxDecoration(
                    //           gradient: LinearGradient(
                    //             begin: Alignment.centerLeft,
                    //             end: Alignment.centerRight,
                    //             colors: <Color>[
                    //               Color(0xFF18007A),
                    //               Color(0xFF0000FF),
                    //             ],
                    //           ),
                    //           borderRadius: BorderRadius.all(
                    //             Radius.circular(16),
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //     Positioned(
                    //       child: BackdropFilter(
                    //         filter: ImageFilter.blur(sigmaY: 12, sigmaX: 12),
                    //         child: Container(
                    //           color: Colors.transparent,
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    UserInfoCard(
                      name: user.data?.name ?? '',
                      faculty: 'Факультет компьютерных наук',
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: 32),
            // ProfileButton(
            //   onTap: () {
            //     presenter.router.push(const PortfolioRoute());
            //   },
            //   title: 'Портфолио',
            //   svg: 'assets/svg/portfolio.svg',
            // ),
            // const SizedBox(height: 16),
            // const ProfileButton(
            //   title: 'Уведомления',
            //   svg: 'assets/svg/notify.svg',
            // ),
            // const SizedBox(height: 16),
            // const ProfileButton(
            //   title: 'Настройки',
            //   svg: 'assets/svg/setting.svg',
            // ),
            // const SizedBox(height: 16),
            ProfileButton(
              onTap: () {
                presenter.logout();
              },
              title: 'Выйти из аккаунта',
              svg: 'assets/svg/logout.svg',
            ),
            const SizedBox(height: 16),
            ProfileButton(
              onTap: () {
                presenter.deleteProfile();
              },
              title: 'Удалить аккаунт',
              svg: 'assets/svg/delete.svg',
            ),
            const SizedBox(height: 72),
            const DebugFittinLogo(),
          ],
        ),
      ),
    );
  }
}
