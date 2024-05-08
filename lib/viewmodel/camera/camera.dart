import 'dart:async';
import 'dart:math';

import 'package:camera/camera.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:turn1checker/hooks/deck.dart';
import 'package:turn1checker/model/deck/deck.dart';
import 'package:turn1checker/types/camera_controller/camera_controller.dart';

part 'camera.g.dart';

@riverpod
class CameraNotifier extends _$CameraNotifier {
  double currentZoomLevel = 1.0;
  @override
  AsyncValue<CameraControllerWithOption> build() {
    initializeCamera();
    ref.onDispose(() {
      state.value?.cameraController.dispose();
    });
    return state;
  }

  initializeCamera() async {
    state = const AsyncValue.loading();
    final cameras = await availableCameras();
    if (cameras.isEmpty) {
      throw Exception('No cameras available');
    }
    final camera = cameras.first;
    final cameraController = CameraController(camera, ResolutionPreset.medium,
        imageFormatGroup: ImageFormatGroup.jpeg);

    await cameraController.initialize();
    await cameraController.setFlashMode(FlashMode.off);

    state = await AsyncValue.guard(() async {
      return CameraControllerWithOption(
        cameraController: cameraController,
        cameraOption: CameraOption(
          maxZoomLevel: await cameraController.getMaxZoomLevel(),
          minZoomLevel: await cameraController.getMinZoomLevel(),
        ),
      );
    });
  }

  void zoom(double zoomLevel) {
    currentZoomLevel = min(
      max(currentZoomLevel + zoomLevel, 1.0),
      state.value?.cameraOption.maxZoomLevel ?? 1.0,
    );

    state.whenData((value) {
      value.cameraController.setZoomLevel(currentZoomLevel);
    });
  }
}
