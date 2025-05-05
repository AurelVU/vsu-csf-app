
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

extension ScaffoldMessengerUtils on StackRouter {
  void showInfoSnackBar(String text, {Duration duration = const Duration(milliseconds: 2000)}) {
    _messengerState.showSnackBar(
      SnackBar(
        duration: duration,
        content: Text(
          text,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  void showErrorSnackBar(String text) {
    _messengerState.showSnackBar(
      SnackBar(
        content: Text(text),
      ),
    );
  }

  /// Display material banner.
  void showMaterialBanner(MaterialBanner materialBanner) {
    _messengerState.showMaterialBanner(materialBanner);
  }

  /// Display material banner.
  void hideMaterialBanner() {
    _messengerState.hideCurrentMaterialBanner();
  }

  ScaffoldMessengerState get _messengerState => ScaffoldMessenger.of(
        navigatorKey.currentContext!,
      );
}
