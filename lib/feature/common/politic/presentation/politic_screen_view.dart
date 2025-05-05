import 'package:fkn/feature/common/politic/presentation/politic_presenter.dart';
import 'package:fkn/startup/app_color.dart';
import 'package:fkn/startup/app_typography.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher_string.dart';

class PoliticScreenView extends StatelessWidget {
  const PoliticScreenView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final presenter = context.watch<PoliticScreenPresenter>();
    final colorScheme = Theme.of(context).colorScheme;
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Политика конфиденциальности',
            style: AppTypography.medium18,
          ),
          leading: IconButton(
            onPressed: () {
              presenter.goBack();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: AppColor.grey,
              size: 16,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Spacer(),
              const Center(
                child: Text(
                  'Необходимо принять условия пользовательского соглашения',
                  textAlign: TextAlign.center,
                  style: AppTypography.medium22,
                ),
              ),
              const SizedBox(height: 32),
              StreamBuilder<bool>(
                  stream: presenter.isPoliticAccept,
                  builder: (context, snapshot) {
                    return Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 40,
                              height: 40,
                              child: Checkbox(
                                value: snapshot.data,
                                checkColor: colorScheme.primary,
                                activeColor: colorScheme.primary,
                                fillColor:
                                    WidgetStateProperty.resolveWith<Color>(
                                        (Set<WidgetState> states) {
                                  return Colors.white;
                                }),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                side: WidgetStateBorderSide.resolveWith(
                                  (states) => BorderSide(
                                    width: 1.5,
                                    strokeAlign: 5,
                                    color: presenter.isPoliticAccept.value
                                        ? AppColor.newBlue
                                        : AppColor.gray,
                                  ),
                                ),
                                onChanged: (_) =>
                                    presenter.changePoliticAgreement(),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Я принимаю условия ',
                                      style: AppTypography.normal14
                                          .copyWith(color: AppColor.black),
                                    ),
                                    TextSpan(
                                      text: 'пользовательского соглашения',
                                      style: AppTypography.normal14.copyWith(
                                          color: AppColor.black,
                                          decoration: TextDecoration.underline),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          launchUrlString(
                                              'https://fittin.ru/privacypolicyapp');
                                        },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: colorScheme.primary,
                              foregroundColor: colorScheme.secondary,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                              ),
                            ),
                            onPressed: presenter.isPoliticAccept.value
                                ? () {
                                    presenter.acceptPolitic();
                                  }
                                : null,
                            child: const Text(
                              'Далее',
                              style: AppTypography.medium16,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                      ],
                    );
                  }),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

class _PointAndText extends StatelessWidget {
  const _PointAndText({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 12,
        ),
        const Text(
          "\u2022",
          style: TextStyle(fontSize: 20),
        ), //bullet text
        const SizedBox(
          width: 10,
        ), //space between bullet and text
        Expanded(
          child: Text(
            text,
            style: AppTypography.normal14,
          ), //text
        )
      ],
    );
  }
}
