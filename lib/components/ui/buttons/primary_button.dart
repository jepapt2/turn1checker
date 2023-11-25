//primarybutton
import 'package:flutter/material.dart';
import 'package:turn1checker/theme/color.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({super.key, required this.onPressed, required this.text});

  final void Function() onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
        backgroundColor: ColorTheme.primary,
        maximumSize: const Size(double.infinity, 48),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(
          height: 1,
          color: ColorTheme.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
