import 'package:fkn/startup/app_color.dart';
import 'package:fkn/startup/app_typography.dart';
import 'package:flutter/material.dart';

class StartUpTheme {
  StartUpTheme._(this.themeData);

  final ThemeData themeData;

  factory StartUpTheme._onStartup({required Brightness brightness}) {
    return StartUpTheme._(
      ThemeData(
        pageTransitionsTheme: const PageTransitionsTheme(),
        fontFamily: 'Roboto',
        // scaffoldBackgroundColor: AppColor.white,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColor.newBlue,
          // brightness: brightness,
          primary: AppColor.newBlue,
          secondary: AppColor.white,
          tertiary: AppColor.gray,
        ),
        appBarTheme: const AppBarTheme(
          scrolledUnderElevation: 0.0,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            // backgroundColor: AppColor.button,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            elevation: 0,
            minimumSize: const Size(double.infinity, 50),
            // fixedSize: const Size.fromHeight(44),
            textStyle: AppTypography.medium16.copyWith(
              color: AppColor.white,
              height: 1.32,
            ),
          ),
        ),

        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            foregroundColor: AppColor.button,
            backgroundColor: Colors.transparent,
            side: const BorderSide(
              color: AppColor.newBlue,
            ),
            // fixedSize: const Size.fromHeight(50),
            textStyle: AppTypography.medium16.copyWith(
              color: AppColor.white,
            ),
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          filled: true,
          hintStyle: AppTypography.normal16,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 17,
          ),
        ),
        textSelectionTheme: const TextSelectionThemeData(),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedIconTheme: IconThemeData(),
        ),
        dividerTheme: const DividerThemeData(
          thickness: 2,
        ),
      ),
    );
  }

  factory StartUpTheme.light() {
    return StartUpTheme._onStartup(brightness: Brightness.light);
    // return StartUpTheme._(
    //   ThemeData(
    //
    //     pageTransitionsTheme: const PageTransitionsTheme(),
    //     fontFamily: 'Roboto',
    //     scaffoldBackgroundColor: AppColor.white,
    //     colorScheme: ColorScheme.fromSeed(seedColor: AppColor.white),
    //     appBarTheme: AppBarTheme(
    //       elevation: 0,
    //       iconTheme: const IconThemeData(
    //         color: AppColor.base,
    //
    //       ),
    //       centerTitle: true,
    //
    //       backgroundColor: AppColor.appBar,
    //       foregroundColor: AppColor.black,
    //       titleTextStyle: AppTypography.medium16.copyWith(
    //         color: AppColor.black1F,
    //       ),
    //     ),
    //     elevatedButtonTheme: ElevatedButtonThemeData(
    //       style: ElevatedButton.styleFrom(
    //         backgroundColor: AppColor.button,
    //         shape: const RoundedRectangleBorder(
    //           borderRadius: BorderRadius.all(Radius.circular(10)),
    //         ),
    //         elevation: 0,
    //         fixedSize: const Size.fromHeight(44),
    //         textStyle: AppTypography.medium16.copyWith(
    //           color: AppColor.white,
    //         ),
    //         disabledForegroundColor: AppColor.white,
    //       ),
    //     ),
    //     outlinedButtonTheme: OutlinedButtonThemeData(
    //       style: OutlinedButton.styleFrom(
    //         shape: const RoundedRectangleBorder(
    //           borderRadius: BorderRadius.all(Radius.circular(10)),
    //         ),
    //         foregroundColor: AppColor.button,
    //         backgroundColor: Colors.transparent,
    //         side: const BorderSide(
    //           color: AppColor.button,
    //         ),
    //         fixedSize: const Size.fromHeight(50),
    //         textStyle: AppTypography.medium16.copyWith(
    //           color: AppColor.white,
    //         ),
    //       ),
    //     ),
    //     inputDecorationTheme: InputDecorationTheme(
    //       enabledBorder: const OutlineInputBorder(
    //         borderSide: BorderSide.none,
    //         borderRadius: BorderRadius.zero,
    //       ),
    //       focusedBorder: const OutlineInputBorder(
    //         borderSide: BorderSide.none,
    //         borderRadius: BorderRadius.zero,
    //       ),
    //       filled: true,
    //       fillColor: AppColor.divider,
    //       hintStyle: AppTypography.normal16.copyWith(
    //         color: AppColor.hint,
    //       ),
    //       contentPadding: const EdgeInsets.symmetric(
    //         horizontal: 18,
    //         vertical: 17,
    //       ),
    //     ),
    //     textSelectionTheme: const TextSelectionThemeData(
    //       cursorColor: AppColor.base,
    //     ),
    //     bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    //       selectedIconTheme: IconThemeData(
    //         color: AppColor.button,
    //       ),
    //     ),
    //     dividerTheme: const DividerThemeData(
    //       color: AppColor.divider,
    //       thickness: 2,
    //     ),
    //   ),
    // );
  }

  factory StartUpTheme.dark() {
    return StartUpTheme._onStartup(brightness: Brightness.dark);
    // return StartUpTheme._(
    //   ThemeData(
    //
    //     pageTransitionsTheme: const PageTransitionsTheme(),
    //     fontFamily: 'Roboto',
    //     scaffoldBackgroundColor: AppColor.white,
    //     colorScheme: ColorScheme.fromSeed(seedColor: AppColor.white),
    //     appBarTheme: AppBarTheme(
    //       elevation: 0,
    //       iconTheme: const IconThemeData(
    //         color: AppColor.base,
    //
    //       ),
    //       centerTitle: true,
    //
    //       backgroundColor: AppColor.appBar,
    //       foregroundColor: AppColor.black,
    //       titleTextStyle: AppTypography.medium16.copyWith(
    //         color: AppColor.black1F,
    //       ),
    //     ),
    //     elevatedButtonTheme: ElevatedButtonThemeData(
    //       style: ElevatedButton.styleFrom(
    //         backgroundColor: AppColor.button,
    //         shape: const RoundedRectangleBorder(
    //           borderRadius: BorderRadius.all(Radius.circular(10)),
    //         ),
    //         elevation: 0,
    //         fixedSize: const Size.fromHeight(44),
    //         textStyle: AppTypography.medium16.copyWith(
    //           color: AppColor.white,
    //         ),
    //         disabledForegroundColor: AppColor.white,
    //       ),
    //     ),
    //     outlinedButtonTheme: OutlinedButtonThemeData(
    //       style: OutlinedButton.styleFrom(
    //         shape: const RoundedRectangleBorder(
    //           borderRadius: BorderRadius.all(Radius.circular(10)),
    //         ),
    //         foregroundColor: AppColor.button,
    //         backgroundColor: Colors.transparent,
    //         side: const BorderSide(
    //           color: AppColor.button,
    //         ),
    //         fixedSize: const Size.fromHeight(50),
    //         textStyle: AppTypography.medium16.copyWith(
    //           color: AppColor.white,
    //         ),
    //       ),
    //     ),
    //     inputDecorationTheme: InputDecorationTheme(
    //       enabledBorder: const OutlineInputBorder(
    //         borderSide: BorderSide.none,
    //         borderRadius: BorderRadius.zero,
    //       ),
    //       focusedBorder: const OutlineInputBorder(
    //         borderSide: BorderSide.none,
    //         borderRadius: BorderRadius.zero,
    //       ),
    //       filled: true,
    //       fillColor: AppColor.divider,
    //       hintStyle: AppTypography.normal16.copyWith(
    //         color: AppColor.hint,
    //       ),
    //       contentPadding: const EdgeInsets.symmetric(
    //         horizontal: 18,
    //         vertical: 17,
    //       ),
    //     ),
    //     textSelectionTheme: const TextSelectionThemeData(
    //       cursorColor: AppColor.base,
    //     ),
    //     bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    //       selectedIconTheme: IconThemeData(
    //         color: AppColor.button,
    //       ),
    //     ),
    //     dividerTheme: const DividerThemeData(
    //       color: AppColor.divider,
    //       thickness: 2,
    //     ),
    //   ),
    // );
  }
}
