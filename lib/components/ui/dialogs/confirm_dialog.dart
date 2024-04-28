import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:turn1checker/components/ui/buttons/gradient_button.dart';
import 'package:turn1checker/components/ui/buttons/primary_button.dart';
import 'package:turn1checker/components/ui/dialogs/primary_simple_dialog.dart';
import 'package:turn1checker/i18n/i18n.g.dart';

class ConfirmDialog extends StatelessWidget {
  const ConfirmDialog({Key? key, required this.description}) : super(key: key);

  final String description;

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      children: [
        SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Text(
                description,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PrimaryButton(
                    onPressed: () {
                      Navigator.pop(context, false);
                    },
                    width: 150,
                    text: t.text.cancel,
                  ),
                  GradientButton(
                    onPressed: () {
                      Navigator.pop(context, true);
                    },
                    width: 150,
                    text: t.text.yes,
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

Future<bool> showConfirmDialog(
  BuildContext context,
  String description,
) async {
  final result = await showDialog<bool>(
    context: context,
    builder: (BuildContext context) {
      return ConfirmDialog(
        description: description,
      );
    },
  );

  return result ?? false;
}
