import 'dart:ffi';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:turn1checker/components/card/image_confirm_dialog.dart';
import 'package:turn1checker/components/ui/buttons/orange_floating_action_button.dart';
import 'package:turn1checker/components/ui/buttons/primary_floating_action_button.dart';
import 'package:turn1checker/i18n/i18n.g.dart';
import 'package:turn1checker/theme/color.dart';
import 'package:image/image.dart' as img;
import 'package:turn1checker/viewmodel/camera/camera.dart';

class CameraScreen extends HookConsumerWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cameraController =
        ref.watch(cameraNotifierProvider).value?.cameraController;
    final cameraOption = ref.watch(cameraNotifierProvider).value?.cameraOption;
    final cameraControllerNotifier = ref.watch(cameraNotifierProvider.notifier);
    if (cameraController == null) {
      return Container();
    }

    print(cameraOption?.maxZoomLevel);
    print(cameraOption?.minZoomLevel);

    GlobalKey cameraKey = GlobalKey();
    GlobalKey illustRectKey = GlobalKey();
    final double mediaWidth = MediaQuery.of(context).size.width;
    final isLoading = useState(false);

    Future<Uint8List> takePictureAndCrop() async {
      try {
        if (isLoading.value) {
          throw Exception('isLoading');
        }
        isLoading.value = true;
        final XFile photoFile = await cameraController.takePicture();
        final photo = await img.decodeJpgFile(photoFile.path);
        if (photo == null) {
          throw Exception('photo is null');
        }

        final imgWidth = photo.data?.width;
        final imgHeight = photo.data?.height;
        if (imgWidth == null || imgHeight == null) {
          throw Exception('imgWidth or imgHeight is null');
        }
        final illustSize = imgWidth * 0.6;
        final illustPositionX = (imgWidth - illustSize) / 2;
        final illustPositionY = (imgHeight - illustSize) / 2;
        final cropImage = img.copyCrop(photo,
            x: illustPositionX.round(),
            y: illustPositionY.round(),
            width: illustSize.round(),
            height: illustSize.round());
        return img.encodePng(cropImage);
      } finally {
        isLoading.value = false;
      }
    }

    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: Text(t.text.camera),
          ),
          body: Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    SizedBox(
                      key: cameraKey,
                      width: double.infinity,
                      child: CameraPreview(
                        cameraController,
                      ),
                    ),
                    Center(
                      child: Container(
                        key: illustRectKey,
                        width: mediaWidth * 0.6,
                        height: mediaWidth * 0.6,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white,
                            width: 1,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Text(t.text.cameraDescription),
              ),
            ],
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: BottomAppBar(
              elevation: 0,
              color: ColorTheme.background,
              shape: const CircularNotchedRectangle(),
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Center(
                        child: OrangeFloatingActionButton(
                          onPressed: () async {
                            takePictureAndCrop()
                                .then((image) => showImageConfirmDialog(
                                    context: context,
                                    image: image,
                                    onConfirm: () {
                                      Navigator.pop(context, image);
                                    }));
                          },
                          child: const Icon(
                              Icons.camera_alt_outlined), // Your child widget
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                              style: IconButton.styleFrom(
                                  backgroundColor: ColorTheme.primary),
                              onPressed: () => cameraControllerNotifier.zoom(1),
                              icon: const Icon(Icons.add)),
                          SizedBox(
                            width: 16,
                          ),
                          IconButton(
                              style: IconButton.styleFrom(
                                  backgroundColor: ColorTheme.primary),
                              onPressed: () =>
                                  cameraControllerNotifier.zoom(-1),
                              icon: const Icon(Icons.remove))
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        if (isLoading.value || ref.watch(cameraNotifierProvider).isLoading)
          Container(
            color: Colors.black.withOpacity(0.5),
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          )
      ],
    );
  }
}
