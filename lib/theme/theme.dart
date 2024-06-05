import 'package:flutter/cupertino.dart';
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
  textSelectionTheme: TextSelectionThemeData(
      cursorColor: Colors.grey[600],
      selectionColor: ColorTheme.lightGray,
      selectionHandleColor: Colors.grey[600]),
  cupertinoOverrideTheme: CupertinoThemeData(
    primaryColor: Colors.grey[600],
  ),
  textButtonTheme: const TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: MaterialStatePropertyAll(ColorTheme.white),
      textStyle: MaterialStatePropertyAll(
          TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
    ),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    filled: true,
    fillColor: ColorTheme.white,
    hintStyle: TextStyle(
      color: ColorTheme.lightGray,
      fontSize: 16.0,
      fontWeight: FontWeight.normal,
    ),
    floatingLabelBehavior: FloatingLabelBehavior.always,
    border: OutlineInputBorder(
        borderSide: BorderSide.none,
        gapPadding: 0,
        borderRadius: BorderRadius.all(Radius.circular(5))),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
          color: Colors.grey,
          width: 1.0), // Change the color and width as per your need
      borderRadius: BorderRadius.all(Radius.circular(5)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
          color: Colors.blue,
          width: 2.0), // Change the color and width as per your need
      borderRadius: BorderRadius.all(Radius.circular(5)),
    ),
    contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
    errorStyle: TextStyle(color: ColorTheme.yellow, fontSize: 16.0),
    counterStyle: TextStyle(color: ColorTheme.lightGray, fontSize: 16.0),
    labelStyle: TextStyle(color: ColorTheme.white, fontSize: 16.0),
    floatingLabelStyle: TextStyle(color: ColorTheme.white, fontSize: 16.0),
  ),
  dropdownMenuTheme: const DropdownMenuThemeData(
      inputDecorationTheme: InputDecorationTheme(),
      textStyle: TextStyle(color: ColorTheme.black, fontSize: 16.0),
      menuStyle: MenuStyle(
          backgroundColor: MaterialStatePropertyAll(ColorTheme.white))),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(100))),
  ),
  scaffoldBackgroundColor: ColorTheme.background,
  progressIndicatorTheme:
      const ProgressIndicatorThemeData(color: ColorTheme.white),
  popupMenuTheme: const PopupMenuThemeData(
    color: ColorTheme.white,
    textStyle: TextStyle(color: ColorTheme.black, fontSize: 16.0),
    labelTextStyle: MaterialStatePropertyAll(
        TextStyle(color: ColorTheme.black, fontSize: 16.0)),
  ),
);
