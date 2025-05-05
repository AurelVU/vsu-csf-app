import 'package:fkn/startup/app_color.dart';
import 'package:fkn/startup/app_typography.dart';
import 'package:flutter/material.dart';

Future<void> showErrorDialog({
  required BuildContext context,
  required String titleText,
  required String successButtonText,
  VoidCallback? onSuccessTap,
  String? message,
  VoidCallback? onCancelTap,
  String? cancelButtonText,
  TextStyle? titleTextStyle,
}) async {
  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        contentPadding: const EdgeInsets.all(24),
        backgroundColor: AppColor.white,
        surfaceTintColor: AppColor.white,
        title: Text(
          titleText,
          style: titleTextStyle ?? AppTypography.semiBold18,
        ),
        content: message != null
            ? Text(
                message,
                style: AppTypography.normal14,
              )
            : null,
        actions: [
          if (onCancelTap != null)
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: TextButton(
                onPressed: () {
                  onCancelTap();
                  Navigator.of(context).pop();
                },
                child: Text(
                  cancelButtonText ?? '',
                  style: AppTypography.semiBold16.copyWith(
                    color: AppColor.newBlue,
                  ),
                ),
              ),
            ),
          TextButton(
            onPressed: () {
              onSuccessTap?.call();
              Navigator.of(context).pop();
            },
            child: Text(
              successButtonText,
              style: AppTypography.semiBold16.copyWith(
                color: AppColor.black,
              ),
            ),
          ),
        ],
      );
    },
  );
}
