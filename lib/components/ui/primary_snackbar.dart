import 'package:flutter/material.dart';
import 'package:turn1checker/theme/color.dart';

enum SnackBarType { success, error }

void showPrimarySnackbar(BuildContext context, String text, SnackBarType type) {
  final Color backgroundColor = type == SnackBarType.success
      ? const Color.fromARGB(220, 27, 94, 31)
      : const Color.fromARGB(220, 183, 28, 28);
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: FittedBox(
        child: Text(
      text,
      style: const TextStyle(color: ColorTheme.white),
    )),
    backgroundColor: backgroundColor,
    margin: const EdgeInsets.only(left: 20, right: 20, bottom: 100),
    behavior: SnackBarBehavior.floating,
  ));
}
