import 'package:flutter/material.dart';
import 'package:turn1checker/theme/color.dart';

final ThemeData themedata = ThemeData(
  useMaterial3: true,
  primaryColor: ColorTheme.primary,
  brightness: Brightness.dark,
  appBarTheme: const AppBarTheme(
      color: ColorTheme.primary,
      titleTextStyle: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 20.0, color: ColorTheme.white),
      centerTitle: true),
  scaffoldBackgroundColor: ColorTheme.background,
);
