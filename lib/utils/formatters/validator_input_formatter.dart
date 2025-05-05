import 'package:flutter/services.dart';

class RegexValidator {
  final RegExp pattern;

  RegexValidator({required this.pattern});

  bool isValid(String value) {
    return pattern.hasMatch(value.split('').last) == true;
  }
}

class ValidatorInputFormatter implements TextInputFormatter {
  ValidatorInputFormatter({required this.pattern});

  final RegExp pattern;

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final RegexValidator editingValidator = RegexValidator(pattern: pattern);
    // applying to delete symbols
    if (newValue.text.length < oldValue.text.length) {
      return newValue;
    }
    // applying to input symbols
    final newValueValid = editingValidator.isValid(newValue.text);
    if (!newValueValid) {
      return oldValue;
    }
    return newValue;
  }
}
