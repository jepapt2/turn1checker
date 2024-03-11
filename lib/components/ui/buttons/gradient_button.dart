//primarybutton
import 'package:flutter/material.dart';
import 'package:turn1checker/theme/color.dart';

enum GradientButtonTheme { cyan, orange }

class GradientButton extends StatelessWidget {
  const GradientButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.theme = GradientButtonTheme.cyan,
    this.width,
    this.height,
    this.fontSize,
  });

  final void Function() onPressed;
  final String text;
  final GradientButtonTheme theme;
  final double? width;
  final double? height;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    final List<Color> gradiationColors = switch (theme) {
      GradientButtonTheme.cyan => [
          ColorTheme.primaryGradientStart,
          ColorTheme.primaryGradientEnd
        ],
      GradientButtonTheme.orange => [
          ColorTheme.orangeGradientStart,
          ColorTheme.orangeGradientEnd
        ],
    };

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(0),
          minimumSize: Size(width ?? 0, height ?? 44)),
      onPressed: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        width: width,
        constraints: const BoxConstraints(maxWidth: double.infinity),
        height: height ?? 44,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: gradiationColors,
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: ColorTheme.white,
              fontSize: fontSize ?? 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
