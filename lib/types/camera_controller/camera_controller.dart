import 'package:camera/camera.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'camera_controller.freezed.dart';

@freezed
abstract class CameraControllerWithOption with _$CameraControllerWithOption {
  const factory CameraControllerWithOption({
    required CameraController cameraController,
    required CameraOption cameraOption,
  }) = _CameraControllerWithOption;
}

@freezed
@freezed
abstract class CameraOption with _$CameraOption {
  const factory CameraOption({
    required double maxZoomLevel,
    required double minZoomLevel,
  }) = _CameraOption;
}
