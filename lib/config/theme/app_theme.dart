import 'package:flutter/material.dart';

class AppTheme {
  static const redColor = Color(0xfffe0012);

  static ThemeData appTheme() => ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: Colors.black,
      bottomSheetTheme: BottomSheetThemeData(backgroundColor: Colors.black, modalBarrierColor: Colors.black.withOpacity(0.96)),
      progressIndicatorTheme: const ProgressIndicatorThemeData(color: redColor),
      filledButtonTheme: FilledButtonThemeData(style: ButtonStyle(backgroundColor: MaterialStateProperty.all(redColor))));
}
