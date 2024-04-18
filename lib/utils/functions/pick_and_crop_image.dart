import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:turn1checker/i18n/i18n.g.dart';
import 'package:turn1checker/theme/color.dart';

Future<Uint8List?> pickAndCropImage() async {
  final picker = ImagePicker();
  final pickedFile = await picker.pickImage(source: ImageSource.gallery);
  final cropper = ImageCropper();

  if (pickedFile != null) {
    final croppedFile = await cropper.cropImage(
      sourcePath: pickedFile.path,
      aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
      cropStyle: CropStyle.rectangle,
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: t.text.cropIluustration,
          toolbarColor: ColorTheme.primary,
          toolbarWidgetColor: ColorTheme.white,
          initAspectRatio: CropAspectRatioPreset.square,
          lockAspectRatio: true,
        ),
        IOSUiSettings(
          title: t.text.cropIluustration,
          aspectRatioLockEnabled: true,
          aspectRatioPickerButtonHidden: true,
          resetAspectRatioEnabled: false,
        ),
      ],
    );

    if (croppedFile != null) {
      return croppedFile.readAsBytes();
    }
  }
  return null;
}
