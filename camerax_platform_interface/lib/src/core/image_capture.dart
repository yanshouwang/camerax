import 'package:camerax_platform_interface/src/camerax_plugin.dart';
import 'package:camerax_platform_interface/src/common.dart';

import 'image_proxy.dart';

enum ImageCaptureCaptureMode {
  maximizeQuality,
  minimizeLatency,
  zeroShutterLag,
}

enum ImageCaptureFlashMode { auto, on, off, screen }

abstract base class ImageCaptureOnImageCapturedCallback {
  ImageCaptureOnImageCapturedCallback.impl();

  factory ImageCaptureOnImageCapturedCallback({
    void Function()? onCaptureStarted,
    void Function(int progress)? onCaptureProcessProgressed,
    void Function(Bitmap bitmap)? onPostviewBitmapAvailable,
    void Function(ImageProxy image)? onCaptureSuccess,
    void Function(Object exception)? onError,
  }) => CameraXPlugin.instance.$ImageCaptureOnImageCapturedCallback(
    onCaptureStarted: onCaptureStarted,
    onCaptureProcessProgressed: onCaptureProcessProgressed,
    onPostviewBitmapAvailable: onPostviewBitmapAvailable,
    onCaptureSuccess: onCaptureSuccess,
    onError: onError,
  );
}
