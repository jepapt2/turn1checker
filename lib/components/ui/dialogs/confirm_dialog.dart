import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:turn1checker/components/ui/buttons/gradient_button.dart';
import 'package:turn1checker/components/ui/buttons/primary_button.dart';
import 'package:turn1checker/components/ui/dialogs/primary_simple_dialog.dart';
import 'package:turn1checker/i18n/i18n.g.dart';

class ConfirmDialog extends StatelessWidget {
  const ConfirmDialog(
      {Key? key,
      required this.description,
      this.onlyYesButton = false,
      this.yesButtonText,
      this.noButtonText,
      this.textStyle})
      : super(key: key);

  final String description;
  final bool onlyYesButton;
  final String? yesButtonText;
  final String? noButtonText;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      children: [
        SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                description,
                style: textStyle ??
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: onlyYesButton
                    ? [
                        const Spacer(),
                        Expanded(
                          flex: 2,
                          child: GradientButton(
                            onPressed: () {
                              Navigator.pop(context, true);
                            },
                            text: yesButtonText ?? t.text.yes,
                            fontSize: 14,
                          ),
                        ),
                        const Spacer(),
                      ]
                    : [
                        Flexible(
                          child: PrimaryButton(
                            onPressed: () {
                              Navigator.pop(context, false);
                            },
                            text: noButtonText ?? t.text.cancel,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Flexible(
                          child: GradientButton(
                            onPressed: () {
                              Navigator.pop(context, true);
                            },
                            text: yesButtonText ?? t.text.yes,
                            fontSize: 14,
                          ),
                        ),
                      ],
              ),
            ],
          ),
        )
      ],
    );
  }
}

Future<bool> showConfirmDialog({
  required BuildContext context,
  required description,
  TextStyle? descriptionTextStyle,
  bool? onlyYesButton,
  String? yesButtonText,
  String? noButtonText,
}) async {
  final result = await showDialog<bool>(
    context: context,
    builder: (BuildContext context) {
      return ConfirmDialog(
        description: description,
        onlyYesButton: onlyYesButton ?? false,
        textStyle: descriptionTextStyle,
        yesButtonText: yesButtonText,
        noButtonText: noButtonText,
      );
    },
  );

  return result ?? false;
}
