import 'dart:ui' as ui;

import 'package:camerax_platform_interface/src/core.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

enum ImageCapture$CaptureMode {
  maximizeQuality,
  minimizeLatency,
  zeroShutterLag,
}

enum ImageCapture$FlashMode { auto, on, off, screen }

abstract interface class ImageCapture$OnImageCapturedCallback {
  factory ImageCapture$OnImageCapturedCallback({
    void Function()? onCaptureStarted,
    void Function(int progress)? onCaptureProcessProgressed,
    void Function(ui.Image bitmap)? onPostviewBitmapAvailable,
    void Function(ImageProxy image)? onCaptureSuccess,
    void Function(Object exception)? onError,
  }) => ImageCaptureChannel.instance.createOnImageCapturedCallback(
    onCaptureStarted: onCaptureStarted,
    onCaptureProcessProgressed: onCaptureProcessProgressed,
    onPostviewBitmapAvailable: onPostviewBitmapAvailable,
    onCaptureSuccess: onCaptureSuccess,
    onError: onError,
  );
}

abstract base class ImageCaptureChannel extends PlatformInterface {
  ImageCaptureChannel() : super(token: _token);

  static final _token = Object();

  static ImageCaptureChannel? _instance;

  static ImageCaptureChannel get instance =>
      ArgumentError.checkNotNull(_instance, 'instance');

  static set instance(ImageCaptureChannel instance) {
    PlatformInterface.verify(instance, _token);
    _instance = instance;
  }

  ImageCapture$OnImageCapturedCallback createOnImageCapturedCallback({
    void Function()? onCaptureStarted,
    void Function(int progress)? onCaptureProcessProgressed,
    void Function(ui.Image bitmap)? onPostviewBitmapAvailable,
    void Function(ImageProxy image)? onCaptureSuccess,
    void Function(Object exception)? onError,
  });
}
