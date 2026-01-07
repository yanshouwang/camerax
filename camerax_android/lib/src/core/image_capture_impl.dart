import 'dart:ui' as ui;

import 'package:camerax_android/src/api.dart';
import 'package:camerax_android/src/common.dart';
import 'package:camerax_android/src/core.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class ImageCaptureOnImageCapturedCallbackImpl
    implements ImageCapture$OnImageCapturedCallback {
  final ImageCaptureOnImageCapturedCallbackProxyApi api;

  ImageCaptureOnImageCapturedCallbackImpl.internal(this.api);
}

final class ImageCaptureChannelImpl extends ImageCaptureChannel {
  @override
  ImageCapture$OnImageCapturedCallback createOnImageCapturedCallback({
    void Function()? onCaptureStarted,
    void Function(int progress)? onCaptureProcessProgressed,
    void Function(ui.Image bitmap)? onPostviewBitmapAvailable,
    void Function(ImageProxy image)? onCaptureSuccess,
    void Function(Object exception)? onError,
  }) {
    final api = ImageCaptureOnImageCapturedCallbackProxyApi(
      onCaptureStarted: onCaptureStarted == null
          ? null
          : (_) => onCaptureStarted(),
      onCaptureProcessProgressed: onCaptureProcessProgressed == null
          ? null
          : (_, e) => onCaptureProcessProgressed(e),
      onPostviewBitmapAvailable: onPostviewBitmapAvailable == null
          ? null
          : (_, e) async {
              final image = await e.impl();
              onPostviewBitmapAvailable(image);
            },
      onCaptureSuccess: onCaptureSuccess == null
          ? null
          : (_, e) => onCaptureSuccess(e.impl),
      onError: onError == null ? null : (_, e) => onError(e.impl),
    );
    return ImageCaptureOnImageCapturedCallbackImpl.internal(api);
  }
}

extension ImageCapture$CaptureModeX on ImageCapture$CaptureMode {
  ImageCaptureCaptureModeApi get api =>
      ImageCaptureCaptureModeApi.values[index];
}

extension ImageCaptureCaptureModeApiX on ImageCaptureCaptureModeApi {
  ImageCapture$CaptureMode get impl => ImageCapture$CaptureMode.values[index];
}

extension ImageCapture$FlashModeX on ImageCapture$FlashMode {
  ImageCaptureFlashModeApi get api => ImageCaptureFlashModeApi.values[index];
}

extension ImageCaptureFlashModeApiX on ImageCaptureFlashModeApi {
  ImageCapture$FlashMode get impl => ImageCapture$FlashMode.values[index];
}

extension ImageCapture$OnImageCapturedCallbackX
    on ImageCapture$OnImageCapturedCallback {
  ImageCaptureOnImageCapturedCallbackProxyApi get api {
    final impl = this;
    if (impl is! ImageCaptureOnImageCapturedCallbackImpl) throw TypeError();
    return impl.api;
  }
}
