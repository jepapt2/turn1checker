import 'package:flutter/material.dart';
import 'package:turn1checker/theme/color.dart';

class OrangeFloatingActionButton extends StatelessWidget {
  const OrangeFloatingActionButton(
      {Key? key, required this.onPressed, required this.child})
      : super(key: key);

  final void Function() onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: Colors.transparent,
      foregroundColor: ColorTheme.white,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(100))),
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  ColorTheme.secondaryGradientStart,
                  ColorTheme.secondaryGradientEnd,
                ])),
        child: child,
      ),
    );
  }
}
