
import 'package:fkn/domain/teacher/profile/teacher_info.dart';
import 'package:fkn/feature/teacher/teacher_profile/presentation/teacher_profile_presenter.dart';
import 'package:fkn/startup/app_typography.dart';
import 'package:fkn/uikit/debug_fittin_logo.dart';
import 'package:fkn/uikit/profile_button.dart';
import 'package:fkn/uikit/user_info_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class TeacherProfileScreenView extends StatelessWidget {
  const TeacherProfileScreenView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final presenter = context.watch<TeacherProfileScreenPresenter>();
    final height = MediaQuery.of(context).padding.top;
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: height),
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 12.0),
              child: Center(
                child: Text(
                  'Профиль',
                  style: AppTypography.medium24,
                ),
              ),
            ),
            StreamBuilder<TeacherInfo?>(
                stream: presenter.profileManager.teacherInfo,
                builder: (context, user) {
                  final teacherInfo = user.data;
                  return   UserInfoCard(
                    name:
                    '${teacherInfo?.lastName ?? ''} ${teacherInfo?.firstName ?? ''} ${teacherInfo?.middlename ?? ''}',
                    faculty: teacherInfo?.faculty ?? '',
                    rank: teacherInfo?.rank,
                  );
                }),
            const SizedBox(height: 32),
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
