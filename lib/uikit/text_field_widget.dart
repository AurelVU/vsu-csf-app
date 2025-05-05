import 'package:fkn/startup/app_color.dart';
import 'package:fkn/startup/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    this.hintText,
    this.controller,
    this.obscureText,
    this.formatters,
    this.keyboardType,
    this.errorText,
    this.onTap,
    this.onChanged,
  });

  final String? hintText;
  final TextEditingController? controller;
  final bool? obscureText;
  final List<TextInputFormatter>? formatters;
  final TextInputType? keyboardType;
  final String? errorText;
  final VoidCallback? onTap;
  final VoidCallback? onChanged;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return SizedBox(
      child: TextField(
        keyboardType: keyboardType,
        controller: controller,
        onTap: onTap,
        onChanged: (_) {
          if (onChanged != null) {
            onChanged!();
          }
        },
        decoration: InputDecoration(
          filled: false,
          isDense: true,
          errorText: errorText,
          hintText: hintText,
          hintStyle: AppTypography.normal14.copyWith(
            color: AppColor.gray,
          ),
          contentPadding: const EdgeInsets.only(bottom: 12),
          border: UnderlineInputBorder(
            borderSide: BorderSide(
              width: 1.5,
              color: colorScheme.tertiary,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              width: 1.5,
              color: colorScheme.tertiary,
            ),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              width: 1.5,
              color: colorScheme.tertiary,
            ),
          ),
          errorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              width: 1.5,
              color: AppColor.red,
            ),
          ),
          disabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              width: 1.5,
              color: colorScheme.tertiary,
            ),
          ),
        ),
        inputFormatters: formatters,
        obscureText: obscureText ?? false,
      ),
    );
  }
}
