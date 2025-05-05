import 'package:auto_route/auto_route.dart';
import 'package:fkn/feature/common/auth/login_teacher/presentation/login_teacher_presenter.dart';
import 'package:fkn/startup/app_color.dart';
import 'package:fkn/startup/app_keys.dart';
import 'package:fkn/startup/app_typography.dart';
import 'package:fkn/uikit/text_field_widget.dart';
import 'package:fkn/utils/capitalize_extension.dart';
import 'package:fkn/utils/formatters/length_limiting_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

/// nice naming bro
/// экран для ввода почта/телефона
class EnterValueTeacherScreenView extends StatelessWidget {
  const EnterValueTeacherScreenView({
    super.key,
    required this.presenter,
  });

  final LoginTeacherScreenPresenter presenter;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Вход в аккаунт',
          style: AppTypography.medium16,
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              onPressed: () {
                context.router.pop();
              },
              icon: SizedBox(
                width: 28,
                height: 28,
                child: Image.asset(
                  'assets/image/close.png',
                ),
              ),
            ),
          ),
        ],
      ),
      body: StreamBuilder<bool>(
        stream: presenter.isMailStream,
        builder: (context, snapshot) {
          return Padding(
            padding: const EdgeInsets.all(46.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // const EnterProfileTitle(),
                const Spacer(),
                StreamBuilder<bool>(
                    stream: presenter.isError,
                    builder: (context, snapshot) {
                      return StreamBuilder<String?>(
                          stream: presenter.profileManager.loginErrorController,
                          builder: (context, errorSnapshot) {
                            final errorData = errorSnapshot.data;
                            return AnimatedCrossFade(
                              firstChild: TextFieldWidget(
                                controller: presenter.mailController,
                                hintText: 'Адрес электронной почты',
                                keyboardType: TextInputType.emailAddress,
                                onChanged: () {
                                  presenter.isError.value = false;
                                },
                                errorText: errorData,
                                formatters: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp("[A-Za-z0-9_.@]")),
                                ],
                              ),
                              secondChild: TextFieldWidget(
                                controller: presenter.phoneController,
                                hintText: 'Номер телефона',
                                onChanged: () {
                                  presenter.isError.value = false;
                                },
                                keyboardType: TextInputType.number,
                                errorText: snapshot.data == true
                                    ? 'Неправильная или пустой номер телефон'
                                    : null,
                                formatters: [
                                  LengthLimitingTextFieldFormatterFixed(18),
                                  FilteringTextInputFormatter.allow(
                                      RegExp('[0-9]')),
                                ],
                              ),
                              crossFadeState: presenter.isMailStream.value
                                  ? CrossFadeState.showFirst
                                  : CrossFadeState.showSecond,
                              duration: const Duration(milliseconds: 300),
                            );
                          });
                    }),
                const SizedBox(
                  height: 16,
                ),
                GestureDetector(
                  onTap: () {
                    final Uri emailLaunchUri = Uri(
                      scheme: 'mailto',
                      path: 'brs@sc.vsu.ru',
                      query: encodeQueryParameters(
                        <String, String>{
                          'subject': 'Не удалось войти',
                        },
                      ),
                    );
                    launchUrl(emailLaunchUri);
                  },
                  behavior: HitTestBehavior.opaque,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: RichText(
                      key: Keys.brs2,
                      text: TextSpan(
                        style: AppTypography.normal12.copyWith(
                          color: colorScheme.onSecondaryContainer,
                          height: 1.32,
                        ),
                        children: [
                          const TextSpan(
                            text: 'Не удалось войти? Напишите на ',
                          ),
                          TextSpan(
                            text: 'brs@sc.vsu.ru',
                            style: AppTypography.normal12.copyWith(
                              color: colorScheme.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 56,
                ),
                StreamBuilder<bool>(
                  stream: presenter.isButtonActive,
                  builder: (context, snapshot) {
                    return SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed:
                            snapshot.data == true ? presenter.getCode : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                          foregroundColor:
                              Theme.of(context).colorScheme.onPrimary,
                        ),
                        child: snapshot.data == true
                            ? AnimatedCrossFade(
                                firstChild:
                                    const Text('Отправить код на Email' , textAlign: TextAlign.center,),
                                secondChild:
                                    const Text('Отправить SMS с кодом', textAlign: TextAlign.center,),
                                crossFadeState: presenter.isMailStream.value
                                    ? CrossFadeState.showFirst
                                    : CrossFadeState.showSecond,
                                duration: const Duration(milliseconds: 300),
                              )
                            : const CircularProgressIndicator(
                                color: AppColor.white,
                              ),
                      ),
                    );
                  },
                ),
                Center(
                  child: TextButton(
                    onPressed: presenter.changeType,
                    style: TextButton.styleFrom(
                        splashFactory: NoSplash.splashFactory),
                    child: AnimatedCrossFade(
                      firstChild: Text(
                        'Войти по номеру телефона',
                        style: AppTypography.medium14.copyWith(),
                      ),
                      secondChild: Text(
                        'Войти по Email',
                        style: AppTypography.medium14.copyWith(),
                      ),
                      crossFadeState: presenter.isMailStream.value
                          ? CrossFadeState.showFirst
                          : CrossFadeState.showSecond,
                      duration: const Duration(milliseconds: 300),
                    ),
                  ),
                ),
                const Spacer(
                  flex: 5,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
