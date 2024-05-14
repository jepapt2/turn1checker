import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:turn1checker/components/ui/buttons/gradient_button.dart';
import 'package:turn1checker/components/ui/buttons/primary_button.dart';
import 'package:turn1checker/components/ui/dialogs/primary_simple_dialog.dart';
import 'package:turn1checker/i18n/i18n.g.dart';

class ImageConfirmDialog extends StatelessWidget {
  const ImageConfirmDialog(
      {Key? key, required this.image, required this.onConfirm})
      : super(key: key);

  final Uint8List image;
  final void Function() onConfirm;
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      children: [
        SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.memory(image),
              const SizedBox(height: 16),
              Text(
                t.text.illustrationConfirm,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: PrimaryButton(
                      onPressed: () {
                        Navigator.pop(context, true);
                      },
                      text: t.text.cancel,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Flexible(
                    child: GradientButton(
                      onPressed: () {
                        Navigator.pop(context, true);
                        onConfirm();
                      },
                      text: t.text.yes,
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

void showImageConfirmDialog({
  required BuildContext context,
  required Uint8List image,
  required void Function() onConfirm,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return ImageConfirmDialog(image: image, onConfirm: onConfirm);
    },
  );
}
