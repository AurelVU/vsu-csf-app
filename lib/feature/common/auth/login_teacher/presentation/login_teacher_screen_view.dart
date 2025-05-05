import 'package:fkn/feature/common/auth/login_teacher/presentation/confirm_code_teacher_screen_view.dart';
import 'package:fkn/feature/common/auth/login_teacher/presentation/enter_value_teacher_screen_view.dart';
import 'package:fkn/feature/common/auth/login_teacher/presentation/login_teacher_presenter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginTeacherScreenView extends StatelessWidget {
  const LoginTeacherScreenView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final presenter = context.watch<LoginTeacherScreenPresenter>();
    return Scaffold(
      body: StreamBuilder<bool>(
        stream: presenter.confirmCodePage,
        builder: (context, snapshot) {
          if (snapshot.data == false){
            return EnterValueTeacherScreenView(
              presenter: presenter,
            );
          }
          return ConfirmCodeTeacherScreenView(
            presenter: presenter,
          );
          // return AnimatedCrossFade(
          //   firstChild: EnterValueTeacherScreenView(
          //     presenter: presenter,
          //   ),
          //   secondChild: ConfirmCodeTeacherScreenView(
          //     presenter: presenter,
          //   ),
          //   crossFadeState: presenter.confirmCodePage.value ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          //   duration: const Duration(milliseconds: 300),
          // );
        },
      ),
    );
  }
}
