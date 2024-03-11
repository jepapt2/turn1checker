import 'package:flutter/material.dart';
import 'package:turn1checker/theme/color.dart';

class PrimarySimpleDialog extends StatelessWidget {
  const PrimarySimpleDialog(
      {Key? key, required this.title, required this.child})
      : super(key: key);

  final Widget title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double dialogWidth = screenWidth * 0.8;
    return SimpleDialog(
      titlePadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      contentPadding: const EdgeInsets.all(0),
      title: Center(child: title),
      children: [
        const Divider(
          color: ColorTheme.primary,
          height: 0,
        ),
        Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            child: SizedBox(width: dialogWidth, child: child)),
      ],
    );
  }
}
