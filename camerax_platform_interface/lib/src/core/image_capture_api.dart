import 'dart:ui' as ui;

import 'package:camerax_platform_interface/src/camerax_plugin.dart';

import 'image_proxy_api.dart';

enum ImageCaptureCaptureMode {
  maximizeQuality,
  minimizeLatency,
  zeroShutterLag,
}

enum ImageCaptureFlashMode { auto, on, off, screen }

abstract base class ImageCaptureOnImageCapturedCallbackApi {
  ImageCaptureOnImageCapturedCallbackApi.impl();

  factory ImageCaptureOnImageCapturedCallbackApi({
    void Function()? onCaptureStarted,
    void Function(int progress)? onCaptureProcessProgressed,
    void Function(ui.Image bitmap)? onPostviewBitmapAvailable,
    void Function(ImageProxyApi image)? onCaptureSuccess,
    void Function(Object exception)? onError,
  }) => CameraXPlugin.instance.$ImageCaptureOnImageCapturedCallbackApi(
    onCaptureStarted: onCaptureStarted,
    onCaptureProcessProgressed: onCaptureProcessProgressed,
    onPostviewBitmapAvailable: onPostviewBitmapAvailable,
    onCaptureSuccess: onCaptureSuccess,
    onError: onError,
  );
}
