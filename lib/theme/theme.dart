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
      borderSide: BorderSide(color: ColorTheme.quaternary),
    ),
    focusedErrorBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: ColorTheme.quaternary),
    ),
    errorStyle: TextStyle(color: ColorTheme.quaternary, fontSize: 16.0),
    counterStyle: TextStyle(color: ColorTheme.lightGray, fontSize: 16.0),
    labelStyle: TextStyle(color: ColorTheme.lightGray, fontSize: 16.0),
    floatingLabelStyle: TextStyle(color: ColorTheme.lightGray, fontSize: 16.0),
  ),
  scaffoldBackgroundColor: ColorTheme.background,
);
