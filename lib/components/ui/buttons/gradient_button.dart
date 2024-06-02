//primarybutton
import 'package:flutter/material.dart';
import 'package:turn1checker/theme/color.dart';

enum GradientButtonTheme { cyan, orange }

class GradientButton extends StatelessWidget {
  const GradientButton({
    super.key,
    this.onPressed,
    required this.text,
    this.theme = GradientButtonTheme.cyan,
    this.width,
    this.height,
    this.fontSize,
    this.isLoading = false,
  });

  final void Function()? onPressed;
  final String text;
  final GradientButtonTheme theme;
  final double? width;
  final double? height;
  final double? fontSize;
  final bool isLoading;

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
      onPressed: isLoading ? (onPressed == null ? null : () {}) : onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        width: width,
        constraints: const BoxConstraints(maxWidth: double.infinity),
        height: height ?? 44,
        decoration: onPressed != null
            ? BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: gradiationColors,
                ),
              )
            : null,
        child: Center(
          child: isLoading && onPressed != null
              ? const SizedBox(
                  width: 20, height: 20, child: CircularProgressIndicator())
              : Text(
                  text,
                  style: TextStyle(
                    color: theme == GradientButtonTheme.cyan
                        ? ColorTheme.white
                        : ColorTheme.background,
                    fontSize: fontSize ?? 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
        ),
      ),
    );
  }
}
