import 'package:flutter/material.dart';
import 'package:turn1checker/theme/color.dart';

enum PrimaryButtonTheme {
  primaryFill,
  outline,
}

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.buttonTheme = PrimaryButtonTheme.primaryFill,
    this.width,
    this.height,
    this.fontSize,
  });

  final void Function() onPressed;
  final String text;
  final PrimaryButtonTheme buttonTheme;
  final double? width;
  final double? height;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    if (buttonTheme == PrimaryButtonTheme.primaryFill) {
      return ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          backgroundColor: ColorTheme.primary,
          minimumSize: Size(width ?? double.infinity, height ?? 44),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            height: 1,
            color: ColorTheme.white,
            fontSize: fontSize ?? 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }

    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
          maximumSize: const Size(double.infinity, 48),
          minimumSize: Size(width ?? 0, 48),
          foregroundColor: ColorTheme.white),
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
