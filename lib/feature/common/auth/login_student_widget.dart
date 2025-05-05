import 'package:auto_route/auto_route.dart';
import 'package:fkn/feature/common/auth/auth_screen_presenter.dart';
import 'package:fkn/startup/app_color.dart';
import 'package:fkn/startup/app_keys.dart';

import 'package:fkn/startup/app_typography.dart';
import 'package:fkn/uikit/text_field_widget.dart';
import 'package:fkn/utils/capitalize_extension.dart';
import 'package:fkn/utils/formatters/length_limiting_text_field.dart';
import 'package:fkn/utils/formatters/validator_input_formatter.dart';
import 'package:fkn/utils/regexes.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginStudentWidget extends StatefulWidget {
  const LoginStudentWidget({
    super.key,
    required this.presenter,
  });

  final AuthScreenPresenter presenter;

  @override
  State<LoginStudentWidget> createState() => _LoginStudentWidgetState();
}

class _LoginStudentWidgetState extends State<LoginStudentWidget> {
  final TextEditingController mailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    mailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 46.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 32,
              ),
              StreamBuilder<bool>(
                stream: widget.presenter.isError,
                builder: (context, snapshot) {
                  return TextFieldWidget(
                    keyboardType: TextInputType.emailAddress,
                    hintText: 'Логин',
                    controller: mailController,
                    onChanged: () {
                      widget.presenter.isError.value = false;
                    },
                    onTap: () {
                      widget.presenter.isError.value = false;
                    },
                    errorText: snapshot.data == true ? '' : null,
                    formatters: [
                      ValidatorInputFormatter(
                          pattern: Regexes.emailAllowSymbols),
                      LengthLimitingTextFieldFormatterFixed(320)
                    ],
                  );
                },
              ),
              const SizedBox(
                height: 32,
              ),
              StreamBuilder<bool>(
                stream: widget.presenter.isError,
                builder: (context, snapshot) {
                  return TextFieldWidget(
                    keyboardType: TextInputType.visiblePassword,
                    hintText: 'Пароль',
                    onChanged: () {
                      widget.presenter.isError.value = false;
                    },
                    onTap: () {
                      widget.presenter.isError.value = false;
                    },
                    obscureText: true,
                    errorText: snapshot.data == true
                        ? 'Неверный логин или пароль'
                        : null,
                    controller: passwordController,
                    formatters: [
                      LengthLimitingTextFieldFormatterFixed(320),
                    ],
                  );
                },
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      final Uri emailLaunchUri = Uri(
                        scheme: 'mailto',
                        path: 'csadmins@sc.vsu.ru',
                        query: encodeQueryParameters(
                          <String, String>{
                            'subject': 'Забыт пароль от почты',
                            'body':
                                'Логин в системе - \nНомер студенческого билета - ',
                          },
                        ),
                      );

                      launchUrl(emailLaunchUri);
                    },
                    behavior: HitTestBehavior.opaque,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text.rich(
                        TextSpan(
                          style: AppTypography.normal12.copyWith(
                            color: colorScheme.onSecondaryContainer,
                            height: 1.32,
                          ),
                          children: [
                            const TextSpan(
                              text: 'Восстановить пароль ',
                            ),
                            TextSpan(
                              text: 'csadmins@sc.vsu.ru',
                              style: AppTypography.normal12.copyWith(
                                color: colorScheme.primary,
                              ),
                            ),
                          ],
                        ),
                        key: Keys.remPass,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  GestureDetector(
                    onTap: () {
                      final Uri googleFormLaunchUri = Uri.parse(
                        'https://docs.google.com/forms/d/e/1FAIpQLSdiaHEb3qiYkiC5FzFxCnB-YIn-YR5TAA9ozEydww6pbfH4jQ/viewform?vc=0&c=0&w=1&flr=0',
                      );

                      launchUrl(googleFormLaunchUri);
                    },
                    child: Text.rich(
                      TextSpan(
                        text: 'Для создания аккаунта необходимо заполнить ',
                        style: AppTypography.normal12.copyWith(
                          color: colorScheme.onSecondaryContainer,
                          height: 1.32,
                        ),
                        children: [
                          TextSpan(
                            text: 'форму',
                            style: AppTypography.normal12.copyWith(
                              color: colorScheme.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const Spacer(),
              AspectRatio(
                aspectRatio: 283 / 50,
                child: StreamBuilder<bool>(
                  stream: widget.presenter.isButtonActive,
                  builder: (context, isActive) {
                    return ElevatedButton(
                      onPressed: isActive.data == true
                          ? () {
                              FocusScope.of(context).requestFocus(FocusNode());
                              widget.presenter.loginAsStudent(
                                mailController.text,
                                passwordController.text,
                              );
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                          backgroundColor: colorScheme.primary,
                          foregroundColor: colorScheme.onPrimary,
                          disabledBackgroundColor: colorScheme.tertiary,
                          // Background Color
                          disabledForegroundColor: colorScheme.surface),
                      child: isActive.data == true
                          ? const Center(
                              child: Text('Войти'),
                            )
                          : const CircularProgressIndicator(
                              color: AppColor.white,
                            ),
                    );
                  },
                ),
              ),
              const Spacer(flex: 4),
            ],
          ),
        ),
      ),
    );
  }
}
