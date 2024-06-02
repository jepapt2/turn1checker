import 'package:flutter/material.dart';
import 'package:turn1checker/theme/color.dart';

enum SnackBarType { success, error, notice }

void showPrimarySnackbar(BuildContext context, String text, SnackBarType type) {
  Color backgroundColor;
  switch (type) {
    case SnackBarType.success:
      backgroundColor = const Color.fromARGB(208, 34, 189, 150);
      break;
    case SnackBarType.error:
      backgroundColor = const Color.fromARGB(220, 183, 28, 28);
      break;
    case SnackBarType.notice:
      backgroundColor = const Color.fromARGB(220, 66, 98, 124);
      break;
  }
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      text,
      style: const TextStyle(color: ColorTheme.white, fontSize: 14),
    ),
    backgroundColor: backgroundColor,
    margin: const EdgeInsets.only(left: 20, right: 20, bottom: 100),
    behavior: SnackBarBehavior.floating,
  ));
}
