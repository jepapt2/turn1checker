import 'package:flutter/material.dart';
import 'package:turn1checker/theme/color.dart';

class PrimaryFloatingActionButton extends StatelessWidget {
  const PrimaryFloatingActionButton(
      {Key? key, required this.onPressed, required this.child})
      : super(key: key);

  final void Function() onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        onPressed: onPressed,
        backgroundColor: Colors.transparent,
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    ColorTheme.primaryGradientStart,
                    ColorTheme.primaryGradientEnd
                  ])),
          child: child,
        ));
  }
}
