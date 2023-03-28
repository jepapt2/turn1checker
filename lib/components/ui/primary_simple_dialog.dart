import 'package:flutter/material.dart';

import '../../theme/color.dart';

class PrimarySimpleModal extends StatelessWidget {
  const PrimarySimpleModal({Key? key, required this.title, required this.child})
      : super(key: key);

  final Widget title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      titlePadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
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
            child: child),
      ],
    );
  }
}
