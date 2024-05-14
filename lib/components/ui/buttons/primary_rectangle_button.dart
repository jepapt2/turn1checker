//primarybutton
import 'package:flutter/material.dart';
import 'package:turn1checker/theme/color.dart';

class PrimaryRectangleButton extends StatelessWidget {
  const PrimaryRectangleButton(
      {super.key,
      required this.onPressed,
      required this.icon,
      required this.text});

  final void Function() onPressed;
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(0)),
      onPressed: onPressed,
      child: Container(
        height: 48,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: const BoxDecoration(
          color: ColorTheme.primary,
          //0.4のborderをつける
          border: Border.fromBorderSide(BorderSide(
            color: ColorTheme.lightGray,
            width: 0.4,
          )),
        ),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: ColorTheme.white, size: 20),
              const SizedBox(width: 2),
              Text(
                text,
                style: const TextStyle(
                  color: ColorTheme.white,
                  // fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
