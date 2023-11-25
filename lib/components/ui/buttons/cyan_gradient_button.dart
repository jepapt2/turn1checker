//primarybutton
import 'package:flutter/material.dart';
import 'package:turn1checker/theme/color.dart';

class CyanGradientButton extends StatelessWidget {
  const CyanGradientButton(
      {super.key, required this.onPressed, required this.text});

  final void Function() onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(0)),
      onPressed: onPressed,
      child: Container(
        width: double.infinity,
        height: 48,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              ColorTheme.primaryGradientStart,
              ColorTheme.primaryGradientEnd
            ],
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: ColorTheme.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
