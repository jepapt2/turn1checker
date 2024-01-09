import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:turn1checker/components/ui/buttons/primary_floating_action_button.dart';
import 'package:turn1checker/theme/color.dart';
import 'package:image/image.dart' as img;

final cameraControllerProvider = FutureProvider<CameraController>((ref) async {
  final cameras = await availableCameras();
  final camera = cameras.first;
  if (camera == null) {
    throw Exception('No cameras available');
  }
  return CameraController(camera, ResolutionPreset.medium,
      imageFormatGroup: ImageFormatGroup.jpeg);
});

class CameraScreen extends HookConsumerWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cameraController = ref.watch(cameraControllerProvider).value;
    if (cameraController == null) {
      return Container();
    }
    final isCameraInitialized = useState(false);
    final cardIllust = useState<XFile?>(null);
    final cameraSizeContext =
        useState<Map<String, Double?>>({"position": null, "size": null});
    final ilustRexctSizeContext =
        useState<Map<String, Double?>>({"position": null, "size": null});

    GlobalKey cameraKey = GlobalKey();
    GlobalKey illustRectKey = GlobalKey();
    final double mediaWidth = MediaQuery.of(context).size.width;

    useEffect(() {
      void initializeCamera() async {
        await cameraController.initialize();

        isCameraInitialized.value = true;
      }

      initializeCamera();

      return () {
        cameraController.dispose();
      };
    }, []);

    if (!isCameraInitialized.value) {
      return Container();
    }

    takePictureAndCrop() async {
      final XFile photo = await cameraController.takePicture();
      final gwy = await img.decodeJpgFile(photo.path);
      if (gwy == null) {
        return;
      }

      RenderBox cameraObject =
          cameraKey.currentContext!.findRenderObject() as RenderBox;
      RenderBox illustObject =
          illustRectKey.currentContext!.findRenderObject() as RenderBox;
      // final cameraPosition = cameraObject.localToGlobal(Offset.zero);
      // final illustSize = illustObject.size;
      // final illustPosition = illustObject.localToGlobal(Offset.zero);

      final imgWidth = gwy.data?.width;
      final imgHeight = gwy.data?.height;
      if (imgWidth == null || imgHeight == null) {
        return;
      }
      final illustSize = imgWidth * 0.6;
      final illustPositionX = (imgWidth - illustSize) / 2;
      final illustPositionY = (imgHeight - illustSize) / 2;
      final tes = img.copyCrop(gwy,
          x: illustPositionX.round(),
          y: illustPositionY.round(),
          width: illustSize.round(),
          height: illustSize.round());

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Image.memory(img.encodeJpg(tes)),
            actions: <Widget>[
              TextButton(
                child: const Text('Close'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Camera'),
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
            child: Text('イラストが写っている状態でボタンを押してください'),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  PrimaryFloatingActionButton(
                    onPressed: () async {
                      takePictureAndCrop();
                    },
                    child: const Icon(
                        Icons.camera_alt_outlined), // Your child widget
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
