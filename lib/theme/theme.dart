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
    centerTitle: true,
    actionsIconTheme: IconThemeData(color: ColorTheme.white),
  ),
  dialogTheme: const DialogTheme(
      backgroundColor: ColorTheme.background,
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20.0,
        color: ColorTheme.white,
      ),
      contentTextStyle: TextStyle(fontSize: 16.0, color: ColorTheme.white),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)))),
  inputDecorationTheme: const InputDecorationTheme(
    border: UnderlineInputBorder(
      borderSide: BorderSide(color: ColorTheme.white),
    ),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: ColorTheme.white),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: ColorTheme.white),
    ),
    errorBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: ColorTheme.yellow),
    ),
    focusedErrorBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: ColorTheme.yellow),
    ),
    errorStyle: TextStyle(color: ColorTheme.yellow, fontSize: 16.0),
    counterStyle: TextStyle(color: ColorTheme.lightGray, fontSize: 16.0),
    labelStyle: TextStyle(color: ColorTheme.white, fontSize: 16.0),
    floatingLabelStyle: TextStyle(color: ColorTheme.white, fontSize: 16.0),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(100))),
  ),
  scaffoldBackgroundColor: ColorTheme.background,
);
