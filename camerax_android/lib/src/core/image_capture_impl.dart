import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:camerax_android/src/camerax_api.g.dart';
import 'package:camerax_android/src/common.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'image_proxy_impl.dart';

Future<ui.Image> _decodeImage(Uint8List value) async {
  final buffer = await ui.ImmutableBuffer.fromUint8List(value);
  final descriptor = await ui.ImageDescriptor.encoded(buffer);
  final codec = await descriptor.instantiateCodec();
  final frame = await codec.getNextFrame();
  final image = frame.image;
  return image;
}

final class ImageCaptureOnImageCapturedCallbackImpl
    extends ImageCaptureOnImageCapturedCallbackApi {
  final ImageCaptureOnImageCapturedCallbackProxyApi api;

  ImageCaptureOnImageCapturedCallbackImpl.internal(this.api) : super.impl();

  factory ImageCaptureOnImageCapturedCallbackImpl({
    void Function()? onCaptureStarted,
    void Function(int progress)? onCaptureProcessProgressed,
    void Function(ui.Image bitmap)? onPostviewBitmapAvailable,
    void Function(ImageProxyApi image)? onCaptureSuccess,
    void Function(Object exception)? onError,
  }) {
    final api = ImageCaptureOnImageCapturedCallbackProxyApi(
      onCaptureStarted: onCaptureStarted == null
          ? null
          : (_) => onCaptureStarted(),
      onCaptureProcessProgressed: onCaptureProcessProgressed == null
          ? null
          : (_, progress) => onCaptureProcessProgressed(progress),
      onPostviewBitmapAvailable: onPostviewBitmapAvailable == null
          ? null
          : (_, bitmapApi) async {
              final bitmap = await _decodeImage(bitmapApi);
              onPostviewBitmapAvailable(bitmap);
            },
      onCaptureSuccess: onCaptureSuccess == null
          ? null
          : (_, e) => onCaptureSuccess(e.impl),
      onError: onError == null
          ? null
          : (_, exceptionApi) => onError(exceptionApi.impl),
    );
    return ImageCaptureOnImageCapturedCallbackImpl.internal(api);
  }
}

extension ImageCaptureCaptureModeX on ImageCaptureCaptureMode {
  ImageCaptureCaptureModeApi get api =>
      ImageCaptureCaptureModeApi.values[index];
}

extension ImageCaptureCaptureModeApiX on ImageCaptureCaptureModeApi {
  ImageCaptureCaptureMode get impl => ImageCaptureCaptureMode.values[index];
}

extension ImageCaptureFlashModeX on ImageCaptureFlashMode {
  ImageCaptureFlashModeApi get api => ImageCaptureFlashModeApi.values[index];
}

extension ImageCaptureFlashModeApiX on ImageCaptureFlashModeApi {
  ImageCaptureFlashMode get impl => ImageCaptureFlashMode.values[index];
}

extension ImageCaptureOnImageCapturedCallbackApiX
    on ImageCaptureOnImageCapturedCallbackApi {
  ImageCaptureOnImageCapturedCallbackProxyApi get api {
    final impl = this;
    if (impl is! ImageCaptureOnImageCapturedCallbackImpl) throw TypeError();
    return impl.api;
  }
}
