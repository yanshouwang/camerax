import 'dart:async';
import 'dart:typed_data';

import 'camera_controller.dart';
import 'camera_facing.dart';
import 'camera_selector.dart';
import 'camera_value.dart';
import 'channels.dart';
import 'image_proxy.dart';
import 'messages.dart' as messages;

class $CameraController implements CameraController {
  static final controllers = <CameraSelector, $CameraController>{};

  final CameraSelector selector;

  $CameraController._(this.selector);

  factory $CameraController(CameraSelector selector) {
    return controllers.putIfAbsent(
      selector,
      () => $CameraController._(selector),
    );
  }

  @override
  Stream<ImageProxy> get imageStream {
    return eventStream
        .where((event) =>
            event.category ==
            messages
                .EventCategory.EVENT_CATEGORY_CAMERA_CONTROLLER_IMAGE_PROXIED)
        .map((event) => $ImageProxy.fromMessage(
            event.cameraControllerImageProxiedArguments.imageProxy))
        .where((imageProxy) => imageProxy.selector == selector);
  }

  @override
  Future<bool> requestPermission() {
    final command = messages.Command(
      category: messages.CommandCategory
          .COMMAND_CATEGORY_CAMERA_CONTROLLER_REQUEST_PERMISSION,
    );
    return methodChannel.invokeCommand(command).then(
        (reply) => reply!.cameraControllerRequestPermissionArguments.granted);
  }

  @override
  Future<CameraValue> bind() {
    final command = messages.Command(
      category:
          messages.CommandCategory.COMMAND_CATEGORY_CAMERA_CONTROLLER_BIND,
      cameraControllerBindArguments:
          messages.CameraControllerBindCommandArguments(
        selector: messages.CameraSelector(
          facing: messages.CameraFacing.values[selector.facing.index],
        ),
      ),
    );
    return methodChannel.invokeCommand(command).then((reply) => $CameraValue
        .fromMessage(reply!.cameraControllerBindArguments.cameraValue));
  }

  @override
  Future<void> unbind() {
    final command = messages.Command(
      category:
          messages.CommandCategory.COMMAND_CATEGORY_CAMERA_CONTROLLER_UNBIND,
      cameraControllerUnbindArguments:
          messages.CameraControllerUnbindCommandArguments(
        selector: messages.CameraSelector(
          facing: messages.CameraFacing.values[selector.facing.index],
        ),
      ),
    );
    return methodChannel.invokeCommand(command);
  }

  @override
  Future<void> torch(bool state) {
    final command = messages.Command(
      category:
          messages.CommandCategory.COMMAND_CATEGORY_CAMERA_CONTROLLER_TORCH,
      cameraControllerTorchArguments:
          messages.CameraControllerTorchCommandArguments(
        selector: messages.CameraSelector(
          facing: messages.CameraFacing.values[selector.facing.index],
        ),
        state: state,
      ),
    );
    return methodChannel.invokeCommand(command);
  }

  @override
  Future<void> zoom(double value) {
    final command = messages.Command(
      category:
          messages.CommandCategory.COMMAND_CATEGORY_CAMERA_CONTROLLER_ZOOM,
      cameraControllerZoomArguments:
          messages.CameraControllerZoomCommandArguments(
        selector: messages.CameraSelector(
          facing: messages.CameraFacing.values[selector.facing.index],
        ),
        value: value,
      ),
    );
    return methodChannel.invokeCommand(command);
  }

  @override
  Future<void> linearZoom(double value) {
    final command = messages.Command(
      category: messages
          .CommandCategory.COMMAND_CATEGORY_CAMERA_CONTROLLER_LINEAR_ZOOM,
      cameraControllerLinearZoomArguments:
          messages.CameraControllerLinearZoomCommandArguments(
        selector: messages.CameraSelector(
          facing: messages.CameraFacing.values[selector.facing.index],
        ),
        value: value,
      ),
    );
    return methodChannel.invokeCommand(command);
  }

  @override
  Future<void> focusAutomatically() {
    final command = messages.Command(
      category: messages.CommandCategory
          .COMMAND_CATEGORY_CAMERA_CONTROLLER_FOCUS_AUTOMATICALLY,
      cameraControllerFocusAutomaticallyArguments:
          messages.CameraControllerFocusAutomaticallyCommandArguments(
        selector: messages.CameraSelector(
          facing: messages.CameraFacing.values[selector.facing.index],
        ),
      ),
    );
    return methodChannel.invokeCommand(command);
  }

  @override
  Future<void> focusManually(double width, double height, double x, double y) {
    final command = messages.Command(
      category: messages
          .CommandCategory.COMMAND_CATEGORY_CAMERA_CONTROLLER_FOCUS_MANUALLY,
      cameraControllerFocusManuallyArguments:
          messages.CameraControllerFocusManuallyCommandArguments(
        selector: messages.CameraSelector(
          facing: messages.CameraFacing.values[selector.facing.index],
        ),
        width: width,
        height: height,
        x: x,
        y: y,
      ),
    );
    return methodChannel.invokeCommand(command);
  }

  @override
  Future<ImageProxy> captureToMemory() {
    final command = messages.Command(
      category: messages
          .CommandCategory.COMMAND_CATEGORY_CAMERA_CONTROLLER_CAPTURE_TO_MEMORY,
      cameraControllerCaptureToMemoryArguments:
          messages.CameraControllerCaptureToMemoryCommandArguments(
        selector: messages.CameraSelector(
          facing: messages.CameraFacing.values[selector.facing.index],
        ),
      ),
    );
    return methodChannel.invokeCommand(command).then((reply) {
      final imageProxy =
          reply!.cameraControllerCaptureToMemoryArguments.imageProxy;
      return $ImageProxy.fromMessage(imageProxy);
    });
  }
}

class $CameraSelector implements CameraSelector {
  @override
  final CameraFacing facing;

  const $CameraSelector(this.facing);

  factory $CameraSelector.fromMessage(messages.CameraSelector selector) {
    final facing = CameraFacing.values[selector.facing.value];
    return $CameraSelector(facing);
  }

  @override
  bool operator ==(Object other) {
    return other is $CameraSelector && other.facing == facing;
  }

  @override
  int get hashCode => facing.hashCode;
}

class $CameraValue implements CameraValue {
  @override
  final int textureId;
  @override
  final int textureWidth;
  @override
  final int textureHeight;
  @override
  final bool torchAvailable;
  @override
  final double zoomMinimum;
  @override
  final double zoomMaximum;

  const $CameraValue(
    this.textureId,
    this.textureWidth,
    this.textureHeight,
    this.torchAvailable,
    this.zoomMinimum,
    this.zoomMaximum,
  );

  factory $CameraValue.fromMessage(messages.CameraValue cameraValue) {
    final textureId = cameraValue.textureId;
    final textureWidth = cameraValue.textureWidth;
    final textureHeight = cameraValue.textureHeight;
    final torchAvailable = cameraValue.torchAvailable;
    final zoomMinimum = cameraValue.zoomMinimum;
    final zoomMaximum = cameraValue.zoomMaximum;
    return $CameraValue(
      textureId,
      textureWidth,
      textureHeight,
      torchAvailable,
      zoomMinimum,
      zoomMaximum,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is $CameraValue &&
        other.textureId == textureId &&
        other.textureWidth == textureWidth &&
        other.textureHeight == textureHeight &&
        other.torchAvailable == torchAvailable &&
        other.zoomMinimum == zoomMinimum &&
        other.zoomMaximum == zoomMaximum;
  }

  @override
  int get hashCode {
    return Object.hash(
      textureId,
      textureWidth,
      textureHeight,
      torchAvailable,
      zoomMinimum,
      zoomMaximum,
    );
  }
}

class $ImageProxy implements ImageProxy {
  final CameraSelector selector;
  final String id;
  @override
  final Uint8List data;
  @override
  final int width;
  @override
  final int height;
  @override
  final int rotationDegrees;

  const $ImageProxy(
    this.selector,
    this.id,
    this.data,
    this.width,
    this.height,
    this.rotationDegrees,
  );

  factory $ImageProxy.fromMessage(
    messages.ImageProxy imageProxy,
  ) {
    final selector = $CameraSelector.fromMessage(imageProxy.selector);
    final id = imageProxy.id;
    final data = Uint8List.fromList(imageProxy.data);
    final width = imageProxy.width;
    final height = imageProxy.height;
    final rotationDegrees =
        imageProxy.hasRotationDegrees() ? imageProxy.rotationDegrees : 0;
    return $ImageProxy(
      selector,
      id,
      data,
      width,
      height,
      rotationDegrees,
    );
  }

  @override
  Future<void> close() {
    final command = messages.Command(
      category: messages.CommandCategory.COMMAND_CATEGORY_IMAGE_PROXY_CLOSE,
      imageProxyCloseArguments: messages.ImageProxyCloseCommandArguments(
        selector: messages.CameraSelector(
          facing: messages.CameraFacing.values[selector.facing.index],
        ),
        id: id,
      ),
    );
    return methodChannel.invokeCommand(command);
  }
}
